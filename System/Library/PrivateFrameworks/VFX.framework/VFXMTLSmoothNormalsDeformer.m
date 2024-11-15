@implementation VFXMTLSmoothNormalsDeformer

+ (unint64_t)requiredInputs
{
  return 1;
}

+ (unint64_t)supportedOutputs
{
  return 3;
}

+ (unint64_t)requiredOutputs
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMTLSmoothNormalsDeformer;
  -[VFXMTLSmoothNormalsDeformer dealloc](&v3, sel_dealloc);
}

- (unint64_t)updateWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5 tangents:(id)a6
{
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void **v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;

  v10 = objc_msgSend_currentFrameHash(a3, a2, (uint64_t)a3, (uint64_t)a4, a5, a6);
  if (self->_currentFrameHash == v10)
    return 0;
  self->_currentFrameHash = v10;
  v15 = (void **)objc_msgSend_currentComputeEncoder(a3, v11, v12, v13);
  objc_msgSend_resetCache(*v15, v16, v17, v18);
  objc_msgSend_setBuffer_offset_atIndex_(*v15, v19, (uint64_t)a4, 0, 0);
  v14 = 1;
  objc_msgSend_setBuffer_offset_atIndex_(*v15, v20, (uint64_t)a5, 0, 1);
  objc_msgSend_setBuffer_offset_atIndex_(*v15, v21, (uint64_t)self->_perVertexTrianglesOffsets, 0, 2);
  objc_msgSend_setBuffer_offset_atIndex_(*v15, v22, (uint64_t)self->_perVertexTrianglesIndices, 0, 3);
  objc_msgSend_setBytes_length_atIndex_(*v15, v23, (uint64_t)&self->_baseVertexCount, 4, 4);
  v24 = sub_1B18FD774((uint64_t)self->_smoothNormalsPipeline);
  objc_msgSend_dispatchOnVertices_vertexCount_(*v15, v25, v24, self->_baseVertexCount);
  return v14;
}

@end
