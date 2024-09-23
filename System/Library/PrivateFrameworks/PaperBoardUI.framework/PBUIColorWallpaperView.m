@implementation PBUIColorWallpaperView

- (PBUIColorWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  PBUIColorWallpaperView *v18;
  void *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PBUIColorWallpaperView;
  v18 = -[PBUIWallpaperView initWithFrame:configuration:variant:cacheGroup:delegate:options:](&v21, sel_initWithFrame_configuration_variant_cacheGroup_delegate_options_, v17, a5, a6, a7, a8, x, y, width, height);
  if (v18)
  {
    objc_msgSend(v17, "wallpaperColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIColorWallpaperView setBackgroundColor:](v18, "setBackgroundColor:", v19);

  }
  return v18;
}

- (int64_t)wallpaperType
{
  return 4;
}

- (BOOL)isDisplayingWallpaperWithConfiguration:(id)a3 forVariant:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a3;
  if (objc_msgSend(v5, "wallpaperType") == 4)
  {
    objc_msgSend(v5, "wallpaperColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIColorWallpaperView wallpaperColor](self, "wallpaperColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)contrastInRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5
{
  if (a4)
    *a4 = 0.0;
  if (a5)
    *a5 = 0.0;
  return 0.0;
}

- (id)snapshotImage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  -[PBUIColorWallpaperView cachedSnapshotImage](self, "cachedSnapshotImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PBUIColorWallpaperView wallpaperColor](self, "wallpaperColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", 20.0, 20.0);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__PBUIColorWallpaperView_snapshotImage__block_invoke;
    v8[3] = &unk_1E6B967A8;
    v9 = v4;
    v6 = v4;
    objc_msgSend(v5, "imageWithActions:", v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIColorWallpaperView setCachedSnapshotImage:](self, "setCachedSnapshotImage:", v3);

  }
  return v3;
}

void __39__PBUIColorWallpaperView_snapshotImage__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "set");
  objc_msgSend(v3, "fillRect:", 0.0, 0.0, 20.0, 20.0);

}

- (UIImage)cachedSnapshotImage
{
  return self->_cachedSnapshotImage;
}

- (void)setCachedSnapshotImage:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSnapshotImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSnapshotImage, 0);
}

@end
