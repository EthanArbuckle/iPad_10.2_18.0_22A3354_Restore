@implementation RGCachedComputeCommandEncoder

- (RGCachedComputeCommandEncoder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RGCachedComputeCommandEncoder;
  return -[RGCachedComputeCommandEncoder init](&v3, sel_init);
}

- (RGCachedComputeCommandEncoder)initWithEncoder:(id)a3
{
  RGCachedComputeCommandEncoder *v4;
  const char *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RGCachedComputeCommandEncoder;
  v4 = -[RGCachedComputeCommandEncoder init](&v8, sel_init);
  objc_msgSend_setEncoder_(v4, v5, (uint64_t)a3, v6);
  return v4;
}

- (MTLDevice)device
{
  uint64_t v2;
  uint64_t v3;

  return (MTLDevice *)objc_msgSend_device(self->_encoder, a2, v2, v3);
}

- (void)setLabel:(id)a3
{
  uint64_t v3;

  objc_msgSend_setLabel_(self->_encoder, a2, (uint64_t)a3, v3);
}

- (NSString)label
{
  return (NSString *)((uint64_t (*)(MTLComputeCommandEncoder *, char *))MEMORY[0x1E0DE7D20])(self->_encoder, sel_label);
}

- (unint64_t)dispatchType
{
  return ((uint64_t (*)(MTLComputeCommandEncoder *, char *))MEMORY[0x1E0DE7D20])(self->_encoder, sel_dispatchType);
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_setEncoder_(self, a2, 0, v2);
  v4.receiver = self;
  v4.super_class = (Class)RGCachedComputeCommandEncoder;
  -[RGCachedComputeCommandEncoder dealloc](&v4, sel_dealloc);
}

- (void)loadWithCommandBuffer:(id)a3 label:(id)a4
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  v6 = objc_msgSend_computeCommandEncoder(a3, a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_setEncoder_(self, v7, v6, v8);
  objc_msgSend_setLabel_(self->_encoder, v9, (uint64_t)a4, v10);
}

- (void)setEncoder:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a3;

  self->_encoder = (MTLComputeCommandEncoder *)a3;
  objc_msgSend_resetCache(self, v6, v7, v8);
}

- (void)endEncoding
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;

  objc_msgSend_endEncoding(self->_encoder, a2, v2, v3);
  objc_msgSend_setEncoder_(self, v5, 0, v6);
}

- (BOOL)isEncoding
{
  return self->_encoder != 0;
}

- (void)insertDebugSignpost:(id)a3
{
  ((void (*)(MTLComputeCommandEncoder *, char *, id))MEMORY[0x1E0DE7D20])(self->_encoder, sel_insertDebugSignpost_, a3);
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

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  MTLComputeCommandEncoder *encoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;

  encoder = self->_encoder;
  v6 = *a3;
  v5 = *a4;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(encoder, a2, (uint64_t)&v6, (uint64_t)&v5);
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  MTLComputeCommandEncoder *encoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;

  encoder = self->_encoder;
  v6 = *a5;
  objc_msgSend_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_(encoder, a2, (uint64_t)a3, a4, &v6);
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  MTLComputeCommandEncoder *encoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;

  encoder = self->_encoder;
  v6 = *a3;
  v5 = *a4;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(encoder, a2, (uint64_t)&v6, (uint64_t)&v5);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_, a3, a4);
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_executeCommandsInBuffer_withRange_, a3, a4.location);
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_memoryBarrierWithResources_count_, a3, a4);
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  ((void (*)(MTLComputeCommandEncoder *, char *, unint64_t))MEMORY[0x1E0DE7D20])(self->_encoder, sel_memoryBarrierWithScope_, a3);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_sampleCountersInBuffer_atSampleIndex_withBarrier_, a3, a4);
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend_setAccelerationStructure_atBufferIndex_(self->_encoder, a2, (uint64_t)a3, a4);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (*((id *)&self->_cache.mesh + a5) == a3)
  {
    if (*((_QWORD *)&self[1]._cache.node + a5) != a4)
    {
      *((_QWORD *)&self[1]._cache.node + a5) = a4;
      objc_msgSend_setBufferOffset_atIndex_(self->_encoder, a2, a4, a5);
    }
  }
  else
  {
    *((_QWORD *)&self->_cache.mesh + a5) = a3;
    *((_QWORD *)&self[1]._cache.node + a5) = a4;
    objc_msgSend_setBuffer_offset_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
  }
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (*((_QWORD *)&self[1]._cache.node + a4) != a3)
  {
    *((_QWORD *)&self[1]._cache.node + a4) = a3;
    objc_msgSend_setBufferOffset_atIndex_(self->_encoder, a2, a3, a4);
  }
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a5.length)
  {
    length = a5.length;
    location = a5.location;
    do
    {
      v11 = (uint64_t)*a3++;
      v10 = v11;
      v12 = *a4++;
      objc_msgSend_setBuffer_offset_atIndex_(self, a2, v10, v12, location++);
      --length;
    }
    while (length);
  }
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setBuffer_offset_attributeStride_atIndex_, a3, a4);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setBuffers_offsets_attributeStrides_withRange_, a3, a4);
}

- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setBufferOffset_attributeStride_atIndex_, a3, a4);
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  Class *v5;

  v5 = &self->super.isa + a5;
  v5[3] = 0;
  v5[34] = 0;
  objc_msgSend_setBytes_length_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  Class *v6;

  v6 = &self->super.isa + a6;
  v6[3] = 0;
  v6[34] = 0;
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setBytes_length_attributeStride_atIndex_, a3, a4);
}

- (void)setComputePipelineState:(id)a3
{
  uint64_t v3;

  if (self->_cache.rasterizerStates != a3)
  {
    self->_cache.rasterizerStates = (__CFXRasterizerStates *)a3;
    objc_msgSend_setComputePipelineState_(self->_encoder, a2, (uint64_t)a3, v3);
  }
}

- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setImageblockWidth_height_, a3, a4);
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend_setIntersectionFunctionTable_atBufferIndex_(self->_encoder, a2, (uint64_t)a3, a4);
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setIntersectionFunctionTables_withBufferRange_, a3, a4.location);
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  if (*((id *)&self[9]._cache.colorBufferWriteMask + a4) != a3)
  {
    *((_QWORD *)&self[9]._cache.colorBufferWriteMask + a4) = a3;
    objc_msgSend_setSamplerState_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
  }
}

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  *((_QWORD *)&self[9]._cache.colorBufferWriteMask + a6) = a3;
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setSamplerState_lodMinClamp_lodMaxClamp_atIndex_, a3, a6);
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  memcpy(&self[9]._cache.colorBufferWriteMask + 8 * a6.location, a3, 8 * a6.length);
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setSamplerStates_lodMinClamps_lodMaxClamps_withRange_, a3, a4);
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger location;

  location = a4.location;
  memcpy(&self[9]._cache.colorBufferWriteMask + 8 * a4.location, a3, 8 * a4.length);
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setSamplerStates_withRange_, a3, location);
}

- (void)setStageInRegion:(id *)a3
{
  uint64_t v3;
  MTLComputeCommandEncoder *encoder;
  __int128 v5;
  _OWORD v6[3];

  encoder = self->_encoder;
  v5 = *(_OWORD *)&a3->var0.var2;
  v6[0] = *(_OWORD *)&a3->var0.var0;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend_setStageInRegion_(encoder, a2, (uint64_t)v6, v3);
}

- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setStageInRegionWithIndirectBuffer_indirectBufferOffset_, a3, a4);
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  if (*((id *)&self[3]._cache.meshElement + a4) != a3)
  {
    *((_QWORD *)&self[3]._cache.meshElement + a4) = a3;
    objc_msgSend_setTexture_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
  }
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  uint64_t i;

  if (a4.length)
  {
    length = a4.length;
    for (i = 0; i != length; ++i)
      objc_msgSend_setTexture_atIndex_(self, a2, (uint64_t)a3[i], i);
  }
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_msgSend_setThreadgroupMemoryLength_atIndex_(self->_encoder, a2, a3, a4);
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setVisibleFunctionTable_atBufferIndex_, a3, a4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_setVisibleFunctionTables_withBufferRange_, a3, a4.location);
}

- (void)updateFence:(id)a3
{
  ((void (*)(MTLComputeCommandEncoder *, char *, id))MEMORY[0x1E0DE7D20])(self->_encoder, sel_updateFence_, a3);
}

- (void)useHeap:(id)a3
{
  uint64_t v3;

  objc_msgSend_useHeap_(self->_encoder, a2, (uint64_t)a3, v3);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_useHeaps_count_, a3, a4);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_encoder, sel_useResource_usage_, a3, a4);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  objc_msgSend_useResources_count_usage_(self->_encoder, a2, (uint64_t)a3, a4, a5);
}

- (void)waitForFence:(id)a3
{
  ((void (*)(MTLComputeCommandEncoder *, char *, id))MEMORY[0x1E0DE7D20])(self->_encoder, sel_waitForFence_, a3);
}

- (void)resetCache
{
  bzero(&self->_cache, 0x678uLL);
}

- (id)getEncoderAndResetCache
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_resetCache(self, a2, v2, v3);
  return self->_encoder;
}

- (void)dispatch:(id)a3 threadgroups:(id *)a4 threadsPerThreadgroup:(id *)a5
{
  const char *v8;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10;

  objc_msgSend_setComputePipelineState_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v10 = *a4;
  v9 = *a5;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(self, v8, (uint64_t)&v10, (uint64_t)&v9);
}

- (void)dispatch:(id)a3 threadgroupsWithIndirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 threadsPerThreadgroup:(id *)a6
{
  const char *v10;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;

  objc_msgSend_setComputePipelineState_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v11 = *a6;
  objc_msgSend_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_(self, v10, (uint64_t)a4, a5, &v11);
}

- (void)dispatchOne:(id)a3
{
  uint64_t v3;
  const char *v5;
  int64x2_t v6;
  uint64_t v7;
  int64x2_t v8;
  uint64_t v9;

  objc_msgSend_setComputePipelineState_(self, a2, (uint64_t)a3, v3);
  v8 = vdupq_n_s64(1uLL);
  v9 = 1;
  v6 = v8;
  v7 = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(self, v5, (uint64_t)&v8, (uint64_t)&v6);
}

- (void)dispatchOnVertices:(id)a3 vertexCount:(unsigned int)a4
{
  uint64_t v7;

  objc_msgSend_setComputePipelineState_(self, a2, (uint64_t)a3, *(uint64_t *)&a4);
  RGMTLComputeCommandEncoderDispatchOnGrid1D(self->_encoder, a3, a4, v7);
}

- (void)dispatch:(id)a3 onTexture2D:(id)a4
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  _QWORD v14[3];

  v7 = objc_msgSend_width(a4, a2, (uint64_t)a3, (uint64_t)a4);
  v11 = objc_msgSend_height(a4, v8, v9, v10);
  objc_msgSend_setComputePipelineState_(self, v12, (uint64_t)a3, v13);
  v14[0] = v7;
  v14[1] = v11;
  v14[2] = 1;
  RGMTLComputeCommandEncoderDispatchOnGrid2D(self, a3, (uint64_t)v14, 1);
}

- (void)dispatchOnTexture2D:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFXRasterizerStates *rasterizerStates;
  _QWORD v12[3];

  v6 = objc_msgSend_width(a3, a2, (uint64_t)a3, v3);
  v10 = objc_msgSend_height(a3, v7, v8, v9);
  rasterizerStates = self->_cache.rasterizerStates;
  v12[0] = v6;
  v12[1] = v10;
  v12[2] = 1;
  RGMTLComputeCommandEncoderDispatchOnGrid2D(self, rasterizerStates, (uint64_t)v12, 1);
}

- (void)dispatchOnTexture2DWithoutOptimizedThreadGroupPerGrid:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFXRasterizerStates *rasterizerStates;
  _QWORD v12[3];

  v6 = objc_msgSend_width(a3, a2, (uint64_t)a3, v3);
  v10 = objc_msgSend_height(a3, v7, v8, v9);
  rasterizerStates = self->_cache.rasterizerStates;
  v12[0] = v6;
  v12[1] = v10;
  v12[2] = 1;
  RGMTLComputeCommandEncoderDispatchOnGrid2D(self, rasterizerStates, (uint64_t)v12, 0);
}

- (void)dispatchOnTexture3D:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFXRasterizerStates *rasterizerStates;
  uint64_t v16;
  _QWORD v17[3];

  v6 = objc_msgSend_width(a3, a2, (uint64_t)a3, v3);
  v10 = objc_msgSend_height(a3, v7, v8, v9);
  v14 = objc_msgSend_depth(a3, v11, v12, v13);
  rasterizerStates = self->_cache.rasterizerStates;
  v17[0] = v6;
  v17[1] = v10;
  v17[2] = v14;
  RGMTLComputeCommandEncoderDispatchOnGrid3D(self, rasterizerStates, (uint64_t)v17, v16);
}

- (void)dispatchOnTextureCube:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFXRasterizerStates *rasterizerStates;
  uint64_t v12;
  _QWORD v13[3];

  v6 = objc_msgSend_width(a3, a2, (uint64_t)a3, v3);
  v10 = objc_msgSend_height(a3, v7, v8, v9);
  rasterizerStates = self->_cache.rasterizerStates;
  v13[0] = v6;
  v13[1] = v10;
  v13[2] = 6;
  RGMTLComputeCommandEncoderDispatchOnGrid3D(self, rasterizerStates, (uint64_t)v13, v12);
}

@end
