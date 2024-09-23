@implementation RefittedFrame

- (RefittedFrame)initWithAttributedString:(id)a3 width:(double)a4 maximumNumberOfLines:(unint64_t)a5 minimumLineHeight:(double)a6
{
  id v10;
  RefittedFrame *v11;
  objc_super v13;

  v10 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RefittedFrame;
  v11 = -[RefittedFrame init](&v13, "init");
  if (v11)
  {
    if (!v10)
      v10 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", &stru_1011EB268);
    -[RefittedFrame setString:](v11, "setString:", v10);
    v11->_width = a4;
    v11->_maximumNumberOfLines = a5;
    v11->_minimumLineHeight = a6;
  }

  return v11;
}

- (void)dealloc
{
  __CTFrame *frame;
  objc_super v4;

  frame = self->_frame;
  if (frame)
    CFRelease(frame);
  v4.receiver = self;
  v4.super_class = (Class)RefittedFrame;
  -[RefittedFrame dealloc](&v4, "dealloc");
}

- (__CTFrame)CTFrame
{
  const __CFAttributedString *v3;
  CTFramesetterRef v4;

  if (!self->_frame)
  {
    v3 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue(-[RefittedFrame string](self, "string"));
    v4 = CTFramesetterCreateWithAttributedString(v3);

    if (v4)
    {
      self->_frame = -[RefittedFrame newFrameFromFramesetter:](self, "newFrameFromFramesetter:", v4);
      CFRelease(v4);
    }
  }
  return self->_frame;
}

- (__CTFrame)newFrameFromFramesetter:(__CTFramesetter *)a3
{
  id v4;
  const CGPath *v5;
  __CTFrame *Frame;
  CFRange v8;

  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 0.0, 0.0, self->_width, 10000.0)));
  v5 = (const CGPath *)objc_msgSend(v4, "CGPath");
  v8.location = 0;
  v8.length = 0;
  Frame = CTFramesetterCreateFrame(a3, v8, v5, 0);

  return Frame;
}

- (void)measureIfNeeded
{
  __CTFrame *v3;
  const __CFArray *Lines;
  CFArrayRef v5;
  void *v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  char *v14;
  const __CTLine *v15;
  double v16;
  double v17;
  double minimumLineHeight;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  CGRect BoundsWithOptions;

  if (!self->_measured)
  {
    v3 = -[RefittedFrame CTFrame](self, "CTFrame");
    Lines = CTFrameGetLines(v3);
    self->_numberOfLines = CFArrayGetCount(Lines);
    self->_fittedRange = (_NSRange)CTFrameGetStringRange(v3);
    if (self->_numberOfLines)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v5 = CTFrameGetLines(v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v7 = (char *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        v10 = *(_QWORD *)v24;
        v11 = 0.0;
        v12 = 0.0;
LABEL_5:
        v13 = 0;
        v14 = &v9[(_QWORD)v8];
        while (1)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v6);
          if ((unint64_t)&v9[v13] >= self->_maximumNumberOfLines)
            break;
          v15 = *(const __CTLine **)(*((_QWORD *)&v23 + 1) + 8 * v13);
          v21 = 0.0;
          v22 = 0.0;
          v20 = 0.0;
          CTLineGetDefaultBounds(v15, &v22, &v21, &v20);
          v16 = ceil(v22 + v21 + v20);
          BoundsWithOptions = CTLineGetBoundsWithOptions(v15, 8uLL);
          v17 = ceil(CGRectGetMaxX(BoundsWithOptions));
          if (v16 > v12)
            v12 = v16;
          if (v17 > v11)
            v11 = v17;
          if (v8 == (char *)++v13)
          {
            v8 = (char *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            v9 = v14;
            if (v8)
              goto LABEL_5;
            break;
          }
        }
      }
      else
      {
        v11 = 0.0;
        v12 = 0.0;
      }

      minimumLineHeight = self->_minimumLineHeight;
      v19 = ceil(v12);
      if (minimumLineHeight <= v19)
        minimumLineHeight = v19;
      self->_maxLineHeight = minimumLineHeight;
      self->_maxLineWidth = ceil(v11);
    }
    self->_measured = 1;
  }
}

- (_NSRange)fittedRange
{
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  -[RefittedFrame measureIfNeeded](self, "measureIfNeeded");
  location = self->_fittedRange.location;
  length = self->_fittedRange.length;
  result.length = length;
  result.location = location;
  return result;
}

- (double)height
{
  unint64_t numberOfLines;

  -[RefittedFrame measureIfNeeded](self, "measureIfNeeded");
  numberOfLines = self->_numberOfLines;
  if (numberOfLines >= self->_maximumNumberOfLines)
    numberOfLines = self->_maximumNumberOfLines;
  if (numberOfLines)
    return self->_maxLineHeight * (double)numberOfLines;
  else
    return 0.0;
}

- (double)widthUsed
{
  -[RefittedFrame measureIfNeeded](self, "measureIfNeeded");
  return self->_maxLineWidth;
}

- (BOOL)textFitsEntirely
{
  -[RefittedFrame measureIfNeeded](self, "measureIfNeeded");
  return self->_numberOfLines <= self->_maximumNumberOfLines;
}

- (unint64_t)numberOfLines
{
  -[RefittedFrame measureIfNeeded](self, "measureIfNeeded");
  return self->_numberOfLines;
}

- (id)getLayersForBounds:(CGRect)a3
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unint64_t maximumNumberOfLines;
  void *v8;
  double v9;
  uint64_t v10;
  CGPoint *v11;
  __CTFrame *v12;
  CFArrayRef Lines;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  const __CTLine *v21;
  _BOOL4 v22;
  CFArrayRef GlyphRuns;
  void *v24;
  id v25;
  id v26;
  const __CTLine *v27;
  CFIndex location;
  RefittedFrame *v29;
  void *v30;
  void *v31;
  const __CFAttributedString *v32;
  const __CTLine *v33;
  CTLineRef TruncatedLine;
  const __CTLine *v35;
  NSString *v36;
  void *v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGContext *CurrentContext;
  UIImage *ImageFromCurrentImageContext;
  void *v43;
  void *v44;
  id v45;
  uint64_t v47;
  unint64_t v48;
  uint64_t *v49;
  unint64_t v50;
  unint64_t v51;
  CGFloat height;
  CFStringRef v53;
  void *v54;
  void *v55;
  RefittedFrame *v56;
  id v57;
  uint64_t v58;
  CFAttributedStringRef v59;
  uint64_t v60;
  uint64_t v61;
  CGFloat leading;
  CGFloat descent;
  CGFloat ascent;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[56];
  CFRange v70;
  CGSize v71;
  CGRect v72;
  CGRect BoundsWithOptions;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[RefittedFrame measureIfNeeded](self, "measureIfNeeded");
  if (self->_numberOfLines >= self->_maximumNumberOfLines)
    maximumNumberOfLines = self->_maximumNumberOfLines;
  else
    maximumNumberOfLines = self->_numberOfLines;
  if (maximumNumberOfLines)
  {
    v50 = maximumNumberOfLines;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:"));
    v49 = &v47;
    *(_QWORD *)&v9 = __chkstk_darwin(v8).n128_u64[0];
    v11 = (CGPoint *)(&v47 - 2 * v10);
    v12 = -[RefittedFrame CTFrame](self, "CTFrame", v9);
    v70.length = self->_numberOfLines;
    v70.location = 0;
    CTFrameGetLineOrigins(v12, v70, v11);
    v68 = 0u;
    v67 = 0u;
    v66 = 0u;
    v65 = 0u;
    v56 = self;
    Lines = CTFrameGetLines(-[RefittedFrame CTFrame](self, "CTFrame"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(Lines);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    if (v15)
    {
      v16 = v15;
      v51 = 0;
      v17 = *(_QWORD *)v66;
      v53 = kCTRunDelegateAttributeName;
      v18 = CGRectZero.origin.y;
      v48 = 1 - v50;
      v55 = v8;
      v54 = v14;
      v58 = v17;
LABEL_7:
      v19 = 0;
      v20 = v50 - v51;
      if (v50 < v51)
        v20 = 0;
      v61 = v20;
      v60 = v48 + v51;
      v57 = v16;
      while (1)
      {
        if (*(_QWORD *)v66 != v17)
          objc_enumerationMutation(v14);
        if (v61 == v19)
          break;
        v21 = *(const __CTLine **)(*((_QWORD *)&v65 + 1) + 8 * v19);
        if (v60 + v19)
        {
          v22 = 0;
        }
        else
        {
          GlyphRuns = CTLineGetGlyphRuns(*(CTLineRef *)(*((_QWORD *)&v65 + 1) + 8 * v19));
          v24 = (void *)objc_claimAutoreleasedReturnValue(GlyphRuns);
          v25 = objc_msgSend(v24, "count");
          v22 = v25 != 0;
          if (v25)
          {
            v26 = -[__CFDictionary mutableCopy](CTRunGetAttributes((CTRunRef)objc_msgSend(v24, "lastObject")), "mutableCopy");
            objc_msgSend(v26, "removeObjectForKey:", v53);
            v59 = (CFAttributedStringRef)objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("…"), v26);
            v27 = CTLineCreateWithAttributedString(v59);
            location = CTLineGetStringRange(v21).location;
            v29 = v56;
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[RefittedFrame string](v56, "string"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[RefittedFrame string](v29, "string"));
            v32 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "attributedSubstringFromRange:", location, (char *)objc_msgSend(v31, "length") - location));

            v33 = CTLineCreateWithAttributedString(v32);
            TruncatedLine = CTLineCreateTruncatedLine(v33, v29->_width, kCTLineTruncationEnd, v27);
            if (TruncatedLine)
            {
              v35 = TruncatedLine;
              CFRelease(v27);
              v27 = v35;
            }
            else
            {
              v72.origin.x = x;
              v72.origin.y = y;
              v72.size.width = width;
              v72.size.height = height;
              v36 = NSStringFromCGRect(v72);
              v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
              NSLog(CFSTR("We have been asked to draw instruction labels but there wasn't space to draw the truncated last line in the provided rectangle (%@). Will draw just the ellipsis instead."), v37);

            }
            v8 = v55;
            CFRelease(v33);

            v21 = v27;
            v14 = v54;
            v16 = v57;
          }

          v17 = v58;
        }
        ascent = 0.0;
        descent = 0.0;
        leading = 0.0;
        CTLineGetTypographicBounds(v21, &ascent, &descent, &leading);
        v38 = ceil(ascent + descent + leading);
        BoundsWithOptions = CTLineGetBoundsWithOptions(v21, 8uLL);
        v39 = ceil(CGRectGetMaxX(BoundsWithOptions));
        v40 = descent + leading;
        v71.width = v39;
        v71.height = v38;
        UIGraphicsBeginImageContextWithOptions(v71, 0, 0.0);
        CurrentContext = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(CurrentContext, 1.0, -1.0);
        CGContextTranslateCTM(CurrentContext, 0.0, -v38);
        CGContextSetTextPosition(CurrentContext, 0.0, v40);
        CTLineDraw(v21, CurrentContext);
        ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
        v43 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
        UIGraphicsEndImageContext();
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
        objc_msgSend(v44, "setFrame:", CGRectZero.origin.x, v18, v39, v38);
        v45 = objc_retainAutorelease(v43);
        objc_msgSend(v44, "setContents:", objc_msgSend(v45, "CGImage"));
        objc_msgSend(v8, "addObject:", v44);
        if (v22)
          CFRelease(v21);

        if (v16 == (id)++v19)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
          v51 += v19;
          if (v16)
            goto LABEL_7;
          break;
        }
      }
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (double)width
{
  return self->_width;
}

- (NSAttributedString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
