@implementation PBCoreImageContext

- (void)setSmallPool:(__CVPixelBufferPool *)a3
{
  __CVPixelBufferPool *smallPool;
  CFDictionaryRef PixelBufferAttributes;
  CGSize *p_smallPoolSize;
  CGFloat v8;
  unsigned int v9;

  smallPool = self->_smallPool;
  if (smallPool != a3)
  {
    if (smallPool)
      CVPixelBufferPoolRelease(smallPool);
    self->_smallPool = CVPixelBufferPoolRetain(a3);
    PixelBufferAttributes = CVPixelBufferPoolGetPixelBufferAttributes(a3);
    p_smallPoolSize = &self->_smallPoolSize;
    v8 = (double)objc_msgSend(-[__CFDictionary valueForKey:](PixelBufferAttributes, "valueForKey:", CFSTR("Width")), "unsignedIntValue");
    v9 = objc_msgSend(-[__CFDictionary valueForKey:](PixelBufferAttributes, "valueForKey:", CFSTR("Height")), "unsignedIntValue");
    p_smallPoolSize->width = v8;
    p_smallPoolSize->height = (double)v9;
  }
}

- (void)setLargePool:(__CVPixelBufferPool *)a3
{
  __CVPixelBufferPool *largePool;
  CFDictionaryRef PixelBufferAttributes;
  CGSize *p_largePoolSize;
  CGFloat v8;
  unsigned int v9;

  largePool = self->_largePool;
  if (largePool != a3)
  {
    if (largePool)
      CVPixelBufferPoolRelease(largePool);
    self->_largePool = CVPixelBufferPoolRetain(a3);
    PixelBufferAttributes = CVPixelBufferPoolGetPixelBufferAttributes(a3);
    p_largePoolSize = &self->_largePoolSize;
    v8 = (double)objc_msgSend(-[__CFDictionary valueForKey:](PixelBufferAttributes, "valueForKey:", CFSTR("Width")), "unsignedIntValue");
    v9 = objc_msgSend(-[__CFDictionary valueForKey:](PixelBufferAttributes, "valueForKey:", CFSTR("Height")), "unsignedIntValue");
    p_largePoolSize->width = v8;
    p_largePoolSize->height = (double)v9;
  }
}

- (__CVPixelBufferPool)smallPool
{
  return self->_smallPool;
}

- (__CVPixelBufferPool)largePool
{
  return self->_largePool;
}

- (PBCoreImageContext)initWithOptions:(id)a3
{
  PBCoreImageContext *v4;
  EAGLContext *v5;
  CVReturn v6;
  CIContext *v7;
  CIContext *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PBCoreImageContext;
  v4 = -[PBContext init](&v10, "init");
  if (v4)
  {
    v5 = (EAGLContext *)objc_msgSend(objc_alloc((Class)EAGLContext), "initWithAPI:", 2);
    v4->_glesContext = v5;
    +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", v5);
    v6 = CVOpenGLESTextureCacheCreate(kCFAllocatorDefault, 0, v4->_glesContext, 0, &v4->_textureCache);
    v4->_inputPixelBuffer = 0;
    v4->_outputPixelBuffer = 0;
    v4->_inputTexture = 0;
    v4->_outputTexture = 0;
    if (v6)
      NSLog(CFSTR("CVOpenGLESTextureCacheCreate() failed!"));
    if (!objc_msgSend(a3, "objectForKey:", kCIContextWorkingColorSpace))
    {
      a3 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a3);
      objc_msgSend(a3, "setValue:forKey:", +[NSNull null](NSNull, "null"), kCIContextWorkingColorSpace);
    }
    v7 = +[CIContext contextWithEAGLContext:options:](CIContext, "contextWithEAGLContext:options:", v4->_glesContext, a3);
    v4->_ciContext = v7;
    v8 = v7;
  }
  return v4;
}

- (void)dealloc
{
  __CVBuffer *inputTexture;
  __CVBuffer *outputTexture;
  __CVBuffer *inputPixelBuffer;
  __CVBuffer *outputPixelBuffer;
  objc_super v7;

  inputTexture = self->_inputTexture;
  if (inputTexture)
  {
    CFRelease(inputTexture);
    self->_inputTexture = 0;
  }
  outputTexture = self->_outputTexture;
  if (outputTexture)
  {
    CFRelease(outputTexture);
    self->_outputTexture = 0;
  }
  CVOpenGLESTextureCacheFlush(self->_textureCache, 0);
  CFRelease(self->_textureCache);
  +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", 0);

  -[PBCoreImageContext setSmallPool:](self, "setSmallPool:", 0);
  -[PBCoreImageContext setLargePool:](self, "setLargePool:", 0);

  inputPixelBuffer = self->_inputPixelBuffer;
  if (inputPixelBuffer)
  {
    CVPixelBufferRelease(inputPixelBuffer);
    self->_inputPixelBuffer = 0;
  }
  outputPixelBuffer = self->_outputPixelBuffer;
  if (outputPixelBuffer)
  {
    CVPixelBufferRelease(outputPixelBuffer);
    self->_outputPixelBuffer = 0;
  }
  if (self->_outputImageQueue)
  {
    CAImageQueueConsumeUnconsumedInRange(-INFINITY, INFINITY);
    CAImageQueueCollect(self->_outputImageQueue);
  }
  v7.receiver = self;
  v7.super_class = (Class)PBCoreImageContext;
  -[PBCoreImageContext dealloc](&v7, "dealloc");
}

- (id)ciContext
{
  return self->_ciContext;
}

- (void)setInputPixelBuffer:(__CVBuffer *)a3
{
  -[PBCoreImageContext setInputPixelBuffer:mapTexture:](self, "setInputPixelBuffer:mapTexture:", a3, 1);
}

- (void)setInputPixelBuffer:(__CVBuffer *)a3 mapTexture:(BOOL)a4
{
  _BOOL4 v4;
  __CVBuffer *v7;
  __CVOpenGLESTextureCache *textureCache;
  GLsizei Width;
  GLsizei Height;
  __CVBuffer **p_inputTexture;
  GLuint v12;
  GLuint Name;

  v4 = a4;
  if (a3)
  {
    v7 = CVPixelBufferRetain(a3);
    self->_inputPixelBuffer = v7;
    CVPixelBufferLockBaseAddress(v7, 0);
    if (v4)
    {
      +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", self->_glesContext);
      textureCache = self->_textureCache;
      Width = CVPixelBufferGetWidth(a3);
      Height = CVPixelBufferGetHeight(a3);
      p_inputTexture = &self->_inputTexture;
      if (CVOpenGLESTextureCacheCreateTextureFromImage(kCFAllocatorDefault, textureCache, a3, 0, 0xDE1u, 6408, Width, Height, 0x80E1u, 0x1401u, 0, p_inputTexture))
      {
        NSLog(CFSTR("CVOpenGLESTextureCacheCreateTextureFromImage failed!"));
        *p_inputTexture = 0;
      }
      else
      {
        Name = CVOpenGLESTextureGetName(*p_inputTexture);
        glBindTexture(0xDE1u, Name);
        glTexParameteri(0xDE1u, 0x2801u, 9729);
        glTexParameteri(0xDE1u, 0x2800u, 9729);
        glTexParameteri(0xDE1u, 0x2802u, 33071);
        glTexParameteri(0xDE1u, 0x2803u, 33071);
        glFlush();
      }
    }
  }
  else
  {
    CVPixelBufferUnlockBaseAddress(self->_inputPixelBuffer, 0);
    CFRelease(self->_inputPixelBuffer);
    self->_inputPixelBuffer = 0;
    if (v4)
    {
      +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", self->_glesContext);
      v12 = CVOpenGLESTextureGetName(self->_inputTexture);
      glBindTexture(0xDE1u, v12);
      CFRelease(self->_inputTexture);
      self->_inputTexture = 0;
      CVOpenGLESTextureCacheFlush(self->_textureCache, 0);
    }
  }
}

- (__CVBuffer)inputPixelBuffer
{
  return self->_inputPixelBuffer;
}

- (void)setOutputPixelBuffer:(__CVBuffer *)a3
{
  -[PBCoreImageContext setOutputPixelBuffer:mapTexture:](self, "setOutputPixelBuffer:mapTexture:", a3, 1);
}

- (void)setOutputPixelBuffer:(__CVBuffer *)a3 mapTexture:(BOOL)a4
{
  _BOOL4 v4;
  __CVBuffer *v7;
  __CVOpenGLESTextureCache *textureCache;
  GLsizei Width;
  GLsizei Height;
  __CVBuffer **p_outputTexture;
  GLuint v12;
  GLuint Name;

  v4 = a4;
  if (a3)
  {
    v7 = CVPixelBufferRetain(a3);
    self->_outputPixelBuffer = v7;
    CVPixelBufferLockBaseAddress(v7, 0);
    if (v4)
    {
      +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", self->_glesContext);
      textureCache = self->_textureCache;
      Width = CVPixelBufferGetWidth(a3);
      Height = CVPixelBufferGetHeight(a3);
      p_outputTexture = &self->_outputTexture;
      if (CVOpenGLESTextureCacheCreateTextureFromImage(kCFAllocatorDefault, textureCache, a3, 0, 0xDE1u, 6408, Width, Height, 0x80E1u, 0x1401u, 0, p_outputTexture))
      {
        NSLog(CFSTR("CVOpenGLESTextureCacheCreateTextureFromImage failed!"));
      }
      else
      {
        Name = CVOpenGLESTextureGetName(*p_outputTexture);
        glBindTexture(0xDE1u, Name);
        glTexParameteri(0xDE1u, 0x2801u, 9729);
        glTexParameteri(0xDE1u, 0x2800u, 9729);
        glTexParameteri(0xDE1u, 0x2802u, 33071);
        glTexParameteri(0xDE1u, 0x2803u, 33071);
        glFlush();
      }
    }
  }
  else
  {
    CVPixelBufferUnlockBaseAddress(self->_outputPixelBuffer, 0);
    CFRelease(self->_outputPixelBuffer);
    self->_outputPixelBuffer = 0;
    if (v4)
    {
      +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", self->_glesContext);
      v12 = CVOpenGLESTextureGetName(self->_outputTexture);
      glBindTexture(0xDE1u, v12);
      CFRelease(self->_outputTexture);
      self->_outputTexture = 0;
      CVOpenGLESTextureCacheFlush(self->_textureCache, 0);
    }
  }
}

- (__CVBuffer)outputPixelBuffer
{
  return self->_outputPixelBuffer;
}

- (unsigned)inputTexture
{
  __CVBuffer *inputTexture;

  inputTexture = self->_inputTexture;
  if (inputTexture)
    LODWORD(inputTexture) = CVOpenGLESTextureGetName(inputTexture);
  return inputTexture;
}

- (unsigned)outputTexture
{
  __CVBuffer *outputTexture;

  outputTexture = self->_outputTexture;
  if (outputTexture)
    LODWORD(outputTexture) = CVOpenGLESTextureGetName(outputTexture);
  return outputTexture;
}

- (void)setRender9Up:(BOOL)a3
{
  self->_render9Up = a3;
}

- (BOOL)render9Up
{
  return self->_render9Up;
}

- (void)setRenderForSave:(BOOL)a3
{
  self->_renderForSave = a3;
}

- (BOOL)renderForSave
{
  return self->_renderForSave;
}

- (void)setOutputSize:(CGSize)a3
{
  self->_outputSize = a3;
}

- (CGSize)outputSize
{
  double width;
  double height;
  CGSize result;

  width = self->_outputSize.width;
  height = self->_outputSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (_CAImageQueue)outputImageQueue
{
  return self->_outputImageQueue;
}

- (void)setOutputImageQueue:(_CAImageQueue *)a3
{
  _CAImageQueue *outputImageQueue;
  BOOL v6;

  outputImageQueue = self->_outputImageQueue;
  if (outputImageQueue)
    v6 = outputImageQueue == a3;
  else
    v6 = 1;
  if (!v6)
  {
    CAImageQueueConsumeUnconsumedInRange(-INFINITY, INFINITY);
    CAImageQueueCollect(self->_outputImageQueue);
  }
  self->_outputImageQueue = a3;
}

- (__CVBuffer)createCVPixelBufferForFilter:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 mirrored:(BOOL)a5
{
  _BOOL8 v5;
  size_t Width;
  size_t Height;
  __CVBuffer *v12;

  v5 = a5;
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  v12 = 0;
  FigCreateIOSurfaceBackedCVPixelBuffer(Width, Height, 1111970369, &v12);
  if (v12)
  {
    -[PBCoreImageContext setInputPixelBuffer:](self, "setInputPixelBuffer:", a4);
    -[PBCoreImageContext setOutputPixelBuffer:mapTexture:](self, "setOutputPixelBuffer:mapTexture:", v12, 0);
    -[PBCoreImageContext setRender9Up:](self, "setRender9Up:", 0);
    -[PBCoreImageContext setRenderForSave:](self, "setRenderForSave:", 1);
    objc_msgSend(a3, "renderWithContext:inputSize:outputRect:mirrored:", self, v5, (double)Width, (double)Height, 0.0, 0.0, (double)Width, (double)Height);
    -[PBCoreImageContext setInputPixelBuffer:](self, "setInputPixelBuffer:", 0);
    -[PBCoreImageContext setOutputPixelBuffer:mapTexture:](self, "setOutputPixelBuffer:mapTexture:", 0, 0);
    -[PBCoreImageContext setRender9Up:](self, "setRender9Up:", 0);
    -[PBCoreImageContext setRenderForSave:](self, "setRenderForSave:", 0);
    return v12;
  }
  else
  {
    NSLog(CFSTR("FigCreateIOSurfaceBackedCVPixelBuffer() failed!"));
    return 0;
  }
}

- (void)renderFilter:(id)a3 inputPixelBuffer:(__CVBuffer *)a4
{
  -[PBCoreImageContext renderFilter:inputPixelBuffer:mirrored:](self, "renderFilter:inputPixelBuffer:mirrored:", a3, a4, 0);
}

- (void)renderFilter:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 mirrored:(BOOL)a5
{
  _BOOL8 v6;
  size_t Width;
  size_t Height;
  double v11;
  unsigned int v12;
  double v13;
  double v14;
  IOSurfaceRef IOSurface;
  uint64_t v16;
  CVPixelBufferRef pixelBuffer;

  if (a4)
  {
    if (self->_outputImageQueue)
    {
      v6 = a5;
      Width = CVPixelBufferGetWidth(a4);
      Height = CVPixelBufferGetHeight(a4);
      v11 = (double)CAImageQueueGetWidth(self->_outputImageQueue);
      CAImageQueueGetHeight(self->_outputImageQueue);
      v13 = (double)v12;
      pixelBuffer = 0;
      -[PBCoreImageContext _createPixelBuffer:withSize:](self, "_createPixelBuffer:withSize:", &pixelBuffer, v11, (double)v12);
      if (pixelBuffer)
      {
        v14 = (double)Width;
        IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
        -[PBCoreImageContext setInputPixelBuffer:](self, "setInputPixelBuffer:", a4);
        -[PBCoreImageContext setOutputPixelBuffer:](self, "setOutputPixelBuffer:", pixelBuffer);
        -[PBCoreImageContext setRender9Up:](self, "setRender9Up:", 0);
        -[PBCoreImageContext setRenderForSave:](self, "setRenderForSave:", 0);
        objc_msgSend(a3, "renderWithContext:inputSize:outputRect:mirrored:", self, v6, v14, (double)Height, 0.0, 0.0, v11, v13);
        -[PBCoreImageContext setInputPixelBuffer:](self, "setInputPixelBuffer:", 0);
        -[PBCoreImageContext setOutputPixelBuffer:](self, "setOutputPixelBuffer:", 0);
        -[PBCoreImageContext setRender9Up:](self, "setRender9Up:", 0);
        -[PBCoreImageContext setRenderForSave:](self, "setRenderForSave:", 0);
        if (CAImageQueueCollect(self->_outputImageQueue))
        {
          v16 = CAImageQueueRegisterIOSurfaceBuffer(self->_outputImageQueue, IOSurface, 0);
          CAImageQueueInsertImage(self->_outputImageQueue, 3, v16, 3, sub_100019CF8, self->_outputImageQueue, -1.0e100);
        }
        CVPixelBufferRelease(pixelBuffer);
      }
    }
  }
}

- (void)renderNineUp:(id)a3 inputPixelBuffer:(__CVBuffer *)a4
{
  -[PBCoreImageContext renderNineUp:inputPixelBuffer:mirrored:](self, "renderNineUp:inputPixelBuffer:mirrored:", a3, a4, 0);
}

- (void)renderNineUp:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 mirrored:(BOOL)a5
{
  _BOOL8 v6;
  size_t Width;
  size_t Height;
  double v11;
  double v12;
  double v13;
  double v14;
  IOSurfaceRef IOSurface;
  signed int v16;
  uint64_t v17;
  uint64_t i;
  uint64_t j;
  uint64_t v20;
  CVPixelBufferRef pixelBufferOut;

  if (a4)
  {
    if (self->_outputImageQueue)
    {
      v6 = a5;
      Width = CVPixelBufferGetWidth(a4);
      Height = CVPixelBufferGetHeight(a4);
      pixelBufferOut = 0;
      CVPixelBufferPoolCreatePixelBuffer(kCFAllocatorDefault, self->_largePool, &pixelBufferOut);
      if (pixelBufferOut)
      {
        v11 = (double)Height;
        v12 = (double)Width;
        v13 = (double)CVPixelBufferGetWidth(pixelBufferOut);
        v14 = (double)CVPixelBufferGetHeight(pixelBufferOut);
        IOSurface = CVPixelBufferGetIOSurface(pixelBufferOut);
        v16 = objc_msgSend(a3, "count");
        -[PBCoreImageContext setInputPixelBuffer:](self, "setInputPixelBuffer:", a4);
        -[PBCoreImageContext setOutputPixelBuffer:](self, "setOutputPixelBuffer:", pixelBufferOut);
        -[PBCoreImageContext setRender9Up:](self, "setRender9Up:", 1);
        -[PBCoreImageContext setRenderForSave:](self, "setRenderForSave:", 0);
        -[PBCoreImageContext setOutputSize:](self, "setOutputSize:", v13, v14);
        v17 = 0;
        for (i = 0; i != 3; ++i)
        {
          for (j = 0; j != 3; ++j)
          {
            if (v17 + j < v16)
              objc_msgSend(objc_msgSend(a3, "objectAtIndex:"), "renderWithContext:inputSize:outputRect:mirrored:", self, v6, v12, v11, v13 / 3.0 * (double)(int)j, v14 / 3.0 * (double)(2 - (int)i), v13 / 3.0, v14 / 3.0);
          }
          v17 += 3;
        }
        -[PBCoreImageContext setInputPixelBuffer:](self, "setInputPixelBuffer:", 0);
        -[PBCoreImageContext setOutputPixelBuffer:](self, "setOutputPixelBuffer:", 0);
        -[PBCoreImageContext setRender9Up:](self, "setRender9Up:", 0);
        -[PBCoreImageContext setRenderForSave:](self, "setRenderForSave:", 0);
        if (CAImageQueueCollect(self->_outputImageQueue))
        {
          v20 = CAImageQueueRegisterIOSurfaceBuffer(self->_outputImageQueue, IOSurface, 0);
          CAImageQueueInsertImage(self->_outputImageQueue, 3, v20, 3, sub_100019CF8, self->_outputImageQueue, -1.0e100);
        }
        CVPixelBufferRelease(pixelBufferOut);
      }
    }
  }
}

- (void)_createPixelBuffer:(__CVBuffer *)a3 withSize:(CGSize)a4
{
  __CVPixelBufferPool *smallPool;

  smallPool = self->_smallPool;
  if (*(_OWORD *)&self->_smallPool == 0)
  {
    *a3 = 0;
  }
  else
  {
    if (a4.width == self->_largePoolSize.width && a4.height == self->_largePoolSize.height)
      smallPool = self->_largePool;
    CVPixelBufferPoolCreatePixelBuffer(kCFAllocatorDefault, smallPool, a3);
  }
}

@end
