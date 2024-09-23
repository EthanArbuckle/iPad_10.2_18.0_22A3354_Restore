@implementation PXShadowImageCache

- (PXShadowImageCache)init
{
  PXShadowImageCache *v2;
  uint64_t v3;
  NSMapTable *weakCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXShadowImageCache;
  v2 = -[PXShadowImageCache init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0x10000, 5, 0);
    weakCache = v2->_weakCache;
    v2->_weakCache = (NSMapTable *)v3;

  }
  return v2;
}

- (id)stretchableShadowImageFor:(id)a3 cornerRadius:(double)a4 screenScale:(double)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  CGImage *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = 0;
  if (v8 && a5 != 0.0)
  {
    v10 = objc_alloc((Class)off_1E50B5CD8);
    v21[0] = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithObjects:", v13);

    -[NSMapTable objectForKey:](self->_weakCache, "objectForKey:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v15 = *((_OWORD *)off_1E50B8020 + 1);
      v19 = *(_OWORD *)off_1E50B8020;
      v20 = v15;
      v16 = (CGImage *)PXGCreateResizableShadowImage(v8, &v19, a4, a5);
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v16, 0, a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v16);
      objc_msgSend(v17, "resizableImageWithCapInsets:resizingMode:", 1, v19, v20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMapTable setObject:forKey:](self->_weakCache, "setObject:forKey:", v9, v14);
    }

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakCache, 0);
}

+ (PXShadowImageCache)sharedInstance
{
  if (sharedInstance_onceToken_188647 != -1)
    dispatch_once(&sharedInstance_onceToken_188647, &__block_literal_global_188648);
  return (PXShadowImageCache *)(id)sharedInstance_sharedInstance_188649;
}

void __36__PXShadowImageCache_sharedInstance__block_invoke()
{
  PXShadowImageCache *v0;
  void *v1;

  v0 = objc_alloc_init(PXShadowImageCache);
  v1 = (void *)sharedInstance_sharedInstance_188649;
  sharedInstance_sharedInstance_188649 = (uint64_t)v0;

}

@end
