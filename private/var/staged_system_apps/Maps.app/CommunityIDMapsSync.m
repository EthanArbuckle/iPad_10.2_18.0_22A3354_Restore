@implementation CommunityIDMapsSync

+ (_TtC4Maps19CommunityIDMapsSync)shared
{
  if (qword_101490C90 != -1)
    swift_once(&qword_101490C90, sub_10000C6A4);
  return (_TtC4Maps19CommunityIDMapsSync *)(id)qword_1014D45D0;
}

- (_TtC8MapsSync13MapsSyncStore)store
{
  return (_TtC8MapsSync13MapsSyncStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC4Maps19CommunityIDMapsSync_store));
}

- (void)setStore:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19CommunityIDMapsSync_store);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19CommunityIDMapsSync_store) = (Class)a3;
  v3 = a3;

}

- (_TtC4Maps19CommunityIDMapsSync)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19CommunityIDMapsSync_store) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CommunityIDMapsSync();
  return -[CommunityIDMapsSync init](&v3, "init");
}

- (void).cxx_destruct
{

}

- (void)fetchAllAvailableCommunityIDsWithCompletion:(id)a3
{
  uint64_t (*v4)();
  uint64_t v5;
  _TtC4Maps19CommunityIDMapsSync *v6;

  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject(&unk_10119B598, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_10000DD04;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_10000D0E0((uint64_t)v4, v5);
  sub_10000BF74((uint64_t)v4, v5);

}

- (void)fetchCommunityIDWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC4Maps19CommunityIDMapsSync *v11;

  v6 = (uint64_t (*)())_Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  if (v6)
  {
    v10 = swift_allocObject(&unk_10119B548, 24, 7);
    *(_QWORD *)(v10 + 16) = v6;
    v6 = sub_10000DD04;
  }
  else
  {
    v10 = 0;
  }
  v11 = self;
  sub_10000D2B8(v7, v9, (uint64_t)v6, v10);
  sub_10000BF74((uint64_t)v6, v10);

  swift_bridgeObjectRelease(v9);
}

- (void)storeCommunityIDWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC4Maps19CommunityIDMapsSync *v11;

  v6 = (uint64_t (*)())_Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  if (v6)
  {
    v10 = swift_allocObject(&unk_10119B520, 24, 7);
    *(_QWORD *)(v10 + 16) = v6;
    v6 = sub_10000DD04;
  }
  else
  {
    v10 = 0;
  }
  v11 = self;
  sub_10000D478(v7, v9, (void (*)(_QWORD, _QWORD))v6);
  sub_10000BF74((uint64_t)v6, v10);

  swift_bridgeObjectRelease(v9);
}

- (void)setExpiredWithMsCommunityID:(id)a3 completion:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  id v8;
  _TtC4Maps19CommunityIDMapsSync *v9;

  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10119B4F8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_10000DD04;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10000D5D4(v8, (void (*)(uint64_t, _QWORD))v6);
  sub_10000BF74((uint64_t)v6, v7);

}

- (void)increaseUsedCountWithMsCommunityID:(id)a3 completion:(id)a4
{
  void (*v6)(uint64_t, _QWORD);
  uint64_t v7;
  id v8;
  _TtC4Maps19CommunityIDMapsSync *v9;

  v6 = (void (*)(uint64_t, _QWORD))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10119B4D0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(uint64_t, _QWORD))sub_10000D8D8;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10000D748(v8, v6);
  sub_10000BF74((uint64_t)v6, v7);

}

@end
