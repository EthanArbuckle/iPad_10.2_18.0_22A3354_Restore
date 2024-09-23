@implementation PXGMetalRenderContext

- (PXGMetalRenderContext)initWithDevice:(id)a3 commandQueue:(id)a4
{
  id v7;
  id v8;
  PXGMetalRenderContext *v9;
  PXGMetalRenderContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXGMetalRenderContext;
  v9 = -[PXGMetalRenderContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_commandQueue, a4);
    v10->_wantsUniformThreadgroups = 0;
  }

  return v10;
}

- (MTLLibrary)library
{
  MTLLibrary *library;
  MTLDevice *device;
  void *v6;
  MTLLibrary *v7;
  id v8;
  MTLLibrary *v9;
  void *v11;
  id v12;

  library = self->_library;
  if (!library)
  {
    device = self->_device;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v7 = (MTLLibrary *)-[MTLDevice newDefaultLibraryWithBundle:error:](device, "newDefaultLibraryWithBundle:error:", v6, &v12);
    v8 = v12;
    v9 = self->_library;
    self->_library = v7;

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalRenderContext.m"), 45, CFSTR("Error creating library:%@"), v8);

      abort();
    }
    library = self->_library;
  }
  return library;
}

- (id)newTextureWithDescriptor:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalRenderContext.m"), 72, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGMetalRenderContext newTextureWithDescriptor:]", v8);

  abort();
}

- (void)copyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;

  v10 = a4;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalRenderContext.m"), 76, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGMetalRenderContext copyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:]", v13);

  abort();
}

- (void)fastCopyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;

  v10 = a4;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalRenderContext.m"), 80, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGMetalRenderContext fastCopyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:]", v13);

  abort();
}

- (id)newMipmappedTextureFromTexture:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "pixelFormat");
  v6 = objc_msgSend(v4, "width");
  v7 = objc_msgSend(v4, "height");
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v5, v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUsage:", 1);
  v9 = -[PXGMetalRenderContext newTextureWithDescriptor:](self, "newTextureWithDescriptor:", v8);
  -[PXGMetalRenderContext _blitFromTexture:toTexture:mipmapped:](self, "_blitFromTexture:toTexture:mipmapped:", v4, v9, (unint64_t)objc_msgSend(v9, "mipmapLevelCount") > 1);

  return v9;
}

- (void)blitTexture:(id)a3 toTexture:(id)a4 blitEncoder:(id)a5
{
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v7 = a5;
  v8 = a4;
  objc_msgSend(v9, "width");
  objc_msgSend(v9, "height");
  kdebug_trace();
  objc_msgSend(v7, "copyFromTexture:toTexture:", v9, v8);

  objc_msgSend(v7, "endEncoding");
  kdebug_trace();

}

- (void)blitBuffer:(id)a3 toTexture:(id)a4 count:(unint64_t)a5 blitEncoder:(id)a6
{
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD v14[3];
  _QWORD v15[3];

  v9 = a3;
  v10 = a6;
  v11 = a4;
  kdebug_trace();
  v12 = objc_msgSend(v11, "width");
  if (v12 >= a5)
    v13 = a5;
  else
    v13 = v12;
  v14[2] = 1;
  memset(v15, 0, sizeof(v15));
  v14[0] = v13;
  v14[1] = (a5 + v12 - 1) / v12;
  objc_msgSend(v10, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v9, 0, 4 * (int)v13, 0, v14, v11, 0, 0, v15);

  objc_msgSend(v10, "endEncoding");
  kdebug_trace();

}

- (void)encodeCopyKernelWithSourceTexture:(id)a3 targetTexture:(id)a4 sourceRegions:(id)a5 sourceRegionsOffset:(unint64_t)a6 targetRegionSize:(id *)a7 regionsCount:(unint64_t)a8 computeEncoder:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t var0;
  unint64_t var1;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v29;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;

  v14 = a9;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[PXGMetalRenderContext _createComputePipelinesIfNeeded](self, "_createComputePipelinesIfNeeded");
  -[PXGMetalRenderContext textureCopyRegionKernelPipelineState](self, "textureCopyRegionKernelPipelineState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "threadExecutionWidth");

  -[PXGMetalRenderContext textureCopyRegionKernelPipelineState](self, "textureCopyRegionKernelPipelineState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v20, "maxTotalThreadsPerThreadgroup") / v19;

  var0 = a7->var0;
  var1 = a7->var1;
  LODWORD(v23) = a7->var0;
  HIDWORD(v23) = var1;
  v38 = v23;
  -[PXGMetalRenderContext textureCopyRegionKernelPipelineState](self, "textureCopyRegionKernelPipelineState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setComputePipelineState:", v24);

  objc_msgSend(v14, "setTexture:atIndex:", v17, 0);
  objc_msgSend(v14, "setTexture:atIndex:", v16, 1);

  objc_msgSend(v14, "setBuffer:offset:atIndex:", v15, a6, 0);
  objc_msgSend(v14, "setBytes:length:atIndex:", &v38, 8, 1);
  if (-[PXGMetalRenderContext wantsUniformThreadgroups](self, "wantsUniformThreadgroups"))
  {
    v25 = (v19 + a7->var0 * a8 - 1) / v19;
    v26 = v29 + a7->var1 - 1;
    v37 = a8;
    v27 = v26 / v29;
    objc_msgSend(v14, "setBytes:length:atIndex:", &v37, 4, 2);
    v34 = v25;
    v35 = v27;
    v36 = 1;
    v31 = v19;
    v32 = v29;
    v33 = 1;
    objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", &v34, &v31);
  }
  else
  {
    v34 = var0 * a8;
    v35 = var1;
    v36 = 1;
    v31 = v19;
    v32 = v29;
    v33 = 1;
    objc_msgSend(v14, "dispatchThreads:threadsPerThreadgroup:", &v34, &v31);
  }
  objc_msgSend(v14, "endEncoding");

}

- (void)_createComputePipelinesIfNeeded
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  MTLComputePipelineState *v9;
  id v10;
  MTLComputePipelineState *textureCopyRegionKernelPipelineState;
  void *v12;
  id v13;
  id v14;
  _OWORD v15[2];
  int v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!self->_textureCopyRegionKernelPipelineState)
  {
    v16 = 0;
    memset(v15, 0, sizeof(v15));
    v17 = -[PXGMetalRenderContext wantsUniformThreadgroups](self, "wantsUniformThreadgroups");
    v4 = objc_alloc_init(MEMORY[0x24BDDD5A0]);
    objc_msgSend(v4, "setConstantValues:type:withRange:", v15, 29, 0, 10);
    -[PXGMetalRenderContext library](self, "library");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v6 = (void *)objc_msgSend(v5, "newFunctionWithName:constantValues:error:", CFSTR("copy_texture_region"), v4, &v14);
    v7 = v14;

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalRenderContext.m"), 169, CFSTR("Error creating copy_texture_region function:%@"), v7);
    }
    else
    {
      -[PXGMetalRenderContext device](self, "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v9 = (MTLComputePipelineState *)objc_msgSend(v8, "newComputePipelineStateWithFunction:error:", v6, &v13);
      v10 = v13;
      textureCopyRegionKernelPipelineState = self->_textureCopyRegionKernelPipelineState;
      self->_textureCopyRegionKernelPipelineState = v9;

      if (!v10)
      {

        return;
      }
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalRenderContext.m"), 175, CFSTR("Error creating pipelineState:%@"), v10);
    }

    abort();
  }
}

- (void)_blitFromBuffer:(id)a3 toTexture:(id)a4 inRegion:(id *)a5 bytesPerRow:(unint64_t)a6 offset:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t var2;
  __int128 v20;
  unint64_t v21;
  __int128 v22;
  unint64_t v23;

  v14 = a3;
  v15 = a4;
  kdebug_trace();
  -[PXGMetalRenderContext commandQueue](self, "commandQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commandBuffer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "blitCommandEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLabel:", CFSTR("PXGMetalRenderContext Buffer Blit Encoder"));
  var2 = a5->var1.var2;
  v22 = *(_OWORD *)&a5->var1.var0;
  v23 = var2;
  v20 = *(_OWORD *)&a5->var0.var0;
  v21 = a5->var0.var2;
  objc_msgSend(v18, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v14, a7, a6, a8, &v22, v15, 0, 0, &v20);

  objc_msgSend(v18, "endEncoding");
  objc_msgSend(v17, "commit");
  kdebug_trace();

}

- (void)_blitFromTexture:(id)a3 toTexture:(id)a4 mipmapped:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a4;
  v8 = a3;
  -[PXGMetalRenderContext commandQueue](self, "commandQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commandBuffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "blitCommandEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLabel:", CFSTR("PXGTextureUtilities Texture Blit Encoder"));
  objc_msgSend(v11, "copyFromTexture:toTexture:", v8, v12);

  if (v5)
    objc_msgSend(v11, "generateMipmapsForTexture:", v12);
  objc_msgSend(v11, "endEncoding");
  objc_msgSend(v10, "commit");

}

- (MTLDevice)device
{
  return self->_device;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (BOOL)supportsSharedTextures
{
  return self->_supportsSharedTextures;
}

- (BOOL)wantsMutableSharedTextures
{
  return self->_wantsMutableSharedTextures;
}

- (MTLComputePipelineState)textureCopyRegionKernelPipelineState
{
  return self->_textureCopyRegionKernelPipelineState;
}

- (void)setTextureCopyRegionKernelPipelineState:(id)a3
{
  objc_storeStrong((id *)&self->_textureCopyRegionKernelPipelineState, a3);
}

- (BOOL)wantsUniformThreadgroups
{
  return self->_wantsUniformThreadgroups;
}

- (void)setWantsUniformThreadgroups:(BOOL)a3
{
  self->_wantsUniformThreadgroups = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureCopyRegionKernelPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

+ (id)privateContextWithDevice:(id)a3
{
  id v3;
  PXGPrivateMetalRenderContext *v4;

  v3 = a3;
  v4 = -[PXGPrivateMetalRenderContext initWithDevice:]([PXGPrivateMetalRenderContext alloc], "initWithDevice:", v3);

  return v4;
}

+ (id)privateContextWithDevice:(id)a3 commandQueue:(id)a4
{
  id v5;
  id v6;
  PXGPrivateMetalRenderContext *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PXGMetalRenderContext initWithDevice:commandQueue:]([PXGPrivateMetalRenderContext alloc], "initWithDevice:commandQueue:", v6, v5);

  return v7;
}

+ (id)sharedContextWithDevice:(id)a3 commandQueue:(id)a4
{
  id v5;
  id v6;
  PXGSharedMetalRenderContext *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PXGMetalRenderContext initWithDevice:commandQueue:]([PXGSharedMetalRenderContext alloc], "initWithDevice:commandQueue:", v6, v5);

  return v7;
}

+ (BOOL)deviceSupportsSharedTextures
{
  return 1;
}

@end
