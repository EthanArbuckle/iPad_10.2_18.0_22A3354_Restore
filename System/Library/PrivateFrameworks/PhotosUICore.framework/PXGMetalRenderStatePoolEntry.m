@implementation PXGMetalRenderStatePoolEntry

- (PXGMetalRenderStatePoolEntry)initWithReusableRenderState:(id)a3 pool:(id)a4
{
  id v8;
  id v9;
  PXGMetalRenderStatePoolEntry *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXGMetalRenderStatePoolEntry;
  v10 = -[PXGMetalRenderStatePoolEntry init](&v13, sel_init);
  if (v10)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PXGMetalRenderStatePool.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reusableRenderState != nil"));

    }
    objc_storeStrong((id *)&v10->_renderState, a3);
    objc_storeWeak((id *)&v10->_pool, v9);
  }

  return v10;
}

- (void)dealloc
{
  id WeakRetained;
  PXGReusableMetalRenderState *v4;
  NSObject *v5;
  PXGReusableMetalRenderState *v6;
  objc_super v7;
  _QWORD block[4];
  id v9;
  PXGReusableMetalRenderState *v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pool);
  if (WeakRetained)
  {
    v4 = self->_renderState;
    -[PXGReusableMetalRenderState prepareForReuse](v4, "prepareForReuse");
    objc_msgSend(WeakRetained, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PXGMetalRenderStatePoolEntry_dealloc__block_invoke;
    block[3] = &unk_1E5148D08;
    v9 = WeakRetained;
    v10 = v4;
    v6 = v4;
    dispatch_async(v5, block);

  }
  v7.receiver = self;
  v7.super_class = (Class)PXGMetalRenderStatePoolEntry;
  -[PXGMetalRenderStatePoolEntry dealloc](&v7, sel_dealloc);
}

- (MTLDevice)device
{
  return -[PXGReusableMetalRenderState device](self->_renderState, "device");
}

- ($7EE80C0E926C3D0A8A931DD48CC5E4D3)uniforms
{
  return -[PXGReusableMetalRenderState uniforms](self->_renderState, "uniforms");
}

- (const)spriteInfos
{
  return -[PXGReusableMetalRenderState spriteInfos](self->_renderState, "spriteInfos");
}

- (const)spriteOriginalGeometries
{
  return -[PXGReusableMetalRenderState spriteOriginalGeometries](self->_renderState, "spriteOriginalGeometries");
}

- ($738B17BD11CC339B30296C0EA03CEC2B)spriteEntitiesBufferWithCount:(int64_t)a3
{
  return -[PXGReusableMetalRenderState spriteEntitiesBufferWithCount:](self->_renderState, "spriteEntitiesBufferWithCount:", a3);
}

- ($E2C29196C7A5C696474C6955C5A9CE06)spriteGeometriesBufferWithCount:(int64_t)a3
{
  return -[PXGReusableMetalRenderState spriteGeometriesBufferWithCount:](self->_renderState, "spriteGeometriesBufferWithCount:", a3);
}

- ($225AF24142A77900D29617A74D173C5F)spriteStylesBufferWithCount:(int64_t)a3
{
  return -[PXGReusableMetalRenderState spriteStylesBufferWithCount:](self->_renderState, "spriteStylesBufferWithCount:", a3);
}

- ($786F7D2F4E5B3A0CBB66DF574B7D98CF)spriteInfosBufferWithCount:(int64_t)a3
{
  return -[PXGReusableMetalRenderState spriteInfosBufferWithCount:](self->_renderState, "spriteInfosBufferWithCount:", a3);
}

- ($16EC8B44B1C22DB88FC318D5A7EDDAB2)spriteOriginalGeometriesBufferWithCount:(int64_t)a3
{
  return -[PXGReusableMetalRenderState spriteOriginalGeometriesBufferWithCount:](self->_renderState, "spriteOriginalGeometriesBufferWithCount:", a3);
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)resizableCapInsetsBufferWithCount:(int64_t)a3
{
  return -[PXGReusableMetalRenderState resizableCapInsetsBufferWithCount:](self->_renderState, "resizableCapInsetsBufferWithCount:", a3);
}

- (id)renderPassStateForSpriteCount:(int64_t)a3
{
  return -[PXGReusableMetalRenderState renderPassStateForSpriteCount:](self->_renderState, "renderPassStateForSpriteCount:", a3);
}

- (PXGMetalRenderPassState)currentRenderPassState
{
  return -[PXGReusableMetalRenderState currentRenderPassState](self->_renderState, "currentRenderPassState");
}

- (NSArray)textures
{
  return -[PXGReusableMetalRenderState textures](self->_renderState, "textures");
}

- (void)setTextures:(id)a3
{
  -[PXGReusableMetalRenderState setTextures:](self->_renderState, "setTextures:", a3);
}

- (NSArray)captureSpriteTextures
{
  return -[PXGReusableMetalRenderState captureSpriteTextures](self->_renderState, "captureSpriteTextures");
}

- (void)setCaptureSpriteTextures:(id)a3
{
  -[PXGReusableMetalRenderState setCaptureSpriteTextures:](self->_renderState, "setCaptureSpriteTextures:", a3);
}

- (void)keepAlive
{
  -[PXGReusableMetalRenderState keepAlive](self->_renderState, "keepAlive");
}

- (void)prepareForRender:(int64_t)a3
{
  -[PXGReusableMetalRenderState prepareForRender:](self->_renderState, "prepareForRender:", a3);
}

- (const)spriteEntities
{
  return -[PXGReusableMetalRenderState spriteEntities](self->_renderState, "spriteEntities");
}

- (const)spriteGeometries
{
  return -[PXGReusableMetalRenderState spriteGeometries](self->_renderState, "spriteGeometries");
}

- (const)spriteStyles
{
  return -[PXGReusableMetalRenderState spriteStyles](self->_renderState, "spriteStyles");
}

- (MTLBuffer)spriteEntitiesBuffer
{
  return -[PXGReusableMetalRenderState spriteEntitiesBuffer](self->_renderState, "spriteEntitiesBuffer");
}

- (MTLBuffer)spriteGeometriesBuffer
{
  return -[PXGReusableMetalRenderState spriteGeometriesBuffer](self->_renderState, "spriteGeometriesBuffer");
}

- (MTLBuffer)spriteStylesBuffer
{
  return -[PXGReusableMetalRenderState spriteStylesBuffer](self->_renderState, "spriteStylesBuffer");
}

- (MTLBuffer)spriteInfosBuffer
{
  return -[PXGReusableMetalRenderState spriteInfosBuffer](self->_renderState, "spriteInfosBuffer");
}

- (MTLBuffer)spriteOriginalGeometriesBuffer
{
  return -[PXGReusableMetalRenderState spriteOriginalGeometriesBuffer](self->_renderState, "spriteOriginalGeometriesBuffer");
}

- (MTLBuffer)resizableCapInsetsBuffer
{
  return -[PXGReusableMetalRenderState resizableCapInsetsBuffer](self->_renderState, "resizableCapInsetsBuffer");
}

- (PXGEffectComponent)effectComponent
{
  return -[PXGReusableMetalRenderState effectComponent](self->_renderState, "effectComponent");
}

- ($C9C3279E115C33C9F65E77750BE5EEE4)values
{
  $C9C3279E115C33C9F65E77750BE5EEE4 *result;

  result = ($C9C3279E115C33C9F65E77750BE5EEE4 *)self->_renderState;
  if (result)
    return ($C9C3279E115C33C9F65E77750BE5EEE4 *)-[$C9C3279E115C33C9F65E77750BE5EEE4 values](result, "values");
  retstr->var6 = 0;
  retstr->var3.size = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  retstr->var2.size = 0u;
  retstr->var3.origin = 0u;
  retstr->var1 = 0u;
  retstr->var2.origin = 0u;
  retstr->var0 = 0u;
  return result;
}

- (void)setValues:(id *)a3
{
  PXGReusableMetalRenderState *renderState;
  CGSize size;
  CGPoint var1;
  CGSize v6;
  _OWORD v7[7];
  int64_t var6;

  renderState = self->_renderState;
  size = a3->var3.size;
  v7[4] = a3->var3.origin;
  v7[5] = size;
  v7[6] = *(_OWORD *)&a3->var4;
  var6 = a3->var6;
  var1 = a3->var1;
  v7[0] = a3->var0;
  v7[1] = var1;
  v6 = a3->var2.size;
  v7[2] = a3->var2.origin;
  v7[3] = v6;
  -[PXGReusableMetalRenderState setValues:](renderState, "setValues:", v7);
}

- (PXGMetalRenderTextureStore)opaqueTextures
{
  return -[PXGReusableMetalRenderState opaqueTextures](self->_renderState, "opaqueTextures");
}

- (PXGMetalRenderTextureStore)translucentTextures
{
  return -[PXGReusableMetalRenderState translucentTextures](self->_renderState, "translucentTextures");
}

- (BOOL)hasParsedRenderTextures
{
  return -[PXGReusableMetalRenderState hasParsedRenderTextures](self->_renderState, "hasParsedRenderTextures");
}

- (void)setHasParsedRenderTextures:(BOOL)a3
{
  -[PXGReusableMetalRenderState setHasParsedRenderTextures:](self->_renderState, "setHasParsedRenderTextures:", a3);
}

- (PXGReusableMetalRenderState)renderState
{
  return self->_renderState;
}

- (PXGMetalRenderStatePool)pool
{
  return (PXGMetalRenderStatePool *)objc_loadWeakRetained((id *)&self->_pool);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pool);
  objc_storeStrong((id *)&self->_renderState, 0);
}

uint64_t __39__PXGMetalRenderStatePoolEntry_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkinRenderState:", *(_QWORD *)(a1 + 40));
}

@end
