@implementation VFXTextureSource

- (void)setSize:(VFXTextureSource *)self
{
  uint64_t v2;

  *(_QWORD *)self->_size = v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXTextureSource;
  -[VFXTextureSource dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldFlip
{
  return 1;
}

- (BOOL)supportsMetal
{
  return 1;
}

- (double)textureSize
{
  NSString *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double result;

  v2 = NSStringFromSelector(aSelector);
  sub_1B17C4408(16, (uint64_t)CFSTR("Error: VFXTextureSource abstract method invoked %@"), v3, v4, v5, v6, v7, v8, (uint64_t)v2);
  __asm { FMOV            V0.2S, #1.0 }
  return result;
}

- (id)metalTextureWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  float v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;

  if (!sub_1B1813BC4((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v11, v12, v13, v14, v15, v16, (uint64_t)"CFXEngineContextGetRenderContext(engineContext)");
  if ((objc_msgSend_supportsMetal(self, v10, v11, v12) & 1) != 0)
  {
    result = (id)objc_msgSend_MTLTextureCache(self, v17, v18, v19);
    if (!result)
    {
      v32 = (void *)sub_1B1813BC4((uint64_t)a3, v25, v26, v27, v28, v29, v30, v31);
      v36 = (void *)objc_msgSend_device(v32, v33, v34, v35);
      objc_msgSend_textureSize(self, v37, v38, v39);
      v43 = (void *)objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E0CC6BB0], v42, 71, (unint64_t)v40, (unint64_t)v41, 0);
      objc_msgSend_setStorageMode_(v43, v44, 2, v45);
      objc_msgSend_setUsage_(v43, v46, 1, v47);
      v49 = (void *)objc_msgSend_newTextureWithDescriptor_iosurface_plane_(v36, v48, (uint64_t)v43, 0, 0);
      objc_msgSend_setMTLTextureCache_(self, v50, (uint64_t)v49, v51);
      return v49;
    }
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Texture source does not support Metal"), v18, v19, v20, v21, v22, v23, v52);
    return 0;
  }
  return result;
}

- (void)renderWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5
{
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = NSStringFromSelector(a2);
  sub_1B17C4408(16, (uint64_t)CFSTR("Error: VFXTextureSource abstract method invoked %@"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);
}

- (double)nextFrameTime
{
  return INFINITY;
}

- (id)MTLTextureCache
{
  return self->_mtlTextureCache;
}

- (void)setMTLTextureCache:(id)a3
{
  id mtlTextureCache;

  mtlTextureCache = self->_mtlTextureCache;
  if (mtlTextureCache != a3)
  {

    self->_mtlTextureCache = a3;
  }
}

@end
