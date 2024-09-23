@implementation VFXMTLMeshElement

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;

  v4 = (char *)objc_alloc_init((Class)objc_opt_class());
  *(_OWORD *)(v4 + 8) = *(_OWORD *)&self->_primitiveType;
  *((_QWORD *)v4 + 3) = self->_instanceCount;
  *((_QWORD *)v4 + 4) = self->_sharedIndexBufferOffset;
  *((_QWORD *)v4 + 5) = self->_indexBuffer;
  *((_QWORD *)v4 + 6) = self->_drawIndexedPrimitivesIndirectBuffer;
  *(_OWORD *)(v4 + 56) = *(_OWORD *)&self->_indexType;
  *((_QWORD *)v4 + 9) = self->_effectiveIndexCount;
  return v4;
}

- (void)dealloc
{
  SEL v3;
  objc_super v4;

  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 40);
    objc_setProperty_nonatomic(self, v3, 0, 48);
  }
  v4.receiver = self;
  v4.super_class = (Class)VFXMTLMeshElement;
  -[VFXMTLMeshElement dealloc](&v4, sel_dealloc);
}

- (id)description
{
  uint64_t v2;
  uint64_t primitiveType_low;
  VFXMTLBuffer *indexBuffer;
  MTLBuffer *drawIndexedPrimitivesIndirectBuffer;
  uint64_t indexCount_low;
  uint64_t effectiveIndexOffset_low;

  primitiveType_low = LODWORD(self->_primitiveType);
  indexBuffer = self->_indexBuffer;
  drawIndexedPrimitivesIndirectBuffer = self->_drawIndexedPrimitivesIndirectBuffer;
  indexCount_low = LODWORD(self->_indexCount);
  effectiveIndexOffset_low = LODWORD(self->_effectiveIndexOffset);
  if (drawIndexedPrimitivesIndirectBuffer)
    return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<VFXMTLMeshElement: %p | type: %d, index buffer: %@ (%d indices), indirect buffer: %@, effective count: %d, offset: %d>"), v2, self, primitiveType_low, indexBuffer, indexCount_low, drawIndexedPrimitivesIndirectBuffer, LODWORD(self->_effectiveIndexCount), effectiveIndexOffset_low);
  else
    return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<VFXMTLMeshElement: %p | type: %d, index buffer: %@ (%d indices), effective count: %d, offset: %d>"), v2, self, primitiveType_low, indexBuffer, indexCount_low, LODWORD(self->_effectiveIndexCount), effectiveIndexOffset_low);
}

@end
