@implementation TPSAssetsDownloadOperation

- (NSString)assetIdentifier
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DACA2D88();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setAssetIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_1DACA2D94();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___TPSAssetsDownloadOperation_assetIdentifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSURL)downloadedURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL;
  swift_beginAccess();
  sub_1DAC77494((uint64_t)v6, (uint64_t)v5, &qword_1EDAF3010);
  v7 = sub_1DACA28E4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1DACA2890();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (void)setDownloadedURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  TPSAssetsDownloadOperation *v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1DACA28C0();
    v8 = sub_1DACA28E4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1DACA28E4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL;
  swift_beginAccess();
  v11 = self;
  sub_1DAC91DF0((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();

}

- (TPSAssetsDownloadOperation)initWithAssetIdentifier:(id)a3 assetURLPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  objc_super v16;

  v5 = sub_1DACA2D94();
  v7 = v6;
  v8 = sub_1DACA2D94();
  v10 = v9;
  v11 = (char *)self + OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL;
  v12 = sub_1DACA28E4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___TPSAssetsDownloadOperation_priority) = *MEMORY[0x1E0CB3338];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TPSAssetsDownloadOperation_urlSessionItem) = 0;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___TPSAssetsDownloadOperation_assetIdentifier);
  *v13 = v5;
  v13[1] = v7;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___TPSAssetsDownloadOperation_assetURLPath);
  *v14 = v8;
  v14[1] = v10;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for AssetsDownloadOperation();
  return -[TPSAsyncOperation init](&v16, sel_init);
}

- (void)main
{
  TPSAssetsDownloadOperation *v2;

  v2 = self;
  sub_1DAC916B0();

}

- (TPSAssetsDownloadOperation)init
{
  TPSAssetsDownloadOperation *result;

  result = (TPSAssetsDownloadOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1DAC7190C((uint64_t)self + OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL, &qword_1EDAF3010);
  swift_bridgeObjectRelease();

}

@end
