@implementation PUIMediaLibraryStorageController

+ (PUIMediaLibraryStorageController)shared
{
  if (qword_1EDAE1608 != -1)
    swift_once();
  return (PUIMediaLibraryStorageController *)(id)qword_1EDAE15F8;
}

- (BOOL)shouldDisplayStorageCleanupTip
{
  PUIMediaLibraryStorageController *v3;
  BOOL v5;

  swift_beginAccess();
  v3 = self;
  sub_1DA66BE60();
  sub_1DA66E2D8();

  swift_release();
  return v5;
}

- (void)setShouldDisplayStorageCleanupTip:(BOOL)a3
{
  PUIMediaLibraryStorageController *v3;

  v3 = self;
  sub_1DA600008();

}

- (PUIMediaLibraryStorageController)init
{
  return (PUIMediaLibraryStorageController *)sub_1DA6006AC();
}

- (void)dealloc
{
  PUIMediaLibraryStorageController *v2;

  v2 = self;
  MediaLibraryStorageController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR___PUIMediaLibraryStorageController__shouldDisplayStorageCleanupTipPublisher;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE1DE0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (int64_t)observeStorageCleanupChange:(id)a3
{
  void *v4;
  PUIMediaLibraryStorageController *v5;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_1DA66BE60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19D8);
  sub_1DA66CC04();

  swift_release();
  swift_release();
  return 0;
}

- (void)removeStorageCleanupChangeObserverWith:(int64_t)a3
{
  PUIMediaLibraryStorageController *v3;

  v3 = self;
  sub_1DA66BE60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19D8);
  sub_1DA66CC04();

  swift_release();
}

- (void)mediaLibraryDidChange
{
  PUIMediaLibraryStorageController *v2;

  v2 = self;
  MediaLibraryStorageController.refreshDownloadedAssets()();
  sub_1DA600CF0((uint64_t)sub_1DA602300, (uint64_t)&block_descriptor_31_0);

}

- (void)refreshDownloadedAssets
{
  PUIMediaLibraryStorageController *v2;

  v2 = self;
  MediaLibraryStorageController.refreshDownloadedAssets()();

}

- (void)ignoreStorageCleanupPrompt
{
  PUIMediaLibraryStorageController *v2;

  v2 = self;
  MediaLibraryStorageController.ignoreStorageCleanupPrompt()();

}

@end
