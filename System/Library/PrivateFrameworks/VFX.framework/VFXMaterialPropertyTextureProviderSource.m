@implementation VFXMaterialPropertyTextureProviderSource

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMaterialPropertyTextureProviderSource;
  -[VFXTextureSource dealloc](&v3, sel_dealloc);
}

- (void)setTextureProvider:(id)a3
{
  if (self->_textureProvider != a3)
  {

    self->_texture = 0;
    self->_textureProvider = (VFXMaterialPropertyTextureProvider *)a3;
  }
}

- (VFXMaterialPropertyTextureProvider)textureProvider
{
  return self->_textureProvider;
}

- (void)connectToProxy:(__CFXImageProxy *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v15[2];

  sub_1B181F31C((uint64_t)a3, self, 0, v3, v4, v5, v6, v7);
  v15[0] = xmmword_1E63DAD38;
  v15[1] = *(_OWORD *)&off_1E63DAD48;
  sub_1B181F3A4((uint64_t)a3, (uint64_t)v15, v9, v10, v11, v12, v13, v14);
}

- (id)metalTextureWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  uint64_t v6;
  uint64_t v7;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  VFXMaterialPropertyTextureProvider *textureProvider;
  uint64_t v17;
  const char *v18;
  uint64_t v19;

  self->_engineContext = a3;
  v10 = (void *)sub_1B1813BC4((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7);
  v14 = (uint64_t)v10;
  if (self->_texture)
  {
    v15 = 0;
  }
  else
  {
    textureProvider = self->_textureProvider;
    v17 = objc_msgSend_device(v10, v11, v12, v13);
    self->_texture = (MTLTexture *)objc_msgSend_newTextureForDevice_(textureProvider, v18, v17, v19);
    v15 = 1;
  }
  a6->var0 = v15;
  a6->var1 = 1;
  sub_1B19D75D0(self->_textureProvider, (const char *)self->_texture, (uint64_t)self, v14);
  return self->_texture;
}

- (void)renderWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  self->_engineContext = a3;
  v9 = sub_1B1813BC4((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6, v7);
  sub_1B19D75D0(self->_textureProvider, (const char *)self->_texture, (uint64_t)self, v9);
}

- (id)cachedTextureWithURL:(id)a3 token:(id *)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_cachedTextureWithURL_token_didFallbackToDefaultTexture_, a3, a4);
}

- (id)cachedTextureWithURL:(id)a3 token:(id *)a4 didFallbackToDefaultTexture:(BOOL *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void *v12;
  const void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  BOOL v46;

  v12 = sub_1B180B630(a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6, v7);
  if (v12)
  {
    v13 = v12;
    if (a4)
    {
      v14 = 0;
LABEL_5:
      *a4 = v14;
    }
  }
  else
  {
    v14 = (void *)sub_1B18092C8(a3);
    sub_1B180B67C(v14, a3, v15, v16, v17, v18, v19, v20);
    v13 = v14;
    if (a4)
      goto LABEL_5;
  }
  CFAutorelease(v13);
  v46 = 0;
  v28 = (void *)sub_1B1813BC4((uint64_t)self->_engineContext, v21, v22, v23, v24, v25, v26, v27);
  v32 = (void *)objc_msgSend_resourceManager(v28, v29, v30, v31);
  v33 = sub_1B180CF10();
  v38 = (void *)objc_msgSend_renderResourceForImage_sampler_options_engineContext_didFallbackToDefaultTexture_(v32, v34, (uint64_t)v13, v33, 0, self->_engineContext, &v46);
  if (v46)
  {
    v39 = objc_msgSend_resourceManagerMonitor(v28, v35, v36, v37);
    if (v39)
    {
      v42 = (void *)v39;
      v43 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v40, (uint64_t)CFSTR("VFXMaterialPropertyTextureProviderHelper could not find texture for %@"), v41, a3);
      objc_msgSend_renderContext_didFallbackToDefaultTextureForSource_message_(v42, v44, (uint64_t)v28, (uint64_t)a3, v43);
    }
  }
  if (a5)
    *a5 = v46;
  return v38;
}

@end
