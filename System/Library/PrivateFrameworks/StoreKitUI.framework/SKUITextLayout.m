@implementation SKUITextLayout

- (SKUITextLayout)initWithLayoutRequest:(id)a3
{
  id v4;
  SKUITextLayout *v5;
  const __CFAttributedString *v6;
  double v7;
  double v8;
  const __CTFramesetter *v9;
  CGSize v10;
  CGPath *Mutable;
  const CGPath *v12;
  CGFloat height;
  double width;
  uint64_t v15;
  uint64_t v16;
  const __CFArray *Lines;
  CFIndex Count;
  CFIndex v19;
  CGFloat v20;
  objc_super v22;
  CFRange v23;
  CFRange v24;
  CGSize v25;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUITextLayout initWithLayoutRequest:].cold.1();
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUITextLayout;
  v5 = -[SKUITextLayout init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "attributedText");
    v6 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
    if (v6
      || (v6 = (const __CFAttributedString *)objc_msgSend((id)objc_opt_class(), "_newAttributedStringWithRequest:", v4)) != 0)
    {
      objc_msgSend(v4, "width");
      v8 = v7;
      v9 = CTFramesetterCreateWithAttributedString(v6);
      v5->_framesetter = v9;
      v25.height = 1.79769313e308;
      v23.location = 0;
      v23.length = 0;
      v25.width = v8;
      v10 = CTFramesetterSuggestFrameSizeWithConstraints(v9, v23, 0, v25, 0);
      Mutable = CGPathCreateMutable();
      v12 = Mutable;
      height = v10.height;
      if (v8 >= v10.width)
        width = v8;
      else
        width = v10.width;
      v15 = 0;
      v16 = 0;
      CGPathAddRect(Mutable, 0, *(CGRect *)(&height - 3));
      v24.location = 0;
      v24.length = 0;
      v5->_textFrame = CTFramesetterCreateFrame(v5->_framesetter, v24, v12, 0);
      CGPathRelease(v12);
      v5->_size = (CGSize)vcvtq_f64_f32(vrndp_f32(vcvt_f32_f64((float64x2_t)v10)));
      Lines = CTFrameGetLines(v5->_textFrame);
      Count = CFArrayGetCount(Lines);
      v19 = objc_msgSend(v4, "numberOfLines");
      if (v19 && v19 < Count)
      {
        v5->_requiresTruncation = 1;
        v5->_truncatedSize.width = SKUITextLayoutSizeForCTFrame(v5->_textFrame, v19);
        v5->_truncatedSize.height = v20;
      }
      v5->_lineHeight = SKUIAttributedStringGetLineHeight(v6);
      CFRelease(v6);
    }
  }

  return v5;
}

- (void)dealloc
{
  __CTFrame *textFrame;
  __CTFramesetter *framesetter;
  objc_super v5;

  textFrame = self->_textFrame;
  if (textFrame)
    CFRelease(textFrame);
  framesetter = self->_framesetter;
  if (framesetter)
    CFRelease(framesetter);
  v5.receiver = self;
  v5.super_class = (Class)SKUITextLayout;
  -[SKUITextLayout dealloc](&v5, sel_dealloc);
}

+ (__CFAttributedString)newAttributedStringWithText:(id)a3
{
  id v4;
  SKUITextLayoutRequest *v5;
  __CFAttributedString *v6;

  v4 = a3;
  v5 = objc_alloc_init(SKUITextLayoutRequest);
  -[SKUITextLayoutRequest setText:](v5, "setText:", v4);

  v6 = (__CFAttributedString *)objc_msgSend(a1, "_newAttributedStringWithRequest:", v5);
  return v6;
}

+ (__CFAttributedString)_newAttributedStringWithRequest:(id)a3
{
  id v3;
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CGFloat v11;
  CTFontRef v12;
  id v13;
  const __CFDictionary *v14;
  __CFString *v15;
  __CFAttributedString *v16;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v4, "setMinimumLineHeight:", 16.0);
  objc_msgSend(v4, "setLineBreakMode:", 0);
  objc_msgSend(v4, "setAlignment:", NSTextAlignmentFromCTTextAlignment((CTTextAlignment)objc_msgSend(v3, "textAlignment")));
  v5 = 0;
  if ((unint64_t)objc_msgSend(v3, "fontWeight") <= 2)
  {
    v6 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v3, "fontSize");
    objc_msgSend(v6, "systemFontOfSize:weight:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (UIAccessibilityIsBoldTextEnabled())
  {
    v8 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v3, "fontSize");
    objc_msgSend(v8, "systemFontOfSize:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fontName");
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v10;
  }
  objc_msgSend(v3, "fontSize");
  v12 = CTFontCreateWithName(v5, v11, 0);
  v13 = objc_alloc(MEMORY[0x1E0C99D80]);
  v14 = (const __CFDictionary *)objc_msgSend(v13, "initWithObjectsAndKeys:", v12, *MEMORY[0x1E0CA8188], *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CA8558], v4, *MEMORY[0x1E0DC1178], 0);
  objc_msgSend(v3, "text");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = CFAttributedStringCreate(0, v15, v14);

  CFRelease(v12);
  return v16;
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (BOOL)requiresTruncation
{
  return self->_requiresTruncation;
}

- (CGSize)textSize
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)truncatedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_truncatedSize.width;
  height = self->_truncatedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (__CTFrame)textFrame
{
  return self->_textFrame;
}

- (void)initWithLayoutRequest:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUITextLayout initWithLayoutRequest:]";
}

@end
