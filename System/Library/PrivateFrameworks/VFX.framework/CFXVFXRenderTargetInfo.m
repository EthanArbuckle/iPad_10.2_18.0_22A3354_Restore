@implementation CFXVFXRenderTargetInfo

- (CFXVFXRenderTargetInfo)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXVFXRenderTargetInfo;
  return -[CFXVFXRenderTargetInfo init](&v3, sel_init);
}

- (BOOL)vrrEnabled
{
  return 0;
}

- (int64_t)sampleCount
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;

  v5 = (void *)objc_msgSend_descriptor(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_colorAttachments(v5, v6, v7, v8);
  v12 = (void *)objc_msgSend_objectAtIndexedSubscript_(v9, v10, 0, v11);
  v16 = objc_msgSend_texture(v12, v13, v14, v15);
  v20 = (void *)objc_msgSend_descriptor(self, v17, v18, v19);
  if (v16)
  {
    v24 = (void *)objc_msgSend_colorAttachments(v20, v21, v22, v23);
    v27 = (void *)objc_msgSend_objectAtIndexedSubscript_(v24, v25, 0, v26);
  }
  else
  {
    v27 = (void *)objc_msgSend_depthAttachment(v20, v21, v22, v23);
  }
  v31 = (void *)objc_msgSend_texture(v27, v28, v29, v30);
  return objc_msgSend_sampleCount(v31, v32, v33, v34);
}

- (unint64_t)depthStencilPixelFormat
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = (void *)objc_msgSend_descriptor(self, a2, v2, v3);
  v8 = (void *)objc_msgSend_depthAttachment(v4, v5, v6, v7);
  v12 = (void *)objc_msgSend_texture(v8, v9, v10, v11);
  return objc_msgSend_pixelFormat(v12, v13, v14, v15);
}

- (unint64_t)colorPixelFormatAtIndex:(int64_t)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = (void *)objc_msgSend_descriptor(self, a2, a3, v3);
  v9 = (void *)objc_msgSend_colorAttachments(v5, v6, v7, v8);
  v12 = (void *)objc_msgSend_objectAtIndexedSubscript_(v9, v10, a3, v11);
  v16 = (void *)objc_msgSend_texture(v12, v13, v14, v15);
  return objc_msgSend_pixelFormat(v16, v17, v18, v19);
}

- (uint64_t)renderTargetSize
{
  return MEMORY[0x1E0DE7D20](a1, sel__renderTargetSize, a3, a4);
}

- (MTLRenderPassDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  self->_descriptor = (MTLRenderPassDescriptor *)a3;
}

- (__n128)_renderTargetSize
{
  return a1[1];
}

- (void)set_renderTargetSize:(CFXVFXRenderTargetInfo *)self
{
  __int128 v2;

  *(_OWORD *)self->__renderTargetSize = v2;
}

@end
