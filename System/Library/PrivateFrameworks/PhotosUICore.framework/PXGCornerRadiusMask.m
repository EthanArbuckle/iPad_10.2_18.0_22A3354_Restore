@implementation PXGCornerRadiusMask

- (PXGCornerRadiusMask)initWithDevice:(id)a3 maxCornerRadius:(double)a4 screenScale:(double)a5
{
  id v9;
  PXGCornerRadiusMask *v10;
  PXGCornerRadiusMask *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXGCornerRadiusMask;
  v10 = -[PXGCornerRadiusMask init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_device, a3);
    v11->_screenScale = a5;
    v11->_maxCornerRadius = a4;
    -[PXGCornerRadiusMask _loadCornerRadiusTexture](v11, "_loadCornerRadiusTexture");
  }

  return v11;
}

- (PXGCornerRadiusMask)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGCornerRadiusMask.m"), 62, CFSTR("%s is not available as initializer"), "-[PXGCornerRadiusMask init]");

  abort();
}

- (void)_loadCornerRadiusTexture
{
  double v3;
  int64_t v4;
  int64_t v5;
  NSObject *v6;
  _QWORD block[9];

  v3 = (double)(uint64_t)self->_maxCornerRadius * 1.528665;
  v4 = llround((double)(uint64_t)round((double)(uint64_t)self->_screenScale * (double)(uint64_t)ceil(v3 + v3)) * 0.5);
  v5 = (uint64_t)self->_screenScale * (uint64_t)self->_maxCornerRadius + 1;
  self->_texturePixelSide = v4;
  self->_numberOfSlices = v5;
  self->_byteSize = 2 * v4 * v5;
  +[PXGCornerRadiusMask _loadQueue](PXGCornerRadiusMask, "_loadQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PXGCornerRadiusMask__loadCornerRadiusTexture__block_invoke;
  block[3] = &unk_1E51490B0;
  block[4] = self;
  block[5] = v4;
  block[6] = v5;
  block[7] = v4;
  block[8] = (uint64_t)(double)(2 * v4);
  dispatch_async(v6, block);

}

- (MTLTexture)texture
{
  void *v3;
  NSObject *v4;

  -[PXGCornerRadiusMask atomicTexture](self, "atomicTexture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[PXGCornerRadiusMask _loadQueue](PXGCornerRadiusMask, "_loadQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v4, &__block_literal_global_13_43340);

    -[PXGCornerRadiusMask atomicTexture](self, "atomicTexture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (MTLTexture *)v3;
}

- (int64_t)texturePixelSide
{
  return self->_texturePixelSide;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (double)maxCornerRadius
{
  return self->_maxCornerRadius;
}

- (int64_t)numberOfSlices
{
  return self->_numberOfSlices;
}

- (int64_t)byteSize
{
  return self->_byteSize;
}

- (MTLTexture)atomicTexture
{
  return (MTLTexture *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAtomicTexture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atomicTexture, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __47__PXGCornerRadiusMask__loadCornerRadiusTexture__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CGContext *v4;
  CGFloat v5;
  uint64_t v6;
  double v7;
  double v8;
  id v9;
  void *Data;
  uint64_t v11;
  _QWORD v12[6];
  CGAffineTransform transform;
  CGRect v14;
  CGRect v15;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextureType:", 3);
  objc_msgSend(v2, "setArrayLength:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "newTextureWithDescriptor:", v2);
  v4 = CGBitmapContextCreate(0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40), 8uLL, *(_QWORD *)(a1 + 56), 0, 7u);
  v5 = (double)*(uint64_t *)(a1 + 40);
  transform.b = 0.0;
  transform.c = 0.0;
  transform.a = 1.0;
  *(_OWORD *)&transform.d = xmmword_1A7C0C3F0;
  transform.ty = v5;
  CGContextConcatCTM(v4, &transform);
  if (*(uint64_t *)(a1 + 48) >= 1)
  {
    v6 = 0;
    v7 = (double)*(uint64_t *)(a1 + 64);
    v8 = (double)*(uint64_t *)(a1 + 40);
    do
    {
      CGContextSaveGState(v4);
      CGContextSetBlendMode(v4, kCGBlendModeCopy);
      CGContextSetRGBFillColor(v4, 0.0, 0.0, 0.0, 0.0);
      v14.origin.x = 0.0;
      v14.origin.y = 0.0;
      v14.size.width = v8;
      v14.size.height = v8;
      CGContextFillRect(v4, v14);
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v7, v7, (double)v6);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextAddPath(v4, (CGPathRef)objc_msgSend(v9, "CGPath"));
      CGContextClip(v4);
      CGContextSetRGBFillColor(v4, 1.0, 1.0, 1.0, 1.0);
      v15.origin.x = 0.0;
      v15.origin.y = 0.0;
      v15.size.width = v7;
      v15.size.height = v7;
      CGContextFillRect(v4, v15);
      Data = CGBitmapContextGetData(v4);
      v11 = *(_QWORD *)(a1 + 40);
      memset(v12, 0, 24);
      v12[3] = v11;
      v12[4] = v11;
      v12[5] = 1;
      objc_msgSend(v3, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v12, 0, v6, Data, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 56) * v11);
      CGContextRestoreGState(v4);

      ++v6;
    }
    while (v6 < *(_QWORD *)(a1 + 48));
  }
  CGContextRelease(v4);
  objc_msgSend(*(id *)(a1 + 32), "setAtomicTexture:", v3);

}

+ (id)_loadQueue
{
  if (_loadQueue_onceToken != -1)
    dispatch_once(&_loadQueue_onceToken, &__block_literal_global_43357);
  return (id)_loadQueue_queue;
}

+ (id)cornerRadiusMaskForDevice:(id)a3 maxCornerRadius:(double)a4 screenScale:(double)a5
{
  id v7;
  void *v8;
  PXGCornerRadiusMask *v9;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("device:%p maxCornerRadius:%.5f screenScale:%.5f"), v7, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (cornerRadiusMaskForDevice_maxCornerRadius_screenScale__onceToken != -1)
    dispatch_once(&cornerRadiusMaskForDevice_maxCornerRadius_screenScale__onceToken, &__block_literal_global_3_43354);
  objc_msgSend((id)cornerRadiusMaskForDevice_maxCornerRadius_screenScale__cache, "objectForKey:", v8);
  v9 = (PXGCornerRadiusMask *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = -[PXGCornerRadiusMask initWithDevice:maxCornerRadius:screenScale:]([PXGCornerRadiusMask alloc], "initWithDevice:maxCornerRadius:screenScale:", v7, a4, a5);
    objc_msgSend((id)cornerRadiusMaskForDevice_maxCornerRadius_screenScale__cache, "setObject:forKey:", v9, v8);
  }

  return v9;
}

uint64_t __77__PXGCornerRadiusMask_cornerRadiusMaskForDevice_maxCornerRadius_screenScale___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)cornerRadiusMaskForDevice_maxCornerRadius_screenScale__cache;
  cornerRadiusMaskForDevice_maxCornerRadius_screenScale__cache = (uint64_t)v0;

  return objc_msgSend((id)cornerRadiusMaskForDevice_maxCornerRadius_screenScale__cache, "setCountLimit:", 2);
}

void __33__PXGCornerRadiusMask__loadQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.photos.PXGCornerRadiusMask-loadQueue", attr);
  v2 = (void *)_loadQueue_queue;
  _loadQueue_queue = (uint64_t)v1;

}

@end
