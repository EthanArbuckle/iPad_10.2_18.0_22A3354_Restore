@implementation PXGMetalImageTexture

- (int64_t)renderPipelineIndex
{
  return self->_renderPipelineIndex;
}

- (void)setRenderPipelineIndex:(int64_t)a3
{
  self->_renderPipelineIndex = a3;
}

- (PXGColorProgram)colorProgram
{
  return self->_colorProgram;
}

- (unsigned)presentationType
{
  return self->_presentationType;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textureCache);
  objc_msgSend(WeakRetained, "recycleTexture:", self->_texture);

  v4.receiver = self;
  v4.super_class = (Class)PXGMetalImageTexture;
  -[PXGImageTexture dealloc](&v4, sel_dealloc);
}

- (BOOL)isOpaque
{
  return self->_isContentOpaque && self->_alpha >= 1.0;
}

- (int)shaderFlags
{
  return self->_shaderFlags;
}

- (BOOL)isAtlas
{
  return 0;
}

- (float)alpha
{
  return self->_alpha;
}

- (__n128)orientationTransform
{
  return a1[9];
}

- (CGSize)pixelSize
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = (double)(unint64_t)-[MTLTexture width](self->_texture, "width");
  v4 = (double)(unint64_t)-[MTLTexture height](self->_texture, "height");
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (MTLTexture)chromaTexture
{
  return self->_chromaTexture;
}

- (BOOL)isCaptureTexture
{
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textureCache);
  objc_storeStrong((id *)&self->_colorProgram, 0);
  objc_storeStrong((id *)&self->_chromaTexture, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

- (PXGMetalImageTexture)initWithTexture:(id)a3 colorProgram:(id)a4 isOpaque:(BOOL)a5 shaderFlags:(int)a6 orientationTransform:(float)a7 alpha:(unsigned __int8)a8 presentationType:
{
  return -[PXGMetalImageTexture initWithTexture:chromaTexture:colorProgram:isOpaque:shaderFlags:orientationTransform:alpha:presentationType:](self, "initWithTexture:chromaTexture:colorProgram:isOpaque:shaderFlags:orientationTransform:alpha:presentationType:", a3, 0, a4, a5, *(_QWORD *)&a6, a8);
}

- (PXGMetalImageTexture)initWithTexture:(id)a3 chromaTexture:(id)a4 colorProgram:(id)a5 isOpaque:(BOOL)a6 shaderFlags:(int)a7 orientationTransform:(float)a8 alpha:(unsigned __int8)a9 presentationType:
{
  float v9;
  float v11;
  id v18;
  id v19;
  id v20;
  PXGMetalImageTexture *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  objc_super v29;

  v11 = v9;
  v28 = *(_OWORD *)&a8;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v29.receiver = self;
  v29.super_class = (Class)PXGMetalImageTexture;
  v21 = -[PXGImageTexture init](&v29, sel_init);
  if (v21)
  {
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("PXGMetalImageTexture.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("texture != nil"));

    }
    if (a7 >= 0x10000)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PXGShaderFlagsDescription();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("PXGMetalImageTexture.m"), 41, CFSTR("Only allowed to set shader flags in the block PXGShaderFlagPerTexture, %@"), v23);

      if (v19)
        goto LABEL_6;
    }
    else if (v19)
    {
LABEL_6:
      if ((a7 & 0xF00) == 0 || (a7 & 0x3000) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("PXGMetalImageTexture.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!chromaTexture || ((shaderFlags & PXGShaderFlagYCbCrMatrixMask) != 0 && (shaderFlags & PXGShaderFlagYCbCrBitDepthMask) != 0)"));

      }
    }
    objc_storeStrong((id *)&v21->_texture, a3);
    objc_storeStrong((id *)&v21->_chromaTexture, a4);
    objc_storeStrong((id *)&v21->_colorProgram, a5);
    *(_OWORD *)v21->_orientationTransform = v28;
    v21->_alpha = v11;
    v21->_isContentOpaque = a6;
    v21->_shaderFlags = a7;
    v21->_presentationType = a9;
  }

  return v21;
}

- (PXGMetalImageTexture)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalImageTexture.m"), 56, CFSTR("%s is not available as initializer"), "-[PXGMetalImageTexture init]");

  abort();
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PXGMetalImageTexture;
  -[PXGBaseTexture description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ memory:%.2fMB texture:%p>"), v4, (double)(unint64_t)-[MTLTexture allocatedSize](self->_texture, "allocatedSize") * 0.0009765625 * 0.0009765625, self->_texture);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (int64_t)estimatedByteSize
{
  return -[MTLTexture allocatedSize](self->_texture, "allocatedSize");
}

- (id)copyWithOrientationTransform:(float)a3 alpha:
{
  float v3;
  float v4;
  id v5;
  double v6;
  void *v7;
  double v9;

  v4 = v3;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)self->_orientationTransform, *(float32x4_t *)&a3)))) & 1) == 0&& self->_alpha == v3)
  {
    return self;
  }
  v9 = *(double *)&a3;
  v5 = objc_alloc((Class)objc_opt_class());
  *(float *)&v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithTexture:chromaTexture:colorProgram:isOpaque:shaderFlags:orientationTransform:alpha:presentationType:", self->_texture, self->_chromaTexture, self->_colorProgram, self->_isContentOpaque, self->_shaderFlags, self->_presentationType, v9, v6);
  objc_msgSend(v7, "setSourceCGImage:", -[PXGImageTexture sourceCGImage](self, "sourceCGImage"));
  objc_msgSend(v7, "setSourceCVPixelBuffer:", -[PXGImageTexture sourceCVPixelBuffer](self, "sourceCVPixelBuffer"));
  return v7;
}

- (PXGMetalTextureCache)textureCache
{
  return (PXGMetalTextureCache *)objc_loadWeakRetained((id *)&self->_textureCache);
}

- (void)setTextureCache:(id)a3
{
  objc_storeWeak((id *)&self->_textureCache, a3);
}

@end
