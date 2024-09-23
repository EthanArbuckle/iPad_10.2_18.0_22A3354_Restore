@implementation VKImage

- (id).cxx_construct
{
  *((_WORD *)self + 90) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_QWORD *)self + 8) = 0;
  return self;
}

- (const)textureCoordinates
{
  TextureAtlasRegion *ptr;

  ptr = self->_textureAtlasRegion.__ptr_;
  if (ptr)
    return (const void *)(*(uint64_t (**)(TextureAtlasRegion *))(*(_QWORD *)ptr + 32))(ptr);
  else
    return &self->_textureCoordinates;
}

- (void)prepareTextureWithAtlas:(TextureAtlas *)a3
{
  atomic<BOOL> *p_isTextureReady;
  unsigned __int8 v4;
  unsigned __int8 v7;
  VKImage *obj;

  p_isTextureReady = &self->_isTextureReady;
  v4 = atomic_load((unsigned __int8 *)&self->_isTextureReady);
  if ((v4 & 1) == 0)
  {
    obj = self;
    objc_sync_enter(obj);
    v7 = atomic_load((unsigned __int8 *)p_isTextureReady);
    if ((v7 & 1) == 0)
    {
      -[VKImage _prepareTextureWithAtlas:](obj, "_prepareTextureWithAtlas:", a3);
      atomic_store(1u, (unsigned __int8 *)&self->_isTextureReady);
    }
    objc_sync_exit(obj);

  }
}

- (void)_prepareTextureWithAtlas:(TextureAtlas *)a3
{
  unsigned __int8 v5;
  CGImage *imageRef;
  unsigned int Width;
  unsigned int Height;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned __int8 v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  void *v17;
  CGColorSpace *v18;
  CGContext *v19;
  shared_ptr<md::TextureAtlasRegion> v20;
  __shared_weak_count *cntrl;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  __shared_weak_count *v30;
  GraphicsResourceStore *ptr;
  unint64_t *p_shared_owners;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  std::__shared_weak_count *v42;
  shared_ptr<md::TextureAtlasRegion> v43;
  _QWORD *v44;
  std::__shared_weak_count *v45;
  CGRect v46;

  -[VKImage image](self, "image");
  v5 = atomic_load((unsigned __int8 *)&self->_isImageReady);
  if ((v5 & 1) == 0)
    return;
  imageRef = self->_imageRef;
  if (!imageRef)
    return;
  Width = CGImageGetWidth(imageRef);
  Height = CGImageGetHeight(self->_imageRef);
  v9 = Height;
  v10 = 1 << -(char)__clz(Width - 1);
  v11 = 1 << -__clz(Height - 1);
  if (a3)
    v12 = Height;
  else
    v12 = v11;
  if (a3)
    v13 = Width;
  else
    v13 = v10;
  {
    v40 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v40, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v15 = mdm::Allocator::instance(void)::alloc;
  v16 = (std::__shared_weak_count *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc
                                                                                         + 16))(mdm::Allocator::instance(void)::alloc, 104, 8);
  v16->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DEF80;
  v16->__shared_owners_ = 0;
  v16->__shared_weak_owners_ = 0;
  v16[1].__vftable = (std::__shared_weak_count_vtbl *)v15;
  v44 = ggl::TextureData2D::TextureData2D((uint64_t)&v16[1].__shared_owners_, v13, v12, 1u, 12, 1);
  v45 = v16;
  v17 = (void *)(*(uint64_t (**)(_QWORD *, _QWORD))(v16[1].__shared_owners_ + 16))(v44, 0);
  if (v17)
  {
    v18 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA00]);
    v19 = CGBitmapContextCreate(v17, Width, v9, 8uLL, 4 * v13, v18, 1u);
    CGColorSpaceRelease(v18);
    CGContextTranslateCTM(v19, 0.0, (double)v9);
    CGContextScaleCTM(v19, 1.0, -1.0);
    v46.size.width = (double)Width;
    v46.origin.x = 0.0;
    v46.origin.y = 0.0;
    v46.size.height = (double)v9;
    CGContextDrawImage(v19, v46, self->_imageRef);
    CGContextRelease(v19);
    MEMORY[0x1A1AF46C8](v17, *((unsigned int *)v44 + 16), 3, self->_imageHash);
  }
  if (a3)
  {
    (*((void (**)(shared_ptr<md::TextureAtlasRegion> *__return_ptr, TextureAtlas *, _QWORD **, uint64_t))a3->var0
     + 4))(&v43, a3, &v44, 1);
    v20 = v43;
    v43 = (shared_ptr<md::TextureAtlasRegion>)0;
    cntrl = self->_textureAtlasRegion.__cntrl_;
    self->_textureAtlasRegion = v20;
    if (cntrl)
    {
      v22 = (unint64_t *)((char *)cntrl + 8);
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
    v24 = (std::__shared_weak_count *)v43.__cntrl_;
    if (v43.__cntrl_)
    {
      v25 = (unint64_t *)((char *)v43.__cntrl_ + 8);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
  }
  if (!self->_textureAtlasRegion.__ptr_)
  {
    v43 = (shared_ptr<md::TextureAtlasRegion>)0;
    v30 = self->_resourceStore.__cntrl_;
    if (v30
      && (v43.__cntrl_ = (__shared_weak_count *)std::__shared_weak_count::lock((std::__shared_weak_count *)v30)) != 0)
    {
      ptr = self->_resourceStore.__ptr_;
      v43.__ptr_ = (TextureAtlasRegion *)ptr;
      if (!self->_texture.var0.var1)
        goto LABEL_38;
    }
    else
    {
      ptr = 0;
      if (!self->_texture.var0.var1)
      {
LABEL_38:
        v41 = v44;
        v42 = v45;
        if (v45)
        {
          p_shared_owners = (unint64_t *)&v45->__shared_owners_;
          do
            v33 = __ldxr(p_shared_owners);
          while (__stxr(v33 + 1, p_shared_owners));
        }
        self->_texture.var0.var1 = (*(uint64_t (**)(GraphicsResourceStore *, _QWORD **))(*(_QWORD *)ptr + 8))(ptr, &v41);
        v34 = v42;
        if (v42)
        {
          v35 = (unint64_t *)&v42->__shared_owners_;
          do
            v36 = __ldaxr(v35);
          while (__stlxr(v36 - 1, v35));
          if (!v36)
          {
            ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
            std::__shared_weak_count::__release_weak(v34);
          }
        }
        self->_textureCoordinates._minimum = 0;
        self->_textureCoordinates._maximum._e[0] = (float)Width / (float)v13;
        self->_textureCoordinates._maximum._e[1] = (float)v9 / (float)v12;
        v37 = (std::__shared_weak_count *)v43.__cntrl_;
        if (v43.__cntrl_)
        {
          v38 = (unint64_t *)((char *)v43.__cntrl_ + 8);
          do
            v39 = __ldaxr(v38);
          while (__stlxr(v39 - 1, v38));
          if (!v39)
          {
            ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
            std::__shared_weak_count::__release_weak(v37);
          }
        }
        goto LABEL_24;
      }
    }
    (*(void (**)(GraphicsResourceStore *))(*(_QWORD *)ptr + 56))(ptr);
    goto LABEL_38;
  }
LABEL_24:
  if (!self->_usedAsTextureAndImage)
  {
    CGImageRelease(self->_imageRef);
    self->_imageRef = 0;
  }
  v27 = v45;
  if (v45)
  {
    v28 = (unint64_t *)&v45->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  -[VKImage image](self, "image");
  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGImage)image
{
  atomic<BOOL> *p_isImageReady;
  unsigned __int8 v4;
  VKImage *v5;
  unsigned __int8 v6;

  p_isImageReady = &self->_isImageReady;
  v4 = atomic_load((unsigned __int8 *)&self->_isImageReady);
  if ((v4 & 1) == 0)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = atomic_load((unsigned __int8 *)p_isImageReady);
    if ((v6 & 1) == 0)
    {
      -[VKImage _prepareImage](v5, "_prepareImage");
      atomic_store(1u, (unsigned __int8 *)&self->_isImageReady);
    }
    objc_sync_exit(v5);

  }
  return self->_imageRef;
}

- (CGPoint)labelingPoint
{
  double x;
  double y;
  double v4;
  double v5;
  CGPoint result;

  if (self->_hasLabelingPoint)
  {
    x = self->_labelingPoint.x;
    y = self->_labelingPoint.y;
  }
  else
  {
    -[VKImage size](self, "size");
    x = v4 * 0.5;
    y = v5 * 0.5;
  }
  result.y = y;
  result.x = x;
  return result;
}

- (CGRect)collisionRect
{
  double x;
  double y;
  double width;
  double height;
  double v6;
  double v7;
  CGRect result;

  if (self->_hasCollisionRect)
  {
    x = self->_collisionRect.origin.x;
    y = self->_collisionRect.origin.y;
    width = self->_collisionRect.size.width;
    height = self->_collisionRect.size.height;
  }
  else
  {
    -[VKImage size](self, "size");
    width = v6;
    height = v7;
    y = 0.0;
    x = 0.0;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  double v4;
  double v5;
  CGPoint result;

  if (self->_hasAnchorPoint)
  {
    x = self->_anchorPoint.x;
    y = self->_anchorPoint.y;
  }
  else
  {
    -[VKImage size](self, "size");
    x = v4 * 0.5;
    y = v5 * 0.5;
  }
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLabelingPoint:(CGPoint)a3
{
  self->_hasLabelingPoint = 1;
  self->_labelingPoint = a3;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_hasAnchorPoint = 1;
  self->_anchorPoint = a3;
}

- (VKImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 usedAsTextureAndImage:(BOOL)a5 resourceStore:(weak_ptr<mre::GraphicsResourceStore>)a6
{
  GraphicsResourceStore *ptr;
  VKImage *v10;
  CGImage *v11;
  size_t Width;
  size_t Height;
  uint64_t v14;
  GraphicsResourceStore *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *cntrl;
  VKImage *v19;
  objc_super v21;

  ptr = a6.__ptr_;
  v21.receiver = self;
  v21.super_class = (Class)VKImage;
  v10 = -[VKImage init](&v21, sel_init, a3, a5, a6.__ptr_, a6.__cntrl_);
  if (v10)
  {
    v11 = CGImageRetain(a3);
    v10->_imageRef = v11;
    atomic_store(1u, (unsigned __int8 *)&v10->_isImageReady);
    Width = CGImageGetWidth(v11);
    Height = CGImageGetHeight(v10->_imageRef);
    v10->_size.width = (double)Width;
    v10->_size.height = (double)Height;
    v10->_scale = a4;
    v10->_usedAsTextureAndImage = a5;
    v15 = *(GraphicsResourceStore **)ptr;
    v14 = *((_QWORD *)ptr + 1);
    if (v14)
    {
      v16 = (unint64_t *)(v14 + 16);
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
    }
    cntrl = (std::__shared_weak_count *)v10->_resourceStore.__cntrl_;
    v10->_resourceStore.__ptr_ = v15;
    v10->_resourceStore.__cntrl_ = (__shared_weak_count *)v14;
    if (cntrl)
      std::__shared_weak_count::__release_weak(cntrl);
    v19 = v10;
  }

  return v10;
}

- (VKImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 resourceStore:(weak_ptr<mre::GraphicsResourceStore>)a5
{
  std::__shared_weak_count *v5;
  unint64_t *p_shared_weak_owners;
  unint64_t v7;
  VKImage *v8;
  uint64_t v10;
  std::__shared_weak_count *v11;

  v5 = (std::__shared_weak_count *)*((_QWORD *)a5.__ptr_ + 1);
  v10 = *(_QWORD *)a5.__ptr_;
  v11 = v5;
  if (v5)
  {
    p_shared_weak_owners = (unint64_t *)&v5->__shared_weak_owners_;
    do
      v7 = __ldxr(p_shared_weak_owners);
    while (__stxr(v7 + 1, p_shared_weak_owners));
  }
  v8 = -[VKImage initWithCGImage:scale:usedAsTextureAndImage:resourceStore:](self, "initWithCGImage:scale:usedAsTextureAndImage:resourceStore:", a3, 0, &v10, a4);
  if (v11)
    std::__shared_weak_count::__release_weak(v11);
  return v8;
}

- (VKImage)initWithData:(id)a3 scale:(double)a4 usedAsTextureAndImage:(BOOL)a5 resourceStore:(weak_ptr<mre::GraphicsResourceStore>)a6
{
  GraphicsResourceStore *ptr;
  id v11;
  VKImage *v12;
  VKImage *v13;
  uint64_t v14;
  GraphicsResourceStore *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *cntrl;
  VKImage *v19;
  objc_super v21;

  ptr = a6.__ptr_;
  v11 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VKImage;
  v12 = -[VKImage init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    v13->_usedAsTextureAndImage = a5;
    v13->_scale = a4;
    v15 = *(GraphicsResourceStore **)ptr;
    v14 = *((_QWORD *)ptr + 1);
    if (v14)
    {
      v16 = (unint64_t *)(v14 + 16);
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
    }
    cntrl = (std::__shared_weak_count *)v13->_resourceStore.__cntrl_;
    v13->_resourceStore.__ptr_ = v15;
    v13->_resourceStore.__cntrl_ = (__shared_weak_count *)v14;
    if (cntrl)
      std::__shared_weak_count::__release_weak(cntrl);
    v19 = v13;
  }

  return v13;
}

- (VKImage)initWithData:(id)a3 scale:(double)a4 resourceStore:(weak_ptr<mre::GraphicsResourceStore>)a5
{
  GraphicsResourceStore *ptr;
  id v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_weak_owners;
  unint64_t v11;
  VKImage *v12;
  uint64_t v14;
  std::__shared_weak_count *v15;

  ptr = a5.__ptr_;
  v8 = a3;
  v9 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v14 = *(_QWORD *)ptr;
  v15 = v9;
  if (v9)
  {
    p_shared_weak_owners = (unint64_t *)&v9->__shared_weak_owners_;
    do
      v11 = __ldxr(p_shared_weak_owners);
    while (__stxr(v11 + 1, p_shared_weak_owners));
  }
  v12 = -[VKImage initWithData:scale:usedAsTextureAndImage:resourceStore:](self, "initWithData:scale:usedAsTextureAndImage:resourceStore:", v8, 0, &v14, a4);
  if (v15)
    std::__shared_weak_count::__release_weak(v15);

  return v12;
}

- (VKImage)initWithName:(id)a3 scale:(double)a4 resourceManager:(id)a5 resourceStore:(weak_ptr<mre::GraphicsResourceStore>)a6
{
  GraphicsResourceStore *ptr;
  id v10;
  id v11;
  VKImage *v12;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  GraphicsResourceStore *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *cntrl;
  VKImage *v20;
  objc_super v22;

  ptr = a6.__ptr_;
  v10 = a3;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)VKImage;
  v12 = -[VKImage init](&v22, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v12->_scale = a4;
    objc_storeStrong((id *)&v12->_resourceManager, a5);
    v16 = *(GraphicsResourceStore **)ptr;
    v15 = *((_QWORD *)ptr + 1);
    if (v15)
    {
      v17 = (unint64_t *)(v15 + 16);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    cntrl = (std::__shared_weak_count *)v12->_resourceStore.__cntrl_;
    v12->_resourceStore.__ptr_ = v16;
    v12->_resourceStore.__cntrl_ = (__shared_weak_count *)v15;
    if (cntrl)
      std::__shared_weak_count::__release_weak(cntrl);
    v20 = v12;
  }

  return v12;
}

- (void)dealloc
{
  TextureAtlasRegion *ptr;
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;
  CGImage *imageRef;
  __shared_weak_count *v8;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  GraphicsResourceStore *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  objc_super v14;
  GraphicsResourceStore *v15;
  std::__shared_weak_count *v16;

  ptr = self->_textureAtlasRegion.__ptr_;
  if (ptr)
  {
    (*(void (**)(TextureAtlasRegion *, SEL))(*(_QWORD *)ptr + 16))(ptr, a2);
    cntrl = self->_textureAtlasRegion.__cntrl_;
    self->_textureAtlasRegion.__ptr_ = 0;
    self->_textureAtlasRegion.__cntrl_ = 0;
    if (cntrl)
    {
      v5 = (unint64_t *)((char *)cntrl + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
        imageRef = self->_imageRef;
        if (!imageRef)
          goto LABEL_8;
        goto LABEL_7;
      }
    }
  }
  imageRef = self->_imageRef;
  if (imageRef)
LABEL_7:
    CGImageRelease(imageRef);
LABEL_8:
  v8 = self->_resourceStore.__cntrl_;
  if (v8)
  {
    v9 = std::__shared_weak_count::lock((std::__shared_weak_count *)v8);
    v16 = v9;
    if (v9)
    {
      v10 = v9;
      v11 = self->_resourceStore.__ptr_;
      v15 = v11;
      if (v11)
        (*(void (**)(GraphicsResourceStore *, unint64_t))(*(_QWORD *)v11 + 56))(v11, self->_texture.var0.var1);
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)VKImage;
  -[VKImage dealloc](&v14, sel_dealloc);
}

- (handle<mre::Texture>)texture
{
  unsigned __int8 v3;
  TextureAtlasRegion *ptr;

  v3 = atomic_load((unsigned __int8 *)&self->_isTextureReady);
  if ((v3 & 1) == 0)
    -[VKImage prepareTextureWithAtlas:](self, "prepareTextureWithAtlas:", 0);
  ptr = self->_textureAtlasRegion.__ptr_;
  if (ptr)
    return (handle<mre::Texture>)(*(uint64_t (**)(TextureAtlasRegion *))(*(_QWORD *)ptr + 24))(ptr);
  else
    return self->_texture;
}

- (void)_prepareImage
{
  NSData *data;
  NSData *v4;
  CGImageSource *v5;
  NSData *v6;
  CGImage *imageRef;
  CGFloat Width;
  size_t Height;
  NSString *name;
  unint64_t v11;
  const __CFAllocator *v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  void *v18;
  char v19;
  const __CFURL *ImageAtIndex;
  CGImageSource *v21;
  CGImage *v22;
  CGFloat v23;
  size_t v24;
  VKResourceManager *resourceManager;

  data = self->_data;
  if (data && -[NSData length](data, "length"))
  {
    v4 = self->_data;
    if (_imageSourceOptions(void)::onceToken != -1)
      dispatch_once(&_imageSourceOptions(void)::onceToken, &__block_literal_global_18216);
    v5 = CGImageSourceCreateWithData((CFDataRef)v4, (CFDictionaryRef)_imageSourceOptions(void)::options);
    v6 = self->_data;
    self->_data = 0;

    if (v5)
    {
      if (CGImageSourceGetCount(v5))
      {
        if (_imageSourceOptions(void)::onceToken != -1)
          dispatch_once(&_imageSourceOptions(void)::onceToken, &__block_literal_global_18216);
        self->_imageRef = CGImageSourceCreateImageAtIndex(v5, 0, (CFDictionaryRef)_imageSourceOptions(void)::options);
        CFRelease(v5);
        imageRef = self->_imageRef;
        if (imageRef)
        {
          Width = (double)CGImageGetWidth(imageRef);
          Height = CGImageGetHeight(self->_imageRef);
          self->_size.width = Width;
          self->_size.height = (double)Height;
        }
      }
      else
      {
        CFRelease(v5);
      }
    }
    return;
  }
  name = self->_name;
  if (!name || !-[NSString length](name, "length"))
    return;
  v11 = vcvtpd_u64_f64(self->_scale);
  if (v11)
  {
    v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    while (1)
    {
      v13 = self->_name;
      v14 = v13;
      if (v11 != 1)
      {
        -[NSString stringByAppendingFormat:](v13, "stringByAppendingFormat:", CFSTR("@%lux"), v11);
        v15 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v15;
      }
      objc_msgSend(v14, "stringByAppendingPathExtension:", CFSTR("png"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[VKResourceManager pathForResourceWithName:](self->_resourceManager, "pathForResourceWithName:", v16);
      v17 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "fileExistsAtPath:", v17);

      if ((v19 & 1) != 0)
      {
        ImageAtIndex = CFURLCreateWithFileSystemPath(v12, v17, kCFURLPOSIXPathStyle, 0);
        if (!ImageAtIndex)
          goto LABEL_29;
        if (_imageSourceOptions(void)::onceToken != -1)
          dispatch_once(&_imageSourceOptions(void)::onceToken, &__block_literal_global_18216);
        v21 = CGImageSourceCreateWithURL(ImageAtIndex, (CFDictionaryRef)_imageSourceOptions(void)::options);
        CFRelease(ImageAtIndex);
        if (v21)
        {
          if (CGImageSourceGetCount(v21))
          {
            if (_imageSourceOptions(void)::onceToken != -1)
              dispatch_once(&_imageSourceOptions(void)::onceToken, &__block_literal_global_18216);
            ImageAtIndex = CGImageSourceCreateImageAtIndex(v21, 0, (CFDictionaryRef)_imageSourceOptions(void)::options);
          }
          else
          {
            ImageAtIndex = 0;
          }
          CFRelease(v21);
          goto LABEL_29;
        }
      }
      ImageAtIndex = 0;
LABEL_29:

      self->_imageRef = ImageAtIndex;
      if (!ImageAtIndex)
      {
        if (--v11)
          continue;
      }
      break;
    }
  }
  v22 = self->_imageRef;
  if (v22)
  {
    v23 = (double)CGImageGetWidth(v22);
    v24 = CGImageGetHeight(self->_imageRef);
    self->_size.width = v23;
    self->_size.height = (double)v24;
    resourceManager = self->_resourceManager;
    self->_resourceManager = 0;

  }
}

- (double)scale
{
  return self->_scale;
}

- (void)setCollisionRect:(CGRect)a3
{
  self->_hasCollisionRect = 1;
  self->_collisionRect = a3;
}

- (int)compareTo:(id)a3
{
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  int v7;

  v4 = (unint64_t *)a3;
  if (self == (VKImage *)v4
    || (-[VKImage prepareTextureWithAtlas:](self, "prepareTextureWithAtlas:", 0),
        objc_msgSend(v4, "prepareTextureWithAtlas:", 0),
        v5 = bswap64(*(_QWORD *)self->_imageHash),
        v6 = bswap64(v4[24]),
        v5 == v6)
    && (v5 = bswap64(*(_QWORD *)&self->_imageHash[8]), v6 = bswap64(v4[25]), v5 == v6))
  {
    v7 = 0;
  }
  else if (v5 < v6)
  {
    v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __shared_weak_count *v6;

  objc_storeStrong((id *)&self->_resourceManager, 0);
  cntrl = self->_textureAtlasRegion.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      v6 = self->_resourceStore.__cntrl_;
      if (!v6)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v6 = self->_resourceStore.__cntrl_;
  if (v6)
LABEL_6:
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
LABEL_7:
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
