@implementation PXGRenderFrame

- (PXGRenderFrame)initWithFrameID:(int64_t)a3 pixelBuffer:(__CVBuffer *)a4
{
  PXGRenderFrame *v7;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXGRenderFrame;
  v7 = -[PXGRenderFrame init](&v10, sel_init);
  if (v7)
  {
    if (!a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PXGHostingController.m"), 520, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pixelBuffer != nil"));

    }
    v7->_frameID = a3;
    v7->_pixelBuffer = CVPixelBufferRetain(a4);
  }
  return v7;
}

- (CGSize)size
{
  double Width;
  double Height;
  double v5;
  CGSize result;

  Width = (double)CVPixelBufferGetWidth(self->_pixelBuffer);
  Height = (double)CVPixelBufferGetHeight(self->_pixelBuffer);
  v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)PXGRenderFrame;
  -[PXGRenderFrame dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)pixelBuffer
{
  CVPixelBufferRef v2;

  v2 = CVPixelBufferRetain(self->_pixelBuffer);
  CFAutorelease(v2);
  return v2;
}

- (int64_t)frameID
{
  return self->_frameID;
}

@end
