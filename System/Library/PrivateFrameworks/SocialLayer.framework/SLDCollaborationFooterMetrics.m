@implementation SLDCollaborationFooterMetrics

- (SLDCollaborationFooterMetrics)initWithSlotStyle:(id)a3 tag:(id)a4
{
  id v7;
  id v8;
  SLDCollaborationFooterMetrics *v9;
  SLDCollaborationFooterMetrics *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SLDCollaborationFooterMetrics;
  v9 = -[SLDCollaborationFooterMetrics init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_style, a3);
    objc_storeStrong((id *)&v10->_tag, a4);
  }

  return v10;
}

- (NSAttributedString)titleAttributedString
{
  void *v3;
  void *v4;
  CGColor *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SLDCollaborationFooterMetrics tag](self, "tag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[SLDCollaborationFooterMetrics labelColor](self, "labelColor");
    -[SLDCollaborationFooterMetrics tag](self, "tag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLDCollaborationFooterMetrics attributedStringWithString:textStyle:color:](self, "attributedStringWithString:textStyle:color:", v7, *MEMORY[0x1E0CA8640], v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (NSAttributedString *)v8;
}

- (NSAttributedString)subtitleAttributedString
{
  void *v3;
  __CFString *v4;
  CGColor *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SLDCollaborationFooterMetrics tag](self, "tag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtitle");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SLDCollaborationFooterMetrics tag](self, "tag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v6 = 0;
      return (NSAttributedString *)v6;
    }
    v4 = CFSTR("Collaboration");
  }
  v5 = -[SLDCollaborationFooterMetrics secondaryLabelColor](self, "secondaryLabelColor");
  -[SLDCollaborationFooterMetrics attributedStringWithString:textStyle:color:](self, "attributedStringWithString:textStyle:color:", v4, *MEMORY[0x1E0CA8638], v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v6;
}

- (id)attributedStringWithString:(id)a3 textStyle:(__CFString *)a4 color:(CGColor *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CTFontDescriptor *v12;
  CTFontRef v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];
  _QWORD v21[3];
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v24 = *MEMORY[0x1E0CA8418];
  v22 = *MEMORY[0x1E0CA8400];
  v23 = &unk_1E37A9F60;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SLDCollaborationFooterMetrics style](self, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CTContentSizeCategoryForSlotStyle(v11);

  v12 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  v13 = CTFontCreateWithFontDescriptor(v12, 0.0, 0);
  CFRelease(v12);
  v14 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v14, "setLineBreakStrategy:", 0xFFFFLL);
  v15 = *MEMORY[0x1E0DC1138];
  v20[0] = *MEMORY[0x1E0DC1140];
  v20[1] = v15;
  v21[0] = a5;
  v21[1] = v13;
  v20[2] = *MEMORY[0x1E0DC1178];
  v16 = (void *)objc_msgSend(v14, "copy");
  v21[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v8, v17);
  return v18;
}

- (CGRect)boundingRectForString:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  CFIndex v8;
  const __CTFramesetter *v9;
  CGSize v10;
  CGFloat width;
  CGFloat height;
  const __CTLine *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double PenOffsetForFlush;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CFRange v27;
  CGSize v28;
  CGRect result;

  if (a3)
  {
    v4 = a3;
    -[SLDCollaborationFooterMetrics tag](self, "tag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "maxWidth");
    v7 = v6;

    v8 = objc_msgSend(v4, "length");
    v9 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)v4);
    v28.height = 1.79769313e308;
    v27.location = 0;
    v27.length = v8;
    v28.width = v7;
    v10 = CTFramesetterSuggestFrameSizeWithConstraints(v9, v27, 0, v28, 0);
    width = v10.width;
    height = v10.height;
    CFRelease(v9);
    v13 = CTLineCreateWithAttributedString((CFAttributedStringRef)v4);

    -[SLDCollaborationFooterMetrics style](self, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (double)objc_msgSend(v14, "displayScale");

    -[SLDCollaborationFooterMetrics style](self, "style");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0.0;
    if (objc_msgSend(v16, "layoutDirection") == 1)
      v18 = 1.0;
    else
      v18 = 0.0;

    -[SLDCollaborationFooterMetrics tag](self, "tag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "maxWidth");
    PenOffsetForFlush = CTLineGetPenOffsetForFlush(v13, v18, v20);
    v22 = SLRoundToScale(PenOffsetForFlush, v15);

    CFRelease(v13);
  }
  else
  {
    v22 = *MEMORY[0x1E0C9D648];
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v23 = v22;
  v24 = v17;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (double)expectedHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[SLDCollaborationFooterMetrics titleAttributedString](self, "titleAttributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDCollaborationFooterMetrics boundingRectForString:](self, "boundingRectForString:", v3);
  v5 = v4;

  -[SLDCollaborationFooterMetrics subtitleAttributedString](self, "subtitleAttributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDCollaborationFooterMetrics boundingRectForString:](self, "boundingRectForString:", v6);
  v8 = v7;

  return v5 + v8;
}

- (CGColor)labelColor
{
  void *v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGColorRef SRGB;

  -[SLDCollaborationFooterMetrics style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceStyle"))
  {
    v3 = 1.0;
    v4 = 1.0;
    v5 = 1.0;
  }
  else
  {
    v3 = 0.0;
    v4 = 0.0;
    v5 = 0.0;
  }
  SRGB = CGColorCreateSRGB(v3, v4, v5, 1.0);

  return (CGColor *)CFAutorelease(SRGB);
}

- (CGColor)secondaryLabelColor
{
  void *v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGColorRef SRGB;

  -[SLDCollaborationFooterMetrics style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceStyle"))
  {
    v3 = 0.75;
    v4 = 0.75;
    v5 = 0.75;
  }
  else
  {
    v3 = 0.25;
    v4 = 0.25;
    v5 = 0.25;
  }
  SRGB = CGColorCreateSRGB(v3, v4, v5, 0.6);

  return (CGColor *)CFAutorelease(SRGB);
}

- (UISSlotStyle)style
{
  return self->_style;
}

- (SLDCollaborationFooterSlotTag)tag
{
  return self->_tag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
