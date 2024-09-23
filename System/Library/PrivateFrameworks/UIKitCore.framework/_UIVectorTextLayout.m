@implementation _UIVectorTextLayout

- (_UIVectorTextLayout)initWithTextParameters:(id)a3
{
  id v4;
  _UIVectorTextLayout *v5;
  uint64_t v6;
  _UIVectorTextLayoutInfo *layoutInfo;
  _UIVectorTextLayoutParameters *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIVectorTextLayout;
  v5 = -[_UIVectorTextLayout init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    layoutInfo = v5->_layoutInfo;
    v5->_layoutInfo = (_UIVectorTextLayoutInfo *)v6;

    v8 = -[_UIVectorTextLayoutParameters initWithParameters:]([_UIVectorTextLayoutParameters alloc], "initWithParameters:", v4);
    -[_UIVectorTextLayoutInfo setParameters:](v5->_layoutInfo, "setParameters:", v8);

  }
  return v5;
}

- (_UIVectorTextLayoutParameters)parameters
{
  return -[_UIVectorTextLayoutInfo parameters](self->_layoutInfo, "parameters");
}

- (BOOL)hasLayout
{
  return self->_runs != 0;
}

- (void)resetLayout
{
  NSArray *runs;

  runs = self->_runs;
  self->_runs = 0;

}

- (CGRect)boundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UIVectorTextLayout _layoutIfNeeded](self, "_layoutIfNeeded");
  x = self->_boundingRect.origin.x;
  y = self->_boundingRect.origin.y;
  width = self->_boundingRect.size.width;
  height = self->_boundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)usedBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UIVectorTextLayout _layoutIfNeeded](self, "_layoutIfNeeded");
  x = self->_usedBoundingRect.origin.x;
  y = self->_usedBoundingRect.origin.y;
  width = self->_usedBoundingRect.size.width;
  height = self->_usedBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)numberOfLines
{
  -[_UIVectorTextLayout _layoutIfNeeded](self, "_layoutIfNeeded");
  return self->_numberOfLines;
}

- (unint64_t)numberOfRuns
{
  -[_UIVectorTextLayout _layoutIfNeeded](self, "_layoutIfNeeded");
  return -[NSArray count](self->_runs, "count");
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  -[_UIVectorTextLayout _layoutIfNeeded](self, "_layoutIfNeeded");
  width = self->_boundingRect.size.width;
  height = self->_boundingRect.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (_NSRange)textRange
{
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  -[_UIVectorTextLayout _layoutIfNeeded](self, "_layoutIfNeeded");
  location = self->_fitRange.location;
  length = self->_fitRange.length;
  result.length = length;
  result.location = location;
  return result;
}

- (double)firstLineBaseline
{
  -[_UIVectorTextLayout _layoutIfNeeded](self, "_layoutIfNeeded");
  return self->_firstLineBaseline;
}

- (double)lastLineBaseline
{
  -[_UIVectorTextLayout _layoutIfNeeded](self, "_layoutIfNeeded");
  return self->_lastLineBaseline;
}

- (void)enumerateRunsUsingBlock:(id)a3
{
  id v4;
  NSArray *runs;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[_UIVectorTextLayout _layoutIfNeeded](self, "_layoutIfNeeded");
  runs = self->_runs;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47___UIVectorTextLayout_enumerateRunsUsingBlock___block_invoke;
  v7[3] = &unk_1E16EA6F0;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](runs, "enumerateObjectsUsingBlock:", v7);

}

- (id)description
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = -[_UIVectorTextLayout hasLayout](self, "hasLayout");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  -[_UIVectorTextLayoutInfo parameters](self->_layoutInfo, "parameters");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v3)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p params=%@ layout=(%fx%f, %ld lines, %ld runs)>"), v5, self, v6, *(_QWORD *)&self->_boundingRect.size.width, *(_QWORD *)&self->_boundingRect.size.height, self->_numberOfLines, -[NSArray count](self->_runs, "count"));
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p params=%@ layout=?>"), v5, self, v6, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)layoutDescription
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  __CFString *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSArray *obj;
  uint64_t v39;
  _UIVectorTextLayout *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  CFIndex GlyphCount;
  void *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v54 = *MEMORY[0x1E0C80C00];
  -[_UIVectorTextLayout _layoutIfNeeded](self, "_layoutIfNeeded");
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "appendString:", CFSTR("Parameters:\n"));
  -[_UIVectorTextLayoutInfo parameters](self->_layoutInfo, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("- text: %@\n"), v6);

  -[_UIVectorTextLayoutInfo parameters](self->_layoutInfo, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "withinSize");
  v9 = v8;
  if (v8 >= 1.79769313e308)
  {
    v11 = CFSTR("(max)");
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[_UIVectorTextLayoutInfo parameters](self->_layoutInfo, "parameters");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "withinSize");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[_UIVectorTextLayoutInfo parameters](self->_layoutInfo, "parameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "withinSize");
  if (v13 >= 1.79769313e308)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("- withinSize: {%@,%@}\n"), v11, CFSTR("(max)"));
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[_UIVectorTextLayoutInfo parameters](self->_layoutInfo, "parameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "withinSize");
    objc_msgSend(v14, "numberWithDouble:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("- withinSize: {%@,%@}\n"), v11, v17);

  }
  if (v9 < 1.79769313e308)
  {

  }
  -[_UIVectorTextLayoutInfo parameters](self->_layoutInfo, "parameters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("- numberOfLines: %ld\n"), objc_msgSend(v18, "numberOfLines"));

  -[_UIVectorTextLayoutInfo parameters](self->_layoutInfo, "parameters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("- traitCollection: %@\n"), v20);

  objc_msgSend(v4, "appendString:", CFSTR("\n"));
  if (-[_UIVectorTextLayout hasLayout](self, "hasLayout"))
  {
    objc_msgSend(v4, "appendString:", CFSTR("Layout:\n"));
    objc_msgSend(v4, "appendFormat:", CFSTR("- size: {%f,%f}\n"), *(_QWORD *)&self->_boundingRect.size.width, *(_QWORD *)&self->_boundingRect.size.height);
    NSStringFromCGRect(self->_boundingRect);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("- bounding rect: %@\n"), v21);

    NSStringFromCGRect(self->_usedBoundingRect);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("- used bounding rect: %@\n"), v22);

    objc_msgSend(v4, "appendFormat:", CFSTR("- first line baseline: %f\n"), *(_QWORD *)&self->_firstLineBaseline);
    objc_msgSend(v4, "appendFormat:", CFSTR("- last line baseline: %f\n"), *(_QWORD *)&self->_lastLineBaseline);
    objc_msgSend(v4, "appendFormat:", CFSTR("- lines (%ld):\n"), self->_numberOfLines);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v40 = self;
    obj = self->_runs;
    v41 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v41)
    {
      v42 = 0;
      v43 = -1;
      v39 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v50 != v39)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if (objc_msgSend(v24, "lineIndex") != v43)
          {
            v25 = objc_msgSend(v24, "lineIndex");
            objc_msgSend(v24, "lineRect");
            NSStringFromCGRect(v55);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "usedLineRect");
            NSStringFromCGRect(v56);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v25;
            objc_msgSend(v4, "appendFormat:", CFSTR("  > Line %ld: rect=%@ usedRect=%@\n"), v25, v26, v27);

          }
          v44 = objc_msgSend(v24, "stringRange");
          v29 = v28;
          v48 = objc_msgSend(v24, "glyphCount");
          v30 = objc_retainAutorelease(v24);
          GlyphCount = CTRunGetGlyphCount((CTRunRef)objc_msgSend(v30, "_CTRun"));
          objc_msgSend(v30, "usedRunRect");
          NSStringFromCGRect(v57);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIVectorTextLayoutInfo parameters](v40->_layoutInfo, "parameters");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "attributedText");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "string");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "substringWithRange:", v44, v29);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\r"), CFSTR("\\r"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\t"), CFSTR("\\t"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "appendFormat:", CFSTR("    [Run %ld: glyphCount=%ld/%ld usedRect=%@ string={%ld,%ld} \"%@\" (ref=%p)]\n"), v42 + i, v48, GlyphCount, v45, v44, v29, v36, objc_msgSend(objc_retainAutorelease(v30), "_CTRun"));
        }
        v41 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        v42 += i;
      }
      while (v41);
    }

  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR("Layout: *not layouted*\n"));
  }
  return v4;
}

- (void)_layoutIfNeeded
{
  _UIVectorTextLayoutInfo **p_layoutInfo;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  CFIndex v8;
  CTFramesetterRef v9;
  const __CTFramesetter *v10;
  const __CTFramesetter *v11;
  void *v12;
  CGSize v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGPathRef v18;
  const CGPath *v19;
  CTFrameRef Frame;
  CFTypeRef v21;
  _UIVectorTextLayoutInfo *layoutInfo;
  _UIVectorTextLayoutInfo *v23;
  __int128 v24;
  uint64_t v25;
  CGPoint v26;
  CGSize v27;
  double v28;
  uint64_t v29;
  __CTFrame *v30;
  int64_t v31;
  __int128 *v32;
  const __CTLine *ValueAtIndex;
  double TypographicBounds;
  CGPoint *v35;
  double x;
  double y;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  _UIVectorTextLayoutInfo *v45;
  double v46;
  double width;
  double height;
  double v49;
  double v50;
  double v51;
  _UIVectorTextLayoutInfo *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  const __CFArray *GlyphRuns;
  CFIndex v59;
  void *v60;
  CFIndex v61;
  double v62;
  double v63;
  double v64;
  double v65;
  const __CTRun *v66;
  _UIVectorTextLayoutRun *v67;
  __int128 v68;
  NSUInteger v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  NSArray *v74;
  NSArray *v75;
  NSArray *runs;
  _QWORD v77[2];
  double *p_firstLineBaseline;
  uint64_t v79;
  CGPoint *v80;
  CFArrayRef Lines;
  NSArray *v82;
  CFIndex Count;
  double v84;
  CGFloat v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[5];
  uint64_t v93;
  CGRect *v94;
  uint64_t v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  CGAffineTransform v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  _OWORD v106[3];
  _QWORD v107[3];
  __int128 v108;
  CGFloat v109;
  _QWORD v110[18];
  CFRange v111;
  CFRange v112;
  CFRange v113;
  NSRange v114;
  CGSize v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect boundingRect;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;

  v110[16] = *MEMORY[0x1E0C80C00];
  if (!self->_runs)
  {
    p_layoutInfo = &self->_layoutInfo;
    -[_UIVectorTextLayoutInfo scale](self->_layoutInfo, "scale");
    v84 = v4;
    -[_UIVectorTextLayout parameters](self, "parameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v5, "numberOfLines");

    if (!-[_UIVectorTextLayoutInfo frame](*p_layoutInfo, "frame"))
    {
      -[_UIVectorTextLayout parameters](self, "parameters");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "attributedText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "length");
      v9 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)v7);
      v10 = (const __CTFramesetter *)CFAutorelease(v9);
      if (v10)
      {
        v11 = v10;
        -[_UIVectorTextLayout parameters](self, "parameters");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "withinSize");
        v111.location = 0;
        v111.length = v8;
        v13 = CTFramesetterSuggestFrameSizeWithConstraints(v11, v111, 0, v115, 0);

        UICeilToScale(v13.width, v84);
        v15 = v14;
        UICeilToScale(v13.height, v84);
        v17 = v16;
        v116.origin.x = 0.0;
        v116.origin.y = 0.0;
        v116.size.width = v15;
        v116.size.height = v17;
        v18 = CGPathCreateWithRect(v116, 0);
        v19 = (const CGPath *)CFAutorelease(v18);
        v112.location = 0;
        v112.length = v8;
        Frame = CTFramesetterCreateFrame(v11, v112, v19, 0);
        v21 = CFAutorelease(Frame);
        if (v21)
          -[_UIVectorTextLayoutInfo setFrame:](self->_layoutInfo, "setFrame:", v21);
        v107[1] = 0;
        v107[2] = 0;
        layoutInfo = self->_layoutInfo;
        v107[0] = 0x3FF0000000000000;
        v108 = xmmword_1866830B0;
        v109 = v17;
        -[_UIVectorTextLayoutInfo setCoordinateAdjustment:](layoutInfo, "setCoordinateAdjustment:", v107);
      }
      else
      {
        v23 = self->_layoutInfo;
        v24 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v106[0] = *MEMORY[0x1E0C9BAA8];
        v106[1] = v24;
        v106[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        -[_UIVectorTextLayoutInfo setCoordinateAdjustment:](v23, "setCoordinateAdjustment:", v106);
      }

    }
    v25 = MEMORY[0x1E0C9D648];
    self->_firstLineBaseline = 0.0;
    v26 = *(CGPoint *)v25;
    v27 = *(CGSize *)(v25 + 16);
    self->_boundingRect.origin = *(CGPoint *)v25;
    self->_boundingRect.size = v27;
    self->_fitRange.location = 0;
    self->_fitRange.length = 0;
    self->_usedBoundingRect.origin = v26;
    self->_usedBoundingRect.size = v27;
    self->_lastLineBaseline = 0.0;
    p_firstLineBaseline = &self->_firstLineBaseline;
    if (-[_UIVectorTextLayoutInfo frame](self->_layoutInfo, "frame"))
    {
      Lines = CTFrameGetLines(-[_UIVectorTextLayoutInfo frame](self->_layoutInfo, "frame"));
      Count = CFArrayGetCount(Lines);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
      v82 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v77[1] = v77;
      *(_QWORD *)&v28 = MEMORY[0x1E0C80A78](v82).n128_u64[0];
      v80 = (CGPoint *)&v77[-2 * v29];
      v30 = -[_UIVectorTextLayoutInfo frame](self->_layoutInfo, "frame", v28);
      v113.location = 0;
      v113.length = 0;
      CTFrameGetLineOrigins(v30, v113, v80);
      if (Count < 1)
      {
        v31 = 0;
      }
      else
      {
        v31 = 0;
        v87 = 0x4010000000;
        v32 = (__int128 *)MEMORY[0x1E0C9D628];
        v86 = 3221225472;
        while (!v79 || v31 < v79)
        {
          ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v31);
          v104 = 0.0;
          v105 = 0.0;
          v103 = 0.0;
          TypographicBounds = CTLineGetTypographicBounds(ValueAtIndex, &v105, &v104, &v103);
          v35 = &v80[v31];
          x = v35->x;
          y = v35->y;
          v38 = UIRectIntegralWithScale(v35->x, y - v104, TypographicBounds, v105 + v104 + v103, v84);
          v40 = v39;
          v42 = v41;
          v44 = v43;
          v45 = self->_layoutInfo;
          if (v45)
            -[_UIVectorTextLayoutInfo coordinateAdjustment](v45, "coordinateAdjustment");
          else
            memset(&v102, 0, sizeof(v102));
          v117.origin.x = v38;
          v117.origin.y = v40;
          v117.size.width = v42;
          v117.size.height = v44;
          v118 = CGRectApplyAffineTransform(v117, &v102);
          v123.origin.x = v118.origin.x;
          v46 = v118.origin.y;
          width = v118.size.width;
          height = v118.size.height;
          boundingRect = self->_boundingRect;
          v85 = v123.origin.x;
          v123.origin.y = v46;
          v123.size.width = width;
          v123.size.height = height;
          v120 = CGRectUnion(boundingRect, v123);
          self->_boundingRect.size.width = v120.size.width;
          self->_boundingRect.size.height = v120.size.height;
          v49 = UIPointRoundToScale(x, y, v84);
          v51 = v50;
          v52 = self->_layoutInfo;
          if (v52)
          {
            -[_UIVectorTextLayoutInfo coordinateAdjustment](v52, "coordinateAdjustment");
            v53 = *((double *)&v99 + 1);
            v54 = *((double *)&v100 + 1);
            v55 = *((double *)&v101 + 1);
          }
          else
          {
            v100 = 0u;
            v101 = 0u;
            v55 = 0.0;
            v54 = 0.0;
            v53 = 0.0;
            v99 = 0u;
          }
          v56 = v55 + v51 * v54 + v49 * v53;
          if (!v31)
            *p_firstLineBaseline = v56;
          v57 = v56;
          self->_lastLineBaseline = v56;
          GlyphRuns = CTLineGetGlyphRuns(ValueAtIndex);
          v59 = CFArrayGetCount(GlyphRuns);
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (v59 < 1)
          {
            v65 = height;
            v64 = width;
            v63 = v46;
            v62 = v85;
          }
          else
          {
            v61 = 0;
            v62 = v85;
            v63 = v46;
            v64 = width;
            v65 = height;
            do
            {
              v66 = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v61);
              if (CTRunGetGlyphCount(v66) >= 1)
              {
                v67 = -[_UIVectorTextLayoutRun initWithCTRun:lineIndex:layoutInfo:]([_UIVectorTextLayoutRun alloc], "initWithCTRun:lineIndex:layoutInfo:", v66, v31, self->_layoutInfo);
                v93 = 0;
                v94 = (CGRect *)&v93;
                v95 = v87;
                v96 = &unk_18685B0AF;
                v68 = v32[1];
                v97 = *v32;
                v98 = v68;
                v92[0] = MEMORY[0x1E0C809B0];
                v92[1] = v86;
                v92[2] = __38___UIVectorTextLayout__layoutIfNeeded__block_invoke;
                v92[3] = &unk_1E16EA718;
                v92[4] = &v93;
                -[_UIVectorTextLayoutRun _enumerateGlyphsUsingBlock:](v67, "_enumerateGlyphsUsingBlock:", v92);
                if (!CGRectIsEmpty(v94[1]))
                {
                  -[_UIVectorTextLayoutRun setBaseline:](v67, "setBaseline:", v57);
                  -[_UIVectorTextLayoutRun setLineRect:](v67, "setLineRect:", v85, v46, width, height);
                  -[_UIVectorTextLayoutRun setUsedRunRect:](v67, "setUsedRunRect:", v94[1].origin.x, v94[1].origin.y, v94[1].size.width, v94[1].size.height);
                  objc_msgSend(v60, "addObject:", v67);
                  v114.location = -[_UIVectorTextLayoutRun stringRange](v67, "stringRange");
                  v114.length = v69;
                  self->_fitRange = NSUnionRange(self->_fitRange, v114);
                  v121.origin.x = v62;
                  v121.origin.y = v63;
                  v121.size.width = v64;
                  v121.size.height = v65;
                  v122 = CGRectUnion(v121, v94[1]);
                  v62 = v122.origin.x;
                  v63 = v122.origin.y;
                  v64 = v122.size.width;
                  v65 = v122.size.height;
                  self->_usedBoundingRect = CGRectUnion(self->_usedBoundingRect, v94[1]);
                }
                _Block_object_dispose(&v93, 8);

              }
              ++v61;
            }
            while (v59 != v61);
          }
          v90 = 0u;
          v91 = 0u;
          v88 = 0u;
          v89 = 0u;
          v70 = v60;
          v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v88, v110, 16);
          if (v71)
          {
            v72 = *(_QWORD *)v89;
            do
            {
              for (i = 0; i != v71; ++i)
              {
                if (*(_QWORD *)v89 != v72)
                  objc_enumerationMutation(v70);
                objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * i), "setUsedLineRect:", v62, v63, v64, v65);
              }
              v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v88, v110, 16);
            }
            while (v71);
          }

          -[NSArray addObjectsFromArray:](v82, "addObjectsFromArray:", v70);
          if (++v31 == Count)
          {
            v31 = Count;
            break;
          }
        }
      }
      v75 = (NSArray *)-[NSArray copy](v82, "copy");
      runs = self->_runs;
      self->_runs = v75;

      v74 = v82;
    }
    else
    {
      v31 = 0;
      v74 = self->_runs;
      self->_runs = (NSArray *)MEMORY[0x1E0C9AA60];
    }

    self->_usedBoundingRect = CGRectUnion(self->_boundingRect, self->_usedBoundingRect);
    self->_numberOfLines = v31;
  }
}

- (CGAffineTransform)coordinateAdjustment
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].c;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutInfo, 0);
  objc_storeStrong((id *)&self->_runs, 0);
}

@end
