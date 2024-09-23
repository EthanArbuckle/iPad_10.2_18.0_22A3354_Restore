@implementation MTFeedManager

+ (MTFeedManager)sharedInstance
{
  if (qword_100552090 != -1)
    swift_once(&qword_100552090, sub_1000076EC);
  return (MTFeedManager *)(id)static FeedManager.shared;
}

- (void)updateFeedForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 forceBootstrap:(BOOL)a8 useBackgroundFetch:(BOOL)a9 source:(int64_t)a10 completion:(id)a11
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t (*v22)();
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int64_t v26;
  uint64_t v27;
  MTFeedManager *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL4 v32;
  _BOOL4 v33;

  v32 = a7;
  v33 = a8;
  v30 = a5;
  v15 = sub_10003F544((uint64_t *)&unk_100553DC0);
  __chkstk_darwin(v15);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for URL(0);
  v19 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = (uint64_t (*)())_Block_copy(a11);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v23 = 0;
  }
  else
  {
    v23 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, v23, 1, v18);
  v31 = v18;
  if (!a6)
  {
    v24 = 0;
    v26 = a10;
    if (v22)
      goto LABEL_6;
LABEL_8:
    v27 = 0;
    goto LABEL_9;
  }
  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  a6 = v25;
  v26 = a10;
  if (!v22)
    goto LABEL_8;
LABEL_6:
  v27 = swift_allocObject(&unk_1004BB798, 24, 7);
  *(_QWORD *)(v27 + 16) = v22;
  v22 = sub_100294E24;
LABEL_9:
  v28 = self;
  FeedManager.updateFeed(forFeedUrl:cloudSyncFeedUrl:podcastStoreId:triggerBy:userInitiated:forceBootstrap:useBackgroundFetch:source:completion:)((uint64_t)v21, (uint64_t)v17, v30, v24, a6, v32, v33, a9, v26, (uint64_t)v22, v27);
  sub_10002CA30((uint64_t)v22, v27);

  swift_bridgeObjectRelease(a6);
  sub_100007A28((uint64_t)v17, (uint64_t *)&unk_100553DC0);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v31);
}

- (void)updateFeedForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 forceBootstrap:(BOOL)a8 useBackgroundFetch:(BOOL)a9 source:(int64_t)a10 isSubscribing:(BOOL)a11 feedDownloadedHook:(id)a12 preProcessFeedHook:(id)a13 postProcessFeedHook:(id)a14 completion:(id)a15
{
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id (*v31)();
  MTFeedManager *v32;
  void (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  MTFeedManager *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  void (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  MTFeedManager *v50;
  uint64_t v51;
  unsigned int v52;
  unsigned int v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;

  v52 = a7;
  v53 = a8;
  v50 = self;
  v51 = a5;
  v18 = sub_10003F544((uint64_t *)&unk_100553DC0);
  __chkstk_darwin(v18);
  v20 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for URL(0);
  v57 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v23 = (char *)&v45 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = _Block_copy(a12);
  v25 = _Block_copy(a13);
  v26 = _Block_copy(a14);
  v27 = _Block_copy(a15);
  v56 = v23;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v28 = 0;
  }
  else
  {
    v28 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v57 + 56))(v20, v28, 1, v21);
  if (a6)
  {
    v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
    v49 = v29;
    if (v24)
      goto LABEL_6;
LABEL_9:
    v47 = 0;
    v45 = 0;
    if (v25)
      goto LABEL_7;
    goto LABEL_10;
  }
  v48 = 0;
  v49 = 0;
  if (!v24)
    goto LABEL_9;
LABEL_6:
  v45 = swift_allocObject(&unk_1004BB770, 24, 7);
  *(_QWORD *)(v45 + 16) = v24;
  v47 = sub_100294BBC;
  if (v25)
  {
LABEL_7:
    v30 = swift_allocObject(&unk_1004BB748, 24, 7);
    *(_QWORD *)(v30 + 16) = v25;
    v31 = sub_100294B8C;
    goto LABEL_11;
  }
LABEL_10:
  v31 = 0;
  v30 = 0;
LABEL_11:
  v54 = v21;
  v55 = v20;
  v46 = a9;
  if (v26)
  {
    v32 = (MTFeedManager *)swift_allocObject(&unk_1004BB720, 24, 7);
    *(_QWORD *)v32->_system = v26;
    v33 = sub_100294B44;
  }
  else
  {
    v33 = 0;
    v32 = 0;
  }
  if (v27)
  {
    v34 = swift_allocObject(&unk_1004BB6F8, 24, 7);
    *(_QWORD *)(v34 + 16) = v27;
    v27 = sub_100294B3C;
  }
  else
  {
    v34 = 0;
  }
  v35 = v50;
  v44 = (uint64_t)v32;
  v50 = v32;
  v36 = v30;
  v42 = (uint64_t)v31;
  v43 = v30;
  v37 = (uint64_t)v31;
  v38 = v45;
  v39 = v47;
  v40 = (uint64_t)v55;
  v41 = v49;
  FeedManager.updateFeed(forFeedUrl:cloudSyncFeedUrl:podcastStoreId:triggerBy:userInitiated:forceBootstrap:useBackgroundFetch:source:isSubscribing:feedDownloadedHook:preProcessFeedHook:postProcessFeedHook:completion:)((uint64_t)v56, (uint64_t)v55, v51, v48, v49, v52, v53, v46, a10, a11, (uint64_t)v47, v45, v42, v43, (uint64_t)v33, v44, (uint64_t)v27, v34);
  sub_10002CA30((uint64_t)v27, v34);
  sub_10002CA30((uint64_t)v33, (uint64_t)v50);
  sub_10002CA30(v37, v36);
  sub_10002CA30((uint64_t)v39, v38);

  swift_bridgeObjectRelease(v41);
  sub_100007A28(v40, (uint64_t *)&unk_100553DC0);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v56, v54);
}

- (BOOL)abortUpdatesIfNetworkUnreachable:(BOOL)a3
{
  return _s8Podcasts11FeedManagerC32abortUpdatesIfNetworkUnreachable13userInitiatedS2b_tF_0(a3) & 1;
}

- (MTFeedManager)init
{
  return (MTFeedManager *)sub_100023738();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR___MTFeedManager_systemFuture;
  v4 = sub_10003F544((uint64_t *)&unk_10055EB20);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  sub_1002941C0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MTFeedManager__system), *(_QWORD *)&self->queue[OBJC_IVAR___MTFeedManager__system], *(_QWORD *)&self->_system[OBJC_IVAR___MTFeedManager__system]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTFeedManager__pendingRequests));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTFeedManager__pendingBlocks));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTFeedManager__subscriptions));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTFeedManager_downloadManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTFeedManager__feedIngesterProvider));
  v5 = (char *)self + OBJC_IVAR___MTFeedManager_signpostID;
  v6 = type metadata accessor for OSSignpostID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (BOOL)isUpdatingShowWithUrl:(id)a3 storeID:(int64_t)a4
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  MTFeedManager *v11;
  char v12;
  uint64_t v14;

  sub_10003F544((uint64_t *)&unk_100553DC0);
  __chkstk_darwin();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = self;
  v12 = FeedManager.isUpdatingShow(url:storeID:)((uint64_t)v8, a4);

  sub_100007A28((uint64_t)v8, (uint64_t *)&unk_100553DC0);
  return v12 & 1;
}

- (void)handleEventsForBackgroundURLSessionFor:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  MTFeedManager *v12;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_1004BB6A8, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = (_QWORD *)swift_allocObject(&unk_1004BB6D0, 56, 7);
  v11[2] = self;
  v11[3] = v7;
  v11[4] = v9;
  v11[5] = sub_100048D5C;
  v11[6] = v10;
  v12 = self;
  swift_bridgeObjectRetain(v9);
  swift_retain();
  sub_100291668((uint64_t)sub_1002941F0, (uint64_t)v11);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
  swift_release(v11);
}

- (BOOL)isUpdating
{
  MTFeedManager *v2;
  char v3;

  v2 = self;
  v3 = FeedManager.isUpdating.getter();

  return v3 & 1;
}

@end
