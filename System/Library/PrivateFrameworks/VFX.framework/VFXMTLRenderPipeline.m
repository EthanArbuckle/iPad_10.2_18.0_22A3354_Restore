@implementation VFXMTLRenderPipeline

- (VFXMTLRenderPipeline)init
{
  VFXMTLRenderPipeline *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMTLRenderPipeline;
  result = -[VFXMTLRenderPipeline init](&v3, sel_init);
  if (result)
    result->_worldBuffer = ($E8FEF9D34A3DFDCB69CDC2374B44012F)-1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMTLRenderPipeline;
  -[VFXMTLRenderPipeline dealloc](&v3, sel_dealloc);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  objc_class *v6;
  NSString *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSArray *frameBufferBindings;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  NSArray *nodeBufferBindings;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  NSArray *passBufferBindings;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  NSArray *shadableBufferBindings;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  NSArray *lightBufferBindings;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t n;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  objc_msgSend_appendFormat_(v5, v8, (uint64_t)CFSTR("<%@: %p>"), v9, v7, self);
  objc_msgSend_appendFormat_(v5, v10, (uint64_t)CFSTR("<state: %@>"), v11, self->_state);
  if (self->_frameBufferBindings)
  {
    objc_msgSend_appendString_(v5, v12, (uint64_t)CFSTR("\n\tFrameBuffer bindings:\n"), v13);
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    frameBufferBindings = self->_frameBufferBindings;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(frameBufferBindings, v15, (uint64_t)&v98, (uint64_t)v106, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v99;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v99 != v18)
            objc_enumerationMutation(frameBufferBindings);
          v20 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
          objc_msgSend_appendString_(v5, v12, (uint64_t)CFSTR("\t\t"), v13);
          v24 = objc_msgSend_name(v20, v21, v22, v23);
          objc_msgSend_appendString_(v5, v25, v24, v26);
        }
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(frameBufferBindings, v12, (uint64_t)&v98, (uint64_t)v106, 16);
      }
      while (v17);
    }
  }
  if (self->_nodeBufferBindings)
  {
    objc_msgSend_appendString_(v5, v12, (uint64_t)CFSTR("\n\tNode bindings:\n"), v13);
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    nodeBufferBindings = self->_nodeBufferBindings;
    v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(nodeBufferBindings, v28, (uint64_t)&v94, (uint64_t)v105, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v95;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v95 != v31)
            objc_enumerationMutation(nodeBufferBindings);
          v33 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
          objc_msgSend_appendString_(v5, v12, (uint64_t)CFSTR("\t\t"), v13);
          v37 = objc_msgSend_name(v33, v34, v35, v36);
          objc_msgSend_appendString_(v5, v38, v37, v39);
        }
        v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(nodeBufferBindings, v12, (uint64_t)&v94, (uint64_t)v105, 16);
      }
      while (v30);
    }
  }
  if (self->_passBufferBindings)
  {
    objc_msgSend_appendString_(v5, v12, (uint64_t)CFSTR("\n\tPass bindings:\n"), v13);
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    passBufferBindings = self->_passBufferBindings;
    v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(passBufferBindings, v41, (uint64_t)&v90, (uint64_t)v104, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v91;
      do
      {
        for (k = 0; k != v43; ++k)
        {
          if (*(_QWORD *)v91 != v44)
            objc_enumerationMutation(passBufferBindings);
          v46 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * k);
          objc_msgSend_appendString_(v5, v12, (uint64_t)CFSTR("\t\t"), v13);
          v50 = objc_msgSend_name(v46, v47, v48, v49);
          objc_msgSend_appendString_(v5, v51, v50, v52);
        }
        v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(passBufferBindings, v12, (uint64_t)&v90, (uint64_t)v104, 16);
      }
      while (v43);
    }
  }
  if (self->_shadableBufferBindings)
  {
    objc_msgSend_appendString_(v5, v12, (uint64_t)CFSTR("\n\tShadable bindings:\n"), v13);
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    shadableBufferBindings = self->_shadableBufferBindings;
    v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(shadableBufferBindings, v54, (uint64_t)&v86, (uint64_t)v103, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v87;
      do
      {
        for (m = 0; m != v56; ++m)
        {
          if (*(_QWORD *)v87 != v57)
            objc_enumerationMutation(shadableBufferBindings);
          v59 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * m);
          objc_msgSend_appendString_(v5, v12, (uint64_t)CFSTR("\t\t"), v13);
          v63 = objc_msgSend_name(v59, v60, v61, v62);
          objc_msgSend_appendString_(v5, v64, v63, v65);
        }
        v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(shadableBufferBindings, v12, (uint64_t)&v86, (uint64_t)v103, 16);
      }
      while (v56);
    }
  }
  if (self->_lightBufferBindings)
  {
    objc_msgSend_appendString_(v5, v12, (uint64_t)CFSTR("\n\tLight bindings:\n"), v13);
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    lightBufferBindings = self->_lightBufferBindings;
    v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(lightBufferBindings, v67, (uint64_t)&v82, (uint64_t)v102, 16);
    if (v68)
    {
      v71 = v68;
      v72 = *(_QWORD *)v83;
      do
      {
        for (n = 0; n != v71; ++n)
        {
          if (*(_QWORD *)v83 != v72)
            objc_enumerationMutation(lightBufferBindings);
          v74 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * n);
          objc_msgSend_appendString_(v5, v69, (uint64_t)CFSTR("\t\t"), v70);
          v78 = objc_msgSend_name(v74, v75, v76, v77);
          objc_msgSend_appendString_(v5, v79, v78, v80);
        }
        v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(lightBufferBindings, v69, (uint64_t)&v82, (uint64_t)v102, 16);
      }
      while (v71);
    }
  }
  return v5;
}

- (BOOL)matchesRenderPassDescriptor:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  $E5576432F07829E5C0D2DE91F4559C6D *p_renderPassDesc;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t sampleCount;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t depthFormat;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  unint64_t stencilFormat;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v6 = 0;
  p_renderPassDesc = &self->_renderPassDesc;
  while (1)
  {
    v8 = (void *)objc_msgSend_colorAttachments(a3, a2, (uint64_t)a3, v3);
    v11 = (void *)objc_msgSend_objectAtIndexedSubscript_(v8, v9, v6, v10);
    v15 = (void *)objc_msgSend_texture(v11, v12, v13, v14);
    v16 = p_renderPassDesc->colorFormat[v6];
    if (v16 != objc_msgSend_pixelFormat(v15, v17, v18, v19))
      break;
    if (v15)
    {
      sampleCount = self->_renderPassDesc.sampleCount;
      if (objc_msgSend_sampleCount(v15, a2, (uint64_t)a3, v3) != sampleCount)
        break;
    }
    if (++v6 == 8)
    {
      v21 = (void *)objc_msgSend_depthAttachment(a3, a2, (uint64_t)a3, v3);
      v25 = (void *)objc_msgSend_texture(v21, v22, v23, v24);
      depthFormat = self->_renderPassDesc.depthFormat;
      if (depthFormat == objc_msgSend_pixelFormat(v25, v27, v28, v29))
      {
        if (!v25 || (v33 = self->_renderPassDesc.sampleCount, objc_msgSend_sampleCount(v25, v30, v31, v32) == v33))
        {
          v34 = (void *)objc_msgSend_stencilAttachment(a3, v30, v31, v32);
          v38 = (void *)objc_msgSend_texture(v34, v35, v36, v37);
          stencilFormat = self->_renderPassDesc.stencilFormat;
          if (stencilFormat == objc_msgSend_pixelFormat(v38, v40, v41, v42))
          {
            if (!v38)
              return 1;
            v46 = self->_renderPassDesc.sampleCount;
            if (objc_msgSend_sampleCount(v38, v43, v44, v45) == v46)
              return 1;
          }
        }
      }
      return 0;
    }
  }
  return 0;
}

- (void)_computeUsageForBindings:(id)a3 function:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unsigned int *buffersUsageMask;
  unsigned int *texturesUsageMask;
  unsigned int *samplersUsageMask;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend_functionType(a4, a2, (uint64_t)a3, (uint64_t)a4);
  v21 = sub_1B189DABC(v6, v7, v8, v9, v10, v11, v12, v13);
  if (v21 >= 2)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Bad stage"), v15, v16, v17, v18, v19, v20, (uint64_t)"stage < kCFXFXProgramStageCount");
  buffersUsageMask = self->_buffersUsageMask;
  self->_buffersUsageMask[v21] = 0;
  texturesUsageMask = self->_texturesUsageMask;
  self->_texturesUsageMask[v21] = 0;
  samplersUsageMask = self->_samplersUsageMask;
  self->_samplersUsageMask[v21] = 0;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v14, (uint64_t)&v40, (uint64_t)v44, 16);
  if (v25)
  {
    v29 = v25;
    v30 = v21;
    v31 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v41 != v31)
          objc_enumerationMutation(a3);
        v33 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v34 = objc_msgSend_type(v33, v26, v27, v28);
        switch(v34)
        {
          case 0:
            buffersUsageMask[v30] |= 1 << objc_msgSend_index(v33, v26, v27, v28);
            break;
          case 1:
            continue;
          case 2:
            texturesUsageMask[v30] |= 1 << objc_msgSend_index(v33, v26, v27, v28);
            break;
          case 3:
            samplersUsageMask[v30] |= 1 << objc_msgSend_index(v33, v26, v27, v28);
            break;
          default:
            if ((unint64_t)(v34 - 16) >= 2)
              sub_1B17C4408(16, (uint64_t)CFSTR("Error: arg type not supported"), v27, v28, v35, v36, v37, v38, v39);
            break;
        }
      }
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v26, (uint64_t)&v40, (uint64_t)v44, 16);
    }
    while (v29);
  }
}

- (unsigned)vertexBuffersUsageMask
{
  return self->_buffersUsageMask[0];
}

- (MTLRenderPipelineState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (MTLVertexDescriptor)vertexDescriptor
{
  return self->_vertexDescriptor;
}

- (void)setVertexDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (MTLFunction)vertexFunction
{
  return self->_vertexFunction;
}

- (void)setVertexFunction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (MTLFunction)fragmentFunction
{
  return self->_fragmentFunction;
}

- (void)setFragmentFunction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSArray)frameBufferBindings
{
  return self->_frameBufferBindings;
}

- (void)setFrameBufferBindings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSArray)nodeBufferBindings
{
  return self->_nodeBufferBindings;
}

- (void)setNodeBufferBindings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSArray)lightBufferBindings
{
  return self->_lightBufferBindings;
}

- (void)setLightBufferBindings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSArray)passBufferBindings
{
  return self->_passBufferBindings;
}

- (void)setPassBufferBindings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSArray)shadableBufferBindings
{
  return self->_shadableBufferBindings;
}

- (void)setShadableBufferBindings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

@end
