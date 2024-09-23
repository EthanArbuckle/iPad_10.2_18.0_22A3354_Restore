@implementation VFXCaptureDeviceOutputConsumerSource

- (VFXCaptureDeviceOutputConsumerSource)init
{
  uint64_t v2;

  return (VFXCaptureDeviceOutputConsumerSource *)objc_msgSend_initWithOptions_(self, a2, 0, v2);
}

- (VFXCaptureDeviceOutputConsumerSource)initWithOptions:(id)a3
{
  const char *v4;
  uint64_t v5;
  VFXCaptureDeviceOutputConsumerSource *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VFXCaptureDeviceOutputConsumerSource;
  v6 = -[VFXCaptureDeviceOutputConsumerSource init](&v12, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v4, (uint64_t)CFSTR("VFXCaptureDeviceOutputConsumerOptionContainsAlpha"), v5);
    v6->_containsAlpha = objc_msgSend_BOOLValue(v7, v8, v9, v10);
  }
  return v6;
}

- (BOOL)containsAlpha
{
  return self->_containsAlpha;
}

- (void)discardVideoData
{
  uint64_t v2;
  uint64_t v3;
  __CVBuffer *pixelBuffer;
  __IOSurface *v6;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    CFRelease(pixelBuffer);
    self->_pixelBuffer = 0;
  }
  v6 = (__IOSurface *)objc_msgSend_iosurface(self->_mtlTexture, a2, v2, v3);
  if (v6)
    IOSurfaceDecrementUseCount(v6);

  self->_mtlTexture = 0;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  __CVMetalTextureCache *textureCache;
  objc_super v6;

  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  objc_msgSend_discardVideoData(self, a2, v2, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXCaptureDeviceOutputConsumerSource;
  -[VFXTextureSource dealloc](&v6, sel_dealloc);
}

- (void)connectToProxy:(__CFXImageProxy *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v15[2];

  sub_1B181F31C((uint64_t)a3, self, 3, v3, v4, v5, v6, v7);
  v15[0] = xmmword_1E63D9AD8;
  v15[1] = *(_OWORD *)&off_1E63D9AE8;
  sub_1B181F3A4((uint64_t)a3, (uint64_t)v15, v9, v10, v11, v12, v13, v14);
}

- (id)metalTextureWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  $96EE1C12479E9B303E9C2794B92A11A2 v16;
  __CVBuffer *pixelBuffer;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const __CFDictionary *v24;
  signed int PixelFormatType;
  int v26;
  MTLPixelFormat v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  MTLTexture *Texture;
  MTLTexture *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  __IOSurface *v40;
  MTLTexture *mtlTexture;
  OSType v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  CVMetalTextureRef image;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (!self->_mtlTexture)
  {
    pixelBuffer = self->_pixelBuffer;
    if (pixelBuffer)
    {
      if (!self->_textureCache)
      {
        v18 = (void *)sub_1B1813BC4((uint64_t)a3, v9, v10, v11, v12, v13, v14, v15);
        v22 = (void *)objc_msgSend_device(v18, v19, v20, v21);
        v51 = *MEMORY[0x1E0CA8F58];
        v52[0] = &unk_1E64783D0;
        v24 = (const __CFDictionary *)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)v52, (uint64_t)&v51, 1);
        CVMetalTextureCacheCreate(0, 0, v22, v24, &self->_textureCache);
        pixelBuffer = self->_pixelBuffer;
      }
      PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
      if (PixelFormatType > 1111970368)
      {
        if (PixelFormatType == 1111970369)
        {
          v26 = 1;
          goto LABEL_15;
        }
        if (PixelFormatType == 1380410945)
        {
          v26 = 2;
          goto LABEL_15;
        }
      }
      else
      {
        if (PixelFormatType == 875704422)
        {
          v26 = 4;
          goto LABEL_15;
        }
        if (PixelFormatType == 875704438)
        {
          v26 = 3;
LABEL_15:
          v27 = *(_QWORD *)&asc_1B22683C8[24 * v26 + 16];
          image = 0;
          v28 = CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x1E0C9AE00], self->_textureCache, self->_pixelBuffer, 0, v27, self->_width, self->_height, 0, &image);
          if ((_DWORD)v28)
          {
            sub_1B17C4408(16, (uint64_t)CFSTR("Error: CVMetalTextureCacheCreateTextureFromImage failed with status %d"), v29, v30, v31, v32, v33, v34, v28);
          }
          else
          {
            Texture = (MTLTexture *)CVMetalTextureGetTexture(image);
            self->_mtlTexture = Texture;
            v36 = Texture;
            v40 = (__IOSurface *)objc_msgSend_iosurface(self->_mtlTexture, v37, v38, v39);
            if (v40)
              IOSurfaceIncrementUseCount(v40);
            CFRelease(image);
          }
          v16 = ($96EE1C12479E9B303E9C2794B92A11A2)257;
          goto LABEL_21;
        }
      }
      v43 = CVPixelBufferGetPixelFormatType(self->_pixelBuffer);
      LOBYTE(image) = HIBYTE(v43);
      BYTE1(image) = BYTE2(v43);
      BYTE2(image) = BYTE1(v43);
      *(_WORD *)((char *)&image + 3) = v43;
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: Invalid pixel buffer pixel format: %s"), v44, v45, v46, v47, v48, v49, (uint64_t)&image);
    }
    mtlTexture = 0;
    goto LABEL_22;
  }
  v16 = ($96EE1C12479E9B303E9C2794B92A11A2)256;
LABEL_21:
  *a6 = v16;
  mtlTexture = self->_mtlTexture;
LABEL_22:
  objc_sync_exit(self);
  return mtlTexture;
}

- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setSampleBuffer_fromDevice_, a3, 0);
}

- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3 fromDevice:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  __CVBuffer *ImageBuffer;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CVBuffer *pixelBuffer;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  objc_sync_enter(self);
  if (a3)
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  else
    ImageBuffer = 0;
  if (ImageBuffer != self->_pixelBuffer)
  {
    objc_msgSend_discardVideoData(self, v7, v8, v9);
    if (a3)
    {
      if (ImageBuffer)
      {
        pixelBuffer = self->_pixelBuffer;
        if (pixelBuffer != ImageBuffer)
        {
          if (pixelBuffer)
          {
            CFRelease(pixelBuffer);
            self->_pixelBuffer = 0;
          }
          ImageBuffer = (__CVBuffer *)CFRetain(ImageBuffer);
          self->_pixelBuffer = ImageBuffer;
        }
        self->_width = CVPixelBufferGetWidth(ImageBuffer);
        self->_height = CVPixelBufferGetHeight(self->_pixelBuffer);
        self->_isFront = objc_msgSend_position(a4, v18, v19, v20) == 2;
      }
      else
      {
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: Could not get pixel buffer (CVPixelBufferRef)"), v11, v12, v13, v14, v15, v16, v21);
      }
    }
  }
  objc_sync_exit(self);
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setPixelBuffer_fromDevice_, a3, 0);
}

- (void)setPixelBuffer:(__CVBuffer *)a3 fromDevice:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  __CVBuffer *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  objc_sync_enter(self);
  if (self->_pixelBuffer != a3)
  {
    objc_msgSend_discardVideoData(self, v7, v8, v9);
    if (a3)
    {
      v10 = (__CVBuffer *)CFRetain(a3);
      self->_pixelBuffer = v10;
      self->_width = CVPixelBufferGetWidth(v10);
      self->_height = CVPixelBufferGetHeight(self->_pixelBuffer);
      self->_isFront = objc_msgSend_position(a4, v11, v12, v13) == 2;
      if (!CVPixelBufferGetIOSurface(self->_pixelBuffer))
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: Pixel buffer (CVPixelBufferRef) must be IOSurface-backed"), v14, v15, v16, v17, v18, v19, v20);
    }
  }
  objc_sync_exit(self);
}

@end
