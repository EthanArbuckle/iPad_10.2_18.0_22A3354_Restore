@implementation VFXMTLMesh

- (void)buildTessellationVertexDescriptorIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLVertexDescriptor *vertexDescriptor;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;

  if (!self->_tessellationVertexDescriptor)
  {
    vertexDescriptor = self->_vertexDescriptor;
    if (!vertexDescriptor)
    {
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v2, v3, v4, v5, v6, v7, (uint64_t)"_vertexDescriptor");
      vertexDescriptor = self->_vertexDescriptor;
    }
    v10 = 0;
    self->_tessellationVertexDescriptor = (MTLVertexDescriptor *)objc_msgSend_copy(vertexDescriptor, a2, v2, v3);
    do
    {
      v14 = (void *)objc_msgSend_layouts(self->_tessellationVertexDescriptor, v11, v12, v13);
      v17 = (void *)objc_msgSend_objectAtIndexedSubscript_(v14, v15, v10, v16);
      objc_msgSend_setStepFunction_(v17, v18, 4, v19);
      ++v10;
    }
    while (v10 != 31);
    self->_tessellationVertexDescriptorHash = objc_msgSend_hash(self->_tessellationVertexDescriptor, v11, v12, v13);
  }
}

- (id)description
{
  uint64_t v2;
  void *v4;
  NSArray *buffers;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSArray *elements;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB37A0], a2, (uint64_t)CFSTR("<VFXMTLMesh: %p\n"), v2, self);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  buffers = self->_buffers;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(buffers, v6, (uint64_t)&v27, (uint64_t)v32, 16);
  if (v7)
  {
    v10 = v7;
    v11 = 0;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(buffers);
        objc_msgSend_appendFormat_(v4, v8, (uint64_t)CFSTR("\tbuffer[%d] : %@\n"), v9, v11 + i, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(buffers, v8, (uint64_t)&v27, (uint64_t)v32, 16);
      v11 = (v11 + i);
    }
    while (v10);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  elements = self->_elements;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(elements, v8, (uint64_t)&v23, (uint64_t)v31, 16);
  if (v15)
  {
    v18 = v15;
    v19 = 0;
    v20 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(elements);
        objc_msgSend_appendFormat_(v4, v16, (uint64_t)CFSTR("\telement[%d] : %@\n"), v17, v19 + j, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(elements, v16, (uint64_t)&v23, (uint64_t)v31, 16);
      v19 = (v19 + j);
    }
    while (v18);
  }
  objc_msgSend_appendString_(v4, v16, (uint64_t)CFSTR(">"), v17);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMTLMesh;
  -[VFXMTLMesh dealloc](&v3, sel_dealloc);
}

@end
