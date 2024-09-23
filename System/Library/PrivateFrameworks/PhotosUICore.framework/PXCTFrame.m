@implementation PXCTFrame

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_framesetter);
  objc_storeStrong((id *)&self->_lines, 0);
}

- (NSArray)lines
{
  return self->_lines;
}

- (void)prepare
{
  PXCTFrame *v2;
  __CTFrame *v3;
  const CGPath *Path;
  double x;
  double y;
  double width;
  double height;
  void *v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  size_t v13;
  NSArray *v14;
  CGPoint *v15;
  uint64_t v16;
  size_t v17;
  CGFloat *p_y;
  _UNKNOWN **v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  size_t v26;
  size_t v27;
  NSArray *v28;
  void *v29;
  _UNKNOWN **v30;
  id v31;
  id v32;
  void *v33;
  NSArray *lines;
  CGPoint *v35;
  BOOL v36;
  PXCTFrame *v37;
  id v38;
  double v39;
  double v40;
  void *v41;
  CFRange v42;
  CGRect BoundingBox;

  if (!self->_prepared)
  {
    v2 = self;
    self->_prepared = 1;
    v3 = -[PXCTFrame frame](self, "frame");
    Path = CTFrameGetPath(v3);
    BoundingBox = CGPathGetBoundingBox(Path);
    x = BoundingBox.origin.x;
    y = BoundingBox.origin.y;
    width = BoundingBox.size.width;
    height = BoundingBox.size.height;
    CTFrameGetLines(v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    v11 = v10 > -[PXCTFrame maximumLineCount](v2, "maximumLineCount");
    v12 = -[PXCTFrame maximumLineCount](v2, "maximumLineCount");
    if (v10 >= v12)
      v13 = v12;
    else
      v13 = v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v13);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v36 = v11;
      v15 = (CGPoint *)malloc_type_calloc(v13, 0x10uLL, 0x1000040451B5BE8uLL);
      v42.location = 0;
      v42.length = v13;
      CTFrameGetLineOrigins(v2->_frame, v42, v15);
      v16 = 0;
      v17 = v13 - 1;
      v35 = v15;
      p_y = &v15->y;
      v19 = &off_1E50B1000;
      v37 = v2;
      do
      {
        v41 = 0;
        objc_msgSend(v9, "objectAtIndexedSubscript:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = 0.0;
        v41 = v20;
        v39 = 0.0;
        PXPointAdd();
        v39 = v21;
        v40 = v22;
        -[PXCTFrame framesetter](v2, "framesetter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "attributedString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 == v16)
        {
          v38 = v24;
          v25 = -[PXCTFrame _truncateLine:withOrigin:referenceAttributedString:bounds:](v2, "_truncateLine:withOrigin:referenceAttributedString:bounds:", &v41, &v39, &v38, x, y, width, height);
          v26 = v17;
          v27 = v13;
          v28 = v14;
          v29 = v9;
          v30 = v19;
          v31 = v38;

          v24 = v31;
          v19 = v30;
          v9 = v29;
          v14 = v28;
          v13 = v27;
          v17 = v26;
          v2 = v37;
        }
        else
        {
          v25 = 0;
        }
        v32 = objc_alloc((Class)v19[378]);
        v33 = (void *)objc_msgSend(v32, "initWithLine:origin:frame:referenceAttributedString:truncated:", v41, v2, v24, v25, v39, v40);
        objc_msgSend(v33, "prepare");
        -[NSArray addObject:](v14, "addObject:", v33);

        ++v16;
        p_y += 2;
      }
      while (v13 != v16);
      free(v35);
      v11 = v36;
    }
    lines = v2->_lines;
    v2->_lines = v14;

    v2->_truncated = v11;
    v2->_origin.x = x;
    v2->_origin.y = y;

  }
}

- (unint64_t)maximumLineCount
{
  return self->_maximumLineCount;
}

- (PXCTFramesetter)framesetter
{
  return (PXCTFramesetter *)objc_loadWeakRetained((id *)&self->_framesetter);
}

- (CGPoint)origin
{
  double x;
  double y;
  CGPoint result;

  x = self->_origin.x;
  y = self->_origin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (PXCTFrame)initWithFrame:(__CTFrame *)a3 maximumLineCount:(unint64_t)a4 allowTruncation:(BOOL)a5 framesetter:(id)a6
{
  id v10;
  PXCTFrame *v11;
  objc_super v13;

  v10 = a6;
  v13.receiver = self;
  v13.super_class = (Class)PXCTFrame;
  v11 = -[PXCTFrame init](&v13, sel_init);
  if (v11)
  {
    v11->_frame = (__CTFrame *)CFRetain(a3);
    v11->_maximumLineCount = a4;
    v11->_allowTruncation = a5;
    objc_storeWeak((id *)&v11->_framesetter, v10);
  }

  return v11;
}

- (__CTFrame)frame
{
  return self->_frame;
}

- (BOOL)_truncateLine:(const __CTLine *)a3 withOrigin:(CGPoint *)a4 referenceAttributedString:(id *)a5 bounds:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CFRange StringRange;
  void *v15;
  void *v16;
  const __CFAttributedString *v17;
  const __CTLine *v18;
  void *v19;
  const __CFAttributedString *v20;
  const __CTLine *v21;
  double v22;
  CTLineRef TruncatedLine;
  BOOL v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double PenOffsetForFlush;
  id *v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  if (!-[PXCTFrame allowTruncation](self, "allowTruncation"))
    return 0;
  StringRange = CTLineGetStringRange(*a3);
  -[PXCTFrame framesetter](self, "framesetter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributedString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (StringRange.location + StringRange.length >= (unint64_t)objc_msgSend(v16, "length"))
  {
    v24 = 0;
  }
  else
  {
    v33 = a5;
    objc_msgSend(v16, "attributedSubstringFromRange:", StringRange.location, objc_msgSend(v16, "length") - StringRange.location);
    v17 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
    v18 = CTLineCreateWithAttributedString(v17);
    objc_msgSend(v16, "attributesAtIndex:effectiveRange:", objc_msgSend(v16, "length") - 1, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (const __CFAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("…"), v19);
    v21 = CTLineCreateWithAttributedString(v20);
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    v22 = CGRectGetWidth(v34);
    TruncatedLine = CTLineCreateTruncatedLine(v18, v22, kCTLineTruncationEnd, v21);
    CFRelease(v21);
    CFRelease(v18);
    v24 = TruncatedLine != 0;
    if (TruncatedLine)
    {
      *a3 = (const __CTLine *)CFAutorelease(TruncatedLine);
      objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        v27 = objc_msgSend(v25, "alignment");
        v28 = 0.0;
        if (v27 == 1)
          v28 = 0.5;
        if (v27 == 2)
          v29 = 1.0;
        else
          v29 = v28;
      }
      else
      {
        v29 = 0.0;
      }
      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = width;
      v35.size.height = height;
      v30 = CGRectGetWidth(v35);
      PenOffsetForFlush = CTLineGetPenOffsetForFlush(TruncatedLine, v29, v30);
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = height;
      a4->x = PenOffsetForFlush + CGRectGetMinX(v36);
      *v33 = objc_retainAutorelease(v17);

    }
  }

  return v24;
}

- (BOOL)allowTruncation
{
  return self->_allowTruncation;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_frame);
  v3.receiver = self;
  v3.super_class = (Class)PXCTFrame;
  -[PXCTFrame dealloc](&v3, sel_dealloc);
}

- (PXCTFrame)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreText+PhotosUICore.m"), 111, CFSTR("%s is not available as initializer"), "-[PXCTFrame init]");

  abort();
}

- (BOOL)isTruncated
{
  return self->_truncated;
}

@end
