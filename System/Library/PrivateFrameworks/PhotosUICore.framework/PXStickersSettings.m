@implementation PXStickersSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_24351 != -1)
    dispatch_once(&sharedInstance_onceToken_24351, &__block_literal_global_24352);
  return (id)sharedInstance_sharedInstance_24353;
}

void __36__PXStickersSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stickersSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_24353;
  sharedInstance_sharedInstance_24353 = v0;

}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

+ (id)settingsControllerModule
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D83078];
  v5 = (void *)MEMORY[0x1E0D83010];
  v6 = (void *)MEMORY[0x1E0D830A0];
  _ReviewActionHandlerForType(v3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:action:", CFSTR("Review Sticker Confidence Score"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v10 = (void *)MEMORY[0x1E0D83010];
  v11 = (void *)MEMORY[0x1E0D830A0];
  _ReviewActionHandlerForType(v3, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithHandler:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:action:", CFSTR("Review Live Sticker Suggestion Score"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v15, CFSTR("Review"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v16);

  objc_msgSend(MEMORY[0x1E0D83078], "moduleWithTitle:contents:", CFSTR("Stickers"), v2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
