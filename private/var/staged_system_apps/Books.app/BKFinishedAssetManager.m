@implementation BKFinishedAssetManager

- (BKFinishedAssetManager)init
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKFinishedAssetManager_libraryManager) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKFinishedAssetManager_objectMonitor) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKFinishedAssetManager_assetCache) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKFinishedAssetManager_enablementObservation) = 0;
  Logger.init(subsystem:category:)(0xD000000000000010, 0x80000001007B2570, 0x64656873696E6946, 0xEE00737465737341);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FinishedAssetManager(0);
  return -[BKFinishedAssetManager init](&v4, "init");
}

- (BKFinishedAssetManager)initWithLibraryManager:(id)a3
{
  return (BKFinishedAssetManager *)sub_1006211A0(a3);
}

- (void)removeFinishedDownloadsWithThreshhold:(double)a3
{
  BKFinishedAssetManager *v4;

  v4 = self;
  FinishedAssetManager.removeFinishedDownloads(threshhold:)(a3);

}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  id v6;
  BKFinishedAssetManager *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_100625108(v6);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKFinishedAssetManager_assetCache));
  v3 = (char *)self + OBJC_IVAR___BKFinishedAssetManager_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
