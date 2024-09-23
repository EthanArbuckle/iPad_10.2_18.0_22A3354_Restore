@implementation PTRenderPipelineDescriptor

- (id)copy
{
  PTRenderPipelineDescriptor *v3;
  __int128 v4;
  void *v5;
  _OWORD v7[3];

  v3 = -[PTRenderPipelineDescriptor initWithDevice:version:colorInputSize:colorOutputSize:disparitySize:]([PTRenderPipelineDescriptor alloc], "initWithDevice:version:colorInputSize:colorOutputSize:disparitySize:", self->_device, self->_version, self->_colorInputSize.width, self->_colorInputSize.height, self->_colorOutputSize.width, self->_colorOutputSize.height, self->_disparitySize.width, self->_disparitySize.height);
  -[PTRenderPipelineDescriptor setDebugRendering:](v3, "setDebugRendering:", self->_debugRendering);
  -[PTRenderPipelineDescriptor setVerbose:](v3, "setVerbose:", self->_verbose);
  -[PTRenderPipelineDescriptor setUseRGBA:](v3, "setUseRGBA:", self->_useRGBA);
  v4 = *(_OWORD *)&self->_preferredTransform.c;
  v7[0] = *(_OWORD *)&self->_preferredTransform.a;
  v7[1] = v4;
  v7[2] = *(_OWORD *)&self->_preferredTransform.tx;
  -[PTRenderPipelineDescriptor setPreferredTransform:](v3, "setPreferredTransform:", v7);
  v5 = (void *)-[NSDictionary copy](self->_options, "copy");
  -[PTRenderPipelineDescriptor setOptions:](v3, "setOptions:", v5);

  return v3;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (void)setUseRGBA:(BOOL)a3
{
  self->_useRGBA = a3;
}

- (void)setPreferredTransform:(CGAffineTransform *)a3
{
  objc_copyStruct(&self->_preferredTransform, a3, 48, 1, 0);
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void)setDebugRendering:(int64_t)a3
{
  self->_debugRendering = a3;
}

- (PTRenderPipelineDescriptor)initWithDevice:(id)a3 version:(unint64_t)a4 colorInputSize:(CGSize)a5 colorOutputSize:(CGSize)a6 disparitySize:(CGSize)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  id v16;
  PTRenderPipelineDescriptor *v17;
  PTRenderPipelineDescriptor *v18;
  uint64_t v19;
  __int128 v20;
  PTRenderPipelineDescriptor *v21;
  objc_super v23;

  height = a7.height;
  width = a7.width;
  v9 = a6.height;
  v10 = a6.width;
  v11 = a5.height;
  v12 = a5.width;
  v16 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PTRenderPipelineDescriptor;
  v17 = -[PTRenderPipelineDescriptor init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_device, a3);
    v18->_colorInputSize.width = v12;
    v18->_colorInputSize.height = v11;
    v18->_colorOutputSize.width = v10;
    v18->_colorOutputSize.height = v9;
    v18->_disparitySize.width = width;
    v18->_disparitySize.height = height;
    v18->_version = a4;
    v18->_debugRendering = 0;
    *(_WORD *)&v18->_verbose = 0;
    v18->_useRGBA = 0;
    v19 = MEMORY[0x1E0C9BAA8];
    v20 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v18->_preferredTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v18->_preferredTransform.c = v20;
    *(_OWORD *)&v18->_preferredTransform.tx = *(_OWORD *)(v19 + 32);
    v21 = v18;
  }

  return v18;
}

- (CGSize)disparitySize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_disparitySize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)colorOutputSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_colorOutputSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)colorInputSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_colorInputSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (CGAffineTransform)preferredTransform
{
  CGAffineTransform *result;

  objc_copyStruct(retstr, &self->_preferredTransform, 48, 1, 0);
  return result;
}

- (NSDictionary)options
{
  return self->_options;
}

- (PTRenderPipelineDescriptor)initWithDevice:(id)a3 version:(unint64_t)a4 colorSize:(CGSize)a5 disparitySize:(CGSize)a6
{
  return -[PTRenderPipelineDescriptor initWithDevice:version:colorInputSize:colorOutputSize:disparitySize:](self, "initWithDevice:version:colorInputSize:colorOutputSize:disparitySize:", a3, a4, a5.width, a5.height, a5.width, a5.height, a6.width, a6.height);
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)debugRendering
{
  return self->_debugRendering;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (BOOL)gpuProfiling
{
  return self->_gpuProfiling;
}

- (void)setGpuProfiling:(BOOL)a3
{
  self->_gpuProfiling = a3;
}

- (BOOL)useRGBA
{
  return self->_useRGBA;
}

@end
