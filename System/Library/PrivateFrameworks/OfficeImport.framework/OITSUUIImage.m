@implementation OITSUUIImage

+ (void)i_performBlockWithUIImageLock:(id)a3
{
  if (i_performBlockWithUIImageLock__sOnce != -1)
    dispatch_once(&i_performBlockWithUIImageLock__sOnce, &__block_literal_global_12);
  dispatch_semaphore_wait((dispatch_semaphore_t)i_performBlockWithUIImageLock__sLock, 0xFFFFFFFFFFFFFFFFLL);
  (*((void (**)(id))a3 + 2))(a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)i_performBlockWithUIImageLock__sLock);
}

dispatch_semaphore_t __46__OITSUUIImage_i_performBlockWithUIImageLock___block_invoke()
{
  dispatch_semaphore_t result;

  result = dispatch_semaphore_create(1);
  i_performBlockWithUIImageLock__sLock = (uint64_t)result;
  return result;
}

+ (id)imageNamed:(id)a3
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v5 = +[TSUQuicklookResource imagePathForQuicklookResource:](TSUQuicklookResource, "imagePathForQuicklookResource:");
  if (!v5 || (v6 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithContentsOfFile:", v5)) == 0)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3052000000;
    v13 = __Block_byref_object_copy__4;
    v14 = __Block_byref_object_dispose__4;
    v15 = 0;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __27__OITSUUIImage_imageNamed___block_invoke;
    v9[3] = &unk_24F39B098;
    v9[4] = a3;
    v9[5] = &v10;
    objc_msgSend(a1, "i_performBlockWithUIImageLock:", v9);
    if (v11[5])
    {
      v7 = objc_alloc((Class)a1);
      v6 = (id)objc_msgSend(v7, "p_initWithUIImage:needsGuard:", v11[5], 1);

    }
    else
    {
      v6 = 0;
    }
    _Block_object_dispose(&v10, 8);
  }
  return v6;
}

void __27__OITSUUIImage_imageNamed___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x22E2DDB58]();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = (id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

- (id)p_initWithUIImage:(id)a3 needsGuard:(BOOL)a4
{
  _BOOL4 v4;
  OITSUUIImage *v6;
  OITSUUIImage *v7;
  OITSUUIImageAutoreleasePoolGuard *v8;
  OITSUUIImageAutoreleasePoolGuard *v9;
  objc_super v11;

  v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)OITSUUIImage;
  v6 = -[OITSUImage init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      v6->mUIImage = (UIImage *)a3;
      if (v4)
      {
        v8 = -[OITSUUIImageAutoreleasePoolGuard initWithUIImage:]([OITSUUIImageAutoreleasePoolGuard alloc], "initWithUIImage:", v7->mUIImage);
        v7->mGuard = v8;
        if (v8)
          v9 = v8;
      }
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (OITSUUIImage)initWithUIImage:(id)a3
{
  return (OITSUUIImage *)-[OITSUUIImage p_initWithUIImage:needsGuard:](self, "p_initWithUIImage:needsGuard:", a3, 0);
}

- (OITSUUIImage)initWithContentsOfFile:(id)a3
{
  return -[OITSUUIImage initWithUIImage:](self, "initWithUIImage:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithContentsOfFile:", a3));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUIImage:", self->mUIImage);
}

- (void)dealloc
{
  OITSUUIImageAutoreleasePoolGuard *mGuard;
  OITSUUIImageAutoreleasePoolGuard *v4;
  objc_super v5;

  mGuard = self->mGuard;
  if (mGuard)
    v4 = mGuard;
  else

  v5.receiver = self;
  v5.super_class = (Class)OITSUUIImage;
  -[OITSUImage dealloc](&v5, sel_dealloc);
}

- (id)UIImage
{
  OITSUUIImageAutoreleasePoolGuard *mGuard;
  OITSUUIImageAutoreleasePoolGuard *v4;

  mGuard = self->mGuard;
  if (mGuard)
    v4 = mGuard;
  return self->mUIImage;
}

- (CGSize)size
{
  OITSUUIImageAutoreleasePoolGuard *mGuard;
  OITSUUIImageAutoreleasePoolGuard *v4;
  double v5;
  double v6;
  CGSize result;

  mGuard = self->mGuard;
  if (mGuard)
    v4 = mGuard;
  -[UIImage size](self->mUIImage, "size");
  result.height = v6;
  result.width = v5;
  return result;
}

- (double)scale
{
  OITSUUIImageAutoreleasePoolGuard *mGuard;
  OITSUUIImageAutoreleasePoolGuard *v4;
  double result;

  mGuard = self->mGuard;
  if (mGuard)
    v4 = mGuard;
  -[UIImage scale](self->mUIImage, "scale");
  return result;
}

- (CGImage)CGImage
{
  OITSUUIImageAutoreleasePoolGuard *mGuard;
  OITSUUIImageAutoreleasePoolGuard *v4;

  mGuard = self->mGuard;
  if (mGuard)
    v4 = mGuard;
  return -[UIImage CGImage](self->mUIImage, "CGImage");
}

- (CGImage)CGImageForSize:(CGSize)a3
{
  OITSUUIImageAutoreleasePoolGuard *mGuard;
  OITSUUIImageAutoreleasePoolGuard *v5;

  mGuard = self->mGuard;
  if (mGuard)
    v5 = mGuard;
  return -[UIImage CGImage](self->mUIImage, "CGImage", a3.width, a3.height);
}

- (int64_t)imageOrientation
{
  OITSUUIImageAutoreleasePoolGuard *mGuard;
  OITSUUIImageAutoreleasePoolGuard *v4;

  mGuard = self->mGuard;
  if (mGuard)
    v4 = mGuard;
  return -[UIImage imageOrientation](self->mUIImage, "imageOrientation");
}

@end
