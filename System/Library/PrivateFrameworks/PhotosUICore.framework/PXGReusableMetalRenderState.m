@implementation PXGReusableMetalRenderState

- (PXGReusableMetalRenderState)initWithDevice:(id)a3
{
  id v5;
  PXGReusableMetalRenderState *v6;
  PXGReusableMetalRenderState *v7;
  uint64_t v8;
  PXGEffectComponent *effectComponent;
  PXGMetalRenderTextureStore *v10;
  PXGMetalRenderTextureStore *opaqueTextures;
  PXGMetalRenderTextureStore *v12;
  PXGMetalRenderTextureStore *translucentTextures;
  NSMutableIndexSet *v14;
  NSMutableIndexSet *renderedFrameIds;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGReusableMetalRenderState;
  v6 = -[PXGReusableMetalRenderState init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    objc_msgSend(off_1E50B2968, "createWithDefaultDataStore");
    v8 = objc_claimAutoreleasedReturnValue();
    effectComponent = v7->_effectComponent;
    v7->_effectComponent = (PXGEffectComponent *)v8;

    v10 = objc_alloc_init(PXGMetalRenderTextureStore);
    opaqueTextures = v7->_opaqueTextures;
    v7->_opaqueTextures = v10;

    v12 = objc_alloc_init(PXGMetalRenderTextureStore);
    translucentTextures = v7->_translucentTextures;
    v7->_translucentTextures = v12;

    v14 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    renderedFrameIds = v7->_renderedFrameIds;
    v7->_renderedFrameIds = v14;

  }
  return v7;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; currentRenderPassState:%@>"),
    v5,
    self,
    self->_currentRenderPassState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)_resizedBufferIfNeeded:(id)a3 neededLength:(int64_t)a4
{
  id v6;
  int64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;

  v6 = a3;
  if (a4)
    v7 = a4;
  else
    v7 = 1;
  v8 = v6;
  v9 = v8;
  if (v7 > (unint64_t)objc_msgSend(v8, "length"))
  {
    v10 = objc_msgSend(v8, "length");
    if (v10)
      v11 = v10;
    else
      v11 = v7;
    do
    {
      v12 = v11;
      v11 *= 2;
    }
    while (v12 < v7);
    v9 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:");

  }
  return v9;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)spriteEntitiesBufferWithCount:(int64_t)a3
{
  MTLBuffer *v4;
  MTLBuffer *spriteEntitiesBuffer;

  -[PXGReusableMetalRenderState _resizedBufferIfNeeded:neededLength:](self, "_resizedBufferIfNeeded:neededLength:", self->_spriteEntitiesBuffer, 4 * a3);
  v4 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
  spriteEntitiesBuffer = self->_spriteEntitiesBuffer;
  self->_spriteEntitiesBuffer = v4;

  return ($738B17BD11CC339B30296C0EA03CEC2B *)-[MTLBuffer contents](self->_spriteEntitiesBuffer, "contents");
}

- ($E2C29196C7A5C696474C6955C5A9CE06)spriteGeometriesBufferWithCount:(int64_t)a3
{
  MTLBuffer *v4;
  MTLBuffer *spriteGeometriesBuffer;

  -[PXGReusableMetalRenderState _resizedBufferIfNeeded:neededLength:](self, "_resizedBufferIfNeeded:neededLength:", self->_spriteGeometriesBuffer, 20 * a3);
  v4 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
  spriteGeometriesBuffer = self->_spriteGeometriesBuffer;
  self->_spriteGeometriesBuffer = v4;

  return ($E2C29196C7A5C696474C6955C5A9CE06 *)-[MTLBuffer contents](self->_spriteGeometriesBuffer, "contents");
}

- ($225AF24142A77900D29617A74D173C5F)spriteStylesBufferWithCount:(int64_t)a3
{
  MTLBuffer *v4;
  MTLBuffer *spriteStylesBuffer;

  -[PXGReusableMetalRenderState _resizedBufferIfNeeded:neededLength:](self, "_resizedBufferIfNeeded:neededLength:", self->_spriteStylesBuffer, 160 * a3);
  v4 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
  spriteStylesBuffer = self->_spriteStylesBuffer;
  self->_spriteStylesBuffer = v4;

  return ($225AF24142A77900D29617A74D173C5F *)-[MTLBuffer contents](self->_spriteStylesBuffer, "contents");
}

- ($786F7D2F4E5B3A0CBB66DF574B7D98CF)spriteInfosBufferWithCount:(int64_t)a3
{
  MTLBuffer *v4;
  MTLBuffer *spriteInfosBuffer;

  -[PXGReusableMetalRenderState _resizedBufferIfNeeded:neededLength:](self, "_resizedBufferIfNeeded:neededLength:", self->_spriteInfosBuffer, 40 * a3);
  v4 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
  spriteInfosBuffer = self->_spriteInfosBuffer;
  self->_spriteInfosBuffer = v4;

  return ($786F7D2F4E5B3A0CBB66DF574B7D98CF *)-[MTLBuffer contents](self->_spriteInfosBuffer, "contents");
}

- ($16EC8B44B1C22DB88FC318D5A7EDDAB2)spriteOriginalGeometriesBufferWithCount:(int64_t)a3
{
  MTLBuffer *v4;
  MTLBuffer *spriteOriginalGeometriesBuffer;

  -[PXGReusableMetalRenderState _resizedBufferIfNeeded:neededLength:](self, "_resizedBufferIfNeeded:neededLength:", self->_spriteOriginalGeometriesBuffer, 32 * a3);
  v4 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
  spriteOriginalGeometriesBuffer = self->_spriteOriginalGeometriesBuffer;
  self->_spriteOriginalGeometriesBuffer = v4;

  return ($16EC8B44B1C22DB88FC318D5A7EDDAB2 *)-[MTLBuffer contents](self->_spriteOriginalGeometriesBuffer, "contents");
}

- (id)renderPassStateForSpriteCount:(int64_t)a3
{
  PXGMetalRenderPassState *v5;
  PXGMetalRenderPassState *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  PXGMetalRenderPassState *v10;

  -[PXGReusableMetalRenderState currentRenderPassState](self, "currentRenderPassState");
  v5 = (PXGMetalRenderPassState *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || -[PXGMetalRenderPassState capacity](v5, "capacity") < a3)
  {
    v7 = -[PXGMetalRenderPassState capacity](v6, "capacity");
    v8 = 2;
    if (v7 > 2)
      v8 = v7;
    do
    {
      v9 = v8;
      v8 *= 2;
    }
    while (v9 < a3);
    v10 = -[PXGMetalRenderPassState initWithDevice:capacity:]([PXGMetalRenderPassState alloc], "initWithDevice:capacity:", self->_device, v9);

    objc_storeStrong((id *)&self->_currentRenderPassState, v10);
    v6 = v10;
  }
  return v6;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)resizableCapInsetsBufferWithCount:(int64_t)a3
{
  MTLBuffer *v4;
  MTLBuffer *resizableCapInsetsBuffer;

  -[PXGReusableMetalRenderState _resizedBufferIfNeeded:neededLength:](self, "_resizedBufferIfNeeded:neededLength:", self->_resizableCapInsetsBuffer, 16 * a3);
  v4 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
  resizableCapInsetsBuffer = self->_resizableCapInsetsBuffer;
  self->_resizableCapInsetsBuffer = v4;

  return ($C28CD4A45FD07A4F97CC9D5F91F25271 *)-[MTLBuffer contents](self->_resizableCapInsetsBuffer, "contents");
}

- (const)spriteEntities
{
  return (const $738B17BD11CC339B30296C0EA03CEC2B *)-[MTLBuffer contents](self->_spriteEntitiesBuffer, "contents");
}

- (const)spriteGeometries
{
  return (const $E2C29196C7A5C696474C6955C5A9CE06 *)-[MTLBuffer contents](self->_spriteGeometriesBuffer, "contents");
}

- (const)spriteStyles
{
  return (const $225AF24142A77900D29617A74D173C5F *)-[MTLBuffer contents](self->_spriteStylesBuffer, "contents");
}

- (const)spriteInfos
{
  return (const $786F7D2F4E5B3A0CBB66DF574B7D98CF *)-[MTLBuffer contents](self->_spriteInfosBuffer, "contents");
}

- (const)spriteOriginalGeometries
{
  return (const $16EC8B44B1C22DB88FC318D5A7EDDAB2 *)-[MTLBuffer contents](self->_spriteOriginalGeometriesBuffer, "contents");
}

- ($7EE80C0E926C3D0A8A931DD48CC5E4D3)uniforms
{
  return ($7EE80C0E926C3D0A8A931DD48CC5E4D3 *)self->_anon_10;
}

- (void)prepareForRender:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PXGReusableMetalRenderState textures](self, "textures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "prepareForRender:", a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  -[NSMutableIndexSet addIndex:](self->_renderedFrameIds, "addIndex:", a3);
  -[PXGReusableMetalRenderState opaqueTextures](self, "opaqueTextures");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "prepareForRender");

  -[PXGReusableMetalRenderState translucentTextures](self, "translucentTextures");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prepareForRender");

}

- (void)prepareForReuse
{
  NSMutableIndexSet *renderedFrameIds;
  void *v4;
  void *v5;
  _QWORD v6[5];

  renderedFrameIds = self->_renderedFrameIds;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PXGReusableMetalRenderState_prepareForReuse__block_invoke;
  v6[3] = &unk_1E5148928;
  v6[4] = self;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](renderedFrameIds, "enumerateIndexesUsingBlock:", v6);
  -[NSMutableIndexSet removeAllIndexes](self->_renderedFrameIds, "removeAllIndexes");
  -[PXGReusableMetalRenderState setTextures:](self, "setTextures:", 0);
  -[PXGReusableMetalRenderState setCaptureSpriteTextures:](self, "setCaptureSpriteTextures:", 0);
  -[PXGReusableMetalRenderState setHasParsedRenderTextures:](self, "setHasParsedRenderTextures:", 0);
  -[PXGReusableMetalRenderState opaqueTextures](self, "opaqueTextures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllTextures");

  -[PXGReusableMetalRenderState translucentTextures](self, "translucentTextures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllTextures");

}

- (NSArray)captureSpriteTextures
{
  return self->_captureSpriteTextures;
}

- (void)setCaptureSpriteTextures:(id)a3
{
  objc_storeStrong((id *)&self->_captureSpriteTextures, a3);
}

- (PXGMetalRenderPassState)currentRenderPassState
{
  return self->_currentRenderPassState;
}

- (MTLBuffer)resizableCapInsetsBuffer
{
  return self->_resizableCapInsetsBuffer;
}

- (NSArray)textures
{
  return self->_textures;
}

- (void)setTextures:(id)a3
{
  objc_storeStrong((id *)&self->_textures, a3);
}

- (MTLBuffer)spriteEntitiesBuffer
{
  return self->_spriteEntitiesBuffer;
}

- (MTLBuffer)spriteGeometriesBuffer
{
  return self->_spriteGeometriesBuffer;
}

- (MTLBuffer)spriteStylesBuffer
{
  return self->_spriteStylesBuffer;
}

- (MTLBuffer)spriteInfosBuffer
{
  return self->_spriteInfosBuffer;
}

- (MTLBuffer)spriteOriginalGeometriesBuffer
{
  return self->_spriteOriginalGeometriesBuffer;
}

- (MTLDevice)device
{
  return self->_device;
}

- (PXGEffectComponent)effectComponent
{
  return self->_effectComponent;
}

- (PXGMetalRenderTextureStore)opaqueTextures
{
  return self->_opaqueTextures;
}

- (PXGMetalRenderTextureStore)translucentTextures
{
  return self->_translucentTextures;
}

- ($C9C3279E115C33C9F65E77750BE5EEE4)values
{
  CGPoint var1;
  CGPoint v4;
  CGSize v5;

  var1 = self[4].var1;
  retstr->var3.origin = (CGPoint)self[4].var0;
  retstr->var3.size = (CGSize)var1;
  *(CGPoint *)&retstr->var4 = self[4].var2.origin;
  retstr->var6 = *(_QWORD *)&self[4].var2.size.width;
  v4 = *(CGPoint *)&self[3].var3.origin.y;
  retstr->var0 = *(CGSize *)&self[3].var2.size.height;
  retstr->var1 = v4;
  v5 = *(CGSize *)&self[3].var5;
  retstr->var2.origin = *(CGPoint *)&self[3].var3.size.height;
  retstr->var2.size = v5;
  return self;
}

- (void)setValues:(id *)a3
{
  CGSize var0;
  CGPoint var1;
  CGSize size;
  CGPoint origin;
  CGSize v7;
  __int128 v8;

  var0 = a3->var0;
  var1 = a3->var1;
  size = a3->var2.size;
  self->_values.renderBoundsInPoints.origin = a3->var2.origin;
  self->_values.renderBoundsInPoints.size = size;
  self->_values.renderSize = var0;
  self->_values.renderOrigin = var1;
  origin = a3->var3.origin;
  v7 = a3->var3.size;
  v8 = *(_OWORD *)&a3->var4;
  self->_values.sampleCount = a3->var6;
  self->_values.visibleRectInRenderCoordinates.size = v7;
  *(_OWORD *)&self->_values.offscreenEffectScale = v8;
  self->_values.visibleRectInRenderCoordinates.origin = origin;
}

- (BOOL)hasParsedRenderTextures
{
  return self->_hasParsedRenderTextures;
}

- (void)setHasParsedRenderTextures:(BOOL)a3
{
  self->_hasParsedRenderTextures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translucentTextures, 0);
  objc_storeStrong((id *)&self->_opaqueTextures, 0);
  objc_storeStrong((id *)&self->_effectComponent, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_spriteOriginalGeometriesBuffer, 0);
  objc_storeStrong((id *)&self->_spriteInfosBuffer, 0);
  objc_storeStrong((id *)&self->_spriteStylesBuffer, 0);
  objc_storeStrong((id *)&self->_spriteGeometriesBuffer, 0);
  objc_storeStrong((id *)&self->_spriteEntitiesBuffer, 0);
  objc_storeStrong((id *)&self->_textures, 0);
  objc_storeStrong((id *)&self->_resizableCapInsetsBuffer, 0);
  objc_storeStrong((id *)&self->_currentRenderPassState, 0);
  objc_storeStrong((id *)&self->_captureSpriteTextures, 0);
  objc_storeStrong((id *)&self->_renderedFrameIds, 0);
}

void __46__PXGReusableMetalRenderState_prepareForReuse__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "textures", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "cleanupAfterRender:", a2);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

@end
