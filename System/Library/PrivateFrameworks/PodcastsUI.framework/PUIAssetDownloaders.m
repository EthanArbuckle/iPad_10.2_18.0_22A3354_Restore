@implementation PUIAssetDownloaders

- (PUIAssetDownloaders)init
{
  return (PUIAssetDownloaders *)AssetDownloaders.init()();
}

+ (PUIAssetDownloaders)sharedDownloaders
{
  if (qword_1EDAE0888 != -1)
    swift_once();
  return (PUIAssetDownloaders *)(id)qword_1EDAE0880;
}

- (void)registerBackgroundCompletion:(id)a3 forSession:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  PUIAssetDownloaders *v10;

  v5 = _Block_copy(a3);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = sub_1DA66F8BC();
  v9 = v8;
  v10 = self;
  sub_1DA661180((uint64_t)sub_1DA661828, v6, v7, v9);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR___PUIAssetDownloaders_backgroundArtworkDownloader;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19E8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___PUIAssetDownloaders_backgroundArtworkSource;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4200);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR___PUIAssetDownloaders_storeArtworkSource;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE27D0);
  v9 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR___PUIAssetDownloaders_libraryArtworkSource, v8);
}

@end
