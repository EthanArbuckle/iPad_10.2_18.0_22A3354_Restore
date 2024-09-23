@implementation SMAssetClient

- (SMAssetClient)initWithDependenciesWrapper:(id)a3
{
  id v4;
  SMAssetClient *v5;
  SMAssetClient *v6;
  objc_super v8;
  __int128 v9;

  v4 = a3;
  v5 = self;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257949838);
  sub_24A778B84();
  swift_release();
  sub_24A6865F8(&v9, (uint64_t)v5 + OBJC_IVAR___SMAssetClient_artworkImageLoader);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for AssetClientBridge();
  v6 = -[SMAssetClient init](&v8, sel_init);

  return v6;
}

- (void)fetchArtwork:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  id v13;
  SMAssetClient *v14;
  uint64_t v15;
  void (*v16)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257949848);
  v19 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR___SMAssetClient_artworkImageLoader), *(_QWORD *)&self->artworkImageLoader[OBJC_IVAR___SMAssetClient_artworkImageLoader + 16]);
  v13 = a3;
  v14 = self;
  sub_24A779BA4();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = sub_24A68BD9C;
  *(_QWORD *)(v15 + 24) = v12;
  swift_retain();
  v16 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_24A778F50();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_24A68BDB8;
  *(_QWORD *)(v17 + 24) = v15;
  swift_retain();
  v16(sub_24A687E78, v17);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v10, v8);

  swift_release();
}

- (SMAssetClient)init
{
  SMAssetClient *result;

  result = (SMAssetClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SMAssetClient_artworkImageLoader);
}

@end
