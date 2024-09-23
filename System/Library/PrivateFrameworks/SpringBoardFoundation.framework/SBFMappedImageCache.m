@implementation SBFMappedImageCache

+ (id)systemAppPersistenteCache
{
  _QWORD *v4;
  void *v6;

  v4 = (_QWORD *)MEMORY[0x1E0CEB258];
  if ((objc_msgSend((id)*MEMORY[0x1E0CEB258], "isFrontBoard") & 1) == 0 && *v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBFMappedImageCache.m"), 24, CFSTR("-[SBFMappedImageCache systemAppPersistenteCache] Allowed only in system app"));

  }
  if (systemAppPersistenteCache___once != -1)
    dispatch_once(&systemAppPersistenteCache___once, &__block_literal_global_13);
  return (id)systemAppPersistenteCache___cache;
}

void __48__SBFMappedImageCache_systemAppPersistenteCache__block_invoke()
{
  SBFMappedImageCache *v0;
  void *v1;

  v0 = -[SBFMappedImageCache initWithUniqueIdentifier:]([SBFMappedImageCache alloc], "initWithUniqueIdentifier:", CFSTR("Persistent"));
  v1 = (void *)systemAppPersistenteCache___cache;
  systemAppPersistenteCache___cache = (uint64_t)v0;

}

- (SBFMappedImageCache)initWithDescription:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFMappedImageCache;
  return -[SBFMappedImageCache initWithUniqueIdentifier:](&v4, sel_initWithUniqueIdentifier_, a3);
}

- (id)imageForKey:(id)a3 generateImageWithBlockIfNecessary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__SBFMappedImageCache_imageForKey_generateImageWithBlockIfNecessary___block_invoke;
    v12[3] = &unk_1E200EC80;
    v13 = v7;
    v9 = (void *)MEMORY[0x18D774178](v12);

  }
  else
  {
    v9 = 0;
  }
  -[SBFMappedImageCache _imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:](self, "_imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:", v6, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __69__SBFMappedImageCache_imageForKey_generateImageWithBlockIfNecessary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)imageForKey:(id)a3 options:(int)a4 generateImageWithBlockIfNecessary:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__SBFMappedImageCache_imageForKey_options_generateImageWithBlockIfNecessary___block_invoke;
    v14[3] = &unk_1E200EC80;
    v15 = v9;
    v11 = (void *)MEMORY[0x18D774178](v14);

  }
  else
  {
    v11 = 0;
  }
  -[SBFMappedImageCache _imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:](self, "_imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:", v8, v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __77__SBFMappedImageCache_imageForKey_options_generateImageWithBlockIfNecessary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)imageForKey:(id)a3 options:(int)a4
{
  return (id)-[SBFMappedImageCache _imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:](self, "_imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:", a3, *(_QWORD *)&a4, 0);
}

- (id)imageForKey:(id)a3 cacheOptions:(unint64_t)a4 generateImageWithBlockIfNecessary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, _QWORD *);
  void *v17;
  id v18;
  unint64_t v19;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __82__SBFMappedImageCache_imageForKey_cacheOptions_generateImageWithBlockIfNecessary___block_invoke;
    v17 = &unk_1E200ECA8;
    v19 = a4;
    v18 = v9;
    v11 = (void *)MEMORY[0x18D774178](&v14);

  }
  else
  {
    v11 = 0;
  }
  -[SBFMappedImageCache _imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:](self, "_imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:", v8, 0, v11, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __82__SBFMappedImageCache_imageForKey_cacheOptions_generateImageWithBlockIfNecessary___block_invoke(uint64_t a1, _QWORD *a2)
{
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
    *a2 = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
