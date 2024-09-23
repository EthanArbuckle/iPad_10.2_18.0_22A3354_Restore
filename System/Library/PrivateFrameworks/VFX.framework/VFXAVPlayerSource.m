@implementation VFXAVPlayerSource

- (VFXAVPlayerSource)init
{
  VFXAVPlayerSource *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXAVPlayerSource;
  result = -[VFXAVPlayerSource init](&v3, sel_init);
  if (result)
    result->_videoSourceFormat = 0;
  return result;
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

- (void)setVideoSourceFormat:(unsigned __int8)a3
{
  uint64_t v3;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (self->_videoSourceFormat != a3)
  {
    v5 = &asc_1B22683C8[24 * a3];
    v6 = *(unsigned int *)v5;
    self->_texturePixelFormat = *((_QWORD *)v5 + 2);
    v14[0] = MEMORY[0x1E0C9AAB0];
    v7 = *MEMORY[0x1E0CA9040];
    v13[0] = *MEMORY[0x1E0CA9010];
    v13[1] = v7;
    v14[1] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], a2, v6, v3);
    v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v14, (uint64_t)v13, 2);

    v10 = objc_alloc(MEMORY[0x1E0C8B328]);
    self->_videoOutput = (AVPlayerItemVideoOutput *)objc_msgSend_initWithPixelBufferAttributes_(v10, v11, v9, v12);
  }
}

- (void)registerPlayer:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;

  v6 = (void *)objc_msgSend_currentItem(a3, a2, (uint64_t)a3, v3);
  v10 = (void *)objc_msgSend_asset(v6, v7, v8, v9);
  v13 = (void *)objc_msgSend_tracksWithMediaCharacteristic_(v10, v11, *MEMORY[0x1E0C8A700], v12);
  if (objc_msgSend_count(v13, v14, v15, v16))
    objc_msgSend_setVideoSourceFormat_(self, v17, 1, v18);
  else
    objc_msgSend_setVideoSourceFormat_(self, v17, 4, v18);
  v22 = (void *)objc_msgSend_currentItem(a3, v19, v20, v21);
  objc_msgSend_addOutput_(v22, v23, (uint64_t)self->_videoOutput, v24);
}

- (void)unregisterPlayer:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_currentItem(a3, a2, (uint64_t)a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_removeOutput_, self->_videoOutput, v6);
}

- (void)dealloc
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  __CVMetalTextureCache *textureCache;
  objc_super v8;

  objc_msgSend_unregisterPlayer_(self, a2, (uint64_t)self->_player, v2);

  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  objc_msgSend_discardVideoData(self, v4, v5, v6);
  v8.receiver = self;
  v8.super_class = (Class)VFXAVPlayerSource;
  -[VFXTextureSource dealloc](&v8, sel_dealloc);
}

- (void)setPlayer:(id)a3
{
  uint64_t v3;
  AVPlayer *player;
  AVPlayer *v7;
  uint64_t v8;

  player = self->_player;
  if (player != a3)
  {
    objc_msgSend_unregisterPlayer_(self, a2, (uint64_t)player, v3);

    v7 = (AVPlayer *)a3;
    self->_player = v7;
    MEMORY[0x1E0DE7D20](self, sel_registerPlayer_, v7, v8);
  }
}

- (AVPlayer)player
{
  return self->_player;
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

  sub_1B181F31C((uint64_t)a3, self, 1, v3, v4, v5, v6, v7);
  v15[0] = xmmword_1E63D9A90;
  v15[1] = *(_OWORD *)&off_1E63D9AA0;
  sub_1B181F3A4((uint64_t)a3, (uint64_t)v15, v9, v10, v11, v12, v13, v14);
}

- (id)metalTextureWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  AVPlayerItemVideoOutput *videoOutput;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  AVPlayerItemVideoOutput *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  AVPlayerItemVideoOutput *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  __CVBuffer *v25;
  __CVBuffer *pixelBuffer;
  $96EE1C12479E9B303E9C2794B92A11A2 v27;
  __CVMetalTextureCache *textureCache;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const __CFDictionary *v36;
  uint64_t TextureFromImage;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  MTLTexture *Texture;
  MTLTexture *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  __IOSurface *v49;
  CVMetalTextureRef *textureOut;
  CVMetalTextureRef image[2];
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v53 = 0uLL;
  v54 = 0;
  videoOutput = self->_videoOutput;
  v13 = sub_1B1815800((uint64_t)a3);
  if (videoOutput)
  {
    objc_msgSend_itemTimeForHostTime_(videoOutput, v10, v11, v12, v13);
  }
  else
  {
    v53 = 0uLL;
    v54 = 0;
  }
  v14 = self->_videoOutput;
  *(_OWORD *)image = v53;
  v52 = v54;
  if (objc_msgSend_hasNewPixelBufferForItemTime_(v14, v10, (uint64_t)image, v12))
  {
    v21 = self->_videoOutput;
    *(_OWORD *)image = v53;
    v52 = v54;
    v22 = objc_msgSend_copyPixelBufferForItemTime_itemTimeForDisplay_(v21, v15, (uint64_t)image, 0);
    if (v22)
    {
      v25 = (__CVBuffer *)v22;
      objc_msgSend_discardVideoData(self, v23, v24, v16);
      self->_pixelBuffer = v25;
      self->_width = CVPixelBufferGetWidth(v25);
      self->_height = CVPixelBufferGetHeight(self->_pixelBuffer);
    }
  }
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    if (self->_mtlTexture)
    {
      v27 = ($96EE1C12479E9B303E9C2794B92A11A2)256;
    }
    else
    {
      textureCache = self->_textureCache;
      if (!textureCache)
      {
        v30 = (void *)sub_1B1813BC4((uint64_t)a3, 0, (uint64_t)pixelBuffer, v16, v17, v18, v19, v20);
        v34 = (void *)objc_msgSend_device(v30, v31, v32, v33);
        v55 = *MEMORY[0x1E0CA8F58];
        v56[0] = &unk_1E64783D0;
        v36 = (const __CFDictionary *)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v35, (uint64_t)v56, (uint64_t)&v55, 1);
        CVMetalTextureCacheCreate(0, 0, v34, v36, &self->_textureCache);
        textureCache = self->_textureCache;
        pixelBuffer = self->_pixelBuffer;
      }
      image[0] = 0;
      TextureFromImage = CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x1E0C9AE00], textureCache, pixelBuffer, 0, (MTLPixelFormat)self->_texturePixelFormat, self->_width, self->_height, 0, image);
      if ((_DWORD)TextureFromImage)
      {
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: CVMetalTextureCacheCreateTextureFromImage failed with status %d"), v38, v39, v40, v41, v42, v43, TextureFromImage);
      }
      else
      {
        Texture = (MTLTexture *)CVMetalTextureGetTexture(image[0]);
        self->_mtlTexture = Texture;
        v45 = Texture;
        v49 = (__IOSurface *)objc_msgSend_iosurface(self->_mtlTexture, v46, v47, v48);
        if (v49)
          IOSurfaceIncrementUseCount(v49);
        CFRelease(image[0]);
      }
      v27 = ($96EE1C12479E9B303E9C2794B92A11A2)257;
    }
    *a6 = v27;
    return self->_mtlTexture;
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Could not get pixel buffer (CVPixelBufferRef)"), 0, v16, v17, v18, v19, v20, (uint64_t)textureOut);
    return 0;
  }
}

@end
