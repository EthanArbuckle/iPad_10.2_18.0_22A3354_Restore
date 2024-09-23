@implementation UISaveToCameraRollActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    return 3;
  else
    return 0;
}

- (id)activityType
{
  return CFSTR("com.apple.UIKit.activity.SaveToCameraRoll");
}

- (id)activityTitle
{
  int64_t imageCount;
  int64_t videoCount;
  int64_t v4;
  int64_t livePhotoCount;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  imageCount = self->_imageCount;
  videoCount = self->_videoCount;
  v4 = videoCount + imageCount;
  livePhotoCount = self->_livePhotoCount;
  if (videoCount + imageCount >= 2)
  {
    if (imageCount - livePhotoCount == v4)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      _ShareSheetBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Save %@ Images[Activity]");
      v10 = CFSTR("Save %@ Images");
LABEL_12:
      objc_msgSend(v7, "localizedStringForKey:value:table:", v9, v10, CFSTR("Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringFromNumber:numberStyle:", v21, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v19, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
    if (livePhotoCount == v4)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      _ShareSheetBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Save %@ Live Photos[Activity]"), CFSTR("Save %@ Live Photos"), CFSTR("Localizable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB37F0];
      v17 = (void *)MEMORY[0x1E0CB37E8];
      v18 = self->_livePhotoCount;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      _ShareSheetBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (imageCount)
      {
        v9 = CFSTR("Save %@ Items[Activity]");
        v10 = CFSTR("Save %@ Items");
        goto LABEL_12;
      }
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Save %@ Videos[Activity]"), CFSTR("Save %@ Videos"), CFSTR("Localizable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB37F0];
      v17 = (void *)MEMORY[0x1E0CB37E8];
      v18 = self->_videoCount;
    }
    objc_msgSend(v17, "numberWithInteger:", v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringFromNumber:numberStyle:", v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v15, v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  if (videoCount == 1)
  {
    _ShareSheetBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    v12 = CFSTR("Save Video[Activity]");
    v13 = CFSTR("Save Video");
  }
  else
  {
    _ShareSheetBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (livePhotoCount == 1)
    {
      v12 = CFSTR("Save Live Photo[Activity]");
      v13 = CFSTR("Save Live Photo");
    }
    else
    {
      v12 = CFSTR("Save Image[Activity]");
      v13 = CFSTR("Save Image");
    }
  }
  objc_msgSend(v11, "localizedStringForKey:value:table:", v12, v13, CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v23;
}

- (id)_activityImage
{
  uint64_t *v2;

  if (self->_videoCount + self->_imageCount < 2)
  {
    if (_activityImage_onceToken_43 != -1)
      dispatch_once(&_activityImage_onceToken_43, &__block_literal_global_44);
    v2 = &_activityImage___image_42;
  }
  else
  {
    if (_activityImage_onceToken_0 != -1)
      dispatch_once(&_activityImage_onceToken_0, &__block_literal_global_36);
    v2 = &_activityImage___image_0;
  }
  return (id)*v2;
}

void __44__UISaveToCameraRollActivity__activityImage__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3E88];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v3 = (void *)MEMORY[0x1E0DC3E88];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollectionWithUserInterfaceIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "traitCollectionWithTraitsFromCollections:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("UIActivitySaveMultiple.png"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIActivity _activityImageForActionRepresentationImage:](UIActivity, "_activityImageForActionRepresentationImage:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)_activityImage___image_0;
  _activityImage___image_0 = v11;

}

void __44__UISaveToCameraRollActivity__activityImage__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3E88];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v3 = (void *)MEMORY[0x1E0DC3E88];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollectionWithUserInterfaceIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "traitCollectionWithTraitsFromCollections:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("UIActivitySaveSingle.png"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIActivity _activityImageForActionRepresentationImage:](UIActivity, "_activityImageForActionRepresentationImage:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)_activityImage___image_42;
  _activityImage___image_42 = v11;

}

- (id)_systemImageName
{
  if (self->_videoCount + self->_imageCount <= 1)
    return CFSTR("square.and.arrow.down");
  else
    return CFSTR("square.and.arrow.down.on.square");
}

- (BOOL)_canSaveImages
{
  BOOL v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = 1;
  v3 = -[objc_class authorizationStatusForAccessLevel:](getPHPhotoLibraryClass(), "authorizationStatusForAccessLevel:", 1);
  if ((unint64_t)(v3 - 1) < 2)
    return 0;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForInfoDictionaryKey:", CFSTR("NSPhotoLibraryAddUsageDescription"));
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForInfoDictionaryKey:", CFSTR("NSPhotoLibraryUsageDescription"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v5 | v6;

    v2 = v7 != 0;
  }
  return v2;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_imageCount = 0;
  self->_livePhotoCount = 0;
  self->_videoCount = 0;
  if ((_UIActivityItemTypes() & 0x42) != 0)
  {
    self->_imageCount = _UIActivityItemCountOfType(v4, 2);
    self->_videoCount = _UIActivityItemCountOfType(v4, 64);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          if (_UIActivityItemIsLivePhoto(*(void **)(*((_QWORD *)&v12 + 1) + 8 * i)))
            ++self->_livePhotoCount;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    self->_imageCount = 0;
    self->_videoCount = 0;
  }
  v10 = (self->_imageCount > 0 || self->_videoCount >= 1)
     && -[UISaveToCameraRollActivity _canSaveImages](self, "_canSaveImages", (_QWORD)v12);

  return v10;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  _UISaveToCameraRollSaveItemsController *v6;
  _UISaveToCameraRollSaveItemsController *v7;
  _UISaveToCameraRollSaveItemsController *saveController;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, void *);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  _UIActivityItemsGetImagesAndVideos(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  v6 = [_UISaveToCameraRollSaveItemsController alloc];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __55__UISaveToCameraRollActivity_prepareWithActivityItems___block_invoke;
  v12 = &unk_1E4003508;
  objc_copyWeak(&v13, &location);
  v7 = -[_UISaveToCameraRollSaveItemsController initWithItems:saveCompletionBlock:](v6, "initWithItems:saveCompletionBlock:", v5, &v9);
  saveController = self->_saveController;
  self->_saveController = v7;

  -[_UISaveToCameraRollSaveItemsController beginSaving](self->_saveController, "beginSaving", v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __55__UISaveToCameraRollActivity_prepareWithActivityItems___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "activityDidFinish:items:error:", a2, 0, v5);

}

- (int64_t)imageCount
{
  return self->_imageCount;
}

- (void)setImageCount:(int64_t)a3
{
  self->_imageCount = a3;
}

- (int64_t)livePhotoCount
{
  return self->_livePhotoCount;
}

- (void)setLivePhotoCount:(int64_t)a3
{
  self->_livePhotoCount = a3;
}

- (int64_t)videoCount
{
  return self->_videoCount;
}

- (void)setVideoCount:(int64_t)a3
{
  self->_videoCount = a3;
}

- (_UISaveToCameraRollSaveItemsController)saveController
{
  return self->_saveController;
}

- (void)setSaveController:(id)a3
{
  objc_storeStrong((id *)&self->_saveController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveController, 0);
}

@end
