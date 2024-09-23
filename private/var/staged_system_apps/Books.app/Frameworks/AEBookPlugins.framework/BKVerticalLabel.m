@implementation BKVerticalLabel

- (void)drawRect:(CGRect)a3
{
  void *v4;
  char *v5;
  void *v6;
  __CFString *v7;
  char *i;
  unsigned int v9;
  void *v10;
  __CFAttributedString *Mutable;
  __CFAttributedString *v12;
  void *v13;
  double v14;
  CGFloat v15;
  void *v16;
  __CFString *v17;
  CTFontRef v18;
  id v19;
  id v20;
  CGContextRef CurrentContext;
  CGContext *v22;
  const __CTTypesetter *v23;
  const __CTTypesetter *v24;
  const __CTLine *Line;
  const __CTLine *v26;
  CGFloat v27;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  __CFAttributedString *v32;
  __CFAttributedString *v33;
  id v34;
  id v35;
  const __CTLine *v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  double v41;
  const __CTLine *TruncatedLine;
  CGFloat v43;
  CGFloat v44;
  CGFloat attrName;
  CTFontRef value;
  CGAffineTransform v47;
  __int16 v48;
  CFRange v49;
  CFRange v50;
  CFRange v51;
  CFRange v52;
  CFRange v53;
  CFRange v54;
  CFRange v55;
  CFRange v56;
  CFRange v57;
  CGRect ImageBounds;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKVerticalLabel text](self, "text", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  v5 = (char *)objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKVerticalLabel text](self, "text"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v6));

    for (i = 0; i != v5; ++i)
    {
      v48 = 0;
      v9 = -[__CFString characterAtIndex:](v7, "characterAtIndex:", i);
      if (v9 - 48 <= 9)
      {
        v48 = v9 - 288;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", &v48, 1));
        -[__CFString replaceCharactersInRange:withString:](v7, "replaceCharactersInRange:withString:", i, 1, v10);

      }
    }
    Mutable = CFAttributedStringCreateMutable(kCFAllocatorDefault, (CFIndex)v5);
    if (!Mutable)
      goto LABEL_22;
    v12 = Mutable;
    v49.location = 0;
    v49.length = 0;
    CFAttributedStringReplaceString(Mutable, v49, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKVerticalLabel font](self, "font"));
    objc_msgSend(v13, "pointSize");
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKVerticalLabel font](self, "font"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fontName"));
    v18 = CTFontCreateWithName(v17, v15, 0);

    if (!v18)
    {
LABEL_21:
      CFRelease(v12);
LABEL_22:

      return;
    }
    v50.location = 0;
    v50.length = (CFIndex)v5;
    value = v18;
    CFAttributedStringSetAttribute(v12, v50, kCTFontAttributeName, v18);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKVerticalLabel textColor](self, "textColor")));
    v20 = objc_msgSend(v19, "CGColor");
    v51.location = 0;
    v51.length = (CFIndex)v5;
    CFAttributedStringSetAttribute(v12, v51, kCTForegroundColorAttributeName, v20);

    v52.location = 0;
    v52.length = (CFIndex)v5;
    CFAttributedStringSetAttribute(v12, v52, kCTVerticalFormsAttributeName, kCFBooleanTrue);
    CurrentContext = UIGraphicsGetCurrentContext();
    if (!CurrentContext)
      goto LABEL_20;
    v22 = CurrentContext;
    CGAffineTransformMakeScale(&v47, 1.0, -1.0);
    CGContextSetTextMatrix(v22, &v47);
    v23 = CTTypesetterCreateWithAttributedString(v12);
    if (!v23)
      goto LABEL_20;
    v24 = v23;
    v53.location = 0;
    v53.length = (CFIndex)v5;
    Line = CTTypesetterCreateLine(v23, v53);
    if (!Line)
    {
LABEL_19:
      CFRelease(v24);
      goto LABEL_20;
    }
    v26 = Line;
    ImageBounds = CTLineGetImageBounds(Line, v22);
    v27 = ceil(CGRectGetWidth(ImageBounds));
    -[BKVerticalLabel bounds](self, "bounds");
    x = v59.origin.x;
    y = v59.origin.y;
    width = v59.size.width;
    height = v59.size.height;
    if (v27 <= CGRectGetWidth(v59))
    {
      TruncatedLine = 0;
      v36 = 0;
      v33 = 0;
    }
    else
    {
      v32 = CFAttributedStringCreateMutable(kCFAllocatorDefault, 1);
      v33 = v32;
      if (!v32)
        goto LABEL_18;
      v54.location = 0;
      v54.length = 0;
      CFAttributedStringReplaceString(v32, v54, CFSTR("…"));
      v55.location = 0;
      v55.length = 1;
      CFAttributedStringSetAttribute(v33, v55, kCTFontAttributeName, value);
      v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKVerticalLabel textColor](self, "textColor")));
      v35 = objc_msgSend(v34, "CGColor");
      v56.location = 0;
      v56.length = 1;
      CFAttributedStringSetAttribute(v33, v56, kCTForegroundColorAttributeName, v35);

      v57.location = 0;
      v57.length = 1;
      CFAttributedStringSetAttribute(v33, v57, kCTVerticalFormsAttributeName, kCFBooleanTrue);
      v36 = CTLineCreateWithAttributedString(v33);
      v60 = CTLineGetImageBounds(v36, v22);
      attrName = v60.origin.x;
      v37 = v60.origin.y;
      v38 = v60.size.width;
      v39 = v60.size.height;
      v60.origin.x = x;
      v60.origin.y = y;
      v60.size.width = width;
      v60.size.height = height;
      v40 = CGRectGetWidth(v60);
      v61.origin.x = attrName;
      v61.origin.y = v37;
      v61.size.width = v38;
      v61.size.height = v39;
      v41 = CGRectGetWidth(v61);
      TruncatedLine = CTLineCreateTruncatedLine(v26, v40 - ceil(v41), kCTLineTruncationEnd, v36);
    }
    v62.origin.x = x;
    v62.origin.y = y;
    v62.size.width = width;
    v62.size.height = height;
    v43 = CGRectGetWidth(v62);
    v63.origin.x = x;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = height;
    v44 = CGRectGetHeight(v63);
    CGContextSetTextPosition(v22, v43, round(v44 * 0.5));
    if (TruncatedLine)
    {
      CTLineDraw(TruncatedLine, v22);
      CFRelease(TruncatedLine);
      if (!v36)
        goto LABEL_18;
    }
    else
    {
      CTLineDraw(v26, v22);
      if (!v36)
      {
LABEL_18:
        CFRelease(v26);
        CFRelease(v24);
        v24 = v33;
        if (v33)
          goto LABEL_19;
LABEL_20:
        CFRelease(value);
        goto LABEL_21;
      }
    }
    CFRelease(v36);
    goto LABEL_18;
  }
}

@end
