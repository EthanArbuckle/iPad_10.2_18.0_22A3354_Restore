@implementation TUICandidateLabel

- (void)commonInit
{
  -[TUICandidateLabel setContentMode:](self, "setContentMode:", 3);
  -[TUICandidateLabel setOpaque:](self, "setOpaque:", 0);
  -[TUICandidateLabel setLineBreakMode:](self, "setLineBreakMode:", 4);
}

- (TUICandidateLabel)initWithFrame:(CGRect)a3
{
  TUICandidateLabel *v3;
  TUICandidateLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateLabel;
  v3 = -[TUICandidateLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TUICandidateLabel commonInit](v3, "commonInit");
  return v4;
}

- (TUICandidateLabel)initWithCoder:(id)a3
{
  TUICandidateLabel *v3;
  TUICandidateLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateLabel;
  v3 = -[TUICandidateLabel initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TUICandidateLabel commonInit](v3, "commonInit");
  return v4;
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    text = self->_text;
    self->_text = v4;

    -[TUICandidateLabel setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIFont isEqual:](self->_font, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    -[TUICandidateLabel setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setMinimumScaleFactor:(double)a3
{
  if (self->_minimumScaleFactor != a3)
  {
    self->_minimumScaleFactor = a3;
    if (-[TUICandidateLabel adjustsFontSizeToFitWidth](self, "adjustsFontSizeToFitWidth"))
      -[TUICandidateLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  if (self->_adjustsFontSizeToFitWidth != a3)
  {
    self->_adjustsFontSizeToFitWidth = a3;
    -[TUICandidateLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setTextColor:(id)a3
{
  UIColor *v4;
  UIColor *textColor;
  id v6;

  v6 = a3;
  if ((-[UIColor isEqual:](self->_textColor, "isEqual:") & 1) == 0)
  {
    v4 = (UIColor *)objc_msgSend(v6, "copy");
    textColor = self->_textColor;
    self->_textColor = v4;

    -[TUICandidateLabel setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setLayoutOrientation:(int64_t)a3
{
  if (self->_layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    -[TUICandidateLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setLineBreakMode:(int64_t)a3
{
  if (self->_lineBreakMode != a3)
  {
    self->_lineBreakMode = a3;
    -[TUICandidateLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (unsigned)lineTruncationType
{
  int64_t lineBreakMode;
  unsigned int v3;

  lineBreakMode = self->_lineBreakMode;
  if (lineBreakMode == 5)
    v3 = 2;
  else
    v3 = 1;
  if (lineBreakMode == 3)
    return 0;
  else
    return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E0DC46C0];
}

- (__CTLine)createLineFromAttributedText:(id)a3
{
  void *v4;
  const __CFAttributedString *v5;
  void *v6;
  const __CFDictionary *v7;
  const __CTTypesetter *v8;
  __CTLine *Line;
  uint64_t v11;
  _QWORD v12[2];
  CFRange v13;

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = *MEMORY[0x1E0CA8618];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = (const __CFAttributedString *)a3;
  objc_msgSend(v4, "numberWithInt:", -[TUICandidateLabel layoutOrientation](self, "layoutOrientation") == 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = CTTypesetterCreateWithAttributedStringAndOptions(v5, v7);

  if (!v8)
    return 0;
  v13.location = 0;
  v13.length = 0;
  Line = CTTypesetterCreateLine(v8, v13);
  CFRelease(v8);
  return Line;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  const __CTFont *v6;
  const __CTFont *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double CapHeight;
  __CTLine *v23;
  __CTLine *v24;
  double width;
  double v26;
  unint64_t v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  const __CTFont *v34;
  __CTLine *v35;
  double v36;
  const __CFAttributedString *v38;
  const __CTLine *v39;
  const __CTLine *TruncatedLine;
  void *v41;
  int v42;
  double v43;
  double v44;
  BOOL v45;
  double v46;
  void *v47;
  void *v48;
  uint64_t v49;
  CGContext *CurrentContext;
  double v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  double x;
  float64x2_t xa;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform transform;
  CGAffineTransform v60;
  CGRect BoundsWithOptions;
  CGRect v62;

  -[TUICandidateLabel font](self, "font", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[TUICandidateLabel bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  -[TUICandidateLabel text](self, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TUICandidateLabel text](self, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0CB3778]);
    -[TUICandidateLabel text](self, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithString:", v17);

    v19 = *MEMORY[0x1E0DC32A0];
    objc_msgSend(v15, "setValue:forKey:", v7, *MEMORY[0x1E0DC32A0]);
    -[TUICandidateLabel textColor](self, "textColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[TUICandidateLabel textColor](self, "textColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forKey:", v21, *MEMORY[0x1E0DC32A8]);

    }
    objc_msgSend(v18, "setAttributes:range:", v15, 0, v14);
    CapHeight = CTFontGetCapHeight(v7);
    v23 = -[TUICandidateLabel createLineFromAttributedText:](self, "createLineFromAttributedText:", v18);
    if (v23)
    {
      v24 = v23;
      BoundsWithOptions = CTLineGetBoundsWithOptions(v23, 0);
      width = BoundsWithOptions.size.width;
      if (-[TUICandidateLabel layoutOrientation](self, "layoutOrientation", BoundsWithOptions.origin.x, BoundsWithOptions.origin.y) == 1)v26 = v11;
      else
        v26 = v9;
      if (-[TUICandidateLabel adjustsFontSizeToFitWidth](self, "adjustsFontSizeToFitWidth") && width > v26)
      {
        v27 = 0;
        v28 = 1.0;
        while (1)
        {
          -[TUICandidateLabel minimumScaleFactor](self, "minimumScaleFactor");
          v28 = v29 >= v28 * (v26 / (width + 1.0)) ? v29 : v28 * (v26 / (width + 1.0));
          -[TUICandidateLabel font](self, "font");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "pointSize");
          v32 = v28 * v31;

          -[TUICandidateLabel font](self, "font");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "fontWithSize:", v32);
          v34 = (const __CTFont *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "setValue:forKey:", v34, v19);
          objc_msgSend(v18, "setAttributes:range:", v15, 0, v14);
          CFRelease(v24);
          v35 = -[TUICandidateLabel createLineFromAttributedText:](self, "createLineFromAttributedText:", v18);
          if (!v35)
            break;
          v24 = v35;
          CapHeight = CTFontGetCapHeight(v34);
          v62 = CTLineGetBoundsWithOptions(v24, 0);
          width = v62.size.width;
          if (v62.size.width <= v26
            || (-[TUICandidateLabel minimumScaleFactor](self, "minimumScaleFactor", v62.origin.x, v62.origin.y),
                v28 <= v36))
          {

            goto LABEL_25;
          }

          if (width > v26 && v27++ < 4)
            continue;
          goto LABEL_25;
        }

      }
      else
      {
        if (width <= v26)
          goto LABEL_30;
LABEL_25:
        v38 = CFAttributedStringCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("…"), (CFDictionaryRef)v15);
        v39 = CTLineCreateWithAttributedString(v38);
        TruncatedLine = CTLineCreateTruncatedLine(v24, v26, (CTLineTruncationType)-[TUICandidateLabel lineTruncationType](self, "lineTruncationType"), v39);
        if (v39)
          CFRelease(v39);
        CFRelease(v38);
        if (TruncatedLine)
          CFRelease(v24);
        else
LABEL_30:
          TruncatedLine = v24;
        v53 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v54 = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v60.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v60.c = v53;
        v52 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        *(_OWORD *)&v60.tx = v52;
        if (-[TUICandidateLabel layoutOrientation](self, "layoutOrientation") == 1)
        {
          -[TUICandidateLabel text](self, "text");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "_containsEmoji");

          v43 = 0.0;
          if (v42)
          {
            -[__CTFont pointSize](v7, "pointSize", 0.0);
            if (v44 <= 16.0)
            {
              v46 = v44 * 0.25;
            }
            else
            {
              v45 = v44 < 24.0;
              v46 = (24.0 - v44) * 0.5;
              if (!v45)
                v46 = 0.0;
            }
            v43 = v46 * 0.5;
          }
          x = v43;
          v51 = v9 * 0.5;
          *(_OWORD *)&transform.a = v54;
          *(_OWORD *)&transform.c = v53;
          *(_OWORD *)&transform.tx = v52;
          CGAffineTransformRotate(&v60, &transform, 1.57079633);
        }
        else
        {
          x = (v11 + CapHeight) * 0.5;
          *(_OWORD *)&transform.a = v54;
          *(_OWORD *)&transform.c = v53;
          *(_OWORD *)&transform.tx = v52;
          v51 = 0.0;
          CGAffineTransformTranslate(&v60, &transform, 0.0, v11);
        }
        v58 = v60;
        CGAffineTransformScale(&transform, &v58, 1.0, -1.0);
        v60 = transform;
        CGAffineTransformInvert(&v57, &transform);
        xa = vaddq_f64(*(float64x2_t *)&v57.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v57.c, x), *(float64x2_t *)&v57.a, v51));
        -[TUICandidateLabel window](self, "window");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "screen");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "scale");
        if (*(double *)&v49 > 1.0)
          xa = vdivq_f64(vrndmq_f64(vmulq_n_f64(xa, *(double *)&v49)), (float64x2_t)vdupq_lane_s64(v49, 0));

        CurrentContext = UIGraphicsGetCurrentContext();
        CGContextSaveGState(CurrentContext);
        transform = v60;
        CGContextConcatCTM(CurrentContext, &transform);
        CGContextSetTextPosition(CurrentContext, xa.f64[0], xa.f64[1]);
        CTLineDraw(TruncatedLine, CurrentContext);
        CGContextRestoreGState(CurrentContext);
        CFRelease(TruncatedLine);
      }
    }

  }
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return self->_adjustsFontSizeToFitWidth;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

+ (double)lineWidthForText:(id)a3 font:(id)a4 layoutOrientation:(int64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  const __CTTypesetter *v13;
  const __CTLine *Line;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v20;
  _QWORD v21[2];
  CFRange v22;
  CGRect BoundsWithOptions;

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = objc_msgSend(v7, "length");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v7);
    objc_msgSend(v10, "setValue:forKey:", v8, *MEMORY[0x1E0DC32A0]);
    objc_msgSend(v11, "setAttributes:range:", v10, 0, v9);
    if (a5 == 1)
    {
      v20 = *MEMORY[0x1E0CA8618];
      v21[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v13 = CTTypesetterCreateWithAttributedStringAndOptions((CFAttributedStringRef)v11, v12);

      if (!v13)
        goto LABEL_5;
      v22.location = 0;
      v22.length = 0;
      Line = CTTypesetterCreateLine(v13, v22);
      CFRelease(v13);
      if (!Line)
        goto LABEL_5;
    }
    else
    {
      Line = CTLineCreateWithAttributedString((CFAttributedStringRef)v11);
      if (!Line)
      {
LABEL_5:
        v15 = 0.0;
LABEL_15:

        goto LABEL_16;
      }
    }
    BoundsWithOptions = CTLineGetBoundsWithOptions(Line, 0);
    v15 = ceil(BoundsWithOptions.size.width);
    CFRelease(Line);
    if (objc_msgSend(v7, "_containsEmoji"))
    {
      objc_msgSend(v8, "pointSize");
      v17 = 0.0;
      if (v16 < 24.0)
        v17 = (24.0 - v16) * 0.5;
      if (v16 <= 16.0)
        v18 = v16 * 0.25;
      else
        v18 = v17;
      v15 = v15 + v18;
    }
    goto LABEL_15;
  }
  v15 = 0.0;
LABEL_16:

  return v15;
}

@end
