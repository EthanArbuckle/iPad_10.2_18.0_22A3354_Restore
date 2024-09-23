@implementation PXImageQueueLayer

- (PXImageQueueLayer)init
{
  PXImageQueueLayer *v2;
  PXImageQueueLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXImageQueueLayer;
  v2 = -[PXImageQueueLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PXImageQueueLayer _commonInit](v2, "_commonInit");
  return v3;
}

- (PXImageQueueLayer)initWithLayer:(id)a3
{
  id v4;
  PXImageQueueLayer *v5;
  PXImageQueueLayer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXImageQueueLayer;
  v5 = -[PXImageQueueLayer init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PXImageQueueLayer _commonInit](v5, "_commonInit");
    if (objc_msgSend(v4, "pixelBuffer"))
    {
      objc_msgSend(v4, "pixelBuffer");
      if (!CVPixelBufferCreateFromCVImageBufferRef())
      {
        -[PXImageQueueLayer setPixelBuffer:](v6, "setPixelBuffer:", 0);
        CVPixelBufferRelease(0);
      }
    }
  }

  return v6;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  self->_imageQueue = (_CAImageQueue *)CAImageQueueCreate();
  -[PXImageQueueLayer setContentsGravity:](self, "setContentsGravity:", *MEMORY[0x1E0CD2F98]);
  -[PXImageQueueLayer setContents:](self, "setContents:", self->_imageQueue);
  v5 = CFSTR("hidden");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImageQueueLayer setActions:](self, "setActions:", v4);

}

- (void)dealloc
{
  objc_super v3;

  CAImageQueueCollect();
  CVPixelBufferRelease(self->_pixelBuffer);
  CAImageQueueInvalidate();
  CFRelease(self->_imageQueue);
  v3.receiver = self;
  v3.super_class = (Class)PXImageQueueLayer;
  -[PXImageQueueLayer dealloc](&v3, sel_dealloc);
}

- (void)display
{
  void *v3;
  objc_super v4;

  -[PXImageQueueLayer contents](self, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)PXImageQueueLayer;
  -[PXImageQueueLayer setContents:](&v4, sel_setContents_, v3);

}

- (__CVBuffer)pixelBuffer
{
  CVPixelBufferRef v2;
  __CVBuffer *v3;

  v2 = CVPixelBufferRetain(self->_pixelBuffer);
  v3 = v2;
  if (v2)
    CFAutorelease(v2);
  return v3;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v5;
  NSObject *v6;
  __CVBuffer *pixelBuffer;
  unint64_t v8;
  NSObject *v9;
  int v10;
  PXImageQueueLayer *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_pixelBuffer != a3)
  {
    v5 = CAImageQueueCollect();
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v10 = 134218240;
      v11 = self;
      v12 = 2048;
      v13 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "PXImageQueueLayer(%p) collect() returned %lu free slots", (uint8_t *)&v10, 0x16u);
    }

    pixelBuffer = self->_pixelBuffer;
    if (pixelBuffer)
    {
      CVPixelBufferRelease(pixelBuffer);
      self->_pixelBuffer = 0;
    }
    if (a3)
    {
      self->_pixelBuffer = CVPixelBufferRetain(a3);
      v8 = CAImageQueueRegisterCVImageBuffer();
      CVPixelBufferGetWidth(self->_pixelBuffer);
      CVPixelBufferGetHeight(self->_pixelBuffer);
      CAImageQueueSetSize();
      self->_pixelBufferId = v8;
      if ((CAImageQueueInsertImage() & 1) == 0)
      {
        PLUIGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = 134217984;
          v11 = self;
          _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "PXImageQueueLayer(%p) failed to enqueue image", (uint8_t *)&v10, 0xCu);
        }

      }
    }
    -[PXImageQueueLayer setHidden:](self, "setHidden:", self->_pixelBuffer == 0);
  }
}

@end
