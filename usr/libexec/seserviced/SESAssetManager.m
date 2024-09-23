@implementation SESAssetManager

- (_TtC10seserviced15SESAssetManager)init
{
  return (_TtC10seserviced15SESAssetManager *)sub_1001CD664();
}

- (unint64_t)currentCompatibilityVersion
{
  return 4;
}

- (unint64_t)currentContentVersion
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC10seserviced15SESAssetManager_currentContentVersion);
}

- (void)setCurrentContentVersion:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced15SESAssetManager_currentContentVersion) = (Class)a3;
}

+ (BOOL)kickOffAndReturnError:(id *)a3
{
  uint64_t ObjCClassMetadata;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[6];

  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  v5 = ObjCClassMetadata;
  if (qword_100344730 != -1)
    ObjCClassMetadata = swift_once(&qword_100344730, sub_1001CDAF0);
  __chkstk_darwin(ObjCClassMetadata, v4);
  v9[2] = v5;
  v7 = v6;
  OS_dispatch_queue.sync<A>(execute:)(&type metadata for (), sub_1001D4FA4, v9, &type metadata for () + 1);

  return 1;
}

+ (void)registerDelegate:(id)a3
{
  uint64_t ObjCClassMetadata;
  uint64_t v5;

  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  v5 = swift_unknownObjectRetain(a3);
  sub_100176AA8(v5, ObjCClassMetadata);
  swift_unknownObjectRelease(a3);
}

+ (void)syncMobileAssetUserInitiated
{
  void *v2;

  if (qword_100344730 != -1)
    swift_once(&qword_100344730, sub_1001CDAF0);
  v2 = *(void **)(qword_100349DE8 + OBJC_IVAR____TtC10seserviced15SESAssetManager_mobileAssetClient);
  if (v2)
    objc_msgSend(v2, "triggerUserInitiatedSync");
}

- (void)handleDownloadedAsset:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC10seserviced15SESAssetManager *v10;
  uint64_t v11;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = self;
  sub_1001D3780((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10seserviced15SESAssetManager_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->queue[OBJC_IVAR____TtC10seserviced15SESAssetManager_staticAssetPath]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->queue[OBJC_IVAR____TtC10seserviced15SESAssetManager_activeAssetPath]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->queue[OBJC_IVAR____TtC10seserviced15SESAssetManager_assetInfoFileName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->queue[OBJC_IVAR____TtC10seserviced15SESAssetManager_profilePrefix]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->queue[OBJC_IVAR____TtC10seserviced15SESAssetManager_compatibilityVersionKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->queue[OBJC_IVAR____TtC10seserviced15SESAssetManager_contentVersionKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->queue[OBJC_IVAR____TtC10seserviced15SESAssetManager_manufacturerKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->queue[OBJC_IVAR____TtC10seserviced15SESAssetManager_versionKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->queue[OBJC_IVAR____TtC10seserviced15SESAssetManager_lastAssetCheckBootUUIDKey]);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced15SESAssetManager_delegates));
}

@end
