@implementation PUWallpaperPosterLegacyAsset

- (PUWallpaperPosterLegacyAsset)initWithProxyImage:(CGImage *)a3
{
  PUWallpaperPosterLegacyAsset *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUWallpaperPosterLegacyAsset;
  result = -[PUWallpaperPosterLegacyAsset init](&v5, sel_init);
  if (result)
    result->_proxyImage = a3;
  return result;
}

- (CGRect)acceptableCropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0D7D078];
  v3 = *(double *)(MEMORY[0x1E0D7D078] + 8);
  v4 = *(double *)(MEMORY[0x1E0D7D078] + 16);
  v5 = *(double *)(MEMORY[0x1E0D7D078] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)preferredCropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0D7D078];
  v3 = *(double *)(MEMORY[0x1E0D7D078] + 8);
  v4 = *(double *)(MEMORY[0x1E0D7D078] + 16);
  v5 = *(double *)(MEMORY[0x1E0D7D078] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)gazeAreaRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0D7D078];
  v3 = *(double *)(MEMORY[0x1E0D7D078] + 8);
  v4 = *(double *)(MEMORY[0x1E0D7D078] + 16);
  v5 = *(double *)(MEMORY[0x1E0D7D078] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSArray)faceRegions
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)petRegions
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSString)localIdentifier
{
  return (NSString *)CFSTR("LegacyAsset");
}

- (BOOL)supportsSegmentationResourceCaching
{
  return 0;
}

- (NSURL)segmentationResourceURL
{
  return 0;
}

- (BOOL)clearSegmentationResourceCacheWithError:(id *)a3
{
  return 1;
}

- (void)updateSegmentationResource:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterMigrator.m"), 230, CFSTR("Migration asset does not support caching"));

}

- (int)loadParallaxResource:(int64_t)a3 options:(id)a4 resultHandler:(id)a5
{
  objc_class *v6;
  void (**v7)(id, id, _QWORD);
  id v8;

  v6 = (objc_class *)MEMORY[0x1E0D75160];
  v7 = (void (**)(id, id, _QWORD))a5;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setType:", 5);
  objc_msgSend(v8, "setProxyImage:", -[PUWallpaperPosterLegacyAsset proxyImage](self, "proxyImage"));
  v7[2](v7, v8, 0);

  return 1;
}

- (int)loadPetsRegionsWithOptions:(id)a3 resultHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterMigrator.m"), 255, CFSTR("Migration asset does not support pet regions"));

  abort();
}

- (int)loadMotionScore:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterMigrator.m"), 260, CFSTR("Migration asset does not support motion"));

  abort();
}

- (CGImage)proxyImage
{
  return self->_proxyImage;
}

@end
