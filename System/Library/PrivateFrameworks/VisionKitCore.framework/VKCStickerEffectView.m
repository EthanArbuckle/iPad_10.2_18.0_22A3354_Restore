@implementation VKCStickerEffectView

- (VKCStickerEffectView)init
{
  id v3;
  VKCStickerEffectView *v4;

  v3 = MTLCreateSystemDefaultDevice();
  v4 = -[VKCStickerEffectView initWithDevice:](self, "initWithDevice:", v3);

  return v4;
}

- (VKCStickerEffectView)initWithDevice:(id)a3
{
  id v4;
  VKCStickerEffectView *v5;
  uint64_t v6;
  VKStickerEffectViewInternal *internalView;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKCStickerEffectView;
  v5 = -[VKCStickerEffectView init](&v9, sel_init);
  if (v5)
  {
    VKInternalStickerEffectViewWithDevice();
    v6 = objc_claimAutoreleasedReturnValue();
    internalView = v5->_internalView;
    v5->_internalView = (VKStickerEffectViewInternal *)v6;

    -[VKStickerEffectViewInternal setAutoresizingMask:](v5->_internalView, "setAutoresizingMask:", 18);
    -[VKCStickerEffectView bounds](v5, "bounds");
    -[VKStickerEffectViewInternal setFrame:](v5->_internalView, "setFrame:");
    -[VKCStickerEffectView addSubview:](v5, "addSubview:", v5->_internalView);
  }

  return v5;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  CADisplayLink *v5;
  CADisplayLink *displayLink;
  CADisplayLink *v7;
  void *v8;
  CADisplayLink *v9;
  CADisplayLink *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VKCStickerEffectView;
  -[VKCStickerEffectView didMoveToWindow](&v11, sel_didMoveToWindow);
  -[VKCStickerEffectView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "displayLinkWithTarget:selector:", self, sel_displayLinkFired_);
    v5 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v5;

    v7 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v7, "addToRunLoop:forMode:", v8, *MEMORY[0x1E0C99860]);

    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
    -[VKCStickerEffectView startPlaybackIfNecessary](self, "startPlaybackIfNecessary");
  }
  else
  {
    v9 = self->_displayLink;
    if (v9)
    {
      -[CADisplayLink invalidate](v9, "invalidate");
      v10 = self->_displayLink;
      self->_displayLink = 0;

    }
  }

}

- (void)startPlaybackIfNecessary
{
  void *v3;
  CADisplayLink *v4;
  CADisplayLink *displayLink;

  if (!-[VKCStickerEffectView isPaused](self, "isPaused")
    && (-[VKCStickerEffectView videoData](self, "videoData"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (v4 = self->_displayLink, v3, v4))
  {
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0);
    self->_startTimeInterval = CACurrentMediaTime();
  }
  else
  {
    displayLink = self->_displayLink;
    if (displayLink)
      -[CADisplayLink setPaused:](displayLink, "setPaused:", 1);
  }
}

- (void)displayLinkFired:(id)a3
{
  double v4;
  long double v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(a3, "targetTimestamp");
  v5 = v4 - self->_startTimeInterval;
  -[VKCStickerEffectView videoDecoder](self, "videoDecoder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VKCStickerVideoDecoder frameForTargetTimestamp:](v6, v5);

  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCStickerEffectView set_image:](self, "set_image:", v8);

}

- (VKCStickerVideoDecoder)videoDecoder
{
  VKCStickerVideoDecoder *videoDecoder;
  VKCStickerVideoDecoder *v4;
  VKCStickerVideoDecoder *v5;

  videoDecoder = self->_videoDecoder;
  if (!videoDecoder)
  {
    v4 = objc_alloc_init(VKCStickerVideoDecoder);
    v5 = self->_videoDecoder;
    self->_videoDecoder = v4;

    -[VKCStickerVideoDecoder setDelegate:]((id *)&self->_videoDecoder->super.isa, self);
    videoDecoder = self->_videoDecoder;
  }
  return videoDecoder;
}

- (void)setEffect:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "internalEffect");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCStickerEffectView internalView](self, "internalView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_effect:", v5);

}

- (VKCStickerEffect)effect
{
  void *v2;
  void *v3;
  void *v4;

  -[VKCStickerEffectView internalView](self, "internalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_effect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCStickerEffect effectFromInternalEffect:](VKCStickerEffect, "effectFromInternalEffect:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (VKCStickerEffect *)v4;
}

- (void)setVideoData:(id)a3
{
  UIImage *fullSizeImage;
  id *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    fullSizeImage = self->_fullSizeImage;
    self->_fullSizeImage = 0;

  }
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
  -[VKCStickerEffectView videoDecoder](self, "videoDecoder");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[VKCStickerVideoDecoder setVideoData:](v5, v7);

  -[VKCStickerEffectView internalView](self, "internalView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReRenderOnMotion:", v7 == 0);

}

- (NSData)videoData
{
  return (NSData *)-[VKCStickerVideoDecoder videoData]((uint64_t)self->_videoDecoder);
}

- (void)set_image:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKCStickerEffectView internalView](self, "internalView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (UIImage)_image
{
  void *v2;
  void *v3;

  -[VKCStickerEffectView internalView](self, "internalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  UIImage *v4;
  uint64_t v5;
  uint64_t v6;
  UIImage *fullSizeImage;
  UIImage *v8;
  NSObject *v9;
  id v10;
  id v11;

  v4 = (UIImage *)a3;
  v5 = objc_opt_class();
  VKDynamicCast(v5, (uint64_t)v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v4 && !v6)
  {
    v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.Stickers");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[VKCStickerEffectView setImage:].cold.1((uint64_t)v4, v9);

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Unsupported Image Format"), *MEMORY[0x1E0C99778], 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  fullSizeImage = self->_fullSizeImage;
  self->_fullSizeImage = v4;
  v11 = (id)v6;
  v8 = v4;

  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
  -[VKCStickerEffectView setVideoData:](self, "setVideoData:", 0);
  -[VKCStickerEffectView setPaused:](self, "setPaused:", -[VKCStickerEffectView isPaused](self, "isPaused"));
  self->_size = (CGSize)*MEMORY[0x1E0C9D820];
  -[VKCStickerEffectView setNeedsLayout](self, "setNeedsLayout");

}

- (id)imageWithImage:(id)a3 scaledToSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  double x;
  double y;
  double v11;
  double v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  objc_msgSend(v6, "size");
  VKMScaleSizeWithinSize(v7, v8, width, height);
  v22.origin.x = VKMRectWithSize();
  x = v22.origin.x;
  y = v22.origin.y;
  v11 = v22.size.width;
  v12 = v22.size.height;
  if (!CGRectIsEmpty(v22))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithBounds:", x, y, v11, v12);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __52__VKCStickerEffectView_imageWithImage_scaledToSize___block_invoke;
    v16[3] = &unk_1E9463290;
    v17 = v6;
    v18 = x;
    v19 = y;
    v20 = v11;
    v21 = v12;
    v14 = v6;
    objc_msgSend(v13, "imageWithActions:", v16);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

uint64_t __52__VKCStickerEffectView_imageWithImage_scaledToSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKCStickerEffectView;
  -[VKCStickerEffectView layoutSubviews](&v7, sel_layoutSubviews);
  -[VKCStickerEffectView bounds](self, "bounds");
  if (v3 != self->_size.width || v4 != self->_size.height)
  {
    self->_size.width = v3;
    self->_size.height = v4;
    if (self->_fullSizeImage)
    {
      -[VKCStickerEffectView imageWithImage:scaledToSize:](self, "imageWithImage:scaledToSize:", v3, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCStickerEffectView set_image:](self, "set_image:", v6);

    }
  }
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[VKCStickerEffectView internalView](self, "internalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIImage)image
{
  void *v3;
  UIImage *fullSizeImage;
  UIImage *v5;

  -[VKCStickerEffectView videoData](self, "videoData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    fullSizeImage = 0;
  else
    fullSizeImage = self->_fullSizeImage;
  v5 = fullSizeImage;

  return v5;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[VKCStickerEffectView internalView](self, "internalView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsPaused:", v3);

  -[VKCStickerEffectView startPlaybackIfNecessary](self, "startPlaybackIfNecessary");
}

- (BOOL)isPaused
{
  void *v2;
  char v3;

  -[VKCStickerEffectView internalView](self, "internalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaused");

  return v3;
}

- (void)setCurlPosition:(double)a3
{
  float v3;
  double v4;
  id v5;

  v3 = a3;
  -[VKCStickerEffectView internalView](self, "internalView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = v3;
  objc_msgSend(v5, "setCurlPosition:", v4);

}

- (double)curlPosition
{
  void *v2;
  float v3;
  double v4;

  -[VKCStickerEffectView internalView](self, "internalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "curlPosition");
  v4 = v3;

  return v4;
}

+ (double)extraScaleToIncludeStrokeWithEffectType:(int64_t)a3 bounds:(CGRect)a4
{
  double result;

  VKStickerEffectViewExtraScaleToIncludeStroke();
  return result;
}

- (void)setBoundsIncludeStroke:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKCStickerEffectView internalView](self, "internalView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBoundsIncludeStroke:", v3);

}

- (BOOL)boundsIncludeStroke
{
  void *v2;
  char v3;

  -[VKCStickerEffectView internalView](self, "internalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "boundsIncludeStroke");

  return v3;
}

- (void)snapshotWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VKCStickerEffectView _image](self, "_image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else if (self->_fullSizeImage)
  {
    -[VKCStickerEffectView set_image:](self, "set_image:");
  }
  -[VKCStickerEffectView internalView](self, "internalView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapshotWithCompletionHandler:", v4);

}

- (void)playSettlingAnimation
{
  id v2;

  -[VKCStickerEffectView internalView](self, "internalView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playSettlingAnimation");

}

- (VKStickerEffectViewInternal)internalView
{
  return self->_internalView;
}

- (void)setInternalView:(id)a3
{
  objc_storeStrong((id *)&self->_internalView, a3);
}

- (void)setVideoDecoder:(id)a3
{
  objc_storeStrong((id *)&self->_videoDecoder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoDecoder, 0);
  objc_storeStrong((id *)&self->_internalView, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_fullSizeImage, 0);
}

- (void)setImage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "Trying to pass image of class: %@, but is not a UIImage", (uint8_t *)&v5, 0xCu);

}

@end
