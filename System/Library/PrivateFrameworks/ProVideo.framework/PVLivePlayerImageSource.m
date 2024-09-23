@implementation PVLivePlayerImageSource

- (PVLivePlayerImageSource)initWithURL:(id)a3
{
  const __CFURL *v4;
  PVLivePlayerImageSource *v5;
  CGImageSource *v6;
  CGImageSource *v7;
  CGImage *ImageAtIndex;
  void *v9;
  void *v10;
  PVFrameSet *v11;
  PVFrameSet *imageFrame;
  __int128 v14;
  uint64_t v15;
  CMTime v16;
  objc_super v17;

  v4 = (const __CFURL *)a3;
  v17.receiver = self;
  v17.super_class = (Class)PVLivePlayerImageSource;
  v5 = -[PVLivePlayerImageSource init](&v17, sel_init);
  if (v5)
  {
    v6 = CGImageSourceCreateWithURL(v4, 0);
    if (v6)
    {
      v7 = v6;
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, 0);
      +[PVImageBuffer imageWithCGImage:](PVImageBuffer, "imageWithCGImage:", ImageAtIndex);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CMTimeMake(&v16, 1, 1);
      v14 = *MEMORY[0x1E0CA2E68];
      v15 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      +[PVCMSampleBuffer sampleBufferWithPVImageBuffer:timestamp:frameDuration:](PVCMSampleBuffer, "sampleBufferWithPVImageBuffer:timestamp:frameDuration:", v9, &v14, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PVFrameSet initWithColorBuffer:metadata:]([PVFrameSet alloc], "initWithColorBuffer:metadata:", v10, 0);
      imageFrame = v5->_imageFrame;
      v5->_imageFrame = v11;

      if (ImageAtIndex)
        CGImageRelease(ImageAtIndex);
      CFRelease(v7);

    }
  }

  return v5;
}

- (PVLivePlayerImageSource)initWithUImage:(id)a3
{
  id v4;
  PVLivePlayerImageSource *v5;
  PVLivePlayerImageSource *v6;
  void *v7;
  void *v8;
  PVFrameSet *v9;
  PVFrameSet *imageFrame;
  __int128 v12;
  uint64_t v13;
  CMTime v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PVLivePlayerImageSource;
  v5 = -[PVLivePlayerImageSource init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    +[PVImageBuffer imageWithUIImage:](PVImageBuffer, "imageWithUIImage:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&v14, 1, 1);
    v12 = *MEMORY[0x1E0CA2E68];
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    +[PVCMSampleBuffer sampleBufferWithPVImageBuffer:timestamp:frameDuration:](PVCMSampleBuffer, "sampleBufferWithPVImageBuffer:timestamp:frameDuration:", v7, &v12, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PVFrameSet initWithColorBuffer:metadata:]([PVFrameSet alloc], "initWithColorBuffer:metadata:", v8, 0);
    imageFrame = v6->_imageFrame;
    v6->_imageFrame = v9;

  }
  return v6;
}

- (PVLivePlayerImageSource)initWithPVImageBuffer:(id)a3
{
  id v4;
  PVLivePlayerImageSource *v5;
  void *v6;
  PVFrameSet *v7;
  PVFrameSet *imageFrame;
  __int128 v10;
  uint64_t v11;
  CMTime v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PVLivePlayerImageSource;
  v5 = -[PVLivePlayerImageSource init](&v13, sel_init);
  if (v5)
  {
    CMTimeMake(&v12, 1, 1);
    v10 = *MEMORY[0x1E0CA2E68];
    v11 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    +[PVCMSampleBuffer sampleBufferWithPVImageBuffer:timestamp:frameDuration:](PVCMSampleBuffer, "sampleBufferWithPVImageBuffer:timestamp:frameDuration:", v4, &v10, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PVFrameSet initWithColorBuffer:metadata:]([PVFrameSet alloc], "initWithColorBuffer:metadata:", v6, 0);
    imageFrame = v5->_imageFrame;
    v5->_imageFrame = v7;

  }
  return v5;
}

- (id)imageBufferForHostTime:(double)a3
{
  return self->_imageFrame;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)itemTimeForHostTime:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFrame, 0);
}

@end
