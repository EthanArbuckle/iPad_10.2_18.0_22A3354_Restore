@implementation VUIMPMediaItemAirTrafficDownloadController

- (VUIMPMediaItemAirTrafficDownloadController)initWithMediaItem:(id)a3 serialProcessingDispatchQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  VUIMPMediaItemDownloadControllerState *v10;
  VUIMPMediaItemAirTrafficDownloadController *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  VUIMPMediaItemAirTrafficDownloadController *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC1E90]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    v10 = objc_alloc_init(VUIMPMediaItemDownloadControllerState);
    -[VUIMPMediaItemDownloadControllerState setStatus:](v10, "setStatus:", 0);
    v17.receiver = self;
    v17.super_class = (Class)VUIMPMediaItemAirTrafficDownloadController;
    v11 = -[VUIMPMediaItemDownloadController initWithMediaItem:state:serialProcessingDispatchQueue:](&v17, sel_initWithMediaItem_state_serialProcessingDispatchQueue_, v6, v10, v7);
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x1E0CC1FF8];
      objc_msgSend(v6, "mediaLibrary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", v11, sel__handleMediaLibraryDidChangeNotification_, v13, v14);

    }
    self = v11;

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (VUIMPMediaItemAirTrafficDownloadController)initWithMediaItem:(id)a3 state:(id)a4 serialProcessingDispatchQueue:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raise:format:", v7, CFSTR("The %@ initializer is not available."), v8);

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIMPMediaItemAirTrafficDownloadController;
  -[VUIMPMediaItemAirTrafficDownloadController dealloc](&v4, sel_dealloc);
}

- (BOOL)supportsPausing
{
  return 0;
}

- (BOOL)supportsCancellation
{
  return 0;
}

- (void)_handleMediaLibraryDidChangeNotification:(id)a3
{
  void *v4;
  int v5;
  double v6;
  uint64_t v7;
  VUIMPMediaItemDownloadControllerState *v8;
  id v9;

  -[VUIMPMediaItemDownloadController mediaItem](self, "mediaItem", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0CC1E90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
    v6 = 0.0;
  else
    v6 = -1.0;
  if (v5)
    v7 = 0;
  else
    v7 = 3;
  v8 = objc_alloc_init(VUIMPMediaItemDownloadControllerState);
  -[VUIMPMediaItemDownloadControllerState setStatus:](v8, "setStatus:", v7);
  -[VUIMPMediaItemDownloadControllerState setDownloadProgress:](v8, "setDownloadProgress:", v6);
  -[VUIMPMediaItemDownloadControllerState setDownloadSucceeded:](v8, "setDownloadSucceeded:", v5 ^ 1u);
  -[VUIMPMediaItemDownloadController _setState:](self, "_setState:", v8);

}

@end
