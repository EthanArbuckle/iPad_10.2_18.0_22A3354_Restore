@implementation SLDActiveCallViewRenderer

- (SLDActiveCallViewRenderer)initWithStyle:(id)a3 tag:(id)a4
{
  id v7;
  id v8;
  SLDActiveCallViewRenderer *v9;
  SLDActiveCallViewRenderer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SLDActiveCallViewRenderer;
  v9 = -[SLDActiveCallViewRenderer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slotStyle, a3);
    objc_storeStrong((id *)&v10->_slotTag, a4);
    v10->_RTL = objc_msgSend(v7, "layoutDirection") == 1;
  }

  return v10;
}

- (void)renderInContext:(CGContext *)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  const CGPath *v12;
  void *v13;
  CGDataProvider *v14;
  CGDataProvider *v15;
  CGImageSource *v16;
  CGImage *ImageAtIndex;
  __int128 v18;
  CGPath *Mutable;
  void *v20;
  void *v21;
  const __CFAttributedString *v22;
  const __CTFramesetter *v23;
  const __CTFrame *Frame;
  CGAffineTransform v25;
  uint64_t v26;
  CFRange v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v26 = *MEMORY[0x1E0C80C00];
  -[SLDActiveCallViewRenderer slotTag](self, "slotTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCallActive");

  SLDaemonLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(v25.a) = 138412290;
      *(_QWORD *)((char *)&v25.a + 4) = self;
      _os_log_impl(&dword_199EFF000, v8, OS_LOG_TYPE_INFO, "[%@] SLDActiveCallViewRenderer had an active conversation at time of rendering.", (uint8_t *)&v25, 0xCu);
    }

    -[SLDActiveCallViewRenderer slotTag](self, "slotTag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "maxWidth");
    v11 = v10;

    v28.origin.x = 0.0;
    v28.origin.y = 0.0;
    v28.size.width = v11;
    v28.size.height = 45.0;
    v12 = CGPathCreateWithRoundedRect(v28, 15.0, 15.0, 0);
    CGContextSetRGBFillColor(a3, 0.8, 0.8, 0.8, 1.0);
    CGContextAddPath(a3, v12);
    CGContextDrawPath(a3, kCGPathFill);
    CGPathRelease(v12);
    -[SLDActiveCallViewRenderer slotTag](self, "slotTag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activeCallGroupPhotoData");
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v14 = CGDataProviderCreateWithCFData((CFDataRef)v8);
      if (v14)
      {
        v15 = v14;
        v16 = CGImageSourceCreateWithDataProvider(v14, 0);
        CFRelease(v15);
        if (v16)
        {
          ImageAtIndex = CGImageSourceCreateImageAtIndex(v16, 0, 0);
          CFRelease(v16);
          if (ImageAtIndex)
          {
            CGContextSaveGState(a3);
            CGContextTranslateCTM(a3, 0.0, 45.0);
            CGContextScaleCTM(a3, 1.0, -1.0);
            CGContextBeginPath(a3);
            v29.origin.x = 8.0;
            v29.origin.y = 8.0;
            v29.size.width = 30.0;
            v29.size.height = 30.0;
            CGContextAddEllipseInRect(a3, v29);
            CGContextClip(a3);
            CGContextClosePath(a3);
            v30.origin.x = 8.0;
            v30.origin.y = 8.0;
            v30.size.width = 30.0;
            v30.size.height = 30.0;
            CGContextDrawImage(a3, v30, ImageAtIndex);
            CGContextRestoreGState(a3);
            CGImageRelease(ImageAtIndex);
          }
        }
      }
    }
    CGContextSaveGState(a3);
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v25.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v25.c = v18;
    *(_OWORD *)&v25.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGContextSetTextMatrix(a3, &v25);
    CGContextTranslateCTM(a3, 0.0, 45.0);
    CGContextScaleCTM(a3, 1.0, -1.0);
    Mutable = CGPathCreateMutable();
    v31.size.width = v11 + -46.0;
    v31.origin.x = 46.0;
    v31.origin.y = 0.0;
    v31.size.height = 30.0;
    CGPathAddRect(Mutable, 0, v31);
    -[SLDActiveCallViewRenderer slotTag](self, "slotTag");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activeCallDisplayName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (const __CFAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v21);
    v23 = CTFramesetterCreateWithAttributedString(v22);
    v27.length = -[__CFAttributedString length](v22, "length");
    v27.location = 0;
    Frame = CTFramesetterCreateFrame(v23, v27, Mutable, 0);
    CTFrameDraw(Frame, a3);
    CFRelease(Frame);
    CFRelease(Mutable);
    CFRelease(v23);
    CGContextRestoreGState(a3);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[SLDActiveCallViewRenderer renderInContext:].cold.1(v8);
  }

}

- (UISSlotStyle)slotStyle
{
  return self->_slotStyle;
}

- (void)setSlotStyle:(id)a3
{
  objc_storeStrong((id *)&self->_slotStyle, a3);
}

- (SLDActiveCallViewSlotTag)slotTag
{
  return self->_slotTag;
}

- (void)setSlotTag:(id)a3
{
  objc_storeStrong((id *)&self->_slotTag, a3);
}

- (BOOL)isRTL
{
  return self->_RTL;
}

- (void)setRTL:(BOOL)a3
{
  self->_RTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotTag, 0);
  objc_storeStrong((id *)&self->_slotStyle, 0);
}

- (void)renderInContext:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_199EFF000, log, OS_LOG_TYPE_DEBUG, "SLDActiveCallViewRenderer: Not drawing anything because there was no active conversation.", v1, 2u);
}

@end
