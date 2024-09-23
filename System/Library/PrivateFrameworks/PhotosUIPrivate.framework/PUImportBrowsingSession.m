@implementation PUImportBrowsingSession

+ (PUImportBrowsingSession)withDeviceMedia
{
  return (PUImportBrowsingSession *)sub_1AABFDF4C();
}

- (NSString)emptyPlaceholderTitle
{
  PUImportBrowsingSession *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1AABFE2C4();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1AB08D468();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)emptyPlaceholderSubtitle
{
  void *v2;

  v2 = (void *)sub_1AB08D468();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (PXImportController)importController
{
  return (PXImportController *)sub_1AABFE388();
}

- (void)setImportController:(id)a3
{
  id v5;
  PUImportBrowsingSession *v6;

  v5 = a3;
  v6 = self;
  sub_1AABFE418(a3);

}

- (PUBrowsingSessionImageWellThumbnailProvider)imageWellThumbnailProvider
{
  return (PUBrowsingSessionImageWellThumbnailProvider *)sub_1AABFE4EC();
}

- (void)importController:(id)a3 addedImportSource:(id)a4
{
  id v6;
  id v7;
  PUImportBrowsingSession *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1AABFE51C((uint64_t)v8, v7);

}

- (void)importController:(id)a3 failedToAddImportSource:(id)a4 exceptions:(id)a5
{
  sub_1AAB74D50(0, &qword_1EEBBE738);
  sub_1AB08D5C4();
  swift_bridgeObjectRelease();
}

- (PUImportBrowsingSession)initWithDataSourceManager:(id)a3 actionManager:(id)a4 mediaProvider:(id)a5 photosDetailsContext:(id)a6 lowMemoryMode:(BOOL)a7 importStatusManager:(id)a8 privacyController:(id)a9
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  swift_unknownObjectRetain();
  v16 = a9;
  return (PUImportBrowsingSession *)ImportBrowsingSession.init(dataSourceManager:actionManager:mediaProvider:photosDetailsContext:lowMemoryMode:importStatusManager:privacyController:)();
}

- (void).cxx_destruct
{

}

@end
