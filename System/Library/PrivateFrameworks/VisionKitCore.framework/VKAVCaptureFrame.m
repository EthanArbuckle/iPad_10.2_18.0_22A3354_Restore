@implementation VKAVCaptureFrame

- (void)dealloc
{
  objc_super v3;

  -[VKAVCaptureFrame setSampleBuffer:](self, "setSampleBuffer:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VKAVCaptureFrame;
  -[VKAVCaptureFrame dealloc](&v3, sel_dealloc);
}

- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  opaqueCMSampleBuffer *sampleBuffer;

  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer != a3)
  {
    if (sampleBuffer)
      CFRelease(sampleBuffer);
    if (a3)
      CFRetain(a3);
    self->_sampleBuffer = a3;
  }
}

- (id)imageRequestHandler
{
  id v3;
  opaqueCMSampleBuffer *v4;
  uint64_t v5;

  v3 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v4 = -[VKAVCaptureFrame sampleBuffer](self, "sampleBuffer");
  v5 = -[VKAVCaptureFrame orientation](self, "orientation");
  return (id)objc_msgSend(v3, "initWithCMSampleBuffer:orientation:options:", v4, v5, MEMORY[0x1E0C9AA70]);
}

- (__CVBuffer)CVImageBuffer
{
  return CMSampleBufferGetImageBuffer(-[VKAVCaptureFrame sampleBuffer](self, "sampleBuffer"));
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

@end
