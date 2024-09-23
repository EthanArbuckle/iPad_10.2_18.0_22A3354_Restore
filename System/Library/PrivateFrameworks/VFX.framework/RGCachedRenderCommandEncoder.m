@implementation RGCachedRenderCommandEncoder

- (RGCachedRenderCommandEncoder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RGCachedRenderCommandEncoder;
  return -[RGCachedRenderCommandEncoder init](&v3, sel_init);
}

- (RGCachedRenderCommandEncoder)initWithEncoder:(id)a3
{
  RGCachedRenderCommandEncoder *v4;
  const char *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RGCachedRenderCommandEncoder;
  v4 = -[RGCachedRenderCommandEncoder init](&v7, sel_init);
  objc_msgSend_setEncoder_alreadyUsed_(v4, v5, (uint64_t)a3, 0);
  return v4;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_setEncoder_(self, a2, 0, v2);
  v4.receiver = self;
  v4.super_class = (Class)RGCachedRenderCommandEncoder;
  -[RGCachedRenderCommandEncoder dealloc](&v4, sel_dealloc);
}

- (void)setCounters:(__RGRenderCounters *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->storage.impl;
  *(_QWORD *)&self->_counters.primitiveCount = *(_QWORD *)&a3->primitiveCount;
  *(_OWORD *)&self->_counters.storage.impl = v3;
}

- (void)loadWithCommandBuffer:(id)a3 renderPassDescriptor:(id)a4
{
  uint64_t v5;
  const char *v6;

  v5 = objc_msgSend_renderCommandEncoderWithDescriptor_(a3, a2, (uint64_t)a4, (uint64_t)a4);
  objc_msgSend_setEncoder_alreadyUsed_(self, v6, v5, 0);
}

- (BOOL)deferredBindingEnabled
{
  return (uint64_t)self[22].super.isa & 1;
}

- (void)setDeferredBindingEnabled:(BOOL)a3
{
  LOWORD(self[22].super.isa) = (uint64_t)self[22].super.isa & 0xFFFE | a3;
}

- (void)setEncoder:(id)a3
{
  objc_msgSend_setEncoder_alreadyUsed_(self, a2, (uint64_t)a3, 1);
}

- (void)setEncoder:(id)a3 alreadyUsed:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  MTLRenderCommandEncoder *encoder;
  BOOL v12;

  v4 = a4;
  v7 = a3;
  encoder = self->_encoder;
  if (encoder)

  self->_encoder = (MTLRenderCommandEncoder *)a3;
  objc_msgSend_clear(self, v8, v9, v10);
  if (self->_encoder)
    v12 = !v4;
  else
    v12 = 1;
  if (!v12)
    LOWORD(self[22].super.isa) |= 0x9Eu;
}

- (void)clear
{
  Cache *p_cache;

  p_cache = &self->_cache;
  sub_1B21AB2F4((uint64_t)&self->_cache);
  bzero(p_cache, 0x1060uLL);
}

- (id)vertexBufferBoundAt:(unint64_t)a3
{
  return (id)*((_QWORD *)&self[4]._cache.blendStates + 2 * a3);
}

- (id)fragmentBufferBoundAt:(unint64_t)a3
{
  return (id)*((_QWORD *)&self[13]._cache.rasterizerStates + 2 * a3);
}

- (MTLDevice)device
{
  uint64_t v2;
  uint64_t v3;

  return (MTLDevice *)objc_msgSend_device(self->_encoder, a2, v2, v3);
}

- (NSString)label
{
  return (NSString *)((uint64_t (*)(MTLRenderCommandEncoder *, char *))MEMORY[0x1E0DE7D20])(self->_encoder, sel_label);
}

- (void)setLabel:(id)a3
{
  uint64_t v3;

  objc_msgSend_setLabel_(self->_encoder, a2, (uint64_t)a3, v3);
}

- (unint64_t)tileWidth
{
  return ((uint64_t (*)(MTLRenderCommandEncoder *, char *))MEMORY[0x1E0DE7D20])(self->_encoder, sel_tileWidth);
}

- (unint64_t)tileHeight
{
  return ((uint64_t (*)(MTLRenderCommandEncoder *, char *))MEMORY[0x1E0DE7D20])(self->_encoder, sel_tileHeight);
}

- (void)endEncoding
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_endEncoding(self->_encoder, a2, v2, v3);
}

- (void)insertDebugSignpost:(id)a3
{
  ((void (*)(MTLRenderCommandEncoder *, char *, id))MEMORY[0x1E0DE7D20])(self->_encoder, sel_insertDebugSignpost_, a3);
}

- (void)popDebugGroup
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_popDebugGroup(self->_encoder, a2, v2, v3);
}

- (void)pushDebugGroup:(id)a3
{
  uint64_t v3;

  objc_msgSend_pushDebugGroup_(self->_encoder, a2, (uint64_t)a3, v3);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  unint64_t v10;
  const char *v13;
  __vfx_counters *impl;

  v10 = a4;
  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  objc_msgSend_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_(self->_encoder, v13, a3, v10, a5, a6, a7);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    switch(a3)
    {
      case 0uLL:
        break;
      case 1uLL:
        v10 >>= 1;
        break;
      case 2uLL:
        --v10;
        break;
      case 3uLL:
        v10 /= 3uLL;
        break;
      case 4uLL:
        v10 -= 2;
        break;
      default:
        v10 = 0;
        break;
    }
    vfx_counters_update((uint64_t)self->_counters.storage.impl, self->_counters.primitiveCount, (double)v10);
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  unint64_t v12;
  const char *v15;
  __vfx_counters *impl;

  v12 = a4;
  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  objc_msgSend_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_(self->_encoder, v15, a3, v12, a5, a6, a7, a8);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    switch(a3)
    {
      case 0uLL:
        break;
      case 1uLL:
        v12 >>= 1;
        break;
      case 2uLL:
        --v12;
        break;
      case 3uLL:
        v12 /= 3uLL;
        break;
      case 4uLL:
        v12 -= 2;
        break;
      default:
        v12 = 0;
        break;
    }
    vfx_counters_update((uint64_t)self->_counters.storage.impl, self->_counters.primitiveCount, (double)(v12 * a8));
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  unint64_t v14;
  const char *v17;
  MTLRenderCommandEncoder *encoder;
  __vfx_counters *impl;

  v14 = a4;
  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  if (v14)
  {
    encoder = self->_encoder;
    if (a9 <= 0 && a10 == 0)
      objc_msgSend_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_(encoder, v17, a3, v14, a5, a6, a7, a8);
    else
      objc_msgSend_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_(encoder, v17, a3, v14, a5, a6, a7, a8, a9, a10);
  }
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    switch(a3)
    {
      case 0uLL:
        break;
      case 1uLL:
        v14 >>= 1;
        break;
      case 2uLL:
        --v14;
        break;
      case 3uLL:
        v14 /= 3uLL;
        break;
      case 4uLL:
        v14 -= 2;
        break;
      default:
        v14 = 0;
        break;
    }
    vfx_counters_update((uint64_t)self->_counters.storage.impl, self->_counters.primitiveCount, (double)(v14 * a8));
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  const char *v15;
  __vfx_counters *impl;

  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  objc_msgSend_drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_(self->_encoder, v15, a3, a4, a5, a6, a7, a8);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    vfx_counters_update((uint64_t)self->_counters.storage.impl, self->_counters.indirectDrawCount, 1.0);
  }
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  const char *v9;
  __vfx_counters *impl;

  objc_msgSend_applyChangedStates(self, a2, a3, (uint64_t)a4);
  objc_msgSend_drawPrimitives_indirectBuffer_indirectBufferOffset_(self->_encoder, v9, a3, (uint64_t)a4, a5);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    vfx_counters_update((uint64_t)self->_counters.storage.impl, self->_counters.indirectDrawCount, 1.0);
  }
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  const char *v9;
  __vfx_counters *impl;

  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  objc_msgSend_drawPrimitives_vertexStart_vertexCount_(self->_encoder, v9, a3, a4, a5);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    switch(a3)
    {
      case 0uLL:
        break;
      case 1uLL:
        a5 >>= 1;
        break;
      case 2uLL:
        --a5;
        break;
      case 3uLL:
        a5 /= 3uLL;
        break;
      case 4uLL:
        a5 -= 2;
        break;
      default:
        a5 = 0;
        break;
    }
    vfx_counters_update((uint64_t)self->_counters.storage.impl, self->_counters.primitiveCount, (double)a5);
  }
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  const char *v11;
  __vfx_counters *impl;

  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  objc_msgSend_drawPrimitives_vertexStart_vertexCount_instanceCount_(self->_encoder, v11, a3, a4, a5, a6);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    switch(a3)
    {
      case 0uLL:
        break;
      case 1uLL:
        a5 >>= 1;
        break;
      case 2uLL:
        --a5;
        break;
      case 3uLL:
        a5 /= 3uLL;
        break;
      case 4uLL:
        a5 -= 2;
        break;
      default:
        a5 = 0;
        break;
    }
    vfx_counters_update((uint64_t)self->_counters.storage.impl, self->_counters.primitiveCount, (double)(a5 * a6));
  }
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  const char *v13;
  MTLRenderCommandEncoder *encoder;
  __vfx_counters *impl;

  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  encoder = self->_encoder;
  if (a7)
    objc_msgSend_drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_(encoder, v13, a3, a4, a5, a6, a7);
  else
    objc_msgSend_drawPrimitives_vertexStart_vertexCount_instanceCount_(encoder, v13, a3, a4, a5, a6);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    switch(a3)
    {
      case 0uLL:
        break;
      case 1uLL:
        a5 >>= 1;
        break;
      case 2uLL:
        --a5;
        break;
      case 3uLL:
        a5 /= 3uLL;
        break;
      case 4uLL:
        a5 -= 2;
        break;
      default:
        a5 = 0;
        break;
    }
    vfx_counters_update((uint64_t)self->_counters.storage.impl, self->_counters.primitiveCount, (double)(a5 * a6));
  }
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  const char *v16;
  __vfx_counters *impl;

  objc_msgSend_applyChangedStates(self, a2, a3, (uint64_t)a4);
  objc_msgSend_drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset_(self->_encoder, v16, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    vfx_counters_update((uint64_t)self->_counters.storage.impl, self->_counters.indirectDrawCount, 1.0);
  }
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  const char *v18;
  __vfx_counters *impl;

  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  objc_msgSend_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_(self->_encoder, v18, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  impl = self->_counters.storage.impl;
  if (impl)
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  MTLRenderCommandEncoder *encoder;
  const char *v10;
  __vfx_counters *impl;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v14;

  objc_msgSend_applyChangedStates(self, a2, (uint64_t)a3, (uint64_t)a4);
  encoder = self->_encoder;
  v14 = *a3;
  v13 = *a4;
  v12 = *a5;
  objc_msgSend_drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_(encoder, v10, (uint64_t)&v14, (uint64_t)&v13, &v12);
  impl = self->_counters.storage.impl;
  if (impl)
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
{
  MTLRenderCommandEncoder *encoder;
  const char *v12;
  __vfx_counters *impl;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v14;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v15;

  objc_msgSend_applyChangedStates(self, a2, (uint64_t)a3, a4);
  encoder = self->_encoder;
  v15 = *a5;
  v14 = *a6;
  objc_msgSend_drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_(encoder, v12, (uint64_t)a3, a4, &v15, &v14);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    vfx_counters_update((uint64_t)self->_counters.storage.impl, self->_counters.indirectDrawCount, 1.0);
  }
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  MTLRenderCommandEncoder *encoder;
  const char *v10;
  __vfx_counters *impl;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v14;

  objc_msgSend_applyChangedStates(self, a2, (uint64_t)a3, (uint64_t)a4);
  encoder = self->_encoder;
  v14 = *a3;
  v13 = *a4;
  v12 = *a5;
  objc_msgSend_drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_(encoder, v10, (uint64_t)&v14, (uint64_t)&v13, &v12);
  impl = self->_counters.storage.impl;
  if (impl)
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  const char *v13;
  __vfx_counters *impl;

  objc_msgSend_applyChangedStates(self, a2, a3, (uint64_t)a4);
  objc_msgSend_drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset_(self->_encoder, v13, a3, (uint64_t)a4, a5, a6, a7);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    vfx_counters_update((uint64_t)self->_counters.storage.impl, self->_counters.indirectDrawCount, 1.0);
  }
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  const char *v16;
  __vfx_counters *impl;

  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  objc_msgSend_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_(self->_encoder, v16, a3, a4, a5, a6, a7, a8, a9);
  impl = self->_counters.storage.impl;
  if (impl)
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  uint64_t v6;
  uint64_t v7;
  float32x4_t v8;

  v8.f32[0] = a3;
  v8.f32[1] = a4;
  v8.i64[1] = __PAIR64__(LODWORD(a6), LODWORD(a5));
  if ((vmaxvq_u32((uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_cache.material, v8))) & 0x80000000) != 0)
  {
    *(float32x4_t *)&self->_cache.material = v8;
    objc_msgSend_setBlendColorRed_green_blue_alpha_(self->_encoder, a2, v6, v7);
  }
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setColorStoreAction_atIndex_, a3, a4);
}

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setColorStoreActionOptions_atIndex_, a3, a4);
}

- (void)setCullMode:(unint64_t)a3
{
  __int16 isa;

  isa = (__int16)self[22].super.isa;
  if ((isa & 0x20) == 0 && self->_cache.meshElement != (__CFXMeshElement *)a3)
  {
    self->_cache.meshElement = (__CFXMeshElement *)a3;
    LOWORD(self[22].super.isa) = isa | 4;
  }
}

- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5
{
  uint64_t v5;
  uint64_t v6;

  objc_msgSend_setDepthBias_slopeScale_clamp_(self->_encoder, a2, v5, v6);
}

- (void)setDepthClipMode:(unint64_t)a3
{
  if (self->_cache.program != (__CFXFXProgram *)a3)
  {
    self->_cache.program = (__CFXFXProgram *)a3;
    LOWORD(self[22].super.isa) |= 0x10u;
  }
}

- (void)setDepthStencilState:(id)a3
{
  uint64_t v3;

  if (self->_cache.rasterizerStates != a3)
  {
    self->_cache.rasterizerStates = (__CFXRasterizerStates *)a3;
    objc_msgSend_setDepthStencilState_(self->_encoder, a2, (uint64_t)a3, v3);
  }
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  ((void (*)(MTLRenderCommandEncoder *, char *, unint64_t))MEMORY[0x1E0DE7D20])(self->_encoder, sel_setDepthStoreAction_, a3);
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
  ((void (*)(MTLRenderCommandEncoder *, char *, unint64_t))MEMORY[0x1E0DE7D20])(self->_encoder, sel_setDepthStoreActionOptions_, a3);
}

- (unint64_t)frontFacingWinding
{
  return (unint64_t)self->_cache.metalMesh;
}

- (void)setFrontFacingWinding:(unint64_t)a3
{
  if (self->_cache.metalMesh != (VFXMTLMesh *)a3)
  {
    self->_cache.metalMesh = (VFXMTLMesh *)a3;
    LOWORD(self[22].super.isa) |= 2u;
  }
}

- (void)setRenderPipelineState:(id)a3
{
  uint64_t v3;

  if (self->_cache.mesh != a3)
  {
    self->_cache.mesh = (__CFXMesh *)a3;
    objc_msgSend_setRenderPipelineState_(self->_encoder, a2, (uint64_t)a3, v3);
  }
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  char *v5;

  v5 = (char *)self + 16 * a5;
  *((_QWORD *)v5 + 113) = 0;
  *((_QWORD *)v5 + 112) = 0;
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setVertexBytes_length_atIndex_, a3, a4);
}

- (void)setScissorRect:(id *)a3
{
  uint64_t v3;
  MTLRenderCommandEncoder *encoder;
  __int128 v5;
  _OWORD v6[2];

  encoder = self->_encoder;
  v5 = *(_OWORD *)&a3->var2;
  v6[0] = *(_OWORD *)&a3->var0;
  v6[1] = v5;
  objc_msgSend_setScissorRect_(encoder, a2, (uint64_t)v6, v3);
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setScissorRects_count_, a3, a4);
}

- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4
{
  if (LODWORD(self->_cache.metalShadable) != a3 || HIDWORD(self->_cache.metalShadable) != a4)
  {
    LODWORD(self->_cache.metalShadable) = a3;
    HIDWORD(self->_cache.metalShadable) = a4;
    MEMORY[0x1E0DE7D20](self->_encoder, sel_setStencilFrontReferenceValue_backReferenceValue_, *(_QWORD *)&a3, *(_QWORD *)&a4);
  }
}

- (void)setStencilReferenceValue:(unsigned int)a3
{
  if (LODWORD(self->_cache.metalShadable) != a3 || HIDWORD(self->_cache.metalShadable) != a3)
  {
    LODWORD(self->_cache.metalShadable) = a3;
    HIDWORD(self->_cache.metalShadable) = a3;
    ((void (*)(MTLRenderCommandEncoder *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self->_encoder, sel_setStencilReferenceValue_, *(_QWORD *)&a3);
  }
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  ((void (*)(MTLRenderCommandEncoder *, char *, unint64_t))MEMORY[0x1E0DE7D20])(self->_encoder, sel_setStencilStoreAction_, a3);
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
  ((void (*)(MTLRenderCommandEncoder *, char *, unint64_t))MEMORY[0x1E0DE7D20])(self->_encoder, sel_setStencilStoreActionOptions_, a3);
}

- (void)setTriangleFillMode:(unint64_t)a3
{
  __int16 isa;

  isa = (__int16)self[22].super.isa;
  if ((isa & 0x40) == 0 && self->_cache.metalMeshElement != (VFXMTLMeshElement *)a3)
  {
    self->_cache.metalMeshElement = (VFXMTLMeshElement *)a3;
    LOWORD(self[22].super.isa) = isa | 8;
  }
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id *v5;
  unint64_t *v6;
  id v7;

  v5 = (id *)(&self[13]._cache.rasterizerStates + 2 * a5);
  if (*v5 == a3)
  {
    v7 = v5[1];
    v6 = (unint64_t *)(v5 + 1);
    if (v7 != (id)a4)
    {
      *v6 = a4;
      MEMORY[0x1E0DE7D20](self->_encoder, sel_setFragmentBufferOffset_atIndex_, a4, a5);
    }
  }
  else
  {
    *v5 = a3;
    v5[1] = (id)a4;
    objc_msgSend_setFragmentBuffer_offset_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
  }
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  char *v4;

  v4 = (char *)self + 16 * a4;
  if (*((_QWORD *)v4 + 319) != a3)
  {
    *((_QWORD *)v4 + 319) = a3;
    MEMORY[0x1E0DE7D20](self->_encoder, sel_setFragmentBufferOffset_atIndex_, a3, a4);
  }
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  __CFXMesh **v5;
  const void **v6;
  const unint64_t *v7;
  NSUInteger length;
  __CFXMesh *v9;
  __CFXMesh *v10;
  __CFXMesh *v11;

  if (a5.length)
  {
    v5 = &self[13]._cache.mesh + 2 * a5.location;
    v6 = a3;
    v7 = a4;
    length = a5.length;
    do
    {
      v10 = (__CFXMesh *)*v6++;
      v9 = v10;
      v11 = (__CFXMesh *)*v7++;
      *(v5 - 1) = v9;
      *v5 = v11;
      v5 += 2;
      --length;
    }
    while (length);
  }
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setFragmentBuffers_offsets_withRange_, a3, a4);
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  char *v5;

  v5 = (char *)self + 16 * a5;
  *((_QWORD *)v5 + 319) = 0;
  *((_QWORD *)v5 + 318) = 0;
  objc_msgSend_setFragmentBytes_length_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  if (*((id *)&self[21]._counters.primitiveCount + a4) != a3)
  {
    *((_QWORD *)&self[21]._counters.primitiveCount + a4) = a3;
    objc_msgSend_setFragmentSamplerState_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
  }
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  *((_QWORD *)&self[21]._counters.primitiveCount + a6) = a3;
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_, a3, a6);
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  unsigned int *v6;
  const void **v7;
  NSUInteger length;
  uint64_t v9;

  if (a6.length)
  {
    v6 = &self[21]._counters.primitiveCount + 2 * a6.location;
    v7 = a3;
    length = a6.length;
    do
    {
      v9 = (uint64_t)*v7++;
      *(_QWORD *)v6 = v9;
      v6 += 2;
      --length;
    }
    while (length);
  }
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_, a3, a4);
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  unsigned int *v4;
  const void **v5;
  NSUInteger length;
  uint64_t v7;

  if (a4.length)
  {
    v4 = &self[21]._counters.primitiveCount + 2 * a4.location;
    v5 = a3;
    length = a4.length;
    do
    {
      v7 = (uint64_t)*v5++;
      *(_QWORD *)v4 = v7;
      v4 += 2;
      --length;
    }
    while (length);
  }
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setFragmentSamplerStates_withRange_, a3, a4.location);
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  __int16 isa;

  if (*((id *)&self[15]._cache.deformers + a4) != a3)
  {
    *((_QWORD *)&self[15]._cache.deformers + a4) = a3;
    isa = (__int16)self[22].super.isa;
    if ((isa & 1) != 0)
    {
      LOWORD(self[22].super.isa) = isa | 0x100;
      *((_QWORD *)&self[21]._cache.tessellationPipelineStateHash + (a4 >> 6)) |= 1 << a4;
    }
    else
    {
      objc_msgSend_setFragmentTexture_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
    }
  }
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  __CFXDeformerStack **v4;
  const void **v5;
  NSUInteger length;
  __CFXDeformerStack *v7;

  if (a4.length)
  {
    v4 = &self[15]._cache.deformers + a4.location;
    v5 = a3;
    length = a4.length;
    do
    {
      v7 = (__CFXDeformerStack *)*v5++;
      *v4++ = v7;
      --length;
    }
    while (length);
  }
  objc_msgSend_setFragmentTextures_withRange_(self->_encoder, a2, (uint64_t)a3, a4.location);
}

- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6
{
  if (*((id *)&self[15]._cache.deformers + a4) != a3 || *((id *)&self[21]._counters.primitiveCount + a6) != a5)
  {
    *((_QWORD *)&self[15]._cache.deformers + a4) = a3;
    *((_QWORD *)&self[21]._counters.primitiveCount + a6) = a5;
    objc_msgSend_setFragmentTexture_atTextureIndex_samplerState_atSamplerIndex_(self->_encoder, a2, (uint64_t)a3, a4);
  }
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
  objc_msgSend_setVertexAmplificationCount_viewMappings_(self->_encoder, a2, a3, (uint64_t)a4);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id *v5;
  unint64_t *v6;
  id v7;

  v5 = (id *)(&self[4]._cache.blendStates + 2 * a5);
  if (*v5 == a3)
  {
    v7 = v5[1];
    v6 = (unint64_t *)(v5 + 1);
    if (v7 != (id)a4)
    {
      *v6 = a4;
      objc_msgSend_setVertexBufferOffset_atIndex_(self->_encoder, a2, a4, a5);
    }
  }
  else
  {
    *v5 = a3;
    v5[1] = (id)a4;
    objc_msgSend_setVertexBuffer_offset_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
  }
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  char *v4;

  v4 = (char *)self + 16 * a4;
  if (*((_QWORD *)v4 + 113) != a3)
  {
    *((_QWORD *)v4 + 113) = a3;
    objc_msgSend_setVertexBufferOffset_atIndex_(self->_encoder, a2, a3, a4);
  }
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v10;
  unint64_t v11;
  unint64_t *i;
  NSUInteger v13;
  const void *v14;
  unint64_t v15;
  NSUInteger v16;
  unint64_t v17;
  const void **v18;
  const unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;

  if (a5.length)
  {
    length = a5.length;
    location = a5.location;
    v10 = 0;
    v11 = 0;
    for (i = (unint64_t *)(&self[4]._cache.colorBufferWriteMask + 16 * a5.location); ; i += 2)
    {
      v13 = location + v11;
      v14 = a3[v11];
      if ((const void *)*(i - 1) != v14)
        break;
      v15 = a4[v11];
      if (*i != v15)
      {
        *i = v15;
        objc_msgSend_setVertexBufferOffset_atIndex_(self->_encoder, a2, a4[v11], location + v11);
      }
      ++v11;
      v10 -= 8;
      if (length == v11)
        return;
    }
    v16 = length - v11;
    if (length != v11)
    {
      if (length - 1 == v11)
      {
        v17 = a4[v11];
        *(i - 1) = (unint64_t)v14;
        *i = v17;
        objc_msgSend_setVertexBuffer_offset_atIndex_(self->_encoder, a2, (uint64_t)a3[v11], a4[v11], v13);
      }
      else
      {
        v18 = &a3[v10 / 0xFFFFFFFFFFFFFFF8];
        v19 = &a4[v10 / 0xFFFFFFFFFFFFFFF8];
        objc_msgSend_setVertexBuffers_offsets_withRange_(self->_encoder, a2, (uint64_t)v18, (uint64_t)v19, v13, length - v11);
        if (length > v11)
        {
          do
          {
            v21 = (unint64_t)*v18++;
            v20 = v21;
            v22 = *v19++;
            *(i - 1) = v20;
            *i = v22;
            i += 2;
            --v16;
          }
          while (v16);
        }
      }
    }
  }
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setVertexBuffer_offset_attributeStride_atIndex_, a3, a4);
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setVertexBuffers_offsets_attributeStrides_withRange_, a3, a4);
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setVertexBufferOffset_attributeStride_atIndex_, a3, a4);
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setVertexBytes_length_attributeStride_atIndex_, a3, a4);
}

- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  if (*((id *)&self[12]._cache.metalShadable + a4) != a3)
  {
    *((_QWORD *)&self[12]._cache.metalShadable + a4) = a3;
    objc_msgSend_setVertexSamplerState_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
  }
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  *((_QWORD *)&self[12]._cache.metalShadable + a6) = a3;
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_, a3, a6);
}

- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  VFXMTLShadable **v6;
  const void **v7;
  NSUInteger length;
  VFXMTLShadable *v9;

  if (a6.length)
  {
    v6 = &self[12]._cache.metalShadable + a6.location;
    v7 = a3;
    length = a6.length;
    do
    {
      v9 = (VFXMTLShadable *)*v7++;
      *v6++ = v9;
      --length;
    }
    while (length);
  }
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_, a3, a4);
}

- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  VFXMTLShadable **v4;
  const void **v5;
  NSUInteger length;
  VFXMTLShadable *v7;

  if (a4.length)
  {
    v4 = &self[12]._cache.metalShadable + a4.location;
    v5 = a3;
    length = a4.length;
    do
    {
      v7 = (VFXMTLShadable *)*v5++;
      *v4++ = v7;
      --length;
    }
    while (length);
  }
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setVertexSamplerStates_withRange_, a3, a4.location);
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  __int16 isa;

  if (*((id *)&self[7]._cache.rasterizerStates + a4) != a3)
  {
    *((_QWORD *)&self[7]._cache.rasterizerStates + a4) = a3;
    isa = (__int16)self[22].super.isa;
    if ((isa & 1) != 0)
    {
      LOWORD(self[22].super.isa) = isa | 0x100;
      *((_QWORD *)&self[21]._cache.deformers + (a4 >> 6)) |= 1 << a4;
    }
    else
    {
      objc_msgSend_setVertexTexture_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
    }
  }
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  __CFXRasterizerStates **v4;
  const void **v5;
  NSUInteger length;
  __CFXRasterizerStates *v7;

  if (a4.length)
  {
    v4 = &self[7]._cache.rasterizerStates + a4.location;
    v5 = a3;
    length = a4.length;
    do
    {
      v7 = (__CFXRasterizerStates *)*v5++;
      *v4++ = v7;
      --length;
    }
    while (length);
  }
  objc_msgSend_setVertexTextures_withRange_(self->_encoder, a2, (uint64_t)a3, a4.location);
}

- (void)setViewport:(id *)a3
{
  __int128 v5;
  __int128 v6;

  if (self[4]._cache.commonProfile != (__CFXCommonProfile *)1 || memcmp(&self->_cache.commonProfile, a3, 0x30uLL))
  {
    v5 = *(_OWORD *)&a3->var0;
    v6 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&self->_cache.pointOfView = *(_OWORD *)&a3->var4;
    *(_OWORD *)&self->_cache.colorBufferWriteMask = v6;
    *(_OWORD *)&self->_cache.commonProfile = v5;
    self[4]._cache.commonProfile = (__CFXCommonProfile *)1;
    LOWORD(self[22].super.isa) |= 0x80u;
  }
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  size_t v7;

  if (self[4]._cache.commonProfile != (__CFXCommonProfile *)a4)
  {
    v7 = 48 * a4;
    goto LABEL_5;
  }
  v7 = 48 * a4;
  if (memcmp(&self->_cache.commonProfile, a3, 48 * a4))
  {
LABEL_5:
    memcpy(&self->_cache.commonProfile, a3, v7);
    self[4]._cache.commonProfile = (__CFXCommonProfile *)a4;
    LOWORD(self[22].super.isa) |= 0x80u;
  }
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_useResource_usage_, a3, a4);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  objc_msgSend_useResource_usage_stages_(self->_encoder, a2, (uint64_t)a3, a4, a5);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  objc_msgSend_useResources_count_usage_(self->_encoder, a2, (uint64_t)a3, a4, a5);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_useResources_count_usage_stages_, a3, a4);
}

- (void)dispatchThreadsPerTile:(id *)a3
{
  uint64_t v3;
  MTLRenderCommandEncoder *encoder;
  const char *v7;
  uint64_t v8;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9;

  objc_msgSend_applyChangedStates(self, a2, (uint64_t)a3, v3);
  encoder = self->_encoder;
  v9 = *a3;
  objc_msgSend_dispatchThreadsPerTile_(encoder, v7, (uint64_t)&v9, v8);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_, a3, a4);
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_executeCommandsInBuffer_withRange_, a3, a4.location);
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_memoryBarrierWithResources_count_afterStages_beforeStages_, a3, a4);
}

- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_memoryBarrierWithScope_afterStages_beforeStages_, a3, a4);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_sampleCountersInBuffer_atSampleIndex_withBarrier_, a3, a4);
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setFragmentAccelerationStructure_atBufferIndex_, a3, a4);
}

- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setFragmentIntersectionFunctionTable_atBufferIndex_, a3, a4);
}

- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setFragmentIntersectionFunctionTables_withBufferRange_, a3, a4.location);
}

- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setFragmentVisibleFunctionTable_atBufferIndex_, a3, a4);
}

- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setFragmentVisibleFunctionTables_withBufferRange_, a3, a4.location);
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setMeshBuffer_offset_atIndex_, a3, a4);
}

- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setMeshBufferOffset_atIndex_, a3, a4);
}

- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setMeshBuffers_offsets_withRange_, a3, a4);
}

- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setMeshBytes_length_atIndex_, a3, a4);
}

- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setMeshSamplerState_atIndex_, a3, a4);
}

- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setMeshSamplerState_lodMinClamp_lodMaxClamp_atIndex_, a3, a6);
}

- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange_, a3, a4);
}

- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setMeshSamplerStates_withRange_, a3, a4.location);
}

- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setMeshTexture_atIndex_, a3, a4);
}

- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setMeshTextures_withRange_, a3, a4.location);
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setObjectBuffer_offset_atIndex_, a3, a4);
}

- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setObjectBufferOffset_atIndex_, a3, a4);
}

- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setObjectBuffers_offsets_withRange_, a3, a4);
}

- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setObjectBytes_length_atIndex_, a3, a4);
}

- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setObjectSamplerState_atIndex_, a3, a4);
}

- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setObjectSamplerState_lodMinClamp_lodMaxClamp_atIndex_, a3, a6);
}

- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange_, a3, a4);
}

- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setObjectSamplerStates_withRange_, a3, a4.location);
}

- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setObjectTexture_atIndex_, a3, a4);
}

- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setObjectTextures_withRange_, a3, a4.location);
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setObjectThreadgroupMemoryLength_atIndex_, a3, a4);
}

- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5
{
  objc_msgSend_setTessellationFactorBuffer_offset_instanceStride_(self->_encoder, a2, (uint64_t)a3, a4, a5);
}

- (void)setTessellationFactorScale:(float)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_setTessellationFactorScale_(self->_encoder, a2, v3, v4);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setThreadgroupMemoryLength_offset_atIndex_, a3, a4);
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setTileAccelerationStructure_atBufferIndex_, a3, a4);
}

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setTileBuffer_offset_atIndex_, a3, a4);
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setTileBufferOffset_atIndex_, a3, a4);
}

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setTileBuffers_offsets_withRange_, a3, a4);
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setTileBytes_length_atIndex_, a3, a4);
}

- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setTileIntersectionFunctionTable_atBufferIndex_, a3, a4);
}

- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setTileIntersectionFunctionTables_withBufferRange_, a3, a4.location);
}

- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setTileSamplerState_atIndex_, a3, a4);
}

- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex_, a3, a6);
}

- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange_, a3, a4);
}

- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setTileSamplerStates_withRange_, a3, a4.location);
}

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setTileTexture_atIndex_, a3, a4);
}

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setTileTextures_withRange_, a3, a4.location);
}

- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setTileVisibleFunctionTable_atBufferIndex_, a3, a4);
}

- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setTileVisibleFunctionTables_withBufferRange_, a3, a4.location);
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setVertexAccelerationStructure_atBufferIndex_, a3, a4);
}

- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setVertexIntersectionFunctionTable_atBufferIndex_, a3, a4);
}

- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setVertexIntersectionFunctionTables_withBufferRange_, a3, a4.location);
}

- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setVertexVisibleFunctionTable_atBufferIndex_, a3, a4);
}

- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setVertexVisibleFunctionTables_withBufferRange_, a3, a4.location);
}

- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setVisibilityResultMode_offset_, a3, a4);
}

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_updateFence_afterStages_, a3, a4);
}

- (void)useHeap:(id)a3
{
  uint64_t v3;

  objc_msgSend_useHeap_(self->_encoder, a2, (uint64_t)a3, v3);
}

- (void)useHeap:(id)a3 stages:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_useHeap_stages_, a3, a4);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_useHeaps_count_, a3, a4);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_useHeaps_count_stages_, a3, a4);
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_waitForFence_beforeStages_, a3, a4);
}

- (void)applyChangedStates
{
  uint64_t v2;
  __int16 isa;
  __CFXCommonProfile *commonProfile;

  isa = (__int16)self[22].super.isa;
  if ((isa & 2) != 0)
  {
    LOWORD(self[22].super.isa) = isa & 0xFFFD;
    objc_msgSend_setFrontFacingWinding_(self->_encoder, a2, (uint64_t)self->_cache.metalMesh, v2);
    isa = (__int16)self[22].super.isa;
    if ((isa & 8) == 0)
    {
LABEL_3:
      if ((isa & 4) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((isa & 8) == 0)
  {
    goto LABEL_3;
  }
  LOWORD(self[22].super.isa) = isa & 0xFFF7;
  objc_msgSend_setTriangleFillMode_(self->_encoder, a2, (uint64_t)self->_cache.metalMeshElement, v2);
  isa = (__int16)self[22].super.isa;
  if ((isa & 4) == 0)
  {
LABEL_4:
    if ((isa & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  LOWORD(self[22].super.isa) = isa & 0xFFFB;
  objc_msgSend_setCullMode_(self->_encoder, a2, (uint64_t)self->_cache.meshElement, v2);
  isa = (__int16)self[22].super.isa;
  if ((isa & 0x10) == 0)
  {
LABEL_5:
    if ((isa & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_11;
  }
LABEL_10:
  LOWORD(self[22].super.isa) = isa & 0xFFEF;
  objc_msgSend_setDepthClipMode_(self->_encoder, a2, (uint64_t)self->_cache.program, v2);
  isa = (__int16)self[22].super.isa;
  if ((isa & 0x80) == 0)
    goto LABEL_13;
LABEL_11:
  commonProfile = self[4]._cache.commonProfile;
  if (commonProfile)
  {
    LOWORD(self[22].super.isa) = isa & 0xFF7F;
    objc_msgSend_setViewports_count_(self->_encoder, a2, (uint64_t)&self->_cache.commonProfile, (uint64_t)commonProfile);
    isa = (__int16)self[22].super.isa;
  }
LABEL_13:
  if ((isa & 1) != 0)
    sub_1B21AAF70((uint64_t)&self->_cache, self->_encoder);
}

- (void)rg_setLineWidth:(float)a3
{
  ((void (*)(MTLRenderCommandEncoder *, char *))MEMORY[0x1E0DE7D20])(self->_encoder, sel_setLineWidth_);
}

- (void)setLockCullMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  LOWORD(self[22].super.isa) = (uint64_t)self[22].super.isa & 0xFFDF | v3;
}

- (BOOL)isCullModeLocked
{
  return (LOWORD(self[22].super.isa) >> 5) & 1;
}

- (void)setLockFillMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  LOWORD(self[22].super.isa) = (uint64_t)self[22].super.isa & 0xFFBF | v3;
}

- (BOOL)isFillModeLocked
{
  return (LOWORD(self[22].super.isa) >> 6) & 1;
}

- (id).cxx_construct
{
  *((_OWORD *)self + 86) = 0u;
  *((_OWORD *)self + 85) = 0u;
  *((_OWORD *)self + 84) = 0u;
  *((_OWORD *)self + 83) = 0u;
  *((_OWORD *)self + 82) = 0u;
  *((_OWORD *)self + 81) = 0u;
  *((_OWORD *)self + 80) = 0u;
  *((_OWORD *)self + 79) = 0u;
  *((_OWORD *)self + 78) = 0u;
  *((_OWORD *)self + 77) = 0u;
  *((_OWORD *)self + 76) = 0u;
  *((_OWORD *)self + 75) = 0u;
  *((_OWORD *)self + 74) = 0u;
  *((_OWORD *)self + 73) = 0u;
  *((_OWORD *)self + 72) = 0u;
  *((_OWORD *)self + 71) = 0u;
  *((_OWORD *)self + 70) = 0u;
  *((_OWORD *)self + 69) = 0u;
  *((_OWORD *)self + 68) = 0u;
  *((_OWORD *)self + 67) = 0u;
  *((_OWORD *)self + 66) = 0u;
  *((_OWORD *)self + 65) = 0u;
  *((_OWORD *)self + 63) = 0u;
  *((_OWORD *)self + 64) = 0u;
  *((_OWORD *)self + 61) = 0u;
  *((_OWORD *)self + 62) = 0u;
  *((_OWORD *)self + 59) = 0u;
  *((_OWORD *)self + 60) = 0u;
  *((_OWORD *)self + 57) = 0u;
  *((_OWORD *)self + 58) = 0u;
  *((_OWORD *)self + 56) = 0u;
  *((_OWORD *)self + 189) = 0u;
  *((_OWORD *)self + 188) = 0u;
  *((_OWORD *)self + 187) = 0u;
  *((_OWORD *)self + 186) = 0u;
  *((_OWORD *)self + 185) = 0u;
  *((_OWORD *)self + 184) = 0u;
  *((_OWORD *)self + 183) = 0u;
  *((_OWORD *)self + 182) = 0u;
  *((_OWORD *)self + 181) = 0u;
  *((_OWORD *)self + 180) = 0u;
  *((_OWORD *)self + 179) = 0u;
  *((_OWORD *)self + 178) = 0u;
  *((_OWORD *)self + 177) = 0u;
  *((_OWORD *)self + 176) = 0u;
  *((_OWORD *)self + 175) = 0u;
  *((_OWORD *)self + 174) = 0u;
  *((_OWORD *)self + 173) = 0u;
  *((_OWORD *)self + 172) = 0u;
  *((_OWORD *)self + 171) = 0u;
  *((_OWORD *)self + 170) = 0u;
  *((_OWORD *)self + 169) = 0u;
  *((_OWORD *)self + 168) = 0u;
  *((_OWORD *)self + 167) = 0u;
  *((_OWORD *)self + 166) = 0u;
  *((_OWORD *)self + 165) = 0u;
  *((_OWORD *)self + 164) = 0u;
  *((_OWORD *)self + 163) = 0u;
  *((_OWORD *)self + 162) = 0u;
  *((_OWORD *)self + 161) = 0u;
  *((_OWORD *)self + 160) = 0u;
  *((_OWORD *)self + 159) = 0u;
  return self;
}

@end
