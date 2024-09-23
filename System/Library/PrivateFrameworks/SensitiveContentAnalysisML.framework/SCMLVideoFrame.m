@implementation SCMLVideoFrame

- (SCMLVideoFrame)initWithFrameBuffer:(opaqueCMSampleBuffer *)a3 frameIndex:(int64_t)a4
{
  SCMLVideoFrame *v6;
  SCMLVideoFrame *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCMLVideoFrame;
  v6 = -[SCMLVideoFrame init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_frameBuffer = 0;
    if (a3)
      v6->_frameBuffer = (opaqueCMSampleBuffer *)CFRetain(a3);
    v7->_frameIndex = a4;
  }
  return v7;
}

- (BOOL)saveToPngWithUrl:(id)a3
{
  id v4;
  __CVBuffer *ImageBuffer;
  char v6;
  NSObject *v7;

  v4 = a3;
  ImageBuffer = CMSampleBufferGetImageBuffer(-[SCMLVideoFrame frameBuffer](self, "frameBuffer"));
  if (ImageBuffer)
  {
    v6 = saveCVPixelBufferToPng(ImageBuffer, v4);
  }
  else
  {
    +[SCMLLog imageAnalyzer](SCMLLog, "imageAnalyzer");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCMLVideoFrame saveToPngWithUrl:].cold.1((uint64_t)v4, v7);

    v6 = 0;
  }

  return v6;
}

- (double)_timestamp
{
  CMTime v3;

  memset(&v3, 0, sizeof(v3));
  CMSampleBufferGetPresentationTimeStamp(&v3, -[SCMLVideoFrame frameBuffer](self, "frameBuffer"));
  return (double)v3.value / (double)v3.timescale;
}

- (id)metaDataInfo
{
  void *v3;
  unint64_t v4;
  uint64_t v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[SCMLVideoFrame frameIndex](self, "frameIndex");
  -[SCMLVideoFrame _timestamp](self, "_timestamp");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%03d-time%.6f"), v4, v5);
}

- (void)dealloc
{
  opaqueCMSampleBuffer *frameBuffer;
  objc_super v4;

  frameBuffer = self->_frameBuffer;
  if (frameBuffer)
    CFRelease(frameBuffer);
  v4.receiver = self;
  v4.super_class = (Class)SCMLVideoFrame;
  -[SCMLVideoFrame dealloc](&v4, sel_dealloc);
}

- (opaqueCMSampleBuffer)frameBuffer
{
  return self->_frameBuffer;
}

- (unint64_t)frameIndex
{
  return self->_frameIndex;
}

- (void)saveToPngWithUrl:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_245BFA000, a2, OS_LOG_TYPE_ERROR, "Failed to save image to %@: no pixel buffer", (uint8_t *)&v2, 0xCu);
}

@end
