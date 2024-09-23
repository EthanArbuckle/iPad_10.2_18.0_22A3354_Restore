@implementation TSDMetalContext

- (void)setCommandBuffer:(id)a3
{
  id WeakRetained;
  NSMutableSet *v5;
  NSMutableSet *retainedObjects;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_commandBuffer);

  if (WeakRetained != obj)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    retainedObjects = self->_retainedObjects;
    self->_retainedObjects = v5;

  }
  objc_storeWeak((id *)&self->_commandBuffer, obj);

}

- (void)retainObject:(id)a3
{
  id v4;
  NSMutableSet *retainedObjects;
  NSMutableSet *v6;
  NSMutableSet *v7;
  TSDMetalContext *v8;
  id WeakRetained;
  _QWORD v10[6];
  _QWORD v11[5];
  NSMutableSet *v12;
  _QWORD v13[5];
  TSDMetalContext *v14;

  v4 = a3;
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (!retainedObjects)
      goto LABEL_5;
    if (-[NSMutableSet count](retainedObjects, "count"))
    {
LABEL_7:
      -[NSMutableSet addObject:](self->_retainedObjects, "addObject:", v4);
      goto LABEL_8;
    }
    if (!self->_retainedObjects)
    {
LABEL_5:
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v7 = self->_retainedObjects;
      self->_retainedObjects = v6;

    }
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__14;
    v13[4] = __Block_byref_object_dispose__14;
    v8 = self;
    v14 = v8;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__14;
    v11[4] = __Block_byref_object_dispose__14;
    v12 = self->_retainedObjects;
    WeakRetained = objc_loadWeakRetained((id *)&v8->_commandBuffer);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __32__TSDMetalContext_retainObject___block_invoke;
    v10[3] = &unk_24D82C288;
    v10[4] = v11;
    v10[5] = v13;
    objc_msgSend(WeakRetained, "addCompletedHandler:", v10);

    _Block_object_dispose(v11, 8);
    _Block_object_dispose(v13, 8);

    goto LABEL_7;
  }
LABEL_8:

}

void __32__TSDMetalContext_retainObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

- (id)copyWithZone:(_NSZone *)a3
{
  TSDMetalContext *v4;
  id WeakRetained;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v4 = objc_alloc_init(TSDMetalContext);
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  -[TSDMetalContext setDevice:](v4, "setDevice:", WeakRetained);

  -[TSDMetalContext setPixelFormat:](v4, "setPixelFormat:", self->_pixelFormat);
  -[TSDMetalContext setLayerSize:](v4, "setLayerSize:", self->_layerSize.width, self->_layerSize.height);
  -[TSDMetalContext setCurrentBuffer:](v4, "setCurrentBuffer:", self->_currentBuffer);
  -[TSDMetalContext setTimingInfo:](v4, "setTimingInfo:", self->_timingInfo.currentTime, self->_timingInfo.displayLinkPresentationTime, self->_timingInfo.elapsedShowTime);
  v6 = objc_loadWeakRetained((id *)&self->_commandQueue);
  -[TSDMetalContext setCommandQueue:](v4, "setCommandQueue:", v6);

  v7 = objc_loadWeakRetained((id *)&self->_commandBuffer);
  -[TSDMetalContext setCommandBuffer:](v4, "setCommandBuffer:", v7);

  v8 = objc_loadWeakRetained((id *)&self->_passDescriptor);
  -[TSDMetalContext setPassDescriptor:](v4, "setPassDescriptor:", v8);

  v9 = objc_loadWeakRetained((id *)&self->_shader);
  -[TSDMetalContext setShader:](v4, "setShader:", v9);

  v10 = objc_loadWeakRetained((id *)&self->_renderEncoder);
  -[TSDMetalContext setRenderEncoder:](v4, "setRenderEncoder:", v10);

  -[TSDMetalContext setDestinationColorSpace:](v4, "setDestinationColorSpace:", self->_destinationColorSpace);
  -[TSDMetalContext setRetainedObjects:](v4, "setRetainedObjects:", self->_retainedObjects);
  return v4;
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_loadWeakRetained((id *)&self->_device);
}

- (void)setDevice:(id)a3
{
  objc_storeWeak((id *)&self->_device, a3);
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (CGSize)layerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layerSize.width;
  height = self->_layerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLayerSize:(CGSize)a3
{
  self->_layerSize = a3;
}

- (unint64_t)currentBuffer
{
  return self->_currentBuffer;
}

- (void)setCurrentBuffer:(unint64_t)a3
{
  self->_currentBuffer = a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)timingInfo
{
  double currentTime;
  double displayLinkPresentationTime;
  double elapsedShowTime;
  $1AB5FA073B851C12C2339EC22442E995 result;

  currentTime = self->_timingInfo.currentTime;
  displayLinkPresentationTime = self->_timingInfo.displayLinkPresentationTime;
  elapsedShowTime = self->_timingInfo.elapsedShowTime;
  result.var2 = elapsedShowTime;
  result.var1 = displayLinkPresentationTime;
  result.var0 = currentTime;
  return result;
}

- (void)setTimingInfo:(id)a3
{
  self->_timingInfo = ($54BC86A77F2B8FADC239F82CFC84E8FD)a3;
}

- (MTLCommandQueue)commandQueue
{
  return (MTLCommandQueue *)objc_loadWeakRetained((id *)&self->_commandQueue);
}

- (void)setCommandQueue:(id)a3
{
  objc_storeWeak((id *)&self->_commandQueue, a3);
}

- (MTLCommandBuffer)commandBuffer
{
  return (MTLCommandBuffer *)objc_loadWeakRetained((id *)&self->_commandBuffer);
}

- (MTLRenderPassDescriptor)passDescriptor
{
  return (MTLRenderPassDescriptor *)objc_loadWeakRetained((id *)&self->_passDescriptor);
}

- (void)setPassDescriptor:(id)a3
{
  objc_storeWeak((id *)&self->_passDescriptor, a3);
}

- (TSDMetalShader)shader
{
  return (TSDMetalShader *)objc_loadWeakRetained((id *)&self->_shader);
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

- (CGColorSpace)destinationColorSpace
{
  return self->_destinationColorSpace;
}

- (void)setDestinationColorSpace:(CGColorSpace *)a3
{
  self->_destinationColorSpace = a3;
}

- (NSMutableSet)retainedObjects
{
  return self->_retainedObjects;
}

- (void)setRetainedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_retainedObjects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedObjects, 0);
  objc_destroyWeak((id *)&self->_renderEncoder);
  objc_destroyWeak((id *)&self->_shader);
  objc_destroyWeak((id *)&self->_passDescriptor);
  objc_destroyWeak((id *)&self->_commandBuffer);
  objc_destroyWeak((id *)&self->_commandQueue);
  objc_destroyWeak((id *)&self->_device);
}

@end
