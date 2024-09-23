@implementation VFXModelDeformerInstanceWrapper

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXModelDeformerInstanceWrapper;
  -[VFXModelDeformerInstanceWrapper dealloc](&v3, sel_dealloc);
}

- (id)dependencyBufferForInput:(unint64_t)a3 dependencyStack:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  if ((uint64_t)a3 <= 2047)
  {
    if (a3 != 256)
    {
      if (a3 != 512)
      {
        if (a3 != 1024)
          goto LABEL_12;
        return (id)*((_QWORD *)a4 + 12);
      }
      return (id)*((_QWORD *)a4 + 11);
    }
    return (id)*((_QWORD *)a4 + 10);
  }
  switch(a3)
  {
    case 0x2000uLL:
      return (id)*((_QWORD *)a4 + 12);
    case 0x1000uLL:
      return (id)*((_QWORD *)a4 + 11);
    case 0x800uLL:
      return (id)*((_QWORD *)a4 + 10);
  }
LABEL_12:
  sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Unsupported input"), a3, (uint64_t)a4, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)dependencyBufferForInput:(unint64_t)a3 dependencyMesh:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Not implemented"), a3, (uint64_t)a4, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)deformer
{
  return self->_stack->_currentInitDeformer;
}

- (MTLDevice)device
{
  return (MTLDevice *)sub_1B18FD774((uint64_t)self->_stack->_resourceManager);
}

- (MTLBlitCommandEncoder)currentBlitEncoder
{
  uint64_t v2;
  uint64_t v3;

  return (MTLBlitCommandEncoder *)objc_msgSend_currentBlitEncoder(self->_stack, a2, v2, v3);
}

- (void)configureStageInputOutputDescriptor:(id)a3 withDeformerFunction:(id)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  $E2FBC665143C1AA598AEE16E33CBB2CF *p_dstNormals;
  $E2FBC665143C1AA598AEE16E33CBB2CF *p_srcNormals;
  $E2FBC665143C1AA598AEE16E33CBB2CF *p_dstPositions;
  $6F17D6CA85075CDE39B0E77F12FDCC88 *p_stageInputOutputDescriptors;
  uint64_t i;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t *v25;
  id v26;
  uint64_t v27;
  __int128 v28;
  const char *v29;
  uint64_t v30;
  __int128 v31;
  const char *v32;
  uint64_t v33;
  __int128 v34;
  const char *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  $E2FBC665143C1AA598AEE16E33CBB2CF *p_dstTangents;
  $E2FBC665143C1AA598AEE16E33CBB2CF *p_srcTangents;
  _OWORD v41[2];
  _OWORD v42[2];
  _OWORD v43[2];
  _OWORD v44[2];
  _OWORD v45[2];
  _OWORD v46[2];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v6 = (void *)objc_msgSend_stageInputAttributes(a4, a2, (uint64_t)a3, (uint64_t)a4);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v47, (uint64_t)v51, 16);
  if (v8)
  {
    v12 = v8;
    p_dstTangents = &self->_stageInputOutputDescriptors.dstTangents;
    p_srcTangents = &self->_stageInputOutputDescriptors.srcTangents;
    v13 = *(_QWORD *)v48;
    p_dstNormals = &self->_stageInputOutputDescriptors.dstNormals;
    p_srcNormals = &self->_stageInputOutputDescriptors.srcNormals;
    p_dstPositions = &self->_stageInputOutputDescriptors.dstPositions;
    p_stageInputOutputDescriptors = &self->_stageInputOutputDescriptors;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v6);
        v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if (objc_msgSend_attributeIndex(v19, v9, v10, v11, p_dstTangents))
        {
          if (objc_msgSend_attributeIndex(v19, v20, v21, v11) == 3)
          {
            v24 = *(_OWORD *)&p_dstPositions->bufferAttributeOffset;
            v45[0] = *(_OWORD *)&p_dstPositions->isActive;
            v45[1] = v24;
            v25 = (uint64_t *)v45;
            v26 = a3;
            v27 = 3;
          }
          else if (objc_msgSend_attributeIndex(v19, v22, v23, v11) == 1)
          {
            v31 = *(_OWORD *)&p_srcNormals->bufferAttributeOffset;
            v44[0] = *(_OWORD *)&p_srcNormals->isActive;
            v44[1] = v31;
            v25 = (uint64_t *)v44;
            v26 = a3;
            v27 = 1;
          }
          else if (objc_msgSend_attributeIndex(v19, v29, v30, v11) == 4)
          {
            v34 = *(_OWORD *)&p_dstNormals->bufferAttributeOffset;
            v43[0] = *(_OWORD *)&p_dstNormals->isActive;
            v43[1] = v34;
            v25 = (uint64_t *)v43;
            v26 = a3;
            v27 = 4;
          }
          else if (objc_msgSend_attributeIndex(v19, v32, v33, v11) == 2)
          {
            v37 = *(_OWORD *)&p_srcTangents->bufferAttributeOffset;
            v42[0] = *(_OWORD *)&p_srcTangents->isActive;
            v42[1] = v37;
            v25 = (uint64_t *)v42;
            v26 = a3;
            v27 = 2;
          }
          else
          {
            if (objc_msgSend_attributeIndex(v19, v35, v36, v11) != 5)
              continue;
            v38 = *(_OWORD *)&p_dstTangents->bufferAttributeOffset;
            v41[0] = *(_OWORD *)&p_dstTangents->isActive;
            v41[1] = v38;
            v25 = (uint64_t *)v41;
            v26 = a3;
            v27 = 5;
          }
        }
        else
        {
          v28 = *(_OWORD *)&p_stageInputOutputDescriptors->srcPositions.bufferAttributeOffset;
          v46[0] = *(_OWORD *)&p_stageInputOutputDescriptors->srcPositions.isActive;
          v46[1] = v28;
          v25 = (uint64_t *)v46;
          v26 = a3;
          v27 = 0;
        }
        sub_1B1872CB4(v26, (const char *)v27, v25, v11);
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v47, (uint64_t)v51, 16);
    }
    while (v12);
  }
}

- (unint64_t)_currentFrameHash
{
  uint64_t v2;
  uint64_t v3;
  VFXMTLRenderContext *currentUpdateRenderContext;
  uint64_t v5;
  double v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  currentUpdateRenderContext = self->_stack->_currentUpdateRenderContext;
  v5 = objc_msgSend_engineContext(currentUpdateRenderContext, a2, v2, v3);
  v6 = sub_1B1815800(v5);
  v10 = objc_msgSend_currentFrameIndex(currentUpdateRenderContext, v7, v8, v9);
  v11 = 0x9DDFEA08EB382D69
      * (v10 ^ ((0x9DDFEA08EB382D69 * (v10 ^ (unint64_t)currentUpdateRenderContext)) >> 47) ^ (0x9DDFEA08EB382D69 * (v10 ^ (unint64_t)currentUpdateRenderContext)));
  v12 = 0xC6A4A7935BD1E995
      * ((0xC6A4A7935BD1E995
        * ((0xC6A4A7935BD1E995 * *(_QWORD *)&v6) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)&v6) >> 47))) ^ 0x35253C9ADE8F4CA8 ^ (0x9DDFEA08EB382D69 * (v11 ^ (v11 >> 47))));
  return (0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) >> 47);
}

- (__n128)_currentTransforms
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_OWORD *)(v2 + 560);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(v2 + 544);
  *(_OWORD *)(a2 + 144) = v3;
  v4 = *(_OWORD *)(v2 + 592);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(v2 + 576);
  *(_OWORD *)(a2 + 176) = v4;
  v5 = *(_OWORD *)(v2 + 496);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(v2 + 480);
  *(_OWORD *)(a2 + 80) = v5;
  v6 = *(_OWORD *)(v2 + 528);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(v2 + 512);
  *(_OWORD *)(a2 + 112) = v6;
  v7 = *(_OWORD *)(v2 + 432);
  *(_OWORD *)a2 = *(_OWORD *)(v2 + 416);
  *(_OWORD *)(a2 + 16) = v7;
  result = *(__n128 *)(v2 + 448);
  v9 = *(_OWORD *)(v2 + 464);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v9;
  return result;
}

- (__n128)_currentFrustumInfo
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __n128 result;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_OWORD *)(v2 + 688);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(v2 + 672);
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(v2 + 704);
  v4 = *(_OWORD *)(v2 + 624);
  *(_OWORD *)a2 = *(_OWORD *)(v2 + 608);
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(v2 + 656);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v2 + 640);
  *(__n128 *)(a2 + 48) = result;
  return result;
}

- (id)_currentRenderContext
{
  return self->_stack->_currentUpdateRenderContext;
}

- (void)setStageInputOutputBuffersToComputeEncoder:(VFXMTLComputeCommandEncoder *)a3
{
  if (self->_stageInputOutputDescriptors.srcPositions.isActive)
    objc_msgSend_setBuffer_offset_atIndex_(a3->_encoder, a2, (uint64_t)self->_currentUpdateBuffers.srcPositions, 0, 10);
  if (self->_stageInputOutputDescriptors.dstPositions.isActive)
    objc_msgSend_setBuffer_offset_atIndex_(a3->_encoder, a2, (uint64_t)self->_currentUpdateBuffers.dstPositions, 0, 13);
  if (self->_stageInputOutputDescriptors.srcNormals.isActive)
    objc_msgSend_setBuffer_offset_atIndex_(a3->_encoder, a2, (uint64_t)self->_currentUpdateBuffers.srcNormals, 0, 11);
  if (self->_stageInputOutputDescriptors.dstNormals.isActive)
    objc_msgSend_setBuffer_offset_atIndex_(a3->_encoder, a2, (uint64_t)self->_currentUpdateBuffers.dstNormals, 0, 14);
  if (self->_stageInputOutputDescriptors.srcTangents.isActive)
    objc_msgSend_setBuffer_offset_atIndex_(a3->_encoder, a2, (uint64_t)self->_currentUpdateBuffers.srcTangents, 0, 12);
  if (self->_stageInputOutputDescriptors.dstTangents.isActive)
    objc_msgSend_setBuffer_offset_atIndex_(a3->_encoder, a2, (uint64_t)self->_currentUpdateBuffers.dstTangents, 0, 15);
}

- (id)_currentResourceManager
{
  return self->_stack->_resourceManager;
}

- (void)setStageInputOutputBuffersToCurrentComputeEncoder
{
  MTLComputeCommandEncoder *currentUpdateComputeEncoder;

  currentUpdateComputeEncoder = self->_currentUpdateComputeEncoder;
  if (!currentUpdateComputeEncoder)
  {
    currentUpdateComputeEncoder = (MTLComputeCommandEncoder *)(*((uint64_t (**)(void))self->_currentUpdateComputeEncoderProvider
                                                               + 2))();
    self->_currentUpdateComputeEncoder = currentUpdateComputeEncoder;
  }
  if (self->_stageInputOutputDescriptors.srcPositions.isActive)
    objc_msgSend_setBuffer_offset_atIndex_(currentUpdateComputeEncoder, a2, (uint64_t)self->_currentUpdateBuffers.srcPositions, 0, 10);
  if (self->_stageInputOutputDescriptors.dstPositions.isActive)
    objc_msgSend_setBuffer_offset_atIndex_(self->_currentUpdateComputeEncoder, a2, (uint64_t)self->_currentUpdateBuffers.dstPositions, 0, 13);
  if (self->_stageInputOutputDescriptors.srcNormals.isActive)
    objc_msgSend_setBuffer_offset_atIndex_(self->_currentUpdateComputeEncoder, a2, (uint64_t)self->_currentUpdateBuffers.srcNormals, 0, 11);
  if (self->_stageInputOutputDescriptors.dstNormals.isActive)
    objc_msgSend_setBuffer_offset_atIndex_(self->_currentUpdateComputeEncoder, a2, (uint64_t)self->_currentUpdateBuffers.dstNormals, 0, 14);
  if (self->_stageInputOutputDescriptors.srcTangents.isActive)
    objc_msgSend_setBuffer_offset_atIndex_(self->_currentUpdateComputeEncoder, a2, (uint64_t)self->_currentUpdateBuffers.srcTangents, 0, 12);
  if (self->_stageInputOutputDescriptors.dstTangents.isActive)
    objc_msgSend_setBuffer_offset_atIndex_(self->_currentUpdateComputeEncoder, a2, (uint64_t)self->_currentUpdateBuffers.dstTangents, 0, 15);
}

- (MTLComputeCommandEncoder)currentComputeEncoder
{
  MTLComputeCommandEncoder *result;

  result = self->_currentUpdateComputeEncoder;
  if (!result)
  {
    result = (MTLComputeCommandEncoder *)(*((uint64_t (**)(void))self->_currentUpdateComputeEncoderProvider + 2))();
    self->_currentUpdateComputeEncoder = result;
  }
  return result;
}

- (MTLBuffer)srcPositionBuffer
{
  return self->_currentUpdateBuffers.srcPositions;
}

- (MTLBuffer)dstPositionBuffer
{
  return self->_currentUpdateBuffers.dstPositions;
}

- (MTLBuffer)srcNormalBuffer
{
  return self->_currentUpdateBuffers.srcNormals;
}

- (MTLBuffer)dstNormalBuffer
{
  return self->_currentUpdateBuffers.dstNormals;
}

- (MTLBuffer)srcTangentBuffer
{
  return self->_currentUpdateBuffers.srcTangents;
}

- (MTLBuffer)dstTangentBuffer
{
  return self->_currentUpdateBuffers.dstTangents;
}

- (id)dependency0PositionBuffer
{
  return self->_currentUpdateBuffers.dependency0Positions;
}

- (id)dependency0NormalBuffer
{
  return self->_currentUpdateBuffers.dependency0Normals;
}

- (id)dependency0TangentBuffer
{
  return self->_currentUpdateBuffers.dependency0Tangents;
}

- (id)dependency1PositionBuffer
{
  return self->_currentUpdateBuffers.dependency1Positions;
}

- (id)dependency1NormalBuffer
{
  return self->_currentUpdateBuffers.dependency1Normals;
}

- (id)dependency1TangentBuffer
{
  return self->_currentUpdateBuffers.dependency1Tangents;
}

@end
