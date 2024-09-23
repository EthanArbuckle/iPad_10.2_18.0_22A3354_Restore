@implementation PXGImageTexture

- (PXGImageTexture)init
{
  PXGImageTexture *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXGImageTexture;
  v2 = -[PXGBaseTexture init](&v4, sel_init);
  if (v2)
  {
    objc_opt_class();
    kdebug_trace();
  }
  return v2;
}

- (void)setSourceCGImage:(CGImage *)a3
{
  CGImage *sourceCGImage;

  sourceCGImage = self->_sourceCGImage;
  if (sourceCGImage != a3)
  {
    CGImageRelease(sourceCGImage);
    self->_sourceCGImage = CGImageRetain(a3);
  }
}

- (CGImage)sourceCGImage
{
  CGImage *result;

  result = CGImageRetain(self->_sourceCGImage);
  if (result)
    return (CGImage *)CFAutorelease(result);
  return result;
}

- (void)setSourceCVPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *sourceCVPixelBuffer;

  sourceCVPixelBuffer = self->_sourceCVPixelBuffer;
  if (sourceCVPixelBuffer != a3)
  {
    CVPixelBufferRelease(sourceCVPixelBuffer);
    self->_sourceCVPixelBuffer = CVPixelBufferRetain(a3);
  }
}

- (__CVBuffer)sourceCVPixelBuffer
{
  __CVBuffer *result;

  result = CVPixelBufferRetain(self->_sourceCVPixelBuffer);
  if (result)
    return (__CVBuffer *)CFAutorelease(result);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[PXGBaseTexture pixelSize](self, "pixelSize");
  -[PXGBaseTexture isOpaque](self, "isOpaque");
  kdebug_trace();
  CVPixelBufferRelease(self->_sourceCVPixelBuffer);
  CGImageRelease(self->_sourceCGImage);
  v3.receiver = self;
  v3.super_class = (Class)PXGImageTexture;
  -[PXGBaseTexture dealloc](&v3, sel_dealloc);
}

- (id)copyWithOrientationTransform:(float)a3 alpha:
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGImageTexture.m"), 70, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGImageTexture copyWithOrientationTransform:alpha:]", v7);

  abort();
}

- (double)orientationTransform
{
  double result;

  *(_QWORD *)&result = 1065353216;
  return result;
}

- (float)alpha
{
  return 1.0;
}

- (CGImage)imageRepresentation
{
  int8x16_t v4;
  double v5;
  double v6;
  void *v7;
  int8x16_t v8;
  void *v9;
  void *v10;
  const void *v11;
  CGImage *v12;
  int8x16_t v13;
  double v14;
  float64x2_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;

  if (-[PXGImageTexture sourceCGImage](self, "sourceCGImage"))
    return -[PXGImageTexture sourceCGImage](self, "sourceCGImage");
  if (!-[PXGImageTexture sourceCVPixelBuffer](self, "sourceCVPixelBuffer"))
    return 0;
  -[PXGImageTexture orientationTransform](self, "orientationTransform");
  v13 = v4;
  v5 = *(float *)v4.i32;
  v6 = *(float *)&v4.i32[3];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithCVPixelBuffer:", -[PXGImageTexture sourceCVPixelBuffer](self, "sourceCVPixelBuffer"));
  v8 = v13;
  v8.i32[0] = vextq_s8(v8, v8, 8uLL).u32[0];
  v14 = v5;
  v15 = vcvtq_f64_f32(*(float32x2_t *)v8.i8);
  v16 = v6;
  v17 = 0;
  v18 = 0;
  objc_msgSend(v7, "imageByApplyingTransform:", &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_sharedCIContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extent");
  v11 = (const void *)objc_msgSend(v10, "createCGImage:fromRect:", v9);
  if (v11)
    v12 = (CGImage *)CFAutorelease(v11);
  else
    v12 = 0;

  return v12;
}

- (void)getTextureInfos:(id *)a3 forSpriteIndexes:(const unsigned int *)a4 geometries:(id *)a5 spriteStyles:(id *)a6 spriteInfos:(id *)a7 screenScale:(double)a8 count:(unsigned int)a9
{
  uint64_t v9;
  const unsigned int *v13;
  $3BA783FF50B239963188BE194EBFFEBA *v14;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v25;
  int v26;
  float32x4_t v27;
  unsigned int v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  float32x4_t v32;
  _OWORD v33[4];

  LODWORD(v9) = a9;
  v13 = a4;
  v14 = a3;
  if (-[PXGBaseTexture spriteCount](self, "spriteCount", a3, a4, a5, a6, a7) < a9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGImageTexture.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count <= self.spriteCount"));

  }
  -[PXGBaseTexture pixelSize](self, "pixelSize");
  v18 = v17;
  v20 = v19;
  PXSizeScale();
  v22 = v21;
  v24 = v23;
  -[PXGImageTexture alpha](self, "alpha");
  v26 = v25;
  -[PXGImageTexture orientationTransform](self, "orientationTransform");
  if ((_DWORD)v9)
  {
    v9 = v9;
    v32 = v27;
    do
    {
      v28 = *v13++;
      PXGCreateTextureInfo(*((unsigned __int8 *)&a6[1].var3 + 160 * v28 + 2), (uint64_t)v33, v18, v20, v22, v24, a8, 0.0, 0.0, COERCE_FLOAT(*((_QWORD *)&a5[1].var0.var0 + 4 * v28)), COERCE_FLOAT(HIDWORD(*((_QWORD *)&a5[1].var0.var0 + 4 * v28))), v27, v26);
      v27 = v32;
      v29 = v33[1];
      *(_OWORD *)&v14->var0 = v33[0];
      *(_OWORD *)&v14[4].var0 = v29;
      v30 = v33[3];
      *(_OWORD *)&v14[8].var0 = v33[2];
      *(_OWORD *)&v14[12].var0 = v30;
      v14 += 16;
      --v9;
    }
    while (v9);
  }
}

- (id)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  objc_storeStrong(&self->_cacheKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cacheKey, 0);
}

+ (id)_sharedCIContext
{
  if (_sharedCIContext_onceToken != -1)
    dispatch_once(&_sharedCIContext_onceToken, &__block_literal_global_457);
  return (id)_sharedCIContext_ciContext;
}

void __35__PXGImageTexture__sharedCIContext__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBF648]);
  v1 = (void *)_sharedCIContext_ciContext;
  _sharedCIContext_ciContext = (uint64_t)v0;

}

@end
