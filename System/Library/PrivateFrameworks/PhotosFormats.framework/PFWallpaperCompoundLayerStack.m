@implementation PFWallpaperCompoundLayerStack

- (PFWallpaperCompoundLayerStack)initWithPortraitLayerStack:(id)a3 landscapeLayerStack:(id)a4
{
  PFParallaxLayerStack *v6;
  PFParallaxLayerStack *v7;
  PFWallpaperCompoundLayerStack *v8;
  PFParallaxLayerStack *portraitLayerStack;
  PFParallaxLayerStack *v10;
  PFParallaxLayerStack *landscapeLayerStack;
  objc_super v13;

  v6 = (PFParallaxLayerStack *)a3;
  v7 = (PFParallaxLayerStack *)a4;
  v13.receiver = self;
  v13.super_class = (Class)PFWallpaperCompoundLayerStack;
  v8 = -[PFWallpaperCompoundLayerStack init](&v13, sel_init);
  portraitLayerStack = v8->_portraitLayerStack;
  v8->_portraitLayerStack = v6;
  v10 = v6;

  landscapeLayerStack = v8->_landscapeLayerStack;
  v8->_landscapeLayerStack = v7;

  return v8;
}

- (id)backgroundBackfillLayer
{
  return -[PFParallaxLayerStack layerWithIdentifier:](self->_portraitLayerStack, "layerWithIdentifier:", CFSTR("background-backfill"));
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  -[PFParallaxLayerStack size](self->_portraitLayerStack, "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)compoundLayerStackByUpdatingPortraitDepthEnabled:(BOOL)a3 landscapeDepthEnabled:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  PFWallpaperCompoundLayerStack *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PFWallpaperCompoundLayerStack *v12;

  v4 = a4;
  v5 = a3;
  v7 = [PFWallpaperCompoundLayerStack alloc];
  -[PFWallpaperCompoundLayerStack portraitLayerStack](self, "portraitLayerStack");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layerStackByUpdatingDepthEnabled:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFWallpaperCompoundLayerStack landscapeLayerStack](self, "landscapeLayerStack");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layerStackByUpdatingDepthEnabled:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PFWallpaperCompoundLayerStack initWithPortraitLayerStack:landscapeLayerStack:](v7, "initWithPortraitLayerStack:landscapeLayerStack:", v9, v11);

  return v12;
}

- (id)compoundLayerStackByUpdatingParallaxDisabled:(BOOL)a3
{
  _BOOL8 v3;
  PFWallpaperCompoundLayerStack *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PFWallpaperCompoundLayerStack *v10;

  v3 = a3;
  v5 = [PFWallpaperCompoundLayerStack alloc];
  -[PFWallpaperCompoundLayerStack portraitLayerStack](self, "portraitLayerStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layerStackByUpdatingParallaxDisabled:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFWallpaperCompoundLayerStack landscapeLayerStack](self, "landscapeLayerStack");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layerStackByUpdatingParallaxDisabled:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PFWallpaperCompoundLayerStack initWithPortraitLayerStack:landscapeLayerStack:](v5, "initWithPortraitLayerStack:landscapeLayerStack:", v7, v9);

  return v10;
}

- (id)compoundLayerStackByUpdatingSettlingEffectEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PFWallpaperCompoundLayerStack *v9;

  v3 = a3;
  -[PFWallpaperCompoundLayerStack portraitLayerStack](self, "portraitLayerStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layerStackByUpdatingSettlingEffectEnabled:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFWallpaperCompoundLayerStack landscapeLayerStack](self, "landscapeLayerStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layerStackByUpdatingSettlingEffectEnabled:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PFWallpaperCompoundLayerStack initWithPortraitLayerStack:landscapeLayerStack:]([PFWallpaperCompoundLayerStack alloc], "initWithPortraitLayerStack:landscapeLayerStack:", v6, v8);
  return v9;
}

- (PFPosterLayout)layout
{
  PFPosterLayout *v3;
  void *v4;
  void *v5;
  PFPosterLayout *v6;

  v3 = [PFPosterLayout alloc];
  -[PFParallaxLayerStack layout](self->_portraitLayerStack, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxLayerStack layout](self->_landscapeLayerStack, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PFPosterLayout initWithPortraitLayout:landscapeLayout:](v3, "initWithPortraitLayout:landscapeLayout:", v4, v5);

  return v6;
}

- (PFParallaxLayerStack)portraitLayerStack
{
  return self->_portraitLayerStack;
}

- (PFParallaxLayerStack)landscapeLayerStack
{
  return self->_landscapeLayerStack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeLayerStack, 0);
  objc_storeStrong((id *)&self->_portraitLayerStack, 0);
}

@end
