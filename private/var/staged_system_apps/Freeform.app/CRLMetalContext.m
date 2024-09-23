@implementation CRLMetalContext

- (CRLMetalContext)initWithEnvironment:(id)a3
{
  id v5;
  CRLMetalContext *v6;
  CRLMetalContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLMetalContext;
  v6 = -[CRLMetalContext init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_environment, a3);

  return v7;
}

- (MTLDevice)device
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMetalContext environment](self, "environment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "device"));

  return (MTLDevice *)v3;
}

- (MTLCommandQueue)commandQueue
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMetalContext environment](self, "environment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "commandQueue"));

  return (MTLCommandQueue *)v3;
}

- (CGColorSpace)destinationColorSpace
{
  void *v2;
  CGColorSpace *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMetalContext environment](self, "environment"));
  v3 = (CGColorSpace *)objc_msgSend(v2, "destinationColorSpace");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLMetalContext *v4;
  id WeakRetained;
  id v6;
  id v7;
  id v8;

  v4 = -[CRLMetalContext initWithEnvironment:]([CRLMetalContext alloc], "initWithEnvironment:", self->_environment);
  -[CRLMetalContext setPixelFormat:](v4, "setPixelFormat:", self->_pixelFormat);
  -[CRLMetalContext setViewportSize:](v4, "setViewportSize:", self->_viewportSize.width, self->_viewportSize.height);
  -[CRLMetalContext setCurrentBuffer:](v4, "setCurrentBuffer:", self->_currentBuffer);
  WeakRetained = objc_loadWeakRetained((id *)&self->_commandBuffer);
  -[CRLMetalContext setCommandBuffer:](v4, "setCommandBuffer:", WeakRetained);

  v6 = objc_loadWeakRetained((id *)&self->_passDescriptor);
  -[CRLMetalContext setPassDescriptor:](v4, "setPassDescriptor:", v6);

  v7 = objc_loadWeakRetained((id *)&self->_shader);
  -[CRLMetalContext setShader:](v4, "setShader:", v7);

  v8 = objc_loadWeakRetained((id *)&self->_renderEncoder);
  -[CRLMetalContext setRenderEncoder:](v4, "setRenderEncoder:", v8);

  return v4;
}

- (CRLMetalEnvironment)environment
{
  return self->_environment;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (CGSize)viewportSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewportSize.width;
  height = self->_viewportSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setViewportSize:(CGSize)a3
{
  self->_viewportSize = a3;
}

- (unint64_t)currentBuffer
{
  return self->_currentBuffer;
}

- (void)setCurrentBuffer:(unint64_t)a3
{
  self->_currentBuffer = a3;
}

- (MTLCommandBuffer)commandBuffer
{
  return (MTLCommandBuffer *)objc_loadWeakRetained((id *)&self->_commandBuffer);
}

- (void)setCommandBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_commandBuffer, a3);
}

- (MTLRenderPassDescriptor)passDescriptor
{
  return (MTLRenderPassDescriptor *)objc_loadWeakRetained((id *)&self->_passDescriptor);
}

- (void)setPassDescriptor:(id)a3
{
  objc_storeWeak((id *)&self->_passDescriptor, a3);
}

- (CRLMetalShader)shader
{
  return (CRLMetalShader *)objc_loadWeakRetained((id *)&self->_shader);
}

- (void)setShader:(id)a3
{
  objc_storeWeak((id *)&self->_shader, a3);
}

- (MTLRenderCommandEncoder)renderEncoder
{
  return (MTLRenderCommandEncoder *)objc_loadWeakRetained((id *)&self->_renderEncoder);
}

- (void)setRenderEncoder:(id)a3
{
  objc_storeWeak((id *)&self->_renderEncoder, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_renderEncoder);
  objc_destroyWeak((id *)&self->_shader);
  objc_destroyWeak((id *)&self->_passDescriptor);
  objc_destroyWeak((id *)&self->_commandBuffer);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
