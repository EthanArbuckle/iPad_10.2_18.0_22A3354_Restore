@implementation SearchFindMyFriendshipCoordinator

- (_TtP4Maps30SearchFindMyFriendshipDelegate_)delegate
{
  return (_TtP4Maps30SearchFindMyFriendshipDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps33SearchFindMyFriendshipCoordinator_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps33SearchFindMyFriendshipCoordinator_delegate, a3);
}

- (_TtC4Maps33SearchFindMyFriendshipCoordinator)initWith:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t *v9;
  objc_super v11;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps33SearchFindMyFriendshipCoordinator_session) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps33SearchFindMyFriendshipCoordinator_delegate, 0);
  v7 = (char *)self + OBJC_IVAR____TtC4Maps33SearchFindMyFriendshipCoordinator_updateStream;
  v8 = sub_100008B04(&qword_10149AD88);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps33SearchFindMyFriendshipCoordinator_handleId);
  *v9 = v4;
  v9[1] = v6;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SearchFindMyFriendshipCoordinator(0);
  return -[SearchFindMyFriendshipCoordinator init](&v11, "init");
}

- (void)getLatestLocationsFor:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC4Maps33SearchFindMyFriendshipCoordinator *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1011A2FD8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_10010A85C(v8, (uint64_t)sub_10000BF64, v7);

  swift_release();
}

- (void)startMonitoringHandles
{
  _TtC4Maps33SearchFindMyFriendshipCoordinator *v2;

  v2 = self;
  sub_10010BC34();

}

- (void)stopMonitoringHandlesWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC4Maps33SearchFindMyFriendshipCoordinator *v13;
  uint64_t v14;

  v5 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1011A2F60, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1011A2F88, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10149ADD8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1011A2FB0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10149A9C0;
  v12[5] = v11;
  v13 = self;
  sub_10020D758((uint64_t)v7, (uint64_t)&unk_10149F0F0, (uint64_t)v12);
  swift_release();
}

- (_TtC4Maps33SearchFindMyFriendshipCoordinator)init
{
  _TtC4Maps33SearchFindMyFriendshipCoordinator *result;

  result = (_TtC4Maps33SearchFindMyFriendshipCoordinator *)_swift_stdlib_reportUnimplementedInitializer("Maps.SearchFindMyFriendshipCoordinator", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->handleId[OBJC_IVAR____TtC4Maps33SearchFindMyFriendshipCoordinator_handleId]);
  swift_release();
  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps33SearchFindMyFriendshipCoordinator_delegate);
  sub_100010CC4((uint64_t)self + OBJC_IVAR____TtC4Maps33SearchFindMyFriendshipCoordinator_updateStream, &qword_10149ADB8);
}

@end
