@implementation PXGEffectWrappingTexture

- (void)setParent:(id)a3
{
  PXGMetalSpriteTexture *v5;
  PXGMetalSpriteTexture *v6;

  v6 = (PXGMetalSpriteTexture *)a3;
  if (self->_parent != v6)
  {
    objc_storeStrong((id *)&self->_parent, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v6;
    else
      v5 = 0;
    objc_storeStrong((id *)&self->_imageTextureParent, v5);
  }

}

- (MTLTexture)chromaTexture
{
  void *v2;
  void *v3;

  -[PXGEffectWrappingTexture parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chromaTexture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTLTexture *)v3;
}

- (MTLTexture)texture
{
  void *v2;
  void *v3;

  -[PXGEffectWrappingTexture parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "texture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTLTexture *)v3;
}

- (void)getTextureInfos:(id *)a3 forSpriteIndexes:(const unsigned int *)a4 geometries:(id *)a5 spriteStyles:(id *)a6 spriteInfos:(id *)a7 screenScale:(double)a8 count:(unsigned int)a9
{
  uint64_t v16;
  unsigned int v17;
  void *v18;
  int v19;

  if (a9)
  {
    v16 = a9;
    do
    {
      v17 = *a4++;
      v19 = *((_QWORD *)&a7[1].var0 + 5 * v17);
      -[PXGEffectWrappingTexture parent](self, "parent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "getTextureInfos:forSpriteIndexes:geometries:spriteStyles:spriteInfos:screenScale:count:", a3, &v19, a5, a6, a7, 1, a8);

      a3 += 16;
      --v16;
    }
    while (v16);
  }
}

- (PXGColorProgram)colorProgram
{
  void *v2;
  void *v3;

  -[PXGEffectWrappingTexture parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorProgram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXGColorProgram *)v3;
}

- (void)cleanupAfterRender:(int64_t)a3
{
  -[PXGEffectWrappingTexture setParent:](self, "setParent:", 0);
  -[PXGBaseTexture removeAllSpriteIndexes](self, "removeAllSpriteIndexes");
  objc_msgSend((id)objc_opt_class(), "_reuseTexture:", self);
}

- (int64_t)renderPipelineIndex
{
  void *v2;
  int64_t v3;

  -[PXGEffectWrappingTexture parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "renderPipelineIndex");

  return v3;
}

- (void)setRenderPipelineIndex:(int64_t)a3
{
  id v4;

  -[PXGEffectWrappingTexture parent](self, "parent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRenderPipelineIndex:", a3);

}

- (BOOL)isAtlas
{
  void *v2;
  char v3;

  -[PXGEffectWrappingTexture parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAtlas");

  return v3;
}

- (BOOL)isOpaque
{
  void *v2;
  char v3;

  -[PXGEffectWrappingTexture parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOpaque");

  return v3;
}

- (float)alpha
{
  void *v2;
  float v3;
  float v4;

  -[PXGEffectWrappingTexture parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3;

  return v4;
}

- (BOOL)isCaptureTexture
{
  void *v2;
  char v3;

  -[PXGEffectWrappingTexture parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCaptureTexture");

  return v3;
}

- (int)shaderFlags
{
  void *v2;
  int v3;

  -[PXGEffectWrappingTexture parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shaderFlags");

  return v3;
}

- (CGSize)pixelSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PXGEffectWrappingTexture parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pixelSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)estimatedByteSize
{
  void *v2;
  int64_t v3;

  -[PXGEffectWrappingTexture parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "estimatedByteSize");

  return v3;
}

- (unsigned)presentationType
{
  void *v2;
  unsigned __int8 v3;

  -[PXGEffectWrappingTexture parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "presentationType");

  return v3;
}

- (CGImage)imageRepresentation
{
  void *v2;
  CGImage *v3;

  -[PXGEffectWrappingTexture imageTextureParent](self, "imageTextureParent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGImage *)objc_msgSend(v2, "imageRepresentation");

  return v3;
}

- (CGImage)sourceCGImage
{
  void *v2;
  CGImage *v3;

  -[PXGEffectWrappingTexture imageTextureParent](self, "imageTextureParent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGImage *)objc_msgSend(v2, "sourceCGImage");

  return v3;
}

- (__CVBuffer)sourceCVPixelBuffer
{
  void *v2;
  __CVBuffer *v3;

  -[PXGEffectWrappingTexture imageTextureParent](self, "imageTextureParent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__CVBuffer *)objc_msgSend(v2, "sourceCVPixelBuffer");

  return v3;
}

- (__n128)orientationTransform
{
  void *v1;
  __int128 v2;
  __int128 v4;

  objc_msgSend(a1, "imageTextureParent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "orientationTransform");
  v4 = v2;

  return (__n128)v4;
}

- (PXGMetalSpriteTexture)parent
{
  return self->_parent;
}

- (PXGImageTexture)imageTextureParent
{
  return self->_imageTextureParent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageTextureParent, 0);
  objc_storeStrong((id *)&self->_parent, 0);
}

+ (id)_reusableTextures
{
  if (_reusableTextures_onceToken != -1)
    dispatch_once(&_reusableTextures_onceToken, &__block_literal_global);
  return (id)_reusableTextures_reusableTextures;
}

+ (id)_dequeueTexture
{
  void *v3;
  void *v4;

  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  objc_msgSend(a1, "_reusableTextures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_popFirst");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  return v4;
}

+ (void)_reuseTexture:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  objc_msgSend(a1, "_reusableTextures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
}

+ (id)createTexture
{
  PXGEffectWrappingTexture *v2;

  objc_msgSend(a1, "_dequeueTexture");
  v2 = (PXGEffectWrappingTexture *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = objc_alloc_init(PXGEffectWrappingTexture);
  return v2;
}

void __45__PXGEffectWrappingTexture__reusableTextures__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v1 = (void *)_reusableTextures_reusableTextures;
  _reusableTextures_reusableTextures = (uint64_t)v0;

}

@end
