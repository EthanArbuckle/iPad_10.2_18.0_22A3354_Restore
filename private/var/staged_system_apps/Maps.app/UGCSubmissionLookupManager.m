@implementation UGCSubmissionLookupManager

- (_TtC4Maps26UGCSubmissionLookupManager)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps26UGCSubmissionLookupManager_ticket) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UGCSubmissionLookupManager();
  return -[UGCSubmissionLookupManager init](&v3, "init");
}

- (void).cxx_destruct
{

}

- (void)fetchSubmissionWithICloudIDFor:(unint64_t)a3 completion:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  void *v8;
  _TtC4Maps26UGCSubmissionLookupManager *v9;
  _TtC4Maps26UGCSubmissionLookupManager *v10;
  _QWORD v11[6];

  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1011A0EB0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1000B5CCC;
    v11[4] = sub_1000B5CCC;
    v11[5] = v7;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_1000142F0;
    v11[3] = &unk_1011A0EC8;
    v8 = _Block_copy(v11);
    v9 = self;
    swift_retain();
    swift_release();
  }
  else
  {
    v10 = self;
    v8 = 0;
    v7 = 0;
  }
  -[UGCSubmissionLookupManager fetchSubmissionWithICloudIDFor:clearCache:completion:](self, "fetchSubmissionWithICloudIDFor:clearCache:completion:", a3, 0, v8);
  _Block_release(v8);
  sub_10000BF74((uint64_t)v6, v7);

}

- (void)fetchSubmissionWithICloudIDFor:(unint64_t)a3 clearCache:(BOOL)a4 completion:(id)a5
{
  uint64_t (*v8)();
  uint64_t v9;
  _TtC4Maps26UGCSubmissionLookupManager *v10;

  v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_1011A0E10, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_1000B5CCC;
  }
  else
  {
    v9 = 0;
  }
  v10 = self;
  sub_1000B3980(a3, a4, (void (*)(_QWORD, uint64_t))v8, v9);
  sub_10000BF74((uint64_t)v8, v9);

}

- (void)fetchSubmissionWithCommunityIDAndICloudIDFor:(unint64_t)a3 identifierHistory:(id)a4 completion:(id)a5
{
  uint64_t (*v8)();
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC4Maps26UGCSubmissionLookupManager *v12;
  NSArray v13;
  void *v14;
  _TtC4Maps26UGCSubmissionLookupManager *v15;
  _QWORD v16[6];

  v8 = (uint64_t (*)())_Block_copy(a5);
  v9 = sub_1000B4DDC();
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  if (v8)
  {
    v11 = swift_allocObject(&unk_1011A0DE8, 24, 7);
    *(_QWORD *)(v11 + 16) = v8;
    v12 = self;
    v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
    v8 = sub_1000B5CCC;
    v16[4] = sub_1000B5CCC;
    v16[5] = v11;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 1107296256;
    v16[2] = sub_1000142F0;
    v16[3] = &unk_1011A0DB0;
    v14 = _Block_copy(v16);
    swift_retain();
    swift_release();
  }
  else
  {
    v15 = self;
    v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
    v11 = 0;
    v14 = 0;
  }
  -[UGCSubmissionLookupManager fetchSubmissionWithCommunityIDAndICloudIDFor:identifierHistory:clearCache:completion:](self, "fetchSubmissionWithCommunityIDAndICloudIDFor:identifierHistory:clearCache:completion:", a3, v13.super.isa, 0, v14);
  _Block_release(v14);

  sub_10000BF74((uint64_t)v8, v11);
  swift_bridgeObjectRelease(v10);
}

- (void)fetchSubmissionWithCommunityIDAndICloudIDFor:(unint64_t)a3 identifierHistory:(id)a4 clearCache:(BOOL)a5 completion:(id)a6
{
  void (*v10)(_QWORD, uint64_t);
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC4Maps26UGCSubmissionLookupManager *v14;

  v10 = (void (*)(_QWORD, uint64_t))_Block_copy(a6);
  v11 = sub_1000B4DDC();
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  if (v10)
  {
    v13 = swift_allocObject(&unk_1011A0A78, 24, 7);
    *(_QWORD *)(v13 + 16) = v10;
    v10 = sub_1000B4E3C;
  }
  else
  {
    v13 = 0;
  }
  v14 = self;
  sub_1000B3F40(a3, v12, a5, v10, v13);
  sub_10000BF74((uint64_t)v10, v13);

  swift_bridgeObjectRelease(v12);
}

- (void)cancelIfNeeded
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps26UGCSubmissionLookupManager_ticket), "cancel");
}

@end
