@implementation HistogramMetal

- (HistogramMetal)init
{
  HistogramMetal *v2;
  HistogramMetal *v3;
  HistogramMetal *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HistogramMetal;
  v2 = -[HistogramMetal init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HistogramMetal initWithDevice:](v2, "initWithDevice:", 0);
    v4 = v3;
  }

  return v3;
}

- (HistogramMetal)initWithDevice:(__CVBuffer *)a3
{
  uint64_t RegistryID;
  MTLDevice *device;
  MTLDevice **p_device;
  MTLDevice *v7;
  MPSImageHistogram *histogramKernel;
  MTLDevice *v10;
  MTLDevice *v11;
  MTLDevice *v12;
  MTLCommandQueue *v13;
  MTLCommandQueue *commandQueue;
  NSDictionary *v15;
  NSDictionary *readAttributes;
  __CVMetalTextureCache *v17;
  CF<__CVMetalTextureCache *> *p_textureCacheRGBALuma;
  __CVMetalTextureCache *value;
  __CVMetalTextureCache *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    CVPixelBufferGetIOSurface(a3);
    RegistryID = IOSurfaceGetRegistryID();
    p_device = &self->_device;
    device = self->_device;
    if (device)
    {
      if (RegistryID && -[MTLDevice registryID](device, "registryID") != RegistryID)
      {
        v7 = *p_device;
        goto LABEL_9;
      }
      return 0;
    }
    v7 = 0;
  }
  else
  {
    p_device = &self->_device;
    v7 = self->_device;
    if (v7)
      return 0;
  }
LABEL_9:
  self->_device = 0;

  histogramKernel = self->_histogramKernel;
  self->_histogramKernel = 0;

  v10 = self->_device;
  if (!v10)
  {
    v11 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    v12 = *p_device;
    *p_device = v11;

    v10 = *p_device;
    if (!*p_device)
      return (HistogramMetal *)4294954385;
  }
  v13 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](v10, "newCommandQueue");
  commandQueue = self->_commandQueue;
  self->_commandQueue = v13;

  if (!self->_commandQueue)
    return (HistogramMetal *)4294954385;
  sub_1B6781368((uint64_t)&self->_histogramBufferPool, self->_device);
  if (!self->_readAttributes)
  {
    v21 = *MEMORY[0x1E0CA8F58];
    v22[0] = &unk_1E6A1D3A0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    readAttributes = self->_readAttributes;
    self->_readAttributes = v15;

  }
  value = self->_textureCacheRGBALuma.value_;
  p_textureCacheRGBALuma = &self->_textureCacheRGBALuma;
  v17 = value;
  v20 = p_textureCacheRGBALuma[-7].value_;
  if (value)
  {
    CFRelease(v17);
    p_textureCacheRGBALuma->value_ = 0;
  }
  return (HistogramMetal *)CVMetalTextureCacheCreate(0, 0, v20, 0, &p_textureCacheRGBALuma->value_);
}

- (id)loadTextureRGBAUnorm:(__CVBuffer *)a3 forPlane:(int)a4 withAttributes:(id)a5
{
  const __CFDictionary *v8;
  OSType PixelFormatType;
  MTLPixelFormat v10;
  __CVMetalTextureCache *value;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  void *v14;
  CFTypeRef cf;

  v8 = (const __CFDictionary *)a5;
  cf = 0;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (sub_1B67C37F4(PixelFormatType) == 10)
    v10 = MTLPixelFormatRGBA16Unorm;
  else
    v10 = MTLPixelFormatRGBA8Unorm;
  value = self->_textureCacheRGBALuma.value_;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a4);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a4);
  if (CVMetalTextureCacheCreateTextureFromImage(0, value, a3, v8, v10, WidthOfPlane >> 2, HeightOfPlane, a4, (CVMetalTextureRef *)&cf))
  {
    v14 = 0;
  }
  else
  {
    CVMetalTextureGetTexture((CVMetalTextureRef)cf);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  sub_1B6773B7C(&cf);

  return v14;
}

- (future<CF<const)generateHistogramMetal:(__CVBuffer *)a3 forRegion:(id *)a4
{
  uint64_t *v4;
  uint64_t *v8;
  OSType PixelFormatType;
  char v10;
  uint64_t v11;
  MPSImageHistogram *v17;
  MPSImageHistogram *histogramKernel;
  void *v19;
  MetalBufferPool *p_histogramBufferPool;
  NSMutableArray *pool;
  void *v22;
  void *v23;
  __int128 v24;
  id v25;
  id v26;
  CFTypeRef v27;
  uint64_t v28;
  unint64_t *v29;
  __int128 v30;
  unint64_t v31;
  future<CF<const __CFData *>> v32;
  const void *v33;
  _OWORD v34[3];
  CFTypeRef cf;
  __int128 v36;
  uint64_t v37;
  const void *v38;
  __int128 v39;
  id v40;
  id v41;
  int v42;
  const void *v43;

  v8 = v4;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v10 = sub_1B67C37F4(PixelFormatType);
  v11 = (1 << v10);
  if (!self->_histogramKernel)
  {
    *(_QWORD *)&v36 = (1 << v10);
    BYTE8(v36) = 1;
    v37 = 0;
    v38 = 0;
    __asm { FMOV            V0.4S, #1.0 }
    v39 = _Q0;
    v17 = (MPSImageHistogram *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E68]), "initWithDevice:histogramInfo:", self->_device, &v36);
    histogramKernel = self->_histogramKernel;
    self->_histogramKernel = v17;

  }
  -[HistogramMetal loadTextureRGBAUnorm:forPlane:withAttributes:](self, "loadTextureRGBAUnorm:forPlane:withAttributes:", a3, 0, self->_readAttributes);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  p_histogramBufferPool = &self->_histogramBufferPool;
  if (self->_histogramBufferPool.allocSize_ != 16 * v11)
  {
    pool = p_histogramBufferPool->pool_;
    p_histogramBufferPool->pool_ = 0;

  }
  self->_histogramBufferPool.allocSize_ = 16 * v11;
  cf = 0;
  sub_1B67802CC((uint64_t)&self->_histogramBufferPool, &cf);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLabel:", CFSTR("histogram"));
  v24 = *(_OWORD *)&a4->var0.var2;
  v34[0] = *(_OWORD *)&a4->var0.var0;
  v34[1] = v24;
  v34[2] = *(_OWORD *)&a4->var1.var1;
  -[MPSImageHistogram setClipRectSource:](self->_histogramKernel, "setClipRectSource:", v34);
  -[MPSImageHistogram encodeToCommandBuffer:sourceTexture:histogram:histogramOffset:](self->_histogramKernel, "encodeToCommandBuffer:sourceTexture:histogram:histogramOffset:", v23, v19, v22, 0);
  objc_msgSend(v23, "commit");
  v25 = v23;
  v26 = v22;
  v27 = cf;
  if (cf)
    CFRetain(cf);
  v42 = v11;
  v33 = 0;
  v40 = 0;
  v41 = 0;
  *(_QWORD *)&v36 = v25;
  *((_QWORD *)&v36 + 1) = v26;
  LODWORD(v37) = v11;
  v38 = v27;
  v43 = 0;
  v28 = operator new();
  *(_QWORD *)(v28 + 8) = 0;
  v29 = (unint64_t *)(v28 + 8);
  *(_QWORD *)(v28 + 16) = 0;
  *(_QWORD *)(v28 + 24) = 850045863;
  *(_OWORD *)(v28 + 32) = 0u;
  *(_OWORD *)(v28 + 48) = 0u;
  *(_OWORD *)(v28 + 64) = 0u;
  *(_QWORD *)(v28 + 80) = 0;
  *(_QWORD *)(v28 + 88) = 1018212795;
  *(_OWORD *)(v28 + 96) = 0u;
  *(_OWORD *)(v28 + 112) = 0u;
  *(_QWORD *)(v28 + 128) = 0;
  *(_QWORD *)v28 = &off_1E6A146D0;
  v30 = v36;
  v36 = 0uLL;
  *(_OWORD *)(v28 + 152) = v30;
  *(_DWORD *)(v28 + 168) = v37;
  *(_QWORD *)(v28 + 176) = v38;
  v38 = 0;
  *(_DWORD *)(v28 + 136) = 8;
  *v8 = v28;
  sub_1B67804AC(v28);
  do
    v31 = __ldaxr(v29);
  while (__stlxr(v31 - 1, v29));
  if (!v31)
    (*(void (**)(uint64_t))(*(_QWORD *)v28 + 16))(v28);
  sub_1B67704D8(&v38);

  sub_1B67704D8(&v43);
  sub_1B67704D8(&v33);

  sub_1B67704D8(&cf);
  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readAttributes, 0);
  sub_1B677747C((const void **)&self->_textureCacheRGBALuma.value_);

  objc_storeStrong((id *)&self->_histogramKernel, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  return self;
}

@end
