@implementation SIResourceFactory

- (SIResourceFactory)initWithDevice:(id)a3
{
  id v5;
  SIResourceFactory *v6;
  SIResourceFactory *v7;
  uint64_t v8;
  MTLCommandQueue *commandQueue;
  void *v10;
  uint64_t v11;
  MTLCommandQueueSPI *commandQueueSPI;
  uint64_t v13;
  MTLSharedEvent *sharedEvent;
  SIResourceFactory *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SIResourceFactory;
  v6 = -[SIResourceFactory init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = -[MTLDevice newCommandQueue](v7->_device, "newCommandQueue");
    commandQueue = v7->_commandQueue;
    v7->_commandQueue = (MTLCommandQueue *)v8;

    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setCommitSynchronously:", 1);
    objc_msgSend(v10, "setDisableAsyncCompletionDispatch:", 1);
    v11 = -[MTLDevice newCommandQueueWithDescriptor:](v7->_device, "newCommandQueueWithDescriptor:", v10);
    commandQueueSPI = v7->_commandQueueSPI;
    v7->_commandQueueSPI = (MTLCommandQueueSPI *)v11;

    v13 = -[MTLDevice newSharedEvent](v7->_device, "newSharedEvent");
    sharedEvent = v7->_sharedEvent;
    v7->_sharedEvent = (MTLSharedEvent *)v13;

    v15 = v7;
  }

  return v7;
}

- (MTLLibrary)library
{
  MTLLibrary *library;
  void *v4;
  MTLDevice *device;
  MTLLibrary *v6;
  id v7;
  MTLLibrary *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  library = self->_library;
  if (!library)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    device = self->_device;
    v11 = 0;
    v6 = (MTLLibrary *)-[MTLDevice newDefaultLibraryWithBundle:error:](device, "newDefaultLibraryWithBundle:error:", v4, &v11);
    v7 = v11;
    v8 = self->_library;
    self->_library = v6;

    if (v7 || !self->_library)
    {
      __SceneIntelligenceLogSharedInstance();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136381187;
        v13 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
        v14 = 1025;
        v15 = 72;
        v16 = 2113;
        v17 = v7;
        _os_log_impl(&dword_21071A000, v9, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** newLibraryWithURL failed: %{private}@ ***", buf, 0x1Cu);
      }

    }
    library = self->_library;
  }
  return library;
}

- (id)commandBuffer
{
  return (id)-[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
}

- (id)commandBufferOnCustomQueue
{
  return (id)-[MTLCommandQueueSPI commandBuffer](self->_commandQueueSPI, "commandBuffer");
}

- (id)commandBufferOnCustomQueueWithoutComputePreemption
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[MTLCommandQueueSPI commandBufferWithDescriptor:](self->_commandQueueSPI, "commandBufferWithDescriptor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)binaryArchive
{
  MTLBinaryArchive *binaryArchive;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MTLDevice *device;
  MTLBinaryArchive *v9;
  id v10;
  MTLBinaryArchive *v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  binaryArchive = self->_binaryArchive;
  if (binaryArchive)
    return binaryArchive;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", CFSTR("default-binaryarchive"), CFSTR("metallib"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUrl:", v7);

    device = self->_device;
    v15 = 0;
    v9 = (MTLBinaryArchive *)-[MTLDevice newBinaryArchiveWithDescriptor:error:](device, "newBinaryArchiveWithDescriptor:error:", v6, &v15);
    v10 = v15;
    v11 = self->_binaryArchive;
    self->_binaryArchive = v9;

    if (v10 || !self->_binaryArchive)
    {
      __SceneIntelligenceLogSharedInstance();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381187;
        v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
        v18 = 1025;
        v19 = 124;
        v20 = 2113;
        v21 = v10;
        _os_log_impl(&dword_21071A000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** newBinaryArchiveWithDescriptor failed:  %{private}@ ***", buf, 0x1Cu);
      }

    }
    binaryArchive = self->_binaryArchive;
    return binaryArchive;
  }
  __SceneIntelligenceLogSharedInstance();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136380931;
    v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
    v18 = 1025;
    v19 = 114;
    _os_log_impl(&dword_21071A000, v13, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** path for resource default-binaryarchive.metallib could not be found. ***", buf, 0x12u);
  }

  return 0;
}

- (id)customCommandQueue
{
  return self->_commandQueueSPI;
}

- (id)sharedEvent
{
  return self->_sharedEvent;
}

- (id)newFunctionWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SIResourceFactory library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newFunctionWithName:", v4);

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136381187;
      v11 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
      v12 = 1025;
      v13 = 142;
      v14 = 2113;
      v15 = v4;
      _os_log_impl(&dword_21071A000, v8, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** newFunctionWithName failed: %{private}@ ***", (uint8_t *)&v10, 0x1Cu);
    }

  }
  return v6;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  -[SIResourceFactory library](self, "library");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "newFunctionWithName:constantValues:error:", v9, v8, a5);

  if (*a5)
  {
    __SceneIntelligenceLogSharedInstance();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *a5;
      v16 = 136381187;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
      v18 = 1025;
      v19 = 152;
      v20 = 2113;
      v21 = v13;
      _os_log_impl(&dword_21071A000, v12, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** newFunctionWithName constantValues failed with error :%{private}@ ***", (uint8_t *)&v16, 0x1Cu);
    }

    v14 = 0;
  }
  else
  {
    v14 = v11;
  }

  return v14;
}

- (id)newComputePipelineStateWithName:(id)a3
{
  return -[SIResourceFactory newComputePipelineStateWithName:constantValues:error:](self, "newComputePipelineStateWithName:constantValues:error:", a3, 0, 0);
}

- (id)newComputePipelineStateWithName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const __CFString *v21;
  NSObject *v22;
  const __CFString *v23;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a3;
  v9 = a4;
  -[SIResourceFactory library](self, "library");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
    v12 = objc_msgSend(v10, "newFunctionWithName:constantValues:error:", v8, v9, a5);
  else
    v12 = objc_msgSend(v10, "newFunctionWithName:", v8);
  v13 = (void *)v12;

  if (v13)
  {
    v14 = objc_opt_new();
    -[NSObject setComputeFunction:](v14, "setComputeFunction:", v13);
    -[NSObject setThreadGroupSizeIsMultipleOfThreadExecutionWidth:](v14, "setThreadGroupSizeIsMultipleOfThreadExecutionWidth:", 0);
    -[SIResourceFactory binaryArchive](self, "binaryArchive");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[SIResourceFactory binaryArchive](self, "binaryArchive");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setBinaryArchives:](v14, "setBinaryArchives:", v17);

    }
    v18 = (void *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](self->_device, "newComputePipelineStateWithDescriptor:options:reflection:error:", v14, 0, 0, a5);
    v19 = v18;
    if (a5 || !v18)
    {
      __SceneIntelligenceLogSharedInstance();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        if (a5)
          v23 = (const __CFString *)*a5;
        else
          v23 = &stru_24CA5D420;
        *(_DWORD *)buf = 136381187;
        v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
        v28 = 1025;
        v29 = 187;
        v30 = 2113;
        v31 = v23;
        _os_log_impl(&dword_21071A000, v22, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** newComputePipelineStateWithDescriptor failed: %{private}@ ***", buf, 0x1Cu);
      }

      v20 = 0;
    }
    else
    {
      v20 = v18;
    }

  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (a5)
        v21 = (const __CFString *)*a5;
      else
        v21 = &stru_24CA5D420;
      *(_DWORD *)buf = 136381443;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
      v28 = 1025;
      v29 = 167;
      v30 = 2113;
      v31 = v8;
      v32 = 2113;
      v33 = v21;
      _os_log_impl(&dword_21071A000, v14, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** newFunctionWithName %{private}@ failed %{private}@ ***", buf, 0x26u);
    }
    v20 = 0;
  }

  return v20;
}

- (id)newCubemapWithFormat:(SIImageFormat_struct *)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDDD740], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", a3->var3, a3->var0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsage:", 23);
  v5 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v4);

  return v5;
}

- (id)newTextureWithFormat:(SIImageFormat_struct *)a3
{
  uint64_t var2;

  var2 = a3->var2;
  if (!(_DWORD)var2)
    var2 = SIOSTypeFromMTLPixelFormat(a3->var3);
  return -[SIResourceFactory newTextureWithWidth:height:pixelFormat:](self, "newTextureWithWidth:height:pixelFormat:", a3->var0, a3->var1, var2);
}

- (id)newTextureWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5
{
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v9 = SIMTLPixelFormatFromOSType(a5);
  if (v9)
  {
    v10 = v9;
    v11 = objc_opt_new();
    -[NSObject setTextureType:](v11, "setTextureType:", 2);
    -[NSObject setWidth:](v11, "setWidth:", a3);
    -[NSObject setHeight:](v11, "setHeight:", a4);
    -[NSObject setPixelFormat:](v11, "setPixelFormat:", v10);
    -[NSObject setUsage:](v11, "setUsage:", 23);
    v12 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v11);
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      __SceneIntelligenceLogSharedInstance();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136380931;
        v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
        v20 = 1025;
        v21 = 238;
        _os_log_impl(&dword_21071A000, v16, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** Texture allocation failed ***", (uint8_t *)&v18, 0x12u);
      }

    }
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      SIPixelFormatToStr(a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136381187;
      v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
      v20 = 1025;
      v21 = 223;
      v22 = 2113;
      v23 = v15;
      _os_log_impl(&dword_21071A000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Textures do not currently support format %{private}@ ***", (uint8_t *)&v18, 0x1Cu);

    }
    v13 = 0;
  }

  return v13;
}

- (id)newIOSurfaceBackedTextureWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5
{
  __CVBuffer *v6;
  id v7;

  v6 = SICreateCVPixelBuffer(a3, a4, a5, 1);
  v7 = -[SIResourceFactory newTextureFromPixelBuffer:](self, "newTextureFromPixelBuffer:", v6);
  CVPixelBufferRelease(v6);
  return v7;
}

- (id)newTextureFromPixelBuffer:(__CVBuffer *)a3
{
  IOSurfaceRef IOSurface;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurface)
    return -[SIResourceFactory newTextureFromIOSurface:](self, "newTextureFromIOSurface:", IOSurface);
  __SceneIntelligenceLogSharedInstance();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 136380931;
    v8 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
    v9 = 1025;
    v10 = 267;
    _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Pixel buffer missing IOSurface backing ***", (uint8_t *)&v7, 0x12u);
  }

  return 0;
}

- (id)newTextureFromIOSurface:(__IOSurface *)a3
{
  OSType PixelFormat;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  size_t Width;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  PixelFormat = IOSurfaceGetPixelFormat(a3);
  v6 = SIMTLPixelFormatFromOSType(PixelFormat);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x24BDDD740];
    Width = IOSurfaceGetWidth(a3);
    objc_msgSend(v8, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v7, Width, IOSurfaceGetHeight(a3), 0);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject setUsage:](v10, "setUsage:", 7);
    v11 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v10, a3, 0);
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      __SceneIntelligenceLogSharedInstance();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v17 = 136380931;
        v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
        v19 = 1025;
        v20 = 300;
        _os_log_impl(&dword_21071A000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Texture allocation failed ***", (uint8_t *)&v17, 0x12u);
      }

    }
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      SIPixelFormatToStr(PixelFormat);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136381187;
      v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
      v19 = 1025;
      v20 = 281;
      v21 = 2113;
      v22 = v14;
      _os_log_impl(&dword_21071A000, v10, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Textures do not currently support format %{private}@ ***", (uint8_t *)&v17, 0x1Cu);

    }
    v12 = 0;
  }

  return v12;
}

- (id)dictionaryFromTexture:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "width");
  v5 = objc_msgSend(v3, "height");

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("width"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("height"));

  return v6;
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedEvent, 0);
  objc_storeStrong((id *)&self->_commandQueueSPI, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_binaryArchive, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
