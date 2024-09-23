@implementation VFXCaptureDeviceSource

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
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  __CVMetalTextureCache *textureCache;
  objc_super v9;

  objc_msgSend_stopRunning(self->_captureSession, a2, v2, v3);

  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  objc_msgSend_discardVideoData(self, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)VFXCaptureDeviceSource;
  -[VFXTextureSource dealloc](&v9, sel_dealloc);
}

- (void)setCaptureDevice:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  if (self->_captureDevice != a3)
  {
    objc_msgSend_stopRunning(self->_captureSession, a2, (uint64_t)a3, v3);

    self->_captureSession = 0;
    self->_captureDevice = (AVCaptureDevice *)a3;
    self->_isFront = objc_msgSend_position(a3, v6, v7, v8) == 2;
  }
}

- (AVCaptureDevice)captureDevice
{
  return self->_captureDevice;
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

  sub_1B181F31C((uint64_t)a3, self, 2, v3, v4, v5, v6, v7);
  v15[0] = xmmword_1E63D9AB0;
  v15[1] = *(_OWORD *)off_1E63D9AC0;
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
  MTLTexture *mtlTexture;
  __CVBuffer *pixelBuffer;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const __CFDictionary *v25;
  signed int PixelFormatType;
  int v27;
  void *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  AVCaptureSession *v38;
  const char *v39;
  uint64_t v40;
  id v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  MTLPixelFormat v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  MTLTexture *Texture;
  MTLTexture *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  __IOSurface *v74;
  OSType v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  CVMetalTextureRef *textureOut;
  CVMetalTextureRef image;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  _QWORD v88[2];

  v88[1] = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (!self->_mtlTexture)
  {
    if (!self->_captureSession)
    {
      v28 = (void *)sub_1B1813BC4((uint64_t)a3, v9, v10, v11, v12, v13, v14, v15);
      image = 0;
      v29 = objc_alloc(MEMORY[0x1E0C8B0B0]);
      v37 = (void *)objc_msgSend_initWithDevice_error_(v29, v30, (uint64_t)self->_captureDevice, (uint64_t)&image);
      if (image)
      {
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: Could not create AVCaptureInput with error: %@"), v31, v32, v33, v34, v35, v36, (uint64_t)image);

        goto LABEL_28;
      }
      v38 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x1E0C8B108]);
      self->_captureSession = v38;
      objc_msgSend_addInput_(v38, v39, (uint64_t)v37, v40);

      v41 = objc_alloc_init(MEMORY[0x1E0C8B168]);
      v87 = *MEMORY[0x1E0CA9040];
      v88[0] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v42, 875704438, v43);
      v45 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v44, (uint64_t)v88, (uint64_t)&v87, 1);
      objc_msgSend_setVideoSettings_(v41, v46, v45, v47);
      v51 = objc_msgSend_resourceQueue(v28, v48, v49, v50);
      objc_msgSend_setSampleBufferDelegate_queue_(v41, v52, (uint64_t)self, v51);
      objc_msgSend_addOutput_(self->_captureSession, v53, (uint64_t)v41, v54);
      objc_msgSend_commitConfiguration(self->_captureSession, v55, v56, v57);
      objc_msgSend_startRunning(self->_captureSession, v58, v59, v60);
    }
    pixelBuffer = self->_pixelBuffer;
    if (pixelBuffer)
    {
      if (!self->_textureCache)
      {
        v19 = (void *)sub_1B1813BC4((uint64_t)a3, v9, v10, v11, v12, v13, v14, v15);
        v23 = (void *)objc_msgSend_device(v19, v20, v21, v22);
        v85 = *MEMORY[0x1E0CA8F58];
        v86 = &unk_1E64783D0;
        v25 = (const __CFDictionary *)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)&v86, (uint64_t)&v85, 1);
        CVMetalTextureCacheCreate(0, 0, v23, v25, &self->_textureCache);
        pixelBuffer = self->_pixelBuffer;
      }
      PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
      if (PixelFormatType > 1111970368)
      {
        if (PixelFormatType == 1111970369)
        {
          v27 = 1;
          goto LABEL_21;
        }
        if (PixelFormatType == 1380410945)
        {
          v27 = 2;
          goto LABEL_21;
        }
      }
      else
      {
        if (PixelFormatType == 875704422)
        {
          v27 = 4;
          goto LABEL_21;
        }
        if (PixelFormatType == 875704438)
        {
          v27 = 3;
LABEL_21:
          v61 = *(_QWORD *)&asc_1B22683C8[24 * v27 + 16];
          image = 0;
          v62 = CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x1E0C9AE00], self->_textureCache, self->_pixelBuffer, 0, v61, self->_width, self->_height, 0, &image);
          if ((_DWORD)v62)
          {
            sub_1B17C4408(16, (uint64_t)CFSTR("Error: CVMetalTextureCacheCreateTextureFromImage failed with status %d"), v63, v64, v65, v66, v67, v68, v62);
          }
          else
          {
            Texture = (MTLTexture *)CVMetalTextureGetTexture(image);
            self->_mtlTexture = Texture;
            v70 = Texture;
            v74 = (__IOSurface *)objc_msgSend_iosurface(self->_mtlTexture, v71, v72, v73);
            if (v74)
              IOSurfaceIncrementUseCount(v74);
            CFRelease(image);
          }
          v16 = ($96EE1C12479E9B303E9C2794B92A11A2)257;
          goto LABEL_3;
        }
      }
      v75 = CVPixelBufferGetPixelFormatType(self->_pixelBuffer);
      LOBYTE(image) = HIBYTE(v75);
      BYTE1(image) = BYTE2(v75);
      BYTE2(image) = BYTE1(v75);
      *(_WORD *)((char *)&image + 3) = v75;
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: Invalid pixel buffer pixel format: %s"), v76, v77, v78, v79, v80, v81, (uint64_t)&image);
    }
    else
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: Could not get pixel buffer (CVPixelBufferRef)"), v10, v11, v12, v13, v14, v15, (uint64_t)textureOut);
    }
LABEL_28:
    mtlTexture = 0;
    goto LABEL_29;
  }
  v16 = ($96EE1C12479E9B303E9C2794B92A11A2)256;
LABEL_3:
  *a6 = v16;
  mtlTexture = self->_mtlTexture;
LABEL_29:
  objc_sync_exit(self);
  return mtlTexture;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CVBuffer *ImageBuffer;
  __CVBuffer *pixelBuffer;
  uint64_t v16;

  objc_sync_enter(self);
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  if (ImageBuffer)
  {
    objc_msgSend_discardVideoData(self, v7, v8, v9);
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
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Could not get pixel buffer (CVPixelBufferRef)"), v8, v9, v10, v11, v12, v13, v16);
  }
  objc_sync_exit(self);
}

@end
