@implementation MTSwiftEpisodeListManifest

+ (id)activityTypeSuffix
{
  return String._bridgeToObjectiveC()();
}

- (MTSwiftEpisodeListManifest)initWithInitialEpisodeUuid:(id)a3 fetchRequest:(id)a4
{
  id v4;
  MTSwiftEpisodeListManifest *result;

  v4 = a4;
  result = (MTSwiftEpisodeListManifest *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.EpisodeListManifest", 28, "init(initialEpisodeUuid:fetchRequest:)", 38, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = &self->super.super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTSwiftEpisodeListManifest_settings];
  v3 = type metadata accessor for EpisodeListSettings(0);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

- (NSUserActivity)activity
{
  MTSwiftEpisodeListManifest *v2;
  void *v3;

  v2 = self;
  v3 = sub_10028A614();

  return (NSUserActivity *)v3;
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t ObjCClassMetadata;
  void *ObjCClassFromMetadata;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;
  id v13;
  _QWORD v14[5];
  _QWORD *v15;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1004BB150, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(ObjCClassMetadata);
  v10 = (_QWORD *)swift_allocObject(&unk_1004BB178, 40, 7);
  v10[2] = a3;
  v10[3] = sub_1001C0F18;
  v10[4] = v7;
  v14[4] = sub_10028B0DC;
  v15 = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10028AF04;
  v14[3] = &unk_1004BB190;
  v11 = _Block_copy(v14);
  v12 = v15;
  v13 = a3;
  swift_retain();
  swift_release(v12);
  objc_msgSend(ObjCClassFromMetadata, "episodeUuidForActivity:completion:", v13, v11);
  _Block_release(v11);

  swift_release(v7);
}

@end
