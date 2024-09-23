@implementation MTNetworkMediaManifest

+ (id)activityTypeSuffix
{
  return String._bridgeToObjectiveC()();
}

+ (int64_t)playerFetchLimit
{
  return 20;
}

- (int64_t)forwardItemCount
{
  return *(_QWORD *)&self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_forwardItemCount];
}

- (void)setForwardItemCount:(int64_t)a3
{
  *(_QWORD *)&self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_forwardItemCount] = a3;
}

- (int64_t)episodeFetchLimit
{
  return *(_QWORD *)&self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_episodeFetchLimit];
}

- (void)setEpisodeFetchLimit:(int64_t)a3
{
  *(_QWORD *)&self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_episodeFetchLimit] = a3;
}

- (BOOL)hasOnlyPaidEpisodesWithoutSubscription
{
  return self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_hasOnlyPaidEpisodesWithoutSubscription];
}

- (void)setHasOnlyPaidEpisodesWithoutSubscription:(BOOL)a3
{
  self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_hasOnlyPaidEpisodesWithoutSubscription] = a3;
}

- (MTNetworkMediaManifest)initWithAssetInfo:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  MTNetworkMediaManifest *v7;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  v7 = -[MTNetworkMediaManifest initWithPodcastAdamId:assetInfo:](self, "initWithPodcastAdamId:assetInfo:", 0, v6);

  return v7;
}

- (MTNetworkMediaManifest)initWithEpisodeAdamId:(id)a3 assetInfo:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a3)
  {
    v5 = 0;
    v7 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    v10 = 0;
    return (MTNetworkMediaManifest *)sub_1001B9448(v5, v7, v8, v10);
  }
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  return (MTNetworkMediaManifest *)sub_1001B9448(v5, v7, v8, v10);
}

- (MTNetworkMediaManifest)initWithEpisodeAdamIds:(id)a3 assetInfo:(id)a4
{
  id v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  MTNetworkMediaManifest *v10;
  uint64_t v11;
  uint64_t ObjectType;

  v4 = a4;
  if (!a3)
  {
    v6 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  if (!v4)
    goto LABEL_5;
LABEL_3:
  v4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v8 = v7;
LABEL_6:
  v9 = objc_allocWithZone((Class)type metadata accessor for NetworkMediaManifest(0));
  v10 = (MTNetworkMediaManifest *)sub_1001B983C(0, 0, v6, 0, 0, (uint64_t)v4, v8);
  ObjectType = swift_getObjectType(self, v11);
  swift_deallocPartialClassInstance(self, ObjectType, *(unsigned int *)((swift_isaMask & *(_QWORD *)self->super.super.IMPlayerManifest_opaque) + 0x30), *(unsigned __int16 *)((swift_isaMask & *(_QWORD *)self->super.super.IMPlayerManifest_opaque) + 0x34));
  return v10;
}

- (MTNetworkMediaManifest)initWithPodcastAdamId:(id)a3 assetInfo:(id)a4
{
  id v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  MTNetworkMediaManifest *v12;
  uint64_t v13;
  uint64_t ObjectType;

  v4 = a4;
  if (!a3)
  {
    v6 = 0;
    v8 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  if (!v4)
    goto LABEL_5;
LABEL_3:
  v4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v10 = v9;
LABEL_6:
  v11 = objc_allocWithZone((Class)type metadata accessor for NetworkMediaManifest(0));
  v12 = (MTNetworkMediaManifest *)sub_1001B983C(v6, v8, 0, 0, 0, (uint64_t)v4, v10);
  ObjectType = swift_getObjectType(self, v13);
  swift_deallocPartialClassInstance(self, ObjectType, *(unsigned int *)((swift_isaMask & *(_QWORD *)self->super.super.IMPlayerManifest_opaque) + 0x30), *(unsigned __int16 *)((swift_isaMask & *(_QWORD *)self->super.super.IMPlayerManifest_opaque) + 0x34));
  return v12;
}

- (MTNetworkMediaManifest)initWithStationId:(id)a3 assetInfo:(id)a4
{
  id v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  MTNetworkMediaManifest *v12;
  uint64_t v13;
  uint64_t ObjectType;

  v4 = a4;
  if (!a3)
  {
    v6 = 0;
    v8 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  if (!v4)
    goto LABEL_5;
LABEL_3:
  v4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v10 = v9;
LABEL_6:
  v11 = objc_allocWithZone((Class)type metadata accessor for NetworkMediaManifest(0));
  v12 = (MTNetworkMediaManifest *)sub_1001B983C(0, 0, 0, v6, v8, (uint64_t)v4, v10);
  ObjectType = swift_getObjectType(self, v13);
  swift_deallocPartialClassInstance(self, ObjectType, *(unsigned int *)((swift_isaMask & *(_QWORD *)self->super.super.IMPlayerManifest_opaque) + 0x30), *(unsigned __int16 *)((swift_isaMask & *(_QWORD *)self->super.super.IMPlayerManifest_opaque) + 0x34));
  return v12;
}

- (void)load:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  MTNetworkMediaManifest *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_1004B3180, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_100048D5C;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_1001BA3D8((void (*)(__n128))v7, v6);
  sub_10002CA30((uint64_t)v7, v6);

}

+ (void)fetchPlayerItemsFor:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;

  v7 = type metadata accessor for MediaRequest.ContentType(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  if (v11)
  {
    v13 = swift_allocObject(&unk_1004B31F8, 24, 7);
    *(_QWORD *)(v13 + 16) = v11;
    v11 = sub_1001C1280;
  }
  else
  {
    v13 = 0;
  }
  swift_getObjCClassMetadata(a1);
  v14 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MediaRequestController(0)), "init");
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for MediaRequest.ContentType.podcastEpisode(_:), v7);
  v15 = (_QWORD *)swift_allocObject(&unk_1004B31D0, 40, 7);
  v15[2] = v14;
  v15[3] = v11;
  v15[4] = v13;
  v16 = v14;
  sub_10002CA20((uint64_t)v11, v13);
  sub_1001BA5F4(0, v12, v16, (uint64_t)v10, 0x7FFFFFFFFFFFFFFFLL, 20, (uint64_t)_swiftEmptyArrayStorage, 0, (uint64_t (*)(_QWORD, _QWORD))sub_1001C1258, (uint64_t)v15);

  swift_release(v15);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_10002CA30((uint64_t)v11, v13);
  swift_bridgeObjectRelease(v12);
}

- (NSArray)initialEpisodeUuids
{
  MTNetworkMediaManifest *v2;
  uint64_t v3;
  uint64_t v4;
  NSArray v5;

  v2 = self;
  sub_1001BC550();
  v4 = v3;

  if (v4)
  {
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return (NSArray *)v5.super.isa;
}

- (NSString)initialPodcastUuid
{
  MTNetworkMediaManifest *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1001BC780();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)parseStationAssetInfo:(id)a3 error:(id *)a4
{
  return sub_1001BDBE4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))sub_1001BC96C);
}

- (id)parseEpisodeAssetInfo:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTNetworkMediaManifest *v8;
  _QWORD *v9;
  __n128 v10;
  Class isa;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = self;
  v9 = sub_1001BCD4C(v5, v7);

  v10 = swift_bridgeObjectRelease(v7);
  type metadata accessor for ServerPodcastEpisode(0, v10);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (BOOL)parsePodcastAssetInfo:(id)a3 error:(id *)a4
{
  return sub_1001BDBE4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))sub_1001BD284);
}

- (unint64_t)currentIndex
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NetworkMediaManifest(0);
  return -[MTNetworkMediaManifest currentIndex](&v3, "currentIndex");
}

- (void)setCurrentIndex:(unint64_t)a3
{
  MTNetworkMediaManifest *v4;
  objc_super v5;

  v4 = self;
  if (-[MTNetworkMediaManifest currentIndex](v4, "currentIndex") == a3)
  {

  }
  else
  {
    v5.receiver = v4;
    v5.super_class = (Class)type metadata accessor for NetworkMediaManifest(0);
    -[MTNetworkMediaManifest setCurrentIndex:](&v5, "setCurrentIndex:", a3);
    sub_1001C061C(0, 0);

  }
}

- (NSArray)itemIdsDebug
{
  MTNetworkMediaManifest *v2;
  _QWORD *v3;
  Class isa;

  v2 = self;
  v3 = sub_1001BF9E0();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (MTNetworkMediaManifest)initWithItems:(id)a3
{
  MTNetworkMediaManifest *result;

  result = (MTNetworkMediaManifest *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.NetworkMediaManifest", 29, "init(items:)", 12, 0);
  __break(1u);
  return result;
}

- (MTNetworkMediaManifest)init
{
  MTNetworkMediaManifest *result;

  result = (MTNetworkMediaManifest *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.NetworkMediaManifest", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_initialIds]);
  v3 = &self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_contentType];
  v4 = type metadata accessor for MediaRequest.ContentType(0);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_inProgressRefreshHandlers]);
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;

  v5 = _Block_copy(a4);
  _Block_copy(v5);
  v6 = a3;
  sub_1001C0BEC(v6, (void (**)(_QWORD, _QWORD))v5);
  _Block_release(v5);
  _Block_release(v5);

}

@end
