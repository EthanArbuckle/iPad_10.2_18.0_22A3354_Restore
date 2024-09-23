@implementation FeedbackCommunityIDManager

+ (_TtC4Maps26FeedbackCommunityIDManager)shared
{
  if (qword_101491070 != -1)
    swift_once(&qword_101491070, sub_10019B534);
  return (_TtC4Maps26FeedbackCommunityIDManager *)(id)qword_1014D4F00;
}

- (_TtC4Maps19CommunityIDMapsSync)syncCache
{
  return (_TtC4Maps19CommunityIDMapsSync *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC4Maps26FeedbackCommunityIDManager_syncCache));
}

- (_TtC4Maps26FeedbackCommunityIDManager)init
{
  uint64_t v2;
  uint64_t v3;
  _TtC4Maps26FeedbackCommunityIDManager *v4;
  void *v5;
  id v6;
  objc_super v8;

  v2 = OBJC_IVAR____TtC4Maps26FeedbackCommunityIDManager_syncCache;
  v3 = qword_101490C90;
  v4 = self;
  if (v3 != -1)
    swift_once(&qword_101490C90, sub_10000C6A4);
  v5 = (void *)qword_1014D45D0;
  *(Class *)((char *)&v4->super.isa + v2) = (Class)qword_1014D45D0;
  v6 = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for FeedbackCommunityIDManager();
  return -[FeedbackCommunityIDManager init](&v8, "init");
}

- (void).cxx_destruct
{

}

- (void)fetchAuthenticationInfoForReviewedPlaceWithMuid:(unint64_t)a3 identifierHistory:(id)a4 shouldIncreaseCount:(BOOL)a5 completion:(id)a6
{
  uint64_t (*v10)();
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _TtC4Maps26FeedbackCommunityIDManager *v15;
  Class isa;
  uint64_t v17;
  void *v18;
  _TtC4Maps26FeedbackCommunityIDManager *v19;
  _QWORD v20[6];

  v10 = (uint64_t (*)())_Block_copy(a6);
  v11 = sub_10000E4BC(0, (unint64_t *)&qword_10149AA00, GEOMapItemIdentifier_ptr);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  if (v10)
  {
    v13 = swift_allocObject(&unk_1011A8198, 24, 7);
    *(_QWORD *)(v13 + 16) = v10;
    v10 = sub_1000B5CCC;
  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)objc_opt_self(UGCReviewedPlaceManager);
  v15 = self;
  isa = Array._bridgeToObjectiveC()().super.isa;
  v17 = swift_allocObject(&unk_1011A8148, 41, 7);
  *(_QWORD *)(v17 + 16) = v10;
  *(_QWORD *)(v17 + 24) = v13;
  *(_QWORD *)(v17 + 32) = v15;
  *(_BYTE *)(v17 + 40) = a5;
  v20[4] = sub_10019CC84;
  v20[5] = v17;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 1107296256;
  v20[2] = sub_10019B464;
  v20[3] = &unk_1011A8160;
  v18 = _Block_copy(v20);
  v19 = v15;
  sub_10000C128((uint64_t)v10, v13);
  swift_release();
  objc_msgSend(v14, "fetchReviewedPlaceForMUID:withIdentifierHistory:completion:", a3, isa, v18);
  _Block_release(v18);

  sub_10000BF74((uint64_t)v10, v13);
  swift_bridgeObjectRelease(v12);
}

- (void)fetchAuthenticationInfoForRAPReportWithReportID:(id)a3 completion:(id)a4
{
  uint64_t (*v6)();
  uint64_t (*v7)();
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _TtC4Maps26FeedbackCommunityIDManager *v11;

  v6 = (uint64_t (*)())_Block_copy(a4);
  v7 = v6;
  if (!a3)
  {
    v8 = 0;
    if (v6)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  a3 = v9;
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v10 = swift_allocObject(&unk_1011A80F8, 24, 7);
  *(_QWORD *)(v10 + 16) = v7;
  v7 = sub_1000B5CCC;
LABEL_6:
  v11 = self;
  sub_10019BB70(v8, (uint64_t)a3, v7, v10);
  sub_10000BF74((uint64_t)v7, v10);

  swift_bridgeObjectRelease(a3);
}

- (void)fetchAuthenticationInfoForRAPReportWithReportID:(id)a3 shouldIncreaseCount:(BOOL)a4 completion:(id)a5
{
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _TtC4Maps26FeedbackCommunityIDManager *v13;

  v8 = (void (*)(uint64_t, uint64_t))_Block_copy(a5);
  v9 = v8;
  if (!a3)
  {
    v10 = 0;
    if (v8)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  a3 = v11;
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v12 = swift_allocObject(&unk_1011A7F90, 24, 7);
  *(_QWORD *)(v12 + 16) = v9;
  v9 = sub_1000B4E3C;
LABEL_6:
  v13 = self;
  sub_10019BCF4(v10, (uint64_t)a3, a4, (uint64_t)v9, v12);
  sub_10000BF74((uint64_t)v9, v12);

  swift_bridgeObjectRelease(a3);
}

@end
