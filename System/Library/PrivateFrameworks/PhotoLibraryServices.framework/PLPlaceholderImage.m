@implementation PLPlaceholderImage

- (PLPlaceholderImage)init
{
  PLPlaceholderImage *v2;
  NSCache *v3;
  NSCache *dumbCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLPlaceholderImage;
  v2 = -[PLPlaceholderImage init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    dumbCache = v2->_dumbCache;
    v2->_dumbCache = v3;

  }
  return v2;
}

- (CGImage)newPlaceholderImageWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CGImage *v12;
  NSSize v14;

  height = a3.height;
  width = a3.width;
  DCIM_resolvedPlaceholderImageColor();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  v14.width = width;
  v14.height = height;
  NSStringFromSize(v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@~%lu"), v8, objc_msgSend(v6, "hash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCache objectForKey:](self->_dumbCache, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    DCIM_imageWithColor();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v12 = 0;
      goto LABEL_5;
    }
    v10 = (void *)v11;
    -[NSCache setObject:forKey:](self->_dumbCache, "setObject:forKey:", v11, v9);
  }
  v12 = (CGImage *)DCIM_CGImageRefFromPLImage();
  CGImageRetain(v12);

LABEL_5:
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dumbCache, 0);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_72745 != -1)
    dispatch_once(&sharedManager_onceToken_72745, &__block_literal_global_72746);
  return (id)sharedManager_placeholderMaker;
}

void __35__PLPlaceholderImage_sharedManager__block_invoke()
{
  PLPlaceholderImage *v0;
  void *v1;

  v0 = objc_alloc_init(PLPlaceholderImage);
  v1 = (void *)sharedManager_placeholderMaker;
  sharedManager_placeholderMaker = (uint64_t)v0;

}

@end
