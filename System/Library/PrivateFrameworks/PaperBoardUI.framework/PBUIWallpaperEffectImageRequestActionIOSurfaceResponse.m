@implementation PBUIWallpaperEffectImageRequestActionIOSurfaceResponse

- (PBUIWallpaperEffectImageRequestActionIOSurfaceResponse)initWithActualStyle:(int64_t)a3 size:(CGSize)a4 ioSurface:(id)a5
{
  double height;
  double width;
  objc_class *v9;
  __IOSurface *v10;
  id v11;
  void *v12;
  void *v13;
  xpc_object_t XPCObject;
  PBUIWallpaperEffectImageRequestActionIOSurfaceResponse *v15;
  objc_super v17;

  height = a4.height;
  width = a4.width;
  v9 = (objc_class *)MEMORY[0x1E0D017D0];
  v10 = (__IOSurface *)a5;
  v11 = objc_alloc_init(v9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forSetting:", v12, 1);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forSetting:", v13, 2);

  XPCObject = IOSurfaceCreateXPCObject(v10);
  objc_msgSend(v11, "setObject:forSetting:", XPCObject, 4);
  v17.receiver = self;
  v17.super_class = (Class)PBUIWallpaperEffectImageRequestActionIOSurfaceResponse;
  v15 = -[BSActionResponse initWithInfo:error:](&v17, sel_initWithInfo_error_, v11, 0);

  return v15;
}

- (IOSurface)ioSurface
{
  void *v2;
  void *v3;
  IOSurfaceRef v4;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = IOSurfaceLookupFromXPCObject(v3);
  return (IOSurface *)v4;
}

@end
