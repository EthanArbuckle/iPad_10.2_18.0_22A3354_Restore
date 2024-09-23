@implementation UIMorphingLabelGlyphSet

- (void)placeGlyphs
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  CGPoint *v6;
  double x;
  double y;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[8];

  if (self->_glyphCount)
  {
    v3 = 0;
    v4 = 0;
    v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v16 = *MEMORY[0x1E0CD2610];
    v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    do
    {
      -[NSMutableArray objectAtIndex:](self->_glyphViews, "objectAtIndex:", v4, v13, v14, v15, v16, v17, v18, v19, v20);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = &self->_glyphPositions[v3];
      x = v6->x;
      y = v6->y;
      objc_msgSend(v5, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPosition:", x, y);

      objc_msgSend(v5, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21[4] = v20;
      v21[5] = v19;
      v21[6] = v18;
      v21[7] = v17;
      v21[0] = v16;
      v21[1] = v15;
      v21[2] = v14;
      v21[3] = v13;
      objc_msgSend(v10, "setTransform:", v21);

      objc_msgSend(v5, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = 1.0;
      objc_msgSend(v11, "setOpacity:", v12);

      objc_msgSend(v5, "setHidden:", 0);
      ++v4;
      ++v3;
    }
    while (v4 < self->_glyphCount);
  }
}

- (unint64_t)glyphCount
{
  return self->_glyphCount;
}

- (UIMorphingLabelGlyphSet)initWithLabel:(id)a3 attributedString:(id)a4
{
  id v6;
  const __CFAttributedString *v7;
  UIMorphingLabelGlyphSet *v8;
  UIMorphingLabelGlyphSet *v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  NSAttributedString *attributedString;
  id v16;
  void *v17;
  const __CFAttributedString *v18;
  const __CTLine *v19;
  CTLineRef TruncatedLine;
  objc_super v22;

  v6 = a3;
  v7 = (const __CFAttributedString *)a4;
  v22.receiver = self;
  v22.super_class = (Class)UIMorphingLabelGlyphSet;
  v8 = -[UIMorphingLabelGlyphSet init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = objc_storeWeak((id *)&v8->_label, v6);
    objc_msgSend(v6, "bounds");
    v12 = v11;

    +[_NSAttributedStringIntentResolver attributedStringByResolvingString:](_UIAttributedStringIntentResolver, "attributedStringByResolvingString:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    attributedString = v9->_attributedString;
    v9->_attributedString = (NSAttributedString *)v14;

    v9->_line = CTLineCreateWithAttributedString(v7);
    if (-[__CFAttributedString length](v7, "length"))
    {
      v16 = objc_alloc(MEMORY[0x1E0CB3498]);
      -[__CFAttributedString attributesAtIndex:effectiveRange:](v7, "attributesAtIndex:effectiveRange:", -[__CFAttributedString length](v7, "length") - 1, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (const __CFAttributedString *)objc_msgSend(v16, "initWithString:attributes:", CFSTR("…"), v17);

      v19 = CTLineCreateWithAttributedString(v18);
      TruncatedLine = CTLineCreateTruncatedLine(v9->_line, v12, kCTLineTruncationEnd, v19);
      CFRelease(v19);
      if (TruncatedLine)
      {
        CFRelease(v9->_line);
        v9->_line = TruncatedLine;
      }

    }
    -[UIMorphingLabelGlyphSet buildGlyphViews](v9, "buildGlyphViews");
  }

  return v9;
}

- (void)buildGlyphViews
{
  CFIndex GlyphCount;
  CGPoint *v4;
  uint64_t v5;
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  CGFloat MidX;
  id v19;
  CGFloat MidY;
  void *v21;
  double v22;
  double v23;
  const __CFArray *GlyphRuns;
  CFIndex Count;
  CGFloat *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  const __CTRun *ValueAtIndex;
  CFIndex v31;
  const __CTFont *Font;
  CTFontSymbolicTraits SymbolicTraits;
  int v34;
  CGPoint *glyphPositions;
  unint64_t v36;
  uint64_t v37;
  id v38;
  double v39;
  CGFloat v40;
  double *v41;
  uint64_t v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  char *v48;
  unint64_t v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  _QWORD *ContextStack;
  CGContext *v57;
  void *v58;
  const __CFArray *v59;
  uint64_t v60;
  unint64_t v61;
  const __CTRun *v62;
  const __CTFont *v63;
  size_t v64;
  void *v65;
  NSMutableArray *v66;
  NSMutableArray *glyphViews;
  unint64_t v68;
  unint64_t v69;
  double v70;
  _OWORD *v71;
  double v72;
  double v73;
  double height;
  double width;
  double y;
  double x;
  UIMorphingLabelImage *v78;
  id v79;
  void *v80;
  id *v81;
  id v82;
  double v83;
  double v84;
  double v85;
  double v86;
  __CTLine *line;
  id v88;
  CGFloat v89;
  double v90;
  id v91;
  CGFloat v92;
  id v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  unint64_t v97;
  CGRect *v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  CGFloat *p_height;
  CGFloat *p_width;
  CGFloat *p_y;
  CGRect *v105;
  CGRect *v106;
  CGFloat v107;
  CGFloat v108;
  CGFloat v109;
  CGFloat v110;
  void *v111;
  CGRect *v112;
  double v113;
  double v114;
  void *v115;
  double *v116;
  double MinX;
  CGFloat MaxX;
  CGFloat v119;
  double v120;
  double MinY;
  double v122;
  void *v123;
  __int128 v124;
  id v125;
  __int128 *v126;
  CFArrayRef v127;
  __int128 v128;
  __int128 v129;
  double v130;
  unint64_t v131;
  char *v132;
  id *p_label;
  CGAffineTransform v134;
  CGFloat v135;
  CGFloat v136;
  CGFloat v137;
  CGAffineTransform v138;
  CGAffineTransform v139;
  CGAffineTransform v140;
  CGAffineTransform v141;
  CGAffineTransform v142;
  uint64_t v143;
  CFRange v144;
  CFRange v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;

  v143 = *MEMORY[0x1E0C80C00];
  GlyphCount = CTLineGetGlyphCount(self->_line);
  self->_glyphCount = GlyphCount;
  if (GlyphCount)
  {
    self->_glyphs = (unsigned __int16 *)malloc_type_malloc(2 * GlyphCount, 0x1000040BDFB0063uLL);
    self->_glyphFrames = (CGRect *)malloc_type_malloc(32 * self->_glyphCount, 0x1000040E0EAB150uLL);
    v4 = (CGPoint *)malloc_type_malloc(16 * self->_glyphCount, 0x1000040451B5BE8uLL);
    self->_glyphPositions = v4;
    v5 = MEMORY[0x1E0C80A78](v4);
    v7 = (double *)(&v124 - 2 * v6);
    v8 = MEMORY[0x1E0C80A78](v5);
    v10 = &v124 - v9;
    MEMORY[0x1E0C80A78](v8);
    v132 = (char *)&v124 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    p_label = (id *)&self->_label;
    WeakRetained = objc_loadWeakRetained((id *)&self->_label);
    objc_msgSend(WeakRetained, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "screen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v16;
    v125 = v16;

    objc_msgSend(v21, "scale");
    v23 = v22;
    GlyphRuns = CTLineGetGlyphRuns(self->_line);
    Count = CFArrayGetCount(GlyphRuns);
    v26 = (CGFloat *)MEMORY[0x1E0C9D648];
    v126 = &v124;
    v127 = GlyphRuns;
    if (!Count)
      goto LABEL_21;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    do
    {
      v130 = *(double *)&v29;
      v131 = v28;
      ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v29);
      v31 = CTRunGetGlyphCount(ValueAtIndex);
      Font = (const __CTFont *)CTRunGetFont();
      SymbolicTraits = CTFontGetSymbolicTraits(Font);
      v144.location = 0;
      v144.length = v31;
      CTRunGetGlyphs(ValueAtIndex, v144, &self->_glyphs[v27]);
      CTFontGetBoundingRectsForGlyphs(Font, kCTFontOrientationDefault, &self->_glyphs[v27], &self->_glyphFrames[v27], v31);
      v145.location = 0;
      v145.length = v31;
      CTRunGetPositions(ValueAtIndex, v145, &self->_glyphPositions[v27]);
      if (v31)
      {
        v34 = (SymbolicTraits >> 13) & 1;
        *(_QWORD *)&v128 = v31 + v27;
        glyphPositions = self->_glyphPositions;
        v36 = 32 * v27;
        *(_QWORD *)&v129 = v31;
        v37 = (16 * v27) | 8;
        do
        {
          v148 = CGRectOffset(self->_glyphFrames[v36 / 0x20], *(CGFloat *)((char *)glyphPositions + v37 - 8), *(CGFloat *)((char *)&glyphPositions->x + v37));
          v149.origin.x = UIRectIntegralWithScale(v148.origin.x, v148.origin.y, v148.size.width, v148.size.height, v23);
          self->_glyphFrames[v36 / 0x20] = CGRectInset(v149, -2.0 / v23, -1.0 / v23);
          if (v27)
            CGRectGetMaxX(*(CGRect *)&v7[v36 / 8 - 4]);
          v38 = objc_loadWeakRetained(p_label);
          UICeilToViewScale(v38);
          v40 = v39;

          *(CGRect *)&v7[v36 / 8] = CGRectOffset(self->_glyphFrames[v36 / 0x20], v40, 0.0);
          v41 = (double *)((char *)v10 + v37);
          glyphPositions = self->_glyphPositions;
          v42 = *(_QWORD *)((char *)&glyphPositions->x + v37);
          v43 = v40 + *(double *)((char *)glyphPositions + v37 - 8);
          v132[v27] = v34;
          *(v41 - 1) = v43;
          *(_QWORD *)v41 = v42;
          ++v27;
          v36 += 32;
          v37 += 16;
          --v31;
        }
        while (v31);
        v28 = v129 + v131;
        GlyphRuns = v127;
        v27 = v128;
      }
      else
      {
        v28 = v131;
      }
      v29 = *(_QWORD *)&v130 + 1;
    }
    while (v29 < CFArrayGetCount(GlyphRuns));
    v26 = (CGFloat *)MEMORY[0x1E0C9D648];
    if (v28)
    {
      v45 = *v7;
      v44 = v7[1];
      v47 = v7[2];
      v46 = v7[3];
      if (self->_glyphCount >= 2)
      {
        v48 = (char *)(v7 + 7);
        v49 = 1;
        do
        {
          v50 = v45;
          v51 = v47;
          *(CGRect *)(&v44 - 1) = CGRectUnion(*(CGRect *)(&v44 - 1), *(CGRect *)(v48 - 24));
          v45 = v52;
          v47 = v53;
          ++v49;
          v48 += 32;
        }
        while (v49 < self->_glyphCount);
      }
    }
    else
    {
LABEL_21:
      v28 = 0;
      v45 = *v26;
      v44 = v26[1];
      v47 = v26[2];
      v46 = v26[3];
    }
    v131 = v28;
    v54 = 1.0 / v23 + v46;
    v55 = v44 - 1.0 / v23;
    CGAffineTransformMakeScale(&v142, 1.0, -1.0);
    v150.origin.x = v45;
    v150.origin.y = v55;
    v150.size.width = v47;
    v150.size.height = v54;
    v151 = CGRectApplyAffineTransform(v150, &v142);
    *(_OWORD *)&v151.size.height = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v141.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v141.c = *(_OWORD *)&v151.size.height;
    *(_OWORD *)&v141.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v128 = *(_OWORD *)&v151.size.height;
    v129 = *(_OWORD *)&v141.a;
    *(_OWORD *)&v140.a = *(_OWORD *)&v141.a;
    *(_OWORD *)&v140.c = *(_OWORD *)&v151.size.height;
    v124 = *(_OWORD *)&v141.tx;
    *(_OWORD *)&v140.tx = *(_OWORD *)&v141.tx;
    CGAffineTransformTranslate(&v141, &v140, -v151.origin.x, -v151.origin.y);
    v139 = v141;
    CGAffineTransformScale(&v140, &v139, 1.0, -1.0);
    v141 = v140;
    _UIGraphicsBeginImageContextWithOptions(0, 0, v47, v54, v23);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v57 = 0;
    else
      v57 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    CGContextSaveGState(v57);
    v140 = v141;
    CGContextConcatCTM(v57, &v140);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "set");

    v59 = v127;
    if (CFArrayGetCount(v127))
    {
      v60 = 0;
      v61 = 0;
      do
      {
        v62 = (const __CTRun *)CFArrayGetValueAtIndex(v59, v61);
        v63 = (const __CTFont *)CTRunGetFont();
        v64 = CTRunGetGlyphCount(v62);
        CTFontDrawGlyphs(v63, &self->_glyphs[v60], (const CGPoint *)&v10[v60], v64, v57);
        v60 += v64;
        ++v61;
      }
      while (v61 < CFArrayGetCount(v59));
    }
    CGContextRestoreGState(v57);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v66 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    glyphViews = self->_glyphViews;
    self->_glyphViews = v66;

    v68 = v131;
    if (self->_glyphCount)
    {
      v69 = 0;
      v70 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v130 = *MEMORY[0x1E0C9D648];
      v71 = v7 + 2;
      v73 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v72 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      do
      {
        height = v72;
        width = v73;
        y = v70;
        x = v130;
        if (v68 > v69)
        {
          v152 = *(CGRect *)(v71 - 1);
          v140 = v141;
          v153 = CGRectApplyAffineTransform(v152, &v140);
          x = v153.origin.x;
          y = v153.origin.y;
          width = v153.size.width;
          height = v153.size.height;
        }
        CGAffineTransformMakeScale(&v138, v23, v23);
        v154.origin.x = x;
        v154.origin.y = y;
        v154.size.width = width;
        v154.size.height = height;
        v155 = CGRectApplyAffineTransform(v154, &v138);
        UIRectIntegralWithScale(v155.origin.x, v155.origin.y, v155.size.width, v155.size.height, 1.0);
        v78 = objc_alloc_init(UIMorphingLabelImage);
        -[UIMorphingLabelImage setImage:](v78, "setImage:", v65);
        -[UIMorphingLabelImage setContentsRect:](v78, "setContentsRect:", x, y, width, height);
        if (v68 > v69)
        {
          v79 = objc_loadWeakRetained(p_label);
          objc_msgSend(v79, "glyphViewWithImage:isColorGlyph:", v78, v132[v69]);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          v68 = v131;
          if (v80)
          {
            -[NSMutableArray addObject:](self->_glyphViews, "addObject:", v80);

          }
        }

        ++v69;
        v71 += 2;
      }
      while (v69 < self->_glyphCount);
    }
    v81 = p_label;
    v82 = objc_loadWeakRetained(p_label);
    objc_msgSend(v82, "bounds");
    v84 = v83;
    v86 = v85;

    line = self->_line;
    v88 = objc_loadWeakRetained(v81);
    objc_msgSend(v88, "flushAmount");
    self->_lineOrigin.x = CTLineGetPenOffsetForFlush(line, v89, v84);

    v136 = 0.0;
    v137 = 0.0;
    v135 = 0.0;
    self->_lineWidth = CTLineGetTypographicBounds(self->_line, &v137, &v136, &v135);
    v90 = self->_lineWidth - CTLineGetTrailingWhitespaceWidth(self->_line);
    self->_lineOrigin.y = v137 + (v86 - (v137 + v136)) * 0.5;
    self->_lineWidth = v90;
    v91 = objc_loadWeakRetained(v81);
    UIRoundToViewScale(v91);
    self->_lineOrigin.x = v92;

    v93 = objc_loadWeakRetained(v81);
    UIRoundToViewScale(v93);
    self->_lineOrigin.y = v94;

    *(_OWORD *)&v140.a = v129;
    *(_OWORD *)&v140.c = v128;
    *(_OWORD *)&v140.tx = v124;
    v95 = self->_lineOrigin.x;
    v96 = self->_lineOrigin.y;
    *(_OWORD *)&v139.a = v129;
    *(_OWORD *)&v139.c = v128;
    *(_OWORD *)&v139.tx = v124;
    CGAffineTransformTranslate(&v140, &v139, v95, v96);
    v134 = v140;
    CGAffineTransformScale(&v139, &v134, 1.0, -1.0);
    v140 = v139;
    v97 = v68;
    v98 = (CGRect *)MEMORY[0x1E0C9D648];
    if (self->_glyphCount)
    {
      v99 = 0;
      v100 = 0;
      v101 = 8;
      do
      {
        p_height = &v98->size.height;
        p_width = &v98->size.width;
        p_y = &v98->origin.y;
        v105 = &self->_glyphFrames[v99];
        if (v97 > v100)
          v106 = &self->_glyphFrames[v99];
        else
          v106 = v98;
        if (v97 > v100)
        {
          p_y = &v105->origin.y;
          p_width = &v105->size.width;
          p_height = &v105->size.height;
        }
        v156.size.height = *p_height;
        v156.size.width = *p_width;
        v156.origin.y = *p_y;
        v156.origin.x = v106->origin.x;
        v139 = v140;
        v157 = CGRectApplyAffineTransform(v156, &v139);
        v107 = v157.origin.x;
        v108 = v157.origin.y;
        v109 = v157.size.width;
        v110 = v157.size.height;
        *v105 = v157;
        -[NSMutableArray objectAtIndexedSubscript:](self->_glyphViews, "objectAtIndexedSubscript:", v100);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = &self->_glyphFrames[v99];
        v113 = v112->size.width;
        v114 = v112->size.height;
        objc_msgSend(v111, "layer");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "setBounds:", 0.0, 0.0, v113, v114);

        v116 = (double *)((char *)&self->_glyphPositions->x + v101);
        v158.origin.x = v107;
        v158.origin.y = v108;
        v158.size.width = v109;
        v158.size.height = v110;
        MinX = CGRectGetMinX(v158);
        v159.origin.x = v107;
        v159.origin.y = v108;
        v159.size.width = v109;
        v159.size.height = v110;
        MaxX = CGRectGetMaxX(v159);
        v119 = self->_lineOrigin.y;
        *(v116 - 1) = MinX * 0.95 + MaxX * 0.05;
        *v116 = v119;
        v120 = self->_lineOrigin.y;
        MinY = CGRectGetMinY(self->_glyphFrames[v99]);
        v122 = (v120 - MinY) / (CGRectGetMaxY(self->_glyphFrames[v99]) - MinY);
        objc_msgSend(v111, "layer");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "setAnchorPoint:", 0.05, v122);

        ++v100;
        ++v99;
        v101 += 16;
      }
      while (v100 < self->_glyphCount);
    }

  }
  else
  {
    v17 = objc_loadWeakRetained((id *)&self->_label);
    objc_msgSend(v17, "bounds");
    MidX = CGRectGetMidX(v146);
    v19 = objc_loadWeakRetained((id *)&self->_label);
    objc_msgSend(v19, "bounds");
    MidY = CGRectGetMidY(v147);
    self->_lineOrigin.x = MidX;
    self->_lineOrigin.y = MidY;

    self->_lineWidth = 0.0;
  }
}

- (void)dealloc
{
  __CTLine *line;
  unsigned __int16 *glyphs;
  CGRect *glyphFrames;
  CGPoint *glyphPositions;
  objc_super v7;

  line = self->_line;
  if (line)
    CFRelease(line);
  glyphs = self->_glyphs;
  if (glyphs)
    free(glyphs);
  glyphFrames = self->_glyphFrames;
  if (glyphFrames)
    free(glyphFrames);
  glyphPositions = self->_glyphPositions;
  if (glyphPositions)
    free(glyphPositions);
  v7.receiver = self;
  v7.super_class = (Class)UIMorphingLabelGlyphSet;
  -[UIMorphingLabelGlyphSet dealloc](&v7, sel_dealloc);
}

- (void)removeGlyphs
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  UIMorphingLabel **p_label;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_glyphViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    p_label = &self->_label;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        WeakRetained = objc_loadWeakRetained((id *)p_label);
        objc_msgSend(WeakRetained, "hideGlyph:", v9, (_QWORD)v11);

        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (CGRect)boundingRectForGlyphsInRange:(_NSRange)a3
{
  CGRect *v4;
  CGFloat x;
  double y;
  double width;
  double height;
  NSUInteger v9;
  NSUInteger location;
  CGRect result;

  if (a3.length)
  {
    v4 = &self->_glyphFrames[a3.location];
    x = v4->origin.x;
    y = v4->origin.y;
    width = v4->size.width;
    height = v4->size.height;
    if (a3.location + 1 < a3.location + a3.length)
    {
      v9 = a3.length - 1;
      location = a3.location;
      do
      {
        *(CGRect *)&x = CGRectUnion(*(CGRect *)&x, self->_glyphFrames[++location]);
        --v9;
      }
      while (v9);
    }
  }
  else
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (const)glyphs
{
  return self->_glyphs;
}

- (const)glyphFrames
{
  return self->_glyphFrames;
}

- (const)glyphPositions
{
  return self->_glyphPositions;
}

- (NSArray)glyphViews
{
  return &self->_glyphViews->super;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (CGPoint)lineOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_lineOrigin.x;
  y = self->_lineOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphViews, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_destroyWeak((id *)&self->_label);
}

@end
