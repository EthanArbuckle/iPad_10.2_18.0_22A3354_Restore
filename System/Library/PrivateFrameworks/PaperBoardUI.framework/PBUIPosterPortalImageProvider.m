@implementation PBUIPosterPortalImageProvider

- (PBUIPosterPortalImageProvider)initWithRootObject:(id)a3
{
  id v5;
  PBUIPosterPortalImageProvider *v6;
  PBUIPosterPortalImageProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBUIPosterPortalImageProvider;
  v6 = -[PBUIPosterPortalImageProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rootObject, a3);

  return v7;
}

- (id)newImageProviderView
{
  return objc_alloc_init(PBUIPortalReplicaEffectView);
}

- (id)imageForWallpaperStyle:(int64_t *)a3 variant:(int64_t)a4 traitCollection:(id)a5
{
  return -[PBUIPosterWallpaperViewController portalSourceProviderForVariant:](self->_rootObject, "portalSourceProviderForVariant:", a4);
}

- (BOOL)updateImageProviderView:(id)a3 withImage:(id)a4
{
  objc_msgSend(a3, "setProvider:", a4);
  return 0;
}

- (double)parallaxFactorForVariant:(int64_t)a3
{
  return 0.0;
}

- (BOOL)parallaxEnabledForVariant:(int64_t)a3
{
  return 0;
}

- (double)zoomFactorForVariant:(int64_t)a3
{
  return 1.0;
}

- (PBUIPosterWallpaperViewController)rootObject
{
  return self->_rootObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootObject, 0);
}

@end
