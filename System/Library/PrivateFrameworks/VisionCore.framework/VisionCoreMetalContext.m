@implementation VisionCoreMetalContext

- (VisionCoreMetalContext)initWithLibrary:(id)a3 device:(id)a4 commandQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  VisionCoreMetalContext *v12;
  VisionCoreMetalContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VisionCoreMetalContext;
  v12 = -[VisionCoreMetalContext init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_library, a3);
    objc_storeStrong((id *)&v13->_device, a4);
    objc_storeStrong((id *)&v13->_commandQueue, a5);
  }

  return v13;
}

- (BOOL)writeMetalTextureToData:(void *)a3 texture:(id)a4 mipmapLevel:(int)a5
{
  id v7;
  void *v8;
  BOOL v9;
  _QWORD v11[3];
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v7 && (a5 & 0x80000000) == 0)
  {
    if (objc_msgSend(v7, "mipmapLevelCount") <= (unint64_t)a5)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v8, "pixelFormat");
      MTLPixelFormatGetInfoForDevice();
      memset(v11, 0, sizeof(v11));
      v12 = (unint64_t)objc_msgSend(v8, "width") >> a5;
      v9 = 1;
      v13 = (unint64_t)objc_msgSend(v8, "height") >> a5;
      v14 = 1;
      objc_msgSend(v8, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", a3, v12 * v15, v11, a5);
    }
  }

  return v9;
}

- (BOOL)writeMetalTextureToFile:(const char *)a3 texture:(id)a4
{
  return -[VisionCoreMetalContext writeMetalTextureToFile:texture:mipmapLevel:](self, "writeMetalTextureToFile:texture:mipmapLevel:", a3, a4, 0);
}

- (BOOL)writeMetalTextureToFile:(const char *)a3 texture:(id)a4 mipmapLevel:(int)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  FILE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  FILE *v21;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v31;
  _QWORD v32[6];
  size_t v33;

  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (!a3 || !v7 || a5 < 0)
    goto LABEL_10;
  if (objc_msgSend(v7, "mipmapLevelCount") <= (unint64_t)a5)
  {
    v9 = 0;
    goto LABEL_10;
  }
  v10 = a5;
  objc_msgSend(v8, "pixelFormat");
  MTLPixelFormatGetInfoForDevice();
  v11 = v33;
  v12 = (unint64_t)objc_msgSend(v8, "width") >> v10;
  v13 = (unint64_t)objc_msgSend(v8, "height") >> v10;
  v9 = malloc_type_malloc(v12 * v33 * v13, 0xEDC68849uLL);
  memset(v32, 0, 24);
  v32[3] = v12;
  v32[4] = v13;
  v32[5] = 1;
  objc_msgSend(v8, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v9, v12 * v33, v32, v10);
  v14 = fopen(a3, "wb");
  if (!v14)
  {
    VisionCoreValidatedLog(0, (uint64_t)CFSTR("Unable to fopen(\"%s\") for writing\n"), v15, v16, v17, v18, v19, v20, (uint64_t)a3);
LABEL_10:
    free(v9);
    v29 = 0;
    goto LABEL_11;
  }
  v21 = v14;
  v22 = fwrite(v9, v11, v13 * v12, v14);
  v29 = v22 == v13 * v12;
  if (v22 != v13 * v12)
    VisionCoreValidatedLog(v22, (uint64_t)CFSTR("Something went wrong during fwrite to file\n"), v23, v24, v25, v26, v27, v28, v31);
  free(v9);
  fclose(v21);
LABEL_11:

  return v29;
}

- (int)writeMetalBufferToFile:(const char *)a3 buffer:(id)a4
{
  id v5;
  FILE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  FILE *v13;
  id v14;
  const void *v15;
  size_t v16;
  size_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v26;

  v5 = a4;
  v6 = fopen(a3, "wb");
  if (v6)
  {
    v13 = v6;
    v14 = objc_retainAutorelease(v5);
    v15 = (const void *)objc_msgSend(v14, "contents");
    v16 = objc_msgSend(v14, "length");
    v17 = fwrite(v15, 1uLL, v16, v13);
    if (v17 == v16)
    {
      v24 = 0;
    }
    else
    {
      VisionCoreValidatedLog(v17, (uint64_t)CFSTR("Something went wrong during fwrite to file\n"), v18, v19, v20, v21, v22, v23, v26);
      v24 = -1;
    }
    fclose(v13);
  }
  else
  {
    VisionCoreValidatedLog(0, (uint64_t)CFSTR("Unable to fopen(\"%s\") for writing\n"), v7, v8, v9, v10, v11, v12, (uint64_t)a3);
    v24 = -1;
  }

  return v24;
}

- (id)newTextureWithPixelFormat:(unint64_t)a3 width:(int)a4 height:(int)a5
{
  void *v6;
  void *v7;

  if (a5 == 1)
  {
    objc_msgSend(MEMORY[0x24BDDD740], "textureBufferDescriptorWithPixelFormat:width:resourceOptions:usage:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUsage:", 19);
  }
  v7 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v6);

  return v7;
}

- (id)newBufferWithPixelFormat:(unint64_t)a3 width:(int)a4 data:(const void *)a5
{
  unint64_t v7;
  MTLDevice *device;

  v7 = +[VisionCoreMetalContext bytesPerPixelForTextureFormat:](VisionCoreMetalContext, "bytesPerPixelForTextureFormat:", a3)* a4;
  device = self->_device;
  if (a5)
    return (id)-[MTLDevice newBufferWithBytes:length:options:](device, "newBufferWithBytes:length:options:", a5, v7, 0);
  else
    return (id)-[MTLDevice newBufferWithLength:options:](device, "newBufferWithLength:options:", v7, 0);
}

- (id)readTextureFromFile:(const char *)a3 width:(int)a4 height:(int)a5 pixelFormat:(unint64_t)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  size_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  FILE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  FILE *v28;
  id v29;
  char *v30;
  uint64_t v32;
  VisionCoreMetalContext *v33;
  char v34;
  char v35;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v11 = a4;
  v12 = +[VisionCoreMetalContext bytesPerPixelForTextureFormat:](VisionCoreMetalContext, "bytesPerPixelForTextureFormat:", a6)* a4* a5;
  v13 = malloc_type_malloc(v12, 0xE483550EuLL);
  if (!v13)
  {
    VisionCoreValidatedLog(0, (uint64_t)CFSTR("Failed to allocate fdata\n"), v14, v15, v16, v17, v18, v19, v32);
LABEL_9:
    v29 = 0;
    return v29;
  }
  v20 = v13;
  v33 = self;
  v21 = fopen(a3, "rb");
  if (!v21)
  {
    VisionCoreValidatedLog(0, (uint64_t)CFSTR("Unable to fopen(\"%s\") for reading\n"), v22, v23, v24, v25, v26, v27, (uint64_t)a3);
    free(v20);
    goto LABEL_9;
  }
  v28 = v21;
  v29 = -[VisionCoreMetalContext newTextureWithPixelFormat:width:height:](v33, "newTextureWithPixelFormat:width:height:", a6, v8, v7);
  fread(v20, v12, 1uLL, v28);
  if ((_DWORD)v7 == 1)
    v30 = &v35;
  else
    v30 = &v34;
  *(_QWORD *)v30 = 0;
  *((_QWORD *)v30 + 1) = 0;
  *((_QWORD *)v30 + 2) = 0;
  *((_QWORD *)v30 + 3) = v11;
  *((_QWORD *)v30 + 4) = (int)v7;
  *((_QWORD *)v30 + 5) = 1;
  objc_msgSend(v29, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:");
  free(v20);
  fclose(v28);
  return v29;
}

- (id)readBufferFromFile:(const char *)a3 width:(int)a4 pixelFormat:(unint64_t)a5
{
  size_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  FILE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  FILE *v23;
  void *v24;
  uint64_t v26;

  v7 = +[VisionCoreMetalContext bytesPerPixelForTextureFormat:](VisionCoreMetalContext, "bytesPerPixelForTextureFormat:", a5)* a4;
  v8 = malloc_type_malloc(v7, 0x371C6B97uLL);
  if (!v8)
  {
    VisionCoreValidatedLog(0, (uint64_t)CFSTR("Failed to allocate fdata\n"), v9, v10, v11, v12, v13, v14, v26);
LABEL_6:
    v24 = 0;
    return v24;
  }
  v15 = v8;
  v16 = fopen(a3, "rb");
  if (!v16)
  {
    VisionCoreValidatedLog(0, (uint64_t)CFSTR("Unable to fopen(\"%s\") for reading\n"), v17, v18, v19, v20, v21, v22, (uint64_t)a3);
    free(v15);
    goto LABEL_6;
  }
  v23 = v16;
  fread(v15, v7, 1uLL, v16);
  v24 = (void *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", v15, v7, 0);
  free(v15);
  fclose(v23);
  return v24;
}

- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 plane:(unint64_t)a5
{
  __IOSurface *IOSurface;
  __IOSurface *v9;
  size_t WidthOfPlane;

  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurface)
  {
    v9 = IOSurface;
    WidthOfPlane = IOSurfaceGetWidthOfPlane(IOSurface, a5);
    -[VisionCoreMetalContext bindIOSurfaceToMTL2DTexture:pixelFormat:width:height:plane:](self, "bindIOSurfaceToMTL2DTexture:pixelFormat:width:height:plane:", v9, a4, WidthOfPlane, IOSurfaceGetHeightOfPlane(v9, a5), a5);
    IOSurface = (__IOSurface *)objc_claimAutoreleasedReturnValue();
  }
  return IOSurface;
}

- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 textureSize:(CGSize)a5 plane:(unint64_t)a6
{
  double height;
  double width;
  __IOSurface *IOSurface;
  __IOSurface *v12;
  size_t WidthOfPlane;
  double HeightOfPlane;

  height = a5.height;
  width = a5.width;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurface)
  {
    v12 = IOSurface;
    WidthOfPlane = IOSurfaceGetWidthOfPlane(IOSurface, a6);
    HeightOfPlane = (double)IOSurfaceGetHeightOfPlane(v12, a6);
    if (width > (double)WidthOfPlane || height > HeightOfPlane)
    {
      IOSurface = 0;
    }
    else
    {
      -[VisionCoreMetalContext bindIOSurfaceToMTL2DTexture:pixelFormat:width:height:plane:](self, "bindIOSurfaceToMTL2DTexture:pixelFormat:width:height:plane:", v12, a4, (unint64_t)width, (unint64_t)height, a6);
      IOSurface = (__IOSurface *)objc_claimAutoreleasedReturnValue();
    }
  }
  return IOSurface;
}

- (id)bindIOSurfaceToMTL2DTexture:(__IOSurface *)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 plane:(unint64_t)a7
{
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, a5, a6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setUsage:", 23);
    v12 = -[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v11, a3, a7);
    if (v12)
      v13 = (void *)v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)copyMTLBufferToMTLTexture:(id)a3 bytesPerRow:(unint64_t)a4 texture:(id)a5
{
  MTLCommandQueue *commandQueue;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  _QWORD v13[3];
  _QWORD v14[3];

  commandQueue = self->_commandQueue;
  v8 = a5;
  v9 = a3;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "blitCommandEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "height") * a4;
  v14[0] = objc_msgSend(v8, "width");
  v14[1] = objc_msgSend(v8, "height");
  v14[2] = objc_msgSend(v8, "depth");
  memset(v13, 0, sizeof(v13));
  objc_msgSend(v11, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v9, 0, a4, v12, v14, v8, 0, 0, v13);

  objc_msgSend(v11, "endEncoding");
  objc_msgSend(v10, "addCompletedHandler:", &__block_literal_global_2111);
  objc_msgSend(v10, "commit");
  objc_msgSend(v10, "waitUntilCompleted");

}

- (unint64_t)textureBytesPerRow:(int)a3 format:(unint64_t)a4
{
  unint64_t v6;

  v6 = -[MTLDevice minimumLinearTextureAlignmentForPixelFormat:](self->_device, "minimumLinearTextureAlignmentForPixelFormat:", a4);
  return (v6
        + +[VisionCoreMetalContext bytesPerPixelForTextureFormat:](VisionCoreMetalContext, "bytesPerPixelForTextureFormat:", a4)* a3- 1)/ v6* v6;
}

- (MTLDevice)device
{
  return self->_device;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (MTLLibrary)library
{
  return self->_library;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (unint64_t)bytesPerPixelForTextureFormat:(unint64_t)a3
{
  unint64_t result;
  char v4;

  result = 1;
  switch(a3)
  {
    case 0xAuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      return result;
    case 0xBuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x15uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1FuLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3DuLL:
    case 0x42uLL:
    case 0x43uLL:
    case 0x44uLL:
    case 0x45uLL:
    case 0x4BuLL:
    case 0x4CuLL:
    case 0x4DuLL:
    case 0x4EuLL:
    case 0x4FuLL:
      goto LABEL_12;
    case 0x14uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1EuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x2BuLL:
      return 2;
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x3CuLL:
    case 0x3EuLL:
    case 0x3FuLL:
    case 0x40uLL:
    case 0x41uLL:
    case 0x46uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x49uLL:
    case 0x4AuLL:
    case 0x50uLL:
    case 0x51uLL:
      return 4;
    default:
      v4 = a3 - 90;
      if (a3 - 90 > 0x23)
        goto LABEL_11;
      if (((1 << v4) & 0x3D0E000) != 0)
        return 8;
      if (((1 << v4) & 0xF) != 0)
        return 4;
      if (((1 << v4) & 0xE00000000) != 0)
        return 16;
LABEL_11:
      if (a3 != 1)
      {
LABEL_12:
        NSLog(CFSTR("Unidentified Metal format"), a2);
        return 0;
      }
      return result;
  }
}

+ (id)metalContextAndReturnError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = MTLCreateSystemDefaultDevice();
  if (v5)
  {
    VisionCoreFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "newLibraryWithURL:error:", v7, a3);
    if (v8)
    {
      v9 = (void *)objc_msgSend(v5, "newCommandQueue");
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "setBackgroundGPUPriority:", 2);
        v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLibrary:device:commandQueue:", v8, v5, v10);
      }
      else if (a3)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInternalErrorWithLocalizedDescription:", CFSTR("Unable to create command queue "));
        v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInternalErrorWithLocalizedDescription:", CFSTR("MTLDevice is nil"));
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
