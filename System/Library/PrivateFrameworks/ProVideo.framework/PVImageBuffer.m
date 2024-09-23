@implementation PVImageBuffer

+ (id)imageWithUIImage:(id)a3
{
  id v3;
  PVCGImageBufferImpl *v4;
  id v5;
  PVCGImageBufferImpl *v6;
  void *v7;

  v3 = a3;
  v4 = [PVCGImageBufferImpl alloc];
  v5 = objc_retainAutorelease(v3);
  v6 = -[PVCGImageBufferImpl initWithCGImage:](v4, "initWithCGImage:", objc_msgSend(v5, "CGImage"));
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImageBufferImpl:", v6);

  return v7;
}

+ (id)imageWithCGImage:(CGImage *)a3
{
  PVCGImageBufferImpl *v3;
  void *v4;

  v3 = -[PVCGImageBufferImpl initWithCGImage:]([PVCGImageBufferImpl alloc], "initWithCGImage:", a3);
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImageBufferImpl:", v3);

  return v4;
}

+ (id)imageWithCGImage:(CGImage *)a3 withGainMap:(CGImage *)a4
{
  PVCGImageBufferImpl *v4;
  void *v5;

  v4 = -[PVCGImageBufferImpl initWithCGImage:withGainMap:]([PVCGImageBufferImpl alloc], "initWithCGImage:withGainMap:", a3, a4);
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImageBufferImpl:", v4);

  return v5;
}

+ (id)imageWithCGImage:(CGImage *)a3 withSourceColorSpace:(id)a4 withDestColorSpace:(id)a5
{
  id v6;
  PVCGImageBufferImpl *v7;
  void *v8;

  v6 = a4;
  v7 = -[PVCGImageBufferImpl initWithCGImage:withSourceColorSpace:]([PVCGImageBufferImpl alloc], "initWithCGImage:withSourceColorSpace:", a3, v6);
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImageBufferImpl:", v7);

  return v8;
}

+ (id)imageWithCVPixelBuffer:(__CVBuffer *)a3
{
  PVCVPixelBufferImageBufferImpl *v3;
  void *v4;

  v3 = -[PVCVPixelBufferImageBufferImpl initWithCVPixelBuffer:]([PVCVPixelBufferImageBufferImpl alloc], "initWithCVPixelBuffer:", a3);
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImageBufferImpl:", v3);

  return v4;
}

+ (id)imageWithHGCVPixelBuffer:(HGRef<HGCVPixelBuffer>)a3
{
  PVCVPixelBufferImageBufferImpl *v4;
  uint64_t v5;
  PVCVPixelBufferImageBufferImpl *v6;
  void *v7;
  uint64_t v9;

  v4 = [PVCVPixelBufferImageBufferImpl alloc];
  v5 = *(_QWORD *)a3.m_Obj;
  v9 = v5;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 16))(v5);
  v6 = -[PVCVPixelBufferImageBufferImpl initWithHGCVPixelBuffer:](v4, "initWithHGCVPixelBuffer:", &v9);
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImageBufferImpl:", v6);

  return v7;
}

+ (id)imageWithHGBitmap:(HGRef<HGBitmap>)a3
{
  _QWORD *CVBitmapStorage;
  uint64_t v5;
  void *v6;
  void *v7;
  PVHGBitmapImageBufferImpl *v8;
  uint64_t v9;
  PVHGBitmapImageBufferImpl *v10;
  uint64_t v12;
  uint64_t v13;

  CVBitmapStorage = HGCVBitmap::getCVBitmapStorage(*(HGBitmap **)a3.m_Obj, (HGBitmap *)a2);
  if (CVBitmapStorage)
  {
    v5 = CVBitmapStorage[16];
    if (v5)
      (*(void (**)(_QWORD))(*(_QWORD *)v5 + 16))(CVBitmapStorage[16]);
    v6 = (void *)objc_opt_class();
    v13 = v5;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 16))(v5);
    objc_msgSend(v6, "imageWithHGCVPixelBuffer:", &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 24))(v13);
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
  }
  else
  {
    v8 = [PVHGBitmapImageBufferImpl alloc];
    v9 = *(_QWORD *)a3.m_Obj;
    v12 = v9;
    if (v9)
      (*(void (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9);
    v10 = -[PVHGBitmapImageBufferImpl initWithHGBitmap:](v8, "initWithHGBitmap:", &v12);
    if (v12)
      (*(void (**)(uint64_t))(*(_QWORD *)v12 + 24))(v12);
    v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImageBufferImpl:", v10);

  }
  return v7;
}

+ (id)imageWithMTLTexture:(id)a3
{
  id v3;
  PVMTLTextureImageBufferImpl *v4;
  void *v5;

  v3 = a3;
  v4 = -[PVMTLTextureImageBufferImpl initWithMTLTexture:]([PVMTLTextureImageBufferImpl alloc], "initWithMTLTexture:", v3);
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImageBufferImpl:", v4);

  return v5;
}

- (PVImageBuffer)initWithImageBufferImpl:(id)a3
{
  id v5;
  PVImageBuffer *v6;
  PVImageBuffer *v7;
  HGSynchronizable *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PVImageBuffer;
  v6 = -[PVImageBuffer init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_imageBufferImpl, a3);
    v8 = (HGSynchronizable *)operator new();
    HGSynchronizable::HGSynchronizable(v8);
    v7->_lock = v8;
  }

  return v7;
}

+ (id)imageWithProResLogUIImage:(id)a3 forColorSpace:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = objc_retainAutorelease(a3);
  objc_msgSend(a1, "imageWithProResLogCGImage:forColorSpace:", objc_msgSend(v6, "CGImage"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)imageWithProResLogCGImage:(CGImage *)a3 forColorSpace:(int)a4
{
  void *v5;
  PVCGImageBufferImpl *v6;
  void *v7;
  PVCGImageBufferImpl *v8;
  PVCVPixelBufferImageBufferImpl *v9;
  PVCVPixelBufferImageBufferImpl *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;

  if (a4)
    +[PVColorSpace rec2100HLGColorSpace](PVColorSpace, "rec2100HLGColorSpace");
  else
    +[PVColorSpace rec709GammaColorSpace](PVColorSpace, "rec709GammaColorSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PVCGImageBufferImpl alloc];
  +[PVColorSpace ProResLogColorSpace](PVColorSpace, "ProResLogColorSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PVCGImageBufferImpl initWithCGImage:withSourceColorSpace:](v6, "initWithCGImage:withSourceColorSpace:", a3, v7);

  if (v8)
    -[PVCGImageBufferImpl cvPixelBufferWithColorSpace:](v8, "cvPixelBufferWithColorSpace:", v5);
  else
    v14 = 0;
  v9 = [PVCVPixelBufferImageBufferImpl alloc];
  v13 = v14;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 16))(v14);
  v10 = -[PVCVPixelBufferImageBufferImpl initWithHGCVPixelBuffer:](v9, "initWithHGCVPixelBuffer:", &v13);

  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 24))(v13);
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImageBufferImpl:", v10);
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 24))(v14);

  return v11;
}

+ (id)imageWithProResLogCVPixelBuffer:(__CVBuffer *)a3 forColorSpace:(int)a4
{
  void *v5;
  PVCVPixelBufferImageBufferImpl *v6;
  void *v7;
  PVCVPixelBufferImageBufferImpl *v8;
  PVCVPixelBufferImageBufferImpl *v9;
  PVCVPixelBufferImageBufferImpl *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;

  if (a4)
    +[PVColorSpace rec2100HLGColorSpace](PVColorSpace, "rec2100HLGColorSpace");
  else
    +[PVColorSpace rec709GammaColorSpace](PVColorSpace, "rec709GammaColorSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PVCVPixelBufferImageBufferImpl alloc];
  +[PVColorSpace ProResLogColorSpace](PVColorSpace, "ProResLogColorSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PVCVPixelBufferImageBufferImpl initWithCVPixelBuffer:withSourceColorSpace:](v6, "initWithCVPixelBuffer:withSourceColorSpace:", a3, v7);

  if (v8)
    -[PVCVPixelBufferImageBufferImpl cvPixelBufferWithColorSpace:](v8, "cvPixelBufferWithColorSpace:", v5);
  else
    v14 = 0;
  v9 = [PVCVPixelBufferImageBufferImpl alloc];
  v13 = v14;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 16))(v14);
  v10 = -[PVCVPixelBufferImageBufferImpl initWithHGCVPixelBuffer:](v9, "initWithHGCVPixelBuffer:", &v13);

  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 24))(v13);
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImageBufferImpl:", v10);
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 24))(v14);

  return v11;
}

- (void)dealloc
{
  HGSynchronizable *lock;
  objc_super v4;

  lock = self->_lock;
  if (lock)
    (*((void (**)(HGSynchronizable *, SEL))lock->var0 + 1))(lock, a2);
  v4.receiver = self;
  v4.super_class = (Class)PVImageBuffer;
  -[PVImageBuffer dealloc](&v4, sel_dealloc);
}

- (id)uiImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  HGSynchronizable *lock;
  char v9;

  lock = self->_lock;
  v9 = 0;
  HGSynchronizable::Lock(lock);
  v3 = (void *)MEMORY[0x1E0CEA638];
  v4 = -[PVImageBufferImpl cgImage](self->_imageBufferImpl, "cgImage");
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nativeScale");
  objc_msgSend(v3, "imageWithCGImage:scale:orientation:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HGSynchronizer::~HGSynchronizer(&lock);
  return v6;
}

- (CGImage)cgImage
{
  CGImage *v3;
  HGSynchronizable *lock;
  char v6;

  lock = self->_lock;
  v6 = 0;
  HGSynchronizable::Lock(lock);
  v3 = (CGImage *)-[PVImageBufferImpl cgImage](self->_imageBufferImpl, "cgImage");
  HGSynchronizer::~HGSynchronizer(&lock);
  return v3;
}

- (BOOL)canCreateCVPixelBuffer
{
  PVImageBuffer *v2;
  HGSynchronizable *lock;
  char v5;

  v2 = self;
  lock = self->_lock;
  v5 = 0;
  HGSynchronizable::Lock(lock);
  LOBYTE(v2) = -[PVImageBufferImpl canCreateCVPixelBuffer](v2->_imageBufferImpl, "canCreateCVPixelBuffer");
  HGSynchronizer::~HGSynchronizer(&lock);
  return (char)v2;
}

- (BOOL)canCreateHGBitmap
{
  PVImageBuffer *v2;
  HGSynchronizable *lock;
  char v5;

  v2 = self;
  lock = self->_lock;
  v5 = 0;
  HGSynchronizable::Lock(lock);
  LOBYTE(v2) = -[PVImageBufferImpl canCreateHGBitmap](v2->_imageBufferImpl, "canCreateHGBitmap");
  HGSynchronizer::~HGSynchronizer(&lock);
  return (char)v2;
}

- (BOOL)cvPixelBufferRequiresCopy
{
  PVImageBuffer *v2;
  HGSynchronizable *lock;
  char v5;

  v2 = self;
  lock = self->_lock;
  v5 = 0;
  HGSynchronizable::Lock(lock);
  LOBYTE(v2) = -[PVImageBufferImpl cvPixelBufferRequiresCopy](v2->_imageBufferImpl, "cvPixelBufferRequiresCopy");
  HGSynchronizer::~HGSynchronizer(&lock);
  return (char)v2;
}

- (BOOL)cvPixelBufferRequiresRender
{
  PVImageBuffer *v2;
  HGSynchronizable *lock;
  char v5;

  v2 = self;
  lock = self->_lock;
  v5 = 0;
  HGSynchronizable::Lock(lock);
  LOBYTE(v2) = -[PVImageBufferImpl cvPixelBufferRequiresRender](v2->_imageBufferImpl, "cvPixelBufferRequiresRender");
  HGSynchronizer::~HGSynchronizer(&lock);
  return (char)v2;
}

- (__CVBuffer)cvPixelBuffer
{
  return -[PVImageBuffer cvPixelBufferWithColorSpace:](self, "cvPixelBufferWithColorSpace:", 0);
}

- (HGRef<HGBitmap>)hgBitmap
{
  return (HGRef<HGBitmap>)-[PVImageBuffer hgBitmapWithColorSpace:](self, "hgBitmapWithColorSpace:", 0);
}

- (__CVBuffer)cvPixelBufferWithColorSpace:(id)a3
{
  id v4;
  PVImageBufferImpl *imageBufferImpl;
  PVCVPixelBufferImageBufferImpl *v6;
  PVImageBufferImpl *v7;
  PVImageBufferImpl *v8;
  __CVBuffer *v9;
  _QWORD *v11;
  _QWORD *v12;
  HGSynchronizable *lock;
  char v14;

  v4 = a3;
  lock = self->_lock;
  v14 = 0;
  HGSynchronizable::Lock(lock);
  imageBufferImpl = self->_imageBufferImpl;
  if (imageBufferImpl
    && (-[PVImageBufferImpl cvPixelBufferWithColorSpace:](imageBufferImpl, "cvPixelBufferWithColorSpace:", v4), v12))
  {
    if (-[PVImageBufferImpl cvPixelBufferRequiresCopy](self->_imageBufferImpl, "cvPixelBufferRequiresCopy"))
    {
      v6 = [PVCVPixelBufferImageBufferImpl alloc];
      v11 = v12;
      (*(void (**)(_QWORD *))(*v12 + 16))(v12);
      v7 = -[PVCVPixelBufferImageBufferImpl initWithHGCVPixelBuffer:](v6, "initWithHGCVPixelBuffer:", &v11);
      if (v11)
        (*(void (**)(_QWORD *))(*v11 + 24))(v11);
      v8 = self->_imageBufferImpl;
      self->_imageBufferImpl = v7;

    }
    v9 = (__CVBuffer *)v12[3];
    (*(void (**)(_QWORD *))(*v12 + 24))(v12);
  }
  else
  {
    v9 = 0;
  }
  HGSynchronizer::~HGSynchronizer(&lock);

  return v9;
}

- (HGRef<HGBitmap>)hgBitmapWithColorSpace:(id)a3
{
  _QWORD *v3;
  _QWORD *v5;
  id v6;
  PVImageBufferImpl *imageBufferImpl;
  HGRef<HGBitmap> v8;
  HGSynchronizable *lock;
  char v10;

  v5 = v3;
  v6 = a3;
  lock = self->_lock;
  v10 = 0;
  HGSynchronizable::Lock(lock);
  imageBufferImpl = self->_imageBufferImpl;
  if (imageBufferImpl)
    -[PVImageBufferImpl hgBitmapWithColorSpace:](imageBufferImpl, "hgBitmapWithColorSpace:", v6);
  else
    *v5 = 0;
  HGSynchronizer::~HGSynchronizer(&lock);

  return v8;
}

- (CGSize)size
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  HGSynchronizable *lock;
  char v10;
  CGSize result;

  lock = self->_lock;
  v10 = 0;
  HGSynchronizable::Lock(lock);
  -[PVImageBufferImpl size](self->_imageBufferImpl, "size");
  v4 = v3;
  v6 = v5;
  HGSynchronizer::~HGSynchronizer(&lock);
  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  HGSynchronizable *lock;
  char v15;

  lock = self->_lock;
  v15 = 0;
  HGSynchronizable::Lock(lock);
  -[PVImageBufferImpl size](self->_imageBufferImpl, "size");
  v4 = v3;
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@ (%@): %p>, [%.1f x %.1f]"), v9, v11, self, v4, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  HGSynchronizer::~HGSynchronizer(&lock);
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageBufferImpl, 0);
}

@end
