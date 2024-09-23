@implementation WFBitmapContext

- (WFBitmapContext)initWithCGContext:(CGContext *)a3 scale:(double)a4
{
  WFBitmapContext *v7;
  WFBitmapContext *v8;
  void *v11;
  objc_super v12;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFBitmapContext.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("CGContext"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFBitmapContext;
  v7 = -[WFBitmapContext init](&v12, sel_init);
  if (v7)
  {
    v7->_scale = WFEffectiveScaleForScale(a4);
    v7->_CGContext = CGContextRetain(a3);
    v8 = v7;
  }

  return v7;
}

- (WFBitmapContext)initWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5
{
  return -[WFBitmapContext initWithSize:opaque:scale:colorspace:flipped:](self, "initWithSize:opaque:scale:colorspace:flipped:", a4, 0, 1, a3.width, a3.height, a5);
}

- (WFBitmapContext)initWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 colorspace:(CGColorSpace *)a6
{
  return -[WFBitmapContext initWithSize:opaque:scale:colorspace:hdrCapable:](self, "initWithSize:opaque:scale:colorspace:hdrCapable:", a4, a6, 0, a3.width, a3.height, a5);
}

- (WFBitmapContext)initWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 colorspace:(CGColorSpace *)a6 hdrCapable:(BOOL)a7
{
  return -[WFBitmapContext initWithSize:opaque:scale:colorspace:flipped:hdrCapable:](self, "initWithSize:opaque:scale:colorspace:flipped:hdrCapable:", a4, a6, 1, a7, a3.width, a3.height, a5);
}

- (WFBitmapContext)initWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 colorspace:(CGColorSpace *)a6 flipped:(BOOL)a7
{
  return -[WFBitmapContext initWithSize:opaque:scale:colorspace:flipped:hdrCapable:](self, "initWithSize:opaque:scale:colorspace:flipped:hdrCapable:", a4, a6, a7, 0, a3.width, a3.height, a5);
}

- (WFBitmapContext)initWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 colorspace:(CGColorSpace *)a6 flipped:(BOOL)a7 hdrCapable:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  double height;
  double width;
  double v16;
  double v17;
  void *v18;
  double v19;
  size_t v20;
  size_t v21;
  void *v22;
  void *v23;
  void *v24;
  CGContext *v25;
  double v26;
  WFBitmapContext *v27;
  WFBitmapContext *v28;
  CGColorSpace *v29;
  CGAffineTransform v31;
  _QWORD aBlock[5];
  BOOL v33;
  uint64_t v34;
  _QWORD v35[2];
  CGRect v36;

  v8 = a8;
  v9 = a7;
  height = a3.height;
  width = a3.width;
  v35[1] = *MEMORY[0x1E0C80C00];
  v16 = WFEffectiveScaleForScale(a5);
  if (width <= 0.0 || height <= 0.0)
    goto LABEL_11;
  v17 = v16;
  if (v16 == 0.0)
  {
    +[WFDevice currentDevice](WFDevice, "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "screenScale");
    v17 = v19;

  }
  v20 = vcvtpd_u64_f64(width * v17);
  v21 = vcvtpd_u64_f64(height * v17);
  if (!v8)
  {
    v29 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
    v25 = CGBitmapContextCreate(0, v20, v21, 8uLL, 4 * v20, v29, 1u);
    CGColorSpaceRelease(v29);
    if (v25)
      goto LABEL_7;
LABEL_11:
    v28 = 0;
    goto LABEL_12;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __WFCreateBitmapContext_block_invoke;
  aBlock[3] = &__block_descriptor_41_e91_B32__0_CGBitmapContextContentInfo_IiIBB_8__CGBitmapContextInfo_IQQQQiII__CGColorSpace_BI_24l;
  v33 = a4;
  aBlock[4] = a6;
  v22 = _Block_copy(aBlock);
  v34 = *MEMORY[0x1E0C9D8D8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (CGContext *)CGBitmapContextCreateWithCallbacks();
  if (!v25)
    goto LABEL_11;
LABEL_7:
  v36.size.width = (double)v20;
  v36.origin.x = 0.0;
  v36.origin.y = 0.0;
  v36.size.height = (double)v21;
  CGContextClearRect(v25, v36);
  v26 = v17;
  if (v9)
  {
    CGContextTranslateCTM(v25, 0.0, (double)v21);
    v26 = -v17;
  }
  CGContextScaleCTM(v25, v17, v26);
  CGContextGetCTM(&v31, v25);
  CGContextSetBaseCTM();
  v27 = -[WFBitmapContext initWithCGContext:scale:](self, "initWithCGContext:scale:", v25, a5);
  CGContextRelease(v25);
  self = v27;
  v28 = self;
LABEL_12:

  return v28;
}

- (void)dealloc
{
  objc_super v3;

  CGContextRelease(self->_CGContext);
  v3.receiver = self;
  v3.super_class = (Class)WFBitmapContext;
  -[WFBitmapContext dealloc](&v3, sel_dealloc);
}

- (id)imageWithOrientation:(unsigned int)a3
{
  uint64_t v3;
  WFBitmapContext *v4;
  CGImageRef Image;
  CGImage *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  v4 = objc_retainAutorelease(self);
  Image = CGBitmapContextCreateImage(-[WFBitmapContext CGContext](v4, "CGContext"));
  if (Image)
  {
    v6 = Image;
    -[WFBitmapContext scale](v4, "scale");
    +[WFImage imageWithCGImage:scale:orientation:](WFImage, "imageWithCGImage:scale:orientation:", v6, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v6);
  }
  else
  {
    v7 = (void *)objc_opt_new();
  }
  return v7;
}

- (void)becomeCurrent
{
  CGContext *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v2 = -[WFBitmapContext CGContext](objc_retainAutorelease(self), "CGContext");
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v3 = getUIGraphicsPushContextSymbolLoc_ptr;
  v10 = getUIGraphicsPushContextSymbolLoc_ptr;
  if (!getUIGraphicsPushContextSymbolLoc_ptr)
  {
    v4 = UIKitLibrary_16836();
    v3 = dlsym(v4, "UIGraphicsPushContext");
    v8[3] = (uint64_t)v3;
    getUIGraphicsPushContextSymbolLoc_ptr = v3;
  }
  _Block_object_dispose(&v7, 8);
  if (v3)
  {
    ((void (*)(CGContext *))v3)(v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void soft_UIGraphicsPushContext(CGContextRef)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("WFBitmapContext.m"), 23, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)resignCurrent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getUIGraphicsPopContextSymbolLoc_ptr;
  v9 = getUIGraphicsPopContextSymbolLoc_ptr;
  if (!getUIGraphicsPopContextSymbolLoc_ptr)
  {
    v3 = UIKitLibrary_16836();
    v2 = dlsym(v3, "UIGraphicsPopContext");
    v7[3] = (uint64_t)v2;
    getUIGraphicsPopContextSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (v2)
  {
    ((void (*)(void))v2)();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void soft_UIGraphicsPopContext(void)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFBitmapContext.m"), 24, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (CGContext)CGContext
{
  return self->_CGContext;
}

- (id)image
{
  return -[WFBitmapContext imageWithOrientation:](self, "imageWithOrientation:", 1);
}

+ (id)contextWithSize:(CGSize)a3 scale:(double)a4
{
  return -[WFBitmapContext initWithSize:opaque:scale:]([WFBitmapContext alloc], "initWithSize:opaque:scale:", 0, a3.width, a3.height, a4);
}

+ (id)contextWithSize:(CGSize)a3 scale:(double)a4 flipped:(BOOL)a5
{
  return -[WFBitmapContext initWithSize:opaque:scale:colorspace:flipped:]([WFBitmapContext alloc], "initWithSize:opaque:scale:colorspace:flipped:", 0, 0, a5, a3.width, a3.height, a4);
}

+ (id)contextWithDeviceScreenScaleAndSize:(CGSize)a3
{
  return (id)objc_msgSend(a1, "contextWithSize:scale:", a3.width, a3.height, 0.0);
}

+ (id)HDRCapableContextWithSize:(CGSize)a3 scale:(double)a4
{
  return -[WFBitmapContext initWithSize:opaque:scale:colorspace:flipped:hdrCapable:]([WFBitmapContext alloc], "initWithSize:opaque:scale:colorspace:flipped:hdrCapable:", 0, 0, 1, 1, a3.width, a3.height, a4);
}

+ (id)currentContextWithScale:(double)a3
{
  WFBitmapContext *v4;
  void *v5;
  void *v6;
  id result;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v4 = [WFBitmapContext alloc];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v5 = getUIGraphicsGetCurrentContextSymbolLoc_ptr;
  v13 = getUIGraphicsGetCurrentContextSymbolLoc_ptr;
  if (!getUIGraphicsGetCurrentContextSymbolLoc_ptr)
  {
    v6 = UIKitLibrary_16836();
    v5 = dlsym(v6, "UIGraphicsGetCurrentContext");
    v11[3] = (uint64_t)v5;
    getUIGraphicsGetCurrentContextSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&v10, 8);
  if (v5)
    return -[WFBitmapContext initWithCGContext:scale:](v4, "initWithCGContext:scale:", ((uint64_t (*)(void))v5)(), a3);
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGContextRef  _Nullable soft_UIGraphicsGetCurrentContext(void)");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("WFBitmapContext.m"), 22, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

@end
