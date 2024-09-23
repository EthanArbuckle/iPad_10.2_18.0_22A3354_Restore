@implementation SIPixelBuffer

- (SIPixelBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3
{
  SIPixelBuffer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SIPixelBuffer;
  v4 = -[SIPixelBuffer init](&v6, sel_init);
  if (v4)
    v4->_pixelBuffer = CVPixelBufferRetain(a3);
  return v4;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *pixelBuffer;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer != a3)
  {
    CVPixelBufferRelease(pixelBuffer);
    self->_pixelBuffer = CVPixelBufferRetain(a3);
  }
}

- (SIPixelBuffer)initWithResolution:(CGSize)a3 pixelformat:(unsigned int)a4
{
  double height;
  double width;
  SIPixelBuffer *v7;
  CVPixelBufferRef v8;
  SIPixelBuffer *v9;
  NSObject *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  height = a3.height;
  width = a3.width;
  v24 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)SIPixelBuffer;
  v7 = -[SIPixelBuffer init](&v13, sel_init);
  if (v7
    && (v8 = SICreateCVPixelBufferWithCustomStride((unint64_t)width, (unint64_t)height, a4, 0, 1),
        (v7->_pixelBuffer = v8) == 0))
  {
    __SceneIntelligenceLogSharedInstance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      SIPixelFormatToStr(a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136381699;
      v15 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      v16 = 1025;
      v17 = 44;
      v18 = 2048;
      v19 = width;
      v20 = 2048;
      v21 = height;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_21071A000, v10, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create the buffer - (%f, %f), formate=%@ ***", buf, 0x30u);

    }
    v9 = 0;
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)SIPixelBuffer;
  -[SIPixelBuffer dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

@end
