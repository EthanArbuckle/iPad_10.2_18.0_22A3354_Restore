@implementation AEHighlightedTextLabel

+ (unint64_t)possibleLineLengthForAnnotation:(id)a3 size:(CGSize)a4
{
  return 45;
}

- (AEHighlightedTextLabel)initWithFrame:(CGRect)a3 generateHighlight:(BOOL)a4 generateHighlightAsynchronously:(BOOL)a5
{
  AEHighlightedTextLabel *v7;
  AEHighlightRenderingController *v8;
  AEHighlightRenderingController *renderingController;
  uint64_t v10;
  UIColor *textColor;
  AEHighlightedTextLabelTextView *v12;
  AEHighlightedTextLabelTextView *v13;
  AEHighlightedTextLabelTextView *textView;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AEHighlightedTextLabel;
  v7 = -[AEHighlightedTextLabel initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v7)
  {
    v8 = objc_alloc_init(AEHighlightRenderingController);
    renderingController = v7->_renderingController;
    v7->_renderingController = v8;

    -[AEHighlightRenderingController setCanUseFilters:](v7->_renderingController, "setCanUseFilters:", 1);
    v7->_numberOfLines = 2;
    v7->_generateHighlight = a4;
    v7->_generateHighlightAsynchronously = a5;
    v7->_annotationBlendMode = 0;
    v7->_highlightedAnnotationBlendMode = 3;
    -[AEHighlightedTextLabel setContentMode:](v7, "setContentMode:", 3);
    -[AEHighlightedTextLabel setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
    v7->_fullLineWidth = 1.79769313e308;
    v10 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    textColor = v7->_textColor;
    v7->_textColor = (UIColor *)v10;

    v12 = [AEHighlightedTextLabelTextView alloc];
    -[AEHighlightedTextLabel bounds](v7, "bounds");
    v13 = -[AEHighlightedTextLabelTextView initWithFrame:](v12, "initWithFrame:");
    textView = v7->_textView;
    v7->_textView = v13;

    -[AEHighlightedTextLabelTextView setOpaque:](v7->_textView, "setOpaque:", -[AEHighlightedTextLabel isOpaque](v7, "isOpaque"));
    -[AEHighlightedTextLabelTextView setDelegate:](v7->_textView, "setDelegate:", v7);
    -[AEHighlightedTextLabel addSubview:](v7, "addSubview:", v7->_textView);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[AEHighlightedTextLabelTextView setBackgroundColor:](v7->_textView, "setBackgroundColor:", v15);
    -[AEHighlightedTextLabel setBackgroundColor:](v7, "setBackgroundColor:", v15);
    -[AEHighlightedTextLabel setUseSelectedText:](v7, "setUseSelectedText:", 0);

  }
  return v7;
}

- (AEHighlightedTextLabel)initWithFrame:(CGRect)a3
{
  return -[AEHighlightedTextLabel initWithFrame:generateHighlight:generateHighlightAsynchronously:](self, "initWithFrame:generateHighlight:generateHighlightAsynchronously:", 1, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  v5 = (void *)objc_opt_class(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightedTextLabel annotation](self, "annotation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightedTextLabel font](self, "font"));
  objc_msgSend(v5, "sizeForAnnotation:font:width:numberOfLines:useSelectedText:", v6, v7, -[AEHighlightedTextLabel numberOfLines](self, "numberOfLines"), -[AEHighlightedTextLabel useSelectedText](self, "useSelectedText"), width);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AEHighlightedTextLabel;
  -[AEHighlightedTextLabel layoutSubviews](&v3, "layoutSubviews");
  -[AEHighlightedTextLabel bounds](self, "bounds");
  -[AEHighlightedTextLabelTextView setFrame:](self->_textView, "setFrame:");
}

+ (double)adjustedLeadingForFont:(__CTFont *)a3
{
  double Ascent;
  double Descent;
  double result;

  Ascent = CTFontGetAscent(a3);
  Descent = CTFontGetDescent(a3);
  result = CTFontGetLeading(a3);
  if (result < (Ascent + Descent) * 0.2)
    return (Ascent + Descent) * 0.2;
  return result;
}

+ (__CTParagraphStyle)createParagraphStyleForFont:(__CTFont *)a3
{
  double Ascent;
  double Descent;
  double v7;
  double v9;
  double v10;
  CTParagraphStyleSetting settings;
  int v12;
  uint64_t v13;
  double *v14;
  int v15;
  uint64_t v16;
  double *v17;

  Ascent = CTFontGetAscent(a3);
  Descent = CTFontGetDescent(a3);
  objc_msgSend(a1, "adjustedLeadingForFont:", a3);
  v10 = v7;
  v9 = Ascent + Descent + v7;
  settings.spec = kCTParagraphStyleSpecifierMinimumLineSpacing;
  settings.valueSize = 8;
  settings.value = &v10;
  v12 = 14;
  v13 = 8;
  v14 = &v10;
  v15 = 8;
  v16 = 8;
  v17 = &v9;
  return CTParagraphStyleCreate(&settings, 3uLL);
}

- (void)drawLabelInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGContext *CurrentContext;
  __int128 v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  __CFString *v19;
  void *v20;
  CGFloat v21;
  CTFontRef v22;
  id v23;
  const void *v24;
  int *v25;
  UIColor *v26;
  id v27;
  id v28;
  const __CTFramesetter *v29;
  id v30;
  const CGPath *v31;
  const __CTFrame *v32;
  id v33;
  AEHighlightedTextLabel *v34;
  const __CTLine *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  __CFString *v40;
  const __CFAttributedString *v41;
  const __CTLine *v42;
  CFIndex location;
  const __CFAttributedString *v44;
  const __CTLine *v45;
  double v46;
  CTLineRef TruncatedLine;
  CTLineRef v48;
  CGPoint *v49;
  uint64_t v50;
  void *v51;
  const __CTLine *v52;
  CGFloat *p_x;
  float v54;
  double v55;
  float v56;
  CGFloat v57;
  float v58;
  CFArrayRef GlyphRuns;
  void *v60;
  id v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  id v66;
  uint64_t v67;
  void *i;
  const __CTRun *v69;
  CFDictionaryRef Attributes;
  void *v71;
  void *v72;
  char Status;
  CFIndex v74;
  double OffsetForStringIndex;
  double v76;
  CGFloat MinY;
  double MaxX;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  AEHighlightLine *v87;
  CTFontRef v88;
  AEHighlight *v89;
  dispatch_queue_global_t global_queue;
  NSObject *v91;
  CGPoint *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  void *j;
  CGRect v102;
  void *v103;
  const __CTFramesetter *cf;
  UIColor *v105;
  id v106;
  void *v107;
  CTFontRef v108;
  const __CTFrame *frame;
  id v110;
  id obj;
  uint64_t v112;
  CGPoint *v113;
  AEHighlightedTextLabel *v114;
  id v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  uint64_t v119;
  CGContext *c;
  double TypographicBounds;
  double v122;
  CGFloat v123;
  CGFloat v124;
  double v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _QWORD block[5];
  AEHighlight *v131;
  id v132;
  CGContext *v133;
  CGFloat v134;
  CGFloat v135;
  CGFloat v136;
  CGFloat v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  CGFloat leading;
  CGFloat descent;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  CGAffineTransform v148;
  CGAffineTransform transform;
  CGAffineTransform v150;
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  CFRange v154;
  CFRange v155;
  CFRange v156;
  CFRange v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v150.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v150.c = v9;
  *(_OWORD *)&v150.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGContextSetTextMatrix(CurrentContext, &v150);
  memset(&v150, 0, sizeof(v150));
  v158.origin.x = x;
  v158.origin.y = y;
  v158.size.width = width;
  v158.size.height = height;
  v10 = CGRectGetHeight(v158);
  CGAffineTransformMakeTranslation(&v150, 0.0, v10);
  v148 = v150;
  CGAffineTransformScale(&transform, &v148, 1.0, -1.0);
  v150 = transform;
  c = CurrentContext;
  CGContextConcatCTM(CurrentContext, &transform);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightedTextLabel annotation](self, "annotation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightedTextLabel renderingController](self, "renderingController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "annotationUuid"));
  objc_msgSend(v12, "removeHighlightForData:", v13);

  if (-[AEHighlightedTextLabel useSelectedText](self, "useSelectedText"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation annotatedAttributedStringForAnnotation:](AEAnnotation, "annotatedAttributedStringForAnnotation:", v11));
  }
  else
  {
    v15 = +[AEAnnotation annotatedAttributedStringForAnnotation:withPossibleLength:](AEAnnotation, "annotatedAttributedStringForAnnotation:withPossibleLength:", v11, -[AEHighlightedTextLabel numberOfLines](self, "numberOfLines")* (_QWORD)objc_msgSend((id)objc_opt_class(self), "possibleLineLengthForAnnotation:size:", v11, CGSizeZero.width, CGSizeZero.height));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v15);
  }
  v16 = v14;
  v17 = objc_msgSend(v14, "mutableCopy");

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightedTextLabel font](self, "font"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fontName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightedTextLabel font](self, "font"));
    objc_msgSend(v20, "pointSize");
    v22 = CTFontCreateWithName(v19, v21, 0);

    v23 = objc_msgSend((id)objc_opt_class(self), "createParagraphStyleForFont:", v22);
    if (v23)
    {
      v24 = v23;
      objc_msgSend(v17, "addAttribute:value:range:", kCTParagraphStyleAttributeName, v23, 0, objc_msgSend(v17, "length"));
      CFRelease(v24);
    }
    v110 = objc_alloc_init((Class)NSMutableArray);
    if (self->_highlighted)
      v25 = &OBJC_IVAR___AEHighlightedTextLabel__highlightedTextColor;
    else
      v25 = &OBJC_IVAR___AEHighlightedTextLabel__textColor;
    v26 = (UIColor *)*(id *)((char *)&self->super.super.super.isa + *v25);
    if (!v26)
      v26 = self->_textColor;
    v107 = v11;
    v27 = objc_alloc((Class)NSDictionary);
    v105 = objc_retainAutorelease(v26);
    v108 = v22;
    v28 = objc_msgSend(v27, "initWithObjectsAndKeys:", v22, kCTFontAttributeName, -[UIColor CGColor](v105, "CGColor"), kCTForegroundColorAttributeName, 0);
    objc_msgSend(v17, "addAttributes:range:", v28, 0, objc_msgSend(v17, "length"));
    objc_msgSend((id)objc_opt_class(self), "collapseNewlinesForMutableAttributedString:", v17);
    v29 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)v17);
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", x, y, width, height)));
    v31 = (const CGPath *)objc_msgSend(v30, "CGPath");
    cf = v29;
    v154.location = 0;
    v154.length = 0;
    v32 = CTFramesetterCreateFrame(v29, v154, v31, 0);

    frame = v32;
    v33 = -[__CFArray mutableCopy](CTFrameGetLines(v32), "mutableCopy");
    v102.size.width = width;
    v102.size.height = height;
    v102.origin.x = x;
    v102.origin.y = y;
    v106 = v17;
    if (objc_msgSend(v33, "count"))
    {
      v34 = self;
      v35 = (const __CTLine *)objc_msgSend(v33, "lastObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "attributesAtIndex:effectiveRange:", 0, 0));

      v37 = objc_msgSend(v36, "mutableCopy");
      objc_msgSend(v37, "setValue:forKey:", 0, CFSTR("kAEAnnotationStyleAttributeName"));
      v38 = IMCommonCoreBundle();
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("\\U2026"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
      v41 = CFAttributedStringCreate(0, v40, (CFDictionaryRef)v37);

      v42 = CTLineCreateWithAttributedString(v41);
      if (v41)
        CFRelease(v41);
      location = CTLineGetStringRange(v35).location;
      v157.length = (CFIndex)objc_msgSend(v17, "length") - location;
      v157.location = location;
      v44 = CFAttributedStringCreateWithSubstring(0, (CFAttributedStringRef)v17, v157);
      v45 = CTLineCreateWithAttributedString(v44);
      v159.origin.x = x;
      v159.origin.y = y;
      v159.size.width = width;
      v159.size.height = height;
      v46 = CGRectGetWidth(v159);
      TruncatedLine = CTLineCreateTruncatedLine(v45, v46, kCTLineTruncationEnd, v42);
      if (TruncatedLine)
      {
        v48 = TruncatedLine;
        objc_msgSend(v33, "replaceObjectAtIndex:withObject:", (char *)objc_msgSend(v33, "count") - 1, TruncatedLine);
        CFRelease(v48);
      }
      if (v45)
        CFRelease(v45);
      if (v44)
        CFRelease(v44);
      if (v42)
        CFRelease(v42);

      v103 = v36;
      self = v34;
    }
    else
    {
      v103 = v28;
    }
    v49 = (CGPoint *)malloc_type_malloc(16 * (_QWORD)objc_msgSend(v33, "count"), 0x1000040451B5BE8uLL);
    v155.location = 0;
    v155.length = 0;
    CTFrameGetLineOrigins(frame, v155, v49);
    v146 = 0u;
    v147 = 0u;
    v144 = 0u;
    v145 = 0u;
    obj = v33;
    v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v144, v153, 16);
    if (v115)
    {
      LODWORD(v50) = 0;
      v112 = *(_QWORD *)v145;
      v118 = CGRectNull.origin.y;
      v116 = CGRectNull.size.height;
      v117 = CGRectNull.size.width;
      v113 = v49;
      v114 = self;
      do
      {
        v51 = 0;
        v50 = (int)v50;
        do
        {
          if (*(_QWORD *)v145 != v112)
            objc_enumerationMutation(obj);
          v52 = *(const __CTLine **)(*((_QWORD *)&v144 + 1) + 8 * (_QWORD)v51);
          v119 = v50;
          p_x = &v49[v50].x;
          CGContextSetTextPosition(c, *p_x, p_x[1]);
          v148.a = 0.0;
          leading = 0.0;
          descent = 0.0;
          TypographicBounds = CTLineGetTypographicBounds(v52, &v148.a, &descent, &leading);
          v54 = p_x[1] - descent;
          v55 = floorf(v54);
          -[AEHighlightedTextLabel bounds](self, "bounds");
          v56 = CGRectGetWidth(v160);
          v57 = ceilf(v56);
          v58 = v148.a + descent;
          v124 = v57;
          v125 = ceilf(v58);
          GlyphRuns = CTLineGetGlyphRuns(v52);
          v60 = (void *)objc_claimAutoreleasedReturnValue(GlyphRuns);
          v138 = 0u;
          v139 = 0u;
          v140 = 0u;
          v141 = 0u;
          v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v138, v152, 16);
          v62 = v116;
          v63 = v117;
          v64 = v118;
          v65 = CGRectNull.origin.x;
          if (v61)
          {
            v66 = v61;
            v67 = *(_QWORD *)v139;
            v62 = v116;
            v63 = v117;
            v64 = v118;
            v65 = CGRectNull.origin.x;
            v122 = v55;
            do
            {
              for (i = 0; i != v66; i = (char *)i + 1)
              {
                if (*(_QWORD *)v139 != v67)
                  objc_enumerationMutation(v60);
                v69 = *(const __CTRun **)(*((_QWORD *)&v138 + 1) + 8 * (_QWORD)i);
                Attributes = CTRunGetAttributes(v69);
                v71 = (void *)objc_claimAutoreleasedReturnValue(Attributes);
                v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKey:", CFSTR("kAEAnnotationStyleAttributeName")));

                if (v72)
                {
                  Status = CTRunGetStatus(v69);
                  if (objc_msgSend(v60, "count") == (char *)&dword_0 + 1)
                  {
                    v63 = CTLineGetTypographicBounds(v52, 0, 0, 0);
                    v65 = 0.0;
                    if ((Status & 1) != 0)
                    {
                      v165.origin.x = 0.0;
                      v165.origin.y = v55;
                      v165.size.width = v124;
                      v62 = v125;
                      v165.size.height = v125;
                      MaxX = CGRectGetMaxX(v165);
                      v166.origin.x = 0.0;
                      v166.origin.y = v55;
                      v166.size.width = v63;
                      v166.size.height = v125;
                      v65 = MaxX - CGRectGetWidth(v166);
                    }
                    else
                    {
                      v62 = v125;
                    }
                    v64 = v55;
                  }
                  else
                  {
                    v123 = v62;
                    v74 = CTRunGetStringRange(v69).location;
                    OffsetForStringIndex = CTLineGetOffsetForStringIndex(v52, v74, 0);
                    v156.location = 0;
                    v156.length = 0;
                    v76 = CTRunGetTypographicBounds(v69, v156, 0, 0, 0);
                    if ((Status & 1) != 0)
                    {
                      v161.origin.x = 0.0;
                      v161.origin.y = v55;
                      v161.size.width = v124;
                      v161.size.height = v125;
                      OffsetForStringIndex = CGRectGetMaxX(v161) - (TypographicBounds - OffsetForStringIndex + v76);
                    }
                    v162.origin.x = 0.0;
                    v162.origin.y = v55;
                    v162.size.width = v124;
                    v162.size.height = v125;
                    v62 = CGRectGetHeight(v162);
                    v163.origin.x = 0.0;
                    v163.origin.y = v55;
                    v163.size.width = v124;
                    v163.size.height = v125;
                    MinY = CGRectGetMinY(v163);
                    v164.origin.x = v65;
                    v164.origin.y = v64;
                    v164.size.width = v63;
                    v164.size.height = v123;
                    if (CGRectIsNull(v164))
                    {
                      v63 = v76;
                      v64 = MinY;
                      v65 = OffsetForStringIndex;
                    }
                    else
                    {
                      v167.origin.x = v65;
                      v167.origin.y = v64;
                      v167.size.width = v63;
                      v167.size.height = v123;
                      v178.origin.x = OffsetForStringIndex;
                      v178.origin.y = MinY;
                      v178.size.width = v76;
                      v178.size.height = v62;
                      v168 = CGRectUnion(v167, v178);
                      v65 = v168.origin.x;
                      v64 = v168.origin.y;
                      v63 = v168.size.width;
                      v62 = v168.size.height;
                    }
                    v55 = v122;
                  }
                }

              }
              v66 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v138, v152, 16);
            }
            while (v66);
          }
          CTLineDraw(v52, c);
          self = v114;
          if (v114->_generateHighlight)
          {
            v169.origin.x = v65;
            v169.origin.y = v64;
            v169.size.width = v63;
            v169.size.height = v62;
            if (!CGRectIsNull(v169))
            {
              transform = v150;
              v170.origin.x = 0.0;
              v170.origin.y = v55;
              v170.size.width = v124;
              v170.size.height = v125;
              v171 = CGRectApplyAffineTransform(v170, &transform);
              v79 = v171.origin.x;
              v80 = v171.origin.y;
              v81 = v171.size.width;
              v82 = v171.size.height;
              transform = v150;
              v171.origin.x = v65;
              v171.origin.y = v64;
              v171.size.width = v63;
              v171.size.height = v62;
              v172 = CGRectApplyAffineTransform(v171, &transform);
              v83 = v172.origin.x;
              v84 = v172.size.width;
              v85 = v172.origin.y + -3.0;
              v86 = v172.size.height + 2.0;
              v87 = objc_alloc_init(AEHighlightLine);
              v173.origin.x = v79;
              v173.origin.y = v80;
              v173.size.width = v81;
              v173.size.height = v82;
              v174 = CGRectIntegral(v173);
              -[AEHighlightLine setFullLineRect:](v87, "setFullLineRect:", v174.origin.x, v174.origin.y, v174.size.width, v174.size.height);
              v175.origin.x = v83;
              v175.origin.y = v85;
              v175.size.width = v84;
              v175.size.height = v86;
              v176 = CGRectIntegral(v175);
              -[AEHighlightLine setCurrentLineRect:](v87, "setCurrentLineRect:", v176.origin.x, v176.origin.y, v176.size.width, v176.size.height);
              -[AEHighlightLine setLightenBlend:](v87, "setLightenBlend:", v114->_shouldInvertContent);
              -[AEHighlightLine setMultiplyImage:](v87, "setMultiplyImage:", 0);
              v177.origin.x = v83;
              v177.origin.y = v85;
              v177.size.width = v84;
              v177.size.height = v86;
              -[AEHighlightLine setUnderlinePosition:](v87, "setUnderlinePosition:", CGRectGetMaxY(v177));
              objc_msgSend(v110, "addObject:", v87);

            }
          }
          v50 = v119 + 1;

          v51 = (char *)v51 + 1;
          v49 = v113;
        }
        while (v51 != v115);
        v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v144, v153, 16);
      }
      while (v115);
    }

    v17 = v106;
    v11 = v107;
    v88 = v108;
    if (objc_msgSend(v110, "count"))
    {
      v89 = objc_alloc_init(AEHighlight);
      -[AEHighlight setAnnotation:](v89, "setAnnotation:", v107);
      -[AEHighlight setLines:](v89, "setLines:", v110);
      if (self->_generateHighlightAsynchronously)
      {
        global_queue = dispatch_get_global_queue(2, 0);
        v91 = objc_claimAutoreleasedReturnValue(global_queue);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_43804;
        block[3] = &unk_28D3E0;
        block[4] = self;
        v131 = v89;
        v132 = v107;
        v133 = c;
        v134 = v102.origin.x;
        v135 = v102.origin.y;
        v136 = v102.size.width;
        v137 = v102.size.height;
        dispatch_async(v91, block);

      }
      else
      {
        v92 = v49;
        v93 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightedTextLabel renderingController](self, "renderingController"));
        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "annotationUuid"));
        objc_msgSend(v93, "addHighlight:forData:", v89, v94);

        v95 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightedTextLabel renderingController](self, "renderingController"));
        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "highlightLayers"));

        v128 = 0u;
        v129 = 0u;
        v126 = 0u;
        v127 = 0u;
        v97 = v96;
        v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v126, v151, 16);
        if (v98)
        {
          v99 = v98;
          v100 = *(_QWORD *)v127;
          do
          {
            for (j = 0; j != v99; j = (char *)j + 1)
            {
              if (*(_QWORD *)v127 != v100)
                objc_enumerationMutation(v97);
              -[AEHighlightedTextLabel p_renderHighlightLayer:inContext:flippingOriginWithY:](self, "p_renderHighlightLayer:inContext:flippingOriginWithY:", *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * (_QWORD)j), c, CGRectGetHeight(v102));
            }
            v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v126, v151, 16);
          }
          while (v99);
        }

        v88 = v108;
        v49 = v92;
      }

    }
    CFRelease(frame);
    if (cf)
      CFRelease(cf);
    if (v88)
      CFRelease(v88);
    if (v49)
      free(v49);

  }
}

- (void)p_renderHighlightLayer:(id)a3 inContext:(CGContext *)a4 flippingOriginWithY:(double)a5
{
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGAffineTransform v13;
  CGAffineTransform transform;
  CGAffineTransform v15;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("kAEHighlightLayerCurrentRectKey")));
  objc_msgSend(v8, "CGRectValue");
  v10 = v9;
  v12 = v11;

  CGContextSaveGState(a4);
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v15, 0.0, a5);
  v13 = v15;
  CGAffineTransformScale(&transform, &v13, 1.0, -1.0);
  v15 = transform;
  CGContextConcatCTM(a4, &transform);
  memset(&transform, 0, sizeof(transform));
  CGAffineTransformMakeTranslation(&transform, v10, v12);
  v13 = transform;
  CGContextConcatCTM(a4, &v13);
  objc_msgSend(v7, "renderInContext:", a4);

  CGContextRestoreGState(a4);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_msgSend((id)objc_opt_class(self), "areAnimationsEnabled");
  objc_msgSend((id)objc_opt_class(self), "setAnimationsEnabled:", 0);
  v9.receiver = self;
  v9.super_class = (Class)AEHighlightedTextLabel;
  -[AEHighlightedTextLabel setFrame:](&v9, "setFrame:", x, y, width, height);
  objc_msgSend((id)objc_opt_class(self), "setAnimationsEnabled:", v8);
}

- (UIFont)font
{
  UIFont *v2;

  v2 = self->_font;
  if (!v2)
    v2 = (UIFont *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 14.0));
  return v2;
}

+ (void)collapseNewlinesForMutableAttributedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  v6 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("[\r\n]+"), 0, &v6));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mutableString"));
    objc_msgSend(v4, "replaceMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v3, "length"), CFSTR("\n"));

  }
}

+ (CGSize)sizeForAnnotation:(id)a3 font:(id)a4 width:(double)a5 numberOfLines:(unint64_t)a6 useSelectedText:(BOOL)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  __CFString *v17;
  CGFloat v18;
  const __CTFont *v19;
  double Ascent;
  double Descent;
  double v22;
  double v23;
  id v24;
  const void *v25;
  double v26;
  const __CTFramesetter *v27;
  id v28;
  const CGPath *v29;
  const __CTFrame *Frame;
  CFArrayRef Lines;
  void *v32;
  CGPoint *v33;
  size_t v34;
  double v35;
  double v36;
  float v37;
  double width;
  float v39;
  double height;
  double v41;
  double v42;
  _QWORD v44[8];
  uint64_t v45;
  double *v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  double *v50;
  uint64_t v51;
  uint64_t v52;
  CFRange v53;
  CFRange v54;
  CGSize result;

  v12 = a3;
  v13 = a4;
  if (a7)
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation annotatedAttributedStringForAnnotation:](AEAnnotation, "annotatedAttributedStringForAnnotation:", v12));
  else
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation annotatedAttributedStringForAnnotation:withPossibleLength:](AEAnnotation, "annotatedAttributedStringForAnnotation:withPossibleLength:", v12, (_QWORD)objc_msgSend(a1, "possibleLineLengthForAnnotation:size:", v12, CGSizeZero.width, CGSizeZero.height)* a6));
  v15 = v14;
  v16 = objc_msgSend(v14, "mutableCopy");

  if (v16)
  {
    objc_msgSend(a1, "collapseNewlinesForMutableAttributedString:", v16);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fontName"));
    objc_msgSend(v13, "pointSize");
    v19 = CTFontCreateWithName(v17, v18, 0);

    Ascent = CTFontGetAscent(v19);
    Descent = CTFontGetDescent(v19);
    objc_msgSend((id)objc_opt_class(a1), "adjustedLeadingForFont:", v19);
    v23 = v22;
    objc_msgSend(v16, "addAttribute:value:range:", kCTFontAttributeName, v19, 0, objc_msgSend(v16, "length"));
    v24 = objc_msgSend((id)objc_opt_class(a1), "createParagraphStyleForFont:", v19);
    if (v24)
    {
      v25 = v24;
      objc_msgSend(v16, "addAttribute:value:range:", kCTParagraphStyleAttributeName, v24, 0, objc_msgSend(v16, "length"));
      CFRelease(v25);
    }
    v26 = (ceil(Ascent + Descent) + ceil(v23)) * (double)a6;
    v27 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)v16);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 0.0, 0.0, a5, v26)));
    v29 = (const CGPath *)objc_msgSend(v28, "CGPath");
    v53.location = 0;
    v53.length = 0;
    Frame = CTFramesetterCreateFrame(v27, v53, v29, 0);

    Lines = CTFrameGetLines(Frame);
    v32 = (void *)objc_claimAutoreleasedReturnValue(Lines);
    v49 = 0;
    v50 = (double *)&v49;
    v51 = 0x2020000000;
    v52 = 0;
    v45 = 0;
    v46 = (double *)&v45;
    v47 = 0x2020000000;
    v48 = v26;
    v33 = (CGPoint *)&v44[-2 * __chkstk_darwin(objc_msgSend(v32, "count")) - 1];
    bzero(v33, v34);
    v54.location = 0;
    v54.length = 0;
    CTFrameGetLineOrigins(Frame, v54, v33);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_44098;
    v44[3] = &unk_28D408;
    v44[6] = a6;
    v44[7] = v33;
    v44[4] = &v49;
    v44[5] = &v45;
    objc_msgSend(v32, "enumerateObjectsUsingBlock:", v44);
    if (Frame)
      CFRelease(Frame);
    v35 = v50[3];
    v36 = v46[3];
    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v49, 8);

    if (v27)
      CFRelease(v27);
    v37 = v35;
    width = ceilf(v37);
    v39 = v36 + -0.5;
    height = v26 - floorf(v39) + 5.0;
    if (v19)
      CFRelease(v19);
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }

  v41 = width;
  v42 = height;
  result.height = v42;
  result.width = v41;
  return result;
}

- (void)setAnnotation:(id)a3
{
  AEAnnotation *v5;
  void *v6;
  void *v7;
  AEAnnotation *v8;

  v5 = (AEAnnotation *)a3;
  if (self->_annotation != v5)
  {
    v8 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightedTextLabel renderingController](self, "renderingController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationUuid](self->_annotation, "annotationUuid"));
    objc_msgSend(v6, "removeHighlightForData:", v7);

    objc_storeStrong((id *)&self->_annotation, a3);
    -[AEHighlightedTextLabelTextView setNeedsDisplay](self->_textView, "setNeedsDisplay");
    v5 = v8;
  }

}

- (void)setTextColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (!v4)
    v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_storeStrong((id *)&self->_textColor, v4);
  if (!v5)

  if (!self->_highlightedTextColor)
    objc_storeStrong((id *)&self->_highlightedTextColor, self->_textColor);
  -[AEHighlightedTextLabelTextView setNeedsDisplay](self->_textView, "setNeedsDisplay");

}

- (void)setHighlightedTextColor:(id)a3
{
  void *textColor;
  id v6;

  textColor = a3;
  if (!a3)
    textColor = self->_textColor;
  objc_storeStrong((id *)&self->_highlightedTextColor, textColor);
  v6 = a3;
  -[AEHighlightedTextLabelTextView setNeedsDisplay](self->_textView, "setNeedsDisplay");

}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  objc_storeStrong((id *)&self->_bk_backgroundColor, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v7.receiver = self;
  v7.super_class = (Class)AEHighlightedTextLabel;
  -[AEHighlightedTextLabel setBackgroundColor:](&v7, "setBackgroundColor:", v6);

  -[AEHighlightedTextLabel _updateBackgroundColors](self, "_updateBackgroundColors");
}

- (void)_updateBackgroundColors
{
  UIColor *v3;
  UIColor *v4;

  if (self->_highlighted)
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  else
    v3 = self->_bk_backgroundColor;
  v4 = v3;
  -[AEHighlightedTextLabelTextView setBackgroundColor:](self->_textView, "setBackgroundColor:", v3);
  -[AEHighlightedTextLabelTextView setNeedsDisplay](self->_textView, "setNeedsDisplay");

}

- (int64_t)pageTheme
{
  return -[AEHighlightRenderingController pageTheme](self->_renderingController, "pageTheme");
}

- (void)setPageTheme:(int64_t)a3
{
  if (-[AEHighlightRenderingController pageTheme](self->_renderingController, "pageTheme") != a3)
  {
    -[AEHighlightRenderingController setPageTheme:](self->_renderingController, "setPageTheme:", a3);
    -[AEHighlightedTextLabelTextView setNeedsDisplay](self->_textView, "setNeedsDisplay");
  }
}

- (void)setAnnotationBlendMode:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  self->_annotationBlendMode = a3;
  if (-[AEHighlightRenderingController annotationBlendMode](self->_renderingController, "annotationBlendMode") != a3)
  {
    -[AEHighlightRenderingController setAnnotationBlendMode:](self->_renderingController, "setAnnotationBlendMode:", v3);
    -[AEHighlightedTextLabelTextView setNeedsDisplay](self->_textView, "setNeedsDisplay");
  }
}

- (void)setHighlightedAnnotationBlendMode:(int)a3
{
  self->_highlightedAnnotationBlendMode = a3;
  -[AEHighlightedTextLabelTextView setNeedsDisplay](self->_textView, "setNeedsDisplay");
}

- (void)setHighlighted:(BOOL)a3
{
  int *v4;

  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    v4 = &OBJC_IVAR___AEHighlightedTextLabel__annotationBlendMode;
    if (a3)
      v4 = &OBJC_IVAR___AEHighlightedTextLabel__highlightedAnnotationBlendMode;
    -[AEHighlightRenderingController setAnnotationBlendMode:](self->_renderingController, "setAnnotationBlendMode:", *(unsigned int *)((char *)&self->super.super.super.isa + *v4));
    -[AEHighlightedTextLabel _updateBackgroundColors](self, "_updateBackgroundColors");
  }
}

- (NSAttributedString)annotationAttributedString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightedTextLabel annotation](self, "annotation"));
  if (-[AEHighlightedTextLabel useSelectedText](self, "useSelectedText"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation annotatedAttributedStringForAnnotation:](AEAnnotation, "annotatedAttributedStringForAnnotation:", v3));
  }
  else
  {
    v5 = +[AEAnnotation annotatedAttributedStringForAnnotation:withPossibleLength:](AEAnnotation, "annotatedAttributedStringForAnnotation:withPossibleLength:", v3, -[AEHighlightedTextLabel numberOfLines](self, "numberOfLines")* (_QWORD)objc_msgSend((id)objc_opt_class(self), "possibleLineLengthForAnnotation:size:", v3, CGSizeZero.width, CGSizeZero.height));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  v6 = v4;
  v7 = objc_msgSend(v4, "mutableCopy");

  return (NSAttributedString *)v7;
}

- (void)clearHighlights
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEHighlightedTextLabel renderingController](self, "renderingController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightedTextLabel annotation](self, "annotation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotationUuid"));
  objc_msgSend(v5, "removeHighlightForData:", v4);

}

- (AEAnnotation)annotation
{
  return self->_annotation;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(int64_t)a3
{
  self->_numberOfLines = a3;
}

- (double)fullLineWidth
{
  return self->_fullLineWidth;
}

- (void)setFullLineWidth:(double)a3
{
  self->_fullLineWidth = a3;
}

- (BOOL)shouldInvertContent
{
  return self->_shouldInvertContent;
}

- (void)setShouldInvertContent:(BOOL)a3
{
  self->_shouldInvertContent = a3;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (int)annotationBlendMode
{
  return self->_annotationBlendMode;
}

- (int)highlightedAnnotationBlendMode
{
  return self->_highlightedAnnotationBlendMode;
}

- (BOOL)useSelectedText
{
  return self->_useSelectedText;
}

- (void)setUseSelectedText:(BOOL)a3
{
  self->_useSelectedText = a3;
}

- (AEHighlightRenderingController)renderingController
{
  return self->_renderingController;
}

- (void)setRenderingController:(id)a3
{
  objc_storeStrong((id *)&self->_renderingController, a3);
}

- (UIColor)bk_backgroundColor
{
  return self->_bk_backgroundColor;
}

- (void)setBk_backgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_bk_backgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bk_backgroundColor, 0);
  objc_storeStrong((id *)&self->_renderingController, 0);
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
