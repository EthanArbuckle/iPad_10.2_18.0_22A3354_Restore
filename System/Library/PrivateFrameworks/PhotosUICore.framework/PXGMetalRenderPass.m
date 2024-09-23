@implementation PXGMetalRenderPass

- (PXGMetalCaptureSpriteTexture)captureSpriteTexture
{
  return self->_captureSpriteTexture;
}

- (void)setRenderPassDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_renderPassDescriptor, a3);
}

- (void)setDrawCalls:(int64_t)a3
{
  self->_drawCalls = a3;
}

- (MTLRenderPassDescriptor)renderPassDescriptor
{
  return self->_renderPassDescriptor;
}

- (PXGEffect)offscreenKernelEffect
{
  return self->_offscreenKernelEffect;
}

- (float)minZ
{
  return self->_minZ;
}

- (float)maxZ
{
  return self->_maxZ;
}

- (PXGMetalRenderPass)init
{
  PXGMetalRenderPass *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGMetalRenderPass;
  result = -[PXGMetalRenderPass init](&v3, sel_init);
  if (result)
  {
    result->_drawingScale = 1.0;
    *(int32x2_t *)&result->_minZ = vdup_n_s32(0x7FC00000u);
  }
  return result;
}

- (double)drawingScale
{
  return self->_drawingScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offscreenKernelEffect, 0);
  objc_storeStrong((id *)&self->_captureSpriteTexture, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGMetalRenderPass captureSpriteTexture](self, "captureSpriteTexture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGMetalRenderPass offscreenKernelEffect](self, "offscreenKernelEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p captureTexture:%@ effect:%@ drawingScale:%.2f sprites:(%.6f < z <= %.6f) drawCalls:%ld>"), v5, self, v6, v7, *(_QWORD *)&self->_drawingScale, self->_minZ, self->_maxZ, self->_drawCalls);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGRect)renderRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_renderRect.origin.x;
  y = self->_renderRect.origin.y;
  width = self->_renderRect.size.width;
  height = self->_renderRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRenderRect:(CGRect)a3
{
  self->_renderRect = a3;
}

- (void)setCaptureSpriteTexture:(id)a3
{
  objc_storeStrong((id *)&self->_captureSpriteTexture, a3);
}

- (float)captureSpriteZPosition
{
  return self->_captureSpriteZPosition;
}

- (void)setCaptureSpriteZPosition:(float)a3
{
  self->_captureSpriteZPosition = a3;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)renderSize
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = ($E8CF8C4D35898297CF58D66FCEA3D064)self[3];
  return self;
}

- (void)setRenderSize:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_renderSize.depth = a3->var2;
  *(_OWORD *)&self->_renderSize.width = v3;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)clearColor
{
  double red;
  double green;
  double blue;
  double alpha;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  red = self->_clearColor.red;
  green = self->_clearColor.green;
  blue = self->_clearColor.blue;
  alpha = self->_clearColor.alpha;
  result.var3 = alpha;
  result.var2 = blue;
  result.var1 = green;
  result.var0 = red;
  return result;
}

- (void)setClearColor:(id)a3
{
  self->_clearColor = ($3ED934EFF50B3E737D3D4A62C605F33B)a3;
}

- (void)setOffscreenKernelEffect:(id)a3
{
  objc_storeStrong((id *)&self->_offscreenKernelEffect, a3);
}

- (void)setDrawingScale:(double)a3
{
  self->_drawingScale = a3;
}

- (void)setMinZ:(float)a3
{
  self->_minZ = a3;
}

- (void)setMaxZ:(float)a3
{
  self->_maxZ = a3;
}

- (int64_t)drawCalls
{
  return self->_drawCalls;
}

@end
