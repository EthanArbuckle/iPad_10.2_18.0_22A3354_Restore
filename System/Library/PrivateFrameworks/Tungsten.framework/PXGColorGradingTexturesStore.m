@implementation PXGColorGradingTexturesStore

- (PXGColorGradingTexturesStore)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGColorGradingTexturesStore.m"), 35, CFSTR("%s is not available as initializer"), "-[PXGColorGradingTexturesStore init]");

  abort();
}

- (PXGColorGradingTexturesStore)initWithMetalContext:(id)a3
{
  id v5;
  PXGColorGradingTexturesStore *v6;
  NSCache *v7;
  NSCache *cachedTextures;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  NSObject *v13;
  _QWORD block[4];
  PXGColorGradingTexturesStore *v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGColorGradingTexturesStore;
  v6 = -[PXGColorGradingTexturesStore init](&v17, sel_init);
  if (v6)
  {
    v7 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    cachedTextures = v6->_cachedTextures;
    v6->_cachedTextures = v7;

    -[NSCache setCountLimit:](v6->_cachedTextures, "setCountLimit:", 12);
    objc_storeStrong((id *)&v6->_metalRenderContext, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_DEFAULT, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.photos.color-grading-textures-store", v10);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    v13 = v6->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__PXGColorGradingTexturesStore_initWithMetalContext___block_invoke;
    block[3] = &unk_251A6E710;
    v16 = v6;
    dispatch_async(v13, block);

  }
  return v6;
}

- (id)colorGradingTextureWithColorLookupCube:(id)a3
{
  PXGColorLookupCube *v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = (PXGColorLookupCube *)a3;
  if (!v5)
  {
    v5 = self->_placeholderCube;
    if (!v5)
    {
      dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_91);
      v5 = self->_placeholderCube;
      if (!v5)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGColorGradingTexturesStore.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cube != nil"));

        v5 = 0;
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PXGColorLookupCube hash](v5, "hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](self->_cachedTextures, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[PXGColorLookupCube createTextureWithContext:](v5, "createTextureWithContext:", self->_metalRenderContext);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (-[PXGColorLookupCube shouldCache](v5, "shouldCache"))
        -[NSCache setObject:forKey:](self->_cachedTextures, "setObject:forKey:", v7, v6);
    }
  }

  return v7;
}

- (void)_createPlaceholderCube
{
  PXGTextureDataColorLookupCube *v4;
  PXGColorLookupCube *v5;
  PXGColorLookupCube *placeholderCube;
  id v7;

  if (_createPlaceholderCube_onceToken != -1)
    dispatch_once(&_createPlaceholderCube_onceToken, &__block_literal_global_14);
  v4 = [PXGTextureDataColorLookupCube alloc];
  v5 = -[PXGTextureDataColorLookupCube initWithData:edgeSize:pixelFormat:](v4, "initWithData:edgeSize:pixelFormat:", _createPlaceholderCube_data, 2, 70);
  placeholderCube = self->_placeholderCube;
  self->_placeholderCube = v5;

  if (!self->_placeholderCube)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGColorGradingTexturesStore.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_placeholderCube != nil"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalRenderContext, 0);
  objc_storeStrong((id *)&self->_placeholderCube, 0);
  objc_storeStrong((id *)&self->_cachedTextures, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __54__PXGColorGradingTexturesStore__createPlaceholderCube__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t result;
  uint64_t v3;
  __int128 *v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_createPlaceholderCube_data;
  _createPlaceholderCube_data = v0;

  result = objc_msgSend((id)_createPlaceholderCube_data, "bytes");
  v3 = 0;
  v4 = &xmmword_24945F790;
  v5 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  do
  {
    v7 = (float32x4_t)v4[2];
    v6 = (float32x4_t)v4[3];
    v9 = (float32x4_t)*v4;
    v8 = (float32x4_t)v4[1];
    v4 += 4;
    *(int16x4_t *)v7.f32 = vmovn_s32(vcvtq_s32_f32(vmulq_f32(v7, v5)));
    *(int16x4_t *)&v7.u32[2] = vmovn_s32(vcvtq_s32_f32(vmulq_f32(v6, v5)));
    *(int16x4_t *)v6.f32 = vmovn_s32(vcvtq_s32_f32(vmulq_f32(v8, v5)));
    *(int16x4_t *)v8.f32 = vmovn_s32(vcvtq_s32_f32(vmulq_f32(v9, v5)));
    v8.i64[1] = v6.i64[0];
    *(int8x16_t *)(result + v3) = vuzp1q_s8((int8x16_t)v8, (int8x16_t)v7);
    v3 += 16;
  }
  while (v3 != 32);
  return result;
}

uint64_t __53__PXGColorGradingTexturesStore_initWithMetalContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createPlaceholderCube");
}

+ (id)colorGradingTextureStoreForContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  PXGColorGradingTexturesStore *v7;
  void *v8;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  objc_msgSend(v4, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v6, sel_colorGradingTextureStoreForContext_);
  v7 = (PXGColorGradingTexturesStore *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[PXGColorGradingTexturesStore initWithMetalContext:]([PXGColorGradingTexturesStore alloc], "initWithMetalContext:", v4);
    objc_msgSend(v4, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v8, sel_colorGradingTextureStoreForContext_, v7, (void *)0x301);

  }
  objc_sync_exit(v5);

  return v7;
}

@end
