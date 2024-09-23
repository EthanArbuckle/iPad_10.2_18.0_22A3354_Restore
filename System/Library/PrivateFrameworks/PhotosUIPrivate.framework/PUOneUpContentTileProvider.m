@implementation PUOneUpContentTileProvider

- (PUOneUpContentTileProvider)init
{
  return -[PUOneUpContentTileProvider initWithMediaProvider:](self, "initWithMediaProvider:", 0);
}

- (PUOneUpContentTileProvider)initWithMediaProvider:(id)a3
{
  id v6;
  PUOneUpContentTileProvider *v7;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUOneUpContentTileProvider;
  v7 = -[PUOneUpContentTileProvider init](&v10, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PUOneUpContentTileProvider.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProvider != nil"));

    }
    objc_storeStrong((id *)&v7->_mediaProvider, a3);
  }

  return v7;
}

- (void)registerTileControllerClassesWithTilingView:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUOneUpImageTileViewReuseIdentifier"));
  objc_msgSend(v3, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUVideoTileViewReuseIdentifier"));
  objc_msgSend(v3, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUIrisImageTileViewReuseIdentifier"));
  objc_msgSend(v3, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUAnimatedImageTileViewReuseIdentifier"));

}

- (id)tileControllerForAsset:(id)a3 viewModel:(id)a4 tilingView:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  __CFString **v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpContentTileProvider.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

    if (v12)
      goto LABEL_3;
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpContentTileProvider.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tilingView != nil"));

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_28;
LABEL_3:
  v13 = objc_msgSend(v9, "mediaType");
  if (objc_msgSend(v9, "playbackStyle") == 5 || v13 == 2)
  {
    objc_msgSend(v12, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUVideoTileViewReuseIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpContentTileProvider mediaProvider](self, "mediaProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMediaProvider:", v17);

    objc_msgSend(v16, "setAssetViewModel:", v10);
    goto LABEL_26;
  }
  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "irisUIEnabled"))
  {
    if ((objc_msgSend(v9, "canPlayPhotoIris") & 1) != 0)
    {

      if ((objc_msgSend(v9, "isAnimatedImage") & 1) != 0)
      {
        v15 = 1;
        goto LABEL_13;
      }
LABEL_19:
      v20 = &PUIrisImageTileViewReuseIdentifier;
      goto LABEL_20;
    }
    v15 = objc_msgSend(v9, "isPhotoIrisPlaceholder");

    if ((objc_msgSend(v9, "isAnimatedImage") & 1) != 0)
    {
LABEL_13:
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "allowGIFPlayback");

      v20 = &PUAnimatedImageTileViewReuseIdentifier;
      if (v15)
        v20 = &PUIrisImageTileViewReuseIdentifier;
      if ((v15 & 1) != 0 || (v19 & 1) != 0)
        goto LABEL_20;
      goto LABEL_17;
    }
    if ((v15 & 1) != 0)
      goto LABEL_19;
  }
  else
  {

    if (objc_msgSend(v9, "isAnimatedImage"))
    {
      v15 = 0;
      goto LABEL_13;
    }
  }
LABEL_17:
  v20 = &PUOneUpImageTileViewReuseIdentifier;
LABEL_20:
  objc_msgSend(v12, "dequeueTileControllerWithReuseIdentifier:", *v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpContentTileProvider window](self, "window");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    objc_msgSend(v12, "window");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v21 = v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "windows");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "firstObject");
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  -[PUOneUpContentTileProvider mediaProvider](self, "mediaProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMediaProvider:", v26);

  objc_msgSend(v21, "px_imageModulationManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImageModulationManager:", v27);

  objc_msgSend(v16, "setAssetViewModel:", v10);
LABEL_26:
  objc_msgSend(v16, "setContentViewEnabled:", 1);

  return v16;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
}

@end
