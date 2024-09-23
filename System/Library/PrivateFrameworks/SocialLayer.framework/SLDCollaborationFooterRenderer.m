@implementation SLDCollaborationFooterRenderer

- (SLDCollaborationFooterRenderer)initWithStyle:(id)a3 tag:(id)a4
{
  id v7;
  id v8;
  SLDCollaborationFooterRenderer *v9;
  SLDCollaborationFooterRenderer *v10;
  SLDCollaborationFooterMetrics *v11;
  SLDCollaborationFooterMetrics *metrics;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLDCollaborationFooterRenderer;
  v9 = -[SLDCollaborationFooterRenderer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slotStyle, a3);
    objc_storeStrong((id *)&v10->_slotTag, a4);
    v11 = -[SLDCollaborationFooterMetrics initWithSlotStyle:tag:]([SLDCollaborationFooterMetrics alloc], "initWithSlotStyle:tag:", v7, v8);
    metrics = v10->_metrics;
    v10->_metrics = v11;

  }
  return v10;
}

- (void)renderInContext:(CGContext *)a3
{
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  -[SLDCollaborationFooterRenderer slotTag](self, "slotTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SLDCollaborationFooterRenderer _renderTitleInContext:resultingRect:](self, "_renderTitleInContext:resultingRect:", a3, &v10);
  }
  else
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *MEMORY[0x1E0C9D648];
    v11 = v7;
  }
  -[SLDCollaborationFooterRenderer slotTag](self, "slotTag", v10, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[SLDCollaborationFooterRenderer _renderSubtitleInContext:titleRect:](self, "_renderSubtitleInContext:titleRect:", a3, v10, v11);
}

- (void)_renderTitleInContext:(CGContext *)a3 resultingRect:(CGRect *)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  -[SLDCollaborationFooterRenderer metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleAttributedString");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[SLDCollaborationFooterRenderer metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "boundingRectForString:", v17);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[SLDCollaborationFooterRenderer _renderString:inRect:context:](self, "_renderString:inRect:context:", v17, a3, v10, v12, v14, v16);
  a4->origin.x = v10;
  a4->origin.y = v12;
  a4->size.width = v14;
  a4->size.height = v16;

}

- (void)_renderSubtitleInContext:(CGContext *)a3 titleRect:(CGRect)a4
{
  double height;
  double y;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  height = a4.size.height;
  y = a4.origin.y;
  -[SLDCollaborationFooterRenderer metrics](self, "metrics", a4.origin.x, a4.origin.y, a4.size.width);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subtitleAttributedString");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v9 = -(y + height);
  -[SLDCollaborationFooterRenderer metrics](self, "metrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "boundingRectForString:", v17);
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[SLDCollaborationFooterRenderer _renderString:inRect:context:](self, "_renderString:inRect:context:", v17, a3, v12, v9, v14, v16);
}

- (void)_renderString:(id)a3 inRect:(CGRect)a4 context:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  const __CFAttributedString *v10;
  const __CTFramesetter *v11;
  CGPath *Mutable;
  CFIndex v13;
  const __CTFrame *Frame;
  CGAffineTransform v15;
  CFRange v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = (const __CFAttributedString *)a3;
  v11 = CTFramesetterCreateWithAttributedString(v10);
  Mutable = CGPathCreateMutable();
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  CGPathAddRect(Mutable, 0, v17);
  v13 = -[__CFAttributedString length](v10, "length");

  v16.location = 0;
  v16.length = v13;
  Frame = CTFramesetterCreateFrame(v11, v16, Mutable, 0);
  CGContextSaveGState(a5);
  v15.a = 1.0;
  v15.b = 0.0;
  v15.c = 0.0;
  v15.d = 1.0;
  v15.tx = x;
  v15.ty = 0.0;
  CGContextSetTextMatrix(a5, &v15);
  CGContextTranslateCTM(a5, 0.0, height);
  CGContextScaleCTM(a5, 1.0, -1.0);
  CTFrameDraw(Frame, a5);
  CGContextRestoreGState(a5);
  if (v11)
    CFRelease(v11);
  if (Mutable)
    CFRelease(Mutable);
  if (Frame)
    CFRelease(Frame);
}

- (UISSlotStyle)slotStyle
{
  return self->_slotStyle;
}

- (void)setSlotStyle:(id)a3
{
  objc_storeStrong((id *)&self->_slotStyle, a3);
}

- (SLDCollaborationFooterSlotTag)slotTag
{
  return self->_slotTag;
}

- (void)setSlotTag:(id)a3
{
  objc_storeStrong((id *)&self->_slotTag, a3);
}

- (SLDCollaborationFooterMetrics)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_slotTag, 0);
  objc_storeStrong((id *)&self->_slotStyle, 0);
}

@end
