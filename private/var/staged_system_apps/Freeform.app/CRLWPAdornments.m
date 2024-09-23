@implementation CRLWPAdornments

- (CRLWPAdornments)initWithType:(int)a3 color:(CGColor *)a4 font:(__CTFont *)a5 flippedFont:(__CTFont *)a6
{
  CRLWPAdornments *v10;
  CRLWPAdornments *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRLWPAdornments;
  v10 = -[CRLWPAdornments init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    -[CRLWPAdornments setColor:](v10, "setColor:", a4);
    -[CRLWPAdornments setFont:](v11, "setFont:", a5);
    -[CRLWPAdornments setFlippedFont:](v11, "setFlippedFont:", a6);
    v11->_location = 1;
    v11->_verticalAdjustment = 0.0;
    v11->_descent = 0.0;
    v11->_advance = 0.0;
    v11->_ascent = 0.0;
    v11->_textPosition = CGPointZero;
    v11->_shouldRotate = 0;
  }
  return v11;
}

- (unint64_t)charIndexCount
{
  return self->_charIndexes.__end_ - self->_charIndexes.__begin_;
}

- (unint64_t)charIndexes
{
  if (self->_charIndexes.__end_ == self->_charIndexes.__begin_)
    return 0;
  else
    return self->_charIndexes.__begin_;
}

- (BOOL)isEmpty
{
  return !-[CRLWPAdornments glyphCount](self, "glyphCount")
      && -[CRLWPAdornments flippedGlyphCount](self, "flippedGlyphCount") == 0;
}

- (unint64_t)glyphCount
{
  return self->_glyphs.__end_ - self->_glyphs.__begin_;
}

- (unsigned)glyphs
{
  if (self->_glyphs.__end_ == self->_glyphs.__begin_)
    return 0;
  else
    return self->_glyphs.__begin_;
}

- (unint64_t)positionCount
{
  return self->_positions.__end_ - self->_positions.__begin_;
}

- (CGPoint)positions
{
  if (self->_positions.__end_ == self->_positions.__begin_)
    return 0;
  else
    return self->_positions.__begin_;
}

- (unint64_t)flippedGlyphCount
{
  return self->_flippedGlyphs.__end_ - self->_flippedGlyphs.__begin_;
}

- (unsigned)flippedGlyphs
{
  if (self->_flippedGlyphs.__end_ == self->_flippedGlyphs.__begin_)
    return 0;
  else
    return self->_flippedGlyphs.__begin_;
}

- (unint64_t)flippedPositionCount
{
  return self->_flippedPositions.__end_ - self->_flippedPositions.__begin_;
}

- (CGPoint)flippedPositions
{
  if (self->_flippedPositions.__end_ == self->_flippedPositions.__begin_)
    return 0;
  else
    return self->_flippedPositions.__begin_;
}

- (unint64_t)rectCount
{
  return self->_rects.__end_ - self->_rects.__begin_;
}

- (CGRect)rects
{
  if (self->_rects.__end_ == self->_rects.__begin_)
    return 0;
  else
    return self->_rects.__begin_;
}

- (unint64_t)attachmentPositionCount
{
  return (self->_attachmentPositions.__end_ - self->_attachmentPositions.__begin_) >> 4;
}

- ($82EDB067EE6F192B39F18594CC8676AD)attachmentPositions
{
  if (self->_attachmentPositions.__end_ == self->_attachmentPositions.__begin_)
    return 0;
  else
    return ($82EDB067EE6F192B39F18594CC8676AD *)self->_attachmentPositions.__begin_;
}

- (void)setAscent:(double)a3 descent:(double)a4 advance:(double)a5
{
  self->_ascent = a3;
  self->_descent = a4;
  self->_advance = a5;
}

- (void)addAdornmentWithPoint:(CGPoint)a3 glyph:(unsigned __int16)a4 flipped:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGPoint *value;
  CGPoint *end;
  CGPoint *v15;
  CGPoint *v16;
  CGPoint *v17;
  CGPoint *v18;
  CGPoint *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  CGPoint *begin;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  CGPoint *v31;
  CGPoint *v32;
  unsigned __int16 *v33;
  unsigned __int16 *v34;
  unsigned __int16 *v35;
  unsigned __int16 *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  unsigned __int16 *v43;
  unsigned __int16 *v44;
  unsigned __int16 v45;
  CGPoint *v46;
  CGPoint *v47;
  unsigned __int16 *v48;
  unsigned __int16 *v49;
  unsigned __int16 *v50;
  unsigned __int16 *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char *v57;
  unsigned __int16 *v58;
  unsigned __int16 *v59;
  unsigned __int16 v60;
  CGSize advances;
  CGGlyph glyphs;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  glyphs = a4;
  if ((self->_type - 1) >= 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258E18);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2CE78();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258E38);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPAdornments addAdornmentWithPoint:glyph:flipped:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPAdornments.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 118, 0, "bad adornments type (expected kAdornmentsTypeInvisibles or kAdornmentsTypeInvisiblesBreak");

  }
  if (v5)
  {
    CTFontGetAdvancesForGlyphs(self->_flippedFont, kCTFontOrientationDefault, &glyphs, &advances, 1);
    v12 = x - advances.width;
    value = self->_flippedPositions.__end_cap_.__value_;
    end = self->_flippedPositions.__end_;
    if (end >= value)
    {
      begin = self->_flippedPositions.__begin_;
      v26 = end - begin;
      v27 = v26 + 1;
      if ((unint64_t)(v26 + 1) >> 60)
        sub_100007810();
      v28 = (char *)value - (char *)begin;
      if (v28 >> 3 > v27)
        v27 = v28 >> 3;
      if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0)
        v29 = 0xFFFFFFFFFFFFFFFLL;
      else
        v29 = v27;
      if (v29)
      {
        v30 = (char *)sub_10001FB2C((uint64_t)&self->_flippedPositions.__end_cap_, v29);
        begin = self->_flippedPositions.__begin_;
        end = self->_flippedPositions.__end_;
      }
      else
      {
        v30 = 0;
      }
      v46 = (CGPoint *)&v30[16 * v26];
      v47 = (CGPoint *)&v30[16 * v29];
      v46->x = v12;
      v46->y = y;
      v15 = v46 + 1;
      if (end != begin)
      {
        do
        {
          v46[-1] = end[-1];
          --v46;
          --end;
        }
        while (end != begin);
        begin = self->_flippedPositions.__begin_;
      }
      self->_flippedPositions.__begin_ = v46;
      self->_flippedPositions.__end_ = v15;
      self->_flippedPositions.__end_cap_.__value_ = v47;
      if (begin)
        operator delete(begin);
    }
    else
    {
      end->x = v12;
      end->y = y;
      v15 = end + 1;
    }
    v48 = self->_flippedGlyphs.__end_cap_.__value_;
    self->_flippedPositions.__end_ = v15;
    v49 = self->_flippedGlyphs.__end_;
    if (v49 >= v48)
    {
      v51 = self->_flippedGlyphs.__begin_;
      v52 = (char *)v49 - (char *)v51;
      if ((char *)v49 - (char *)v51 <= -3)
        sub_100007810();
      v53 = v52 >> 1;
      v54 = (char *)v48 - (char *)v51;
      if (v54 <= (v52 >> 1) + 1)
        v55 = v53 + 1;
      else
        v55 = v54;
      if (v54 >= 0x7FFFFFFFFFFFFFFELL)
        v56 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v56 = v55;
      if (v56)
      {
        v57 = (char *)sub_100134070((uint64_t)&self->_flippedGlyphs.__end_cap_, v56);
        v51 = self->_flippedGlyphs.__begin_;
        v49 = self->_flippedGlyphs.__end_;
      }
      else
      {
        v57 = 0;
      }
      v58 = (unsigned __int16 *)&v57[2 * v53];
      v59 = (unsigned __int16 *)&v57[2 * v56];
      *v58 = glyphs;
      v50 = v58 + 1;
      while (v49 != v51)
      {
        v60 = *--v49;
        *--v58 = v60;
      }
      self->_flippedGlyphs.__begin_ = v58;
      self->_flippedGlyphs.__end_ = v50;
      self->_flippedGlyphs.__end_cap_.__value_ = v59;
      if (v51)
        operator delete(v51);
    }
    else
    {
      *v49 = glyphs;
      v50 = v49 + 1;
    }
    self->_flippedGlyphs.__end_ = v50;
  }
  else
  {
    v16 = self->_positions.__end_cap_.__value_;
    v17 = self->_positions.__end_;
    if (v17 >= v16)
    {
      v19 = self->_positions.__begin_;
      v20 = v17 - v19;
      v21 = v20 + 1;
      if ((unint64_t)(v20 + 1) >> 60)
        sub_100007810();
      v22 = (char *)v16 - (char *)v19;
      if (v22 >> 3 > v21)
        v21 = v22 >> 3;
      if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0)
        v23 = 0xFFFFFFFFFFFFFFFLL;
      else
        v23 = v21;
      if (v23)
      {
        v24 = (char *)sub_10001FB2C((uint64_t)&self->_positions.__end_cap_, v23);
        v19 = self->_positions.__begin_;
        v17 = self->_positions.__end_;
      }
      else
      {
        v24 = 0;
      }
      v31 = (CGPoint *)&v24[16 * v20];
      v32 = (CGPoint *)&v24[16 * v23];
      v31->x = x;
      v31->y = y;
      v18 = v31 + 1;
      if (v17 != v19)
      {
        do
        {
          v31[-1] = v17[-1];
          --v31;
          --v17;
        }
        while (v17 != v19);
        v19 = self->_positions.__begin_;
      }
      self->_positions.__begin_ = v31;
      self->_positions.__end_ = v18;
      self->_positions.__end_cap_.__value_ = v32;
      if (v19)
        operator delete(v19);
    }
    else
    {
      v17->x = x;
      v17->y = y;
      v18 = v17 + 1;
    }
    v33 = self->_glyphs.__end_cap_.__value_;
    self->_positions.__end_ = v18;
    v34 = self->_glyphs.__end_;
    if (v34 >= v33)
    {
      v36 = self->_glyphs.__begin_;
      v37 = (char *)v34 - (char *)v36;
      if ((char *)v34 - (char *)v36 <= -3)
        sub_100007810();
      v38 = v37 >> 1;
      v39 = (char *)v33 - (char *)v36;
      if (v39 <= (v37 >> 1) + 1)
        v40 = v38 + 1;
      else
        v40 = v39;
      if (v39 >= 0x7FFFFFFFFFFFFFFELL)
        v41 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v41 = v40;
      if (v41)
      {
        v42 = (char *)sub_100134070((uint64_t)&self->_glyphs.__end_cap_, v41);
        v36 = self->_glyphs.__begin_;
        v34 = self->_glyphs.__end_;
      }
      else
      {
        v42 = 0;
      }
      v43 = (unsigned __int16 *)&v42[2 * v38];
      v44 = (unsigned __int16 *)&v42[2 * v41];
      *v43 = glyphs;
      v35 = v43 + 1;
      while (v34 != v36)
      {
        v45 = *--v34;
        *--v43 = v45;
      }
      self->_glyphs.__begin_ = v43;
      self->_glyphs.__end_ = v35;
      self->_glyphs.__end_cap_.__value_ = v44;
      if (v36)
        operator delete(v36);
    }
    else
    {
      *v34 = glyphs;
      v35 = v34 + 1;
    }
    self->_glyphs.__end_ = v35;
  }
}

- (void)addAdornmentWithCharIndex:(unint64_t)a3 point:(CGPoint)a4 glyph:(unsigned __int16)a5 rect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v11;
  CGFloat v12;
  void *v15;
  void *v16;
  void *v17;
  unint64_t *value;
  unint64_t *end;
  unint64_t *v20;
  unint64_t *begin;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  unint64_t *v27;
  unint64_t *v28;
  unint64_t v29;
  CGPoint *v30;
  CGPoint *v31;
  CGPoint *v32;
  CGPoint *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  CGPoint *v39;
  CGPoint *v40;
  unsigned __int16 *v41;
  unsigned __int16 *v42;
  unsigned __int16 *v43;
  unsigned __int16 *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char *v50;
  unsigned __int16 *v51;
  unsigned __int16 *v52;
  unsigned __int16 v53;
  CGRect *v54;
  CGRect *v55;
  CGRect *v56;
  CGRect *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  CGRect *v63;
  CGRect *v64;
  CGSize size;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v11 = a4.y;
  v12 = a4.x;
  if ((self->_type | 2) != 6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258E58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2CEF8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258E78);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPAdornments addAdornmentWithCharIndex:point:glyph:rect:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPAdornments.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 137, 0, "bad adornments type (expected kAdornmentsTypeEmphasisMarks or kAdornmentTypeHiddenDeletions");

  }
  value = self->_charIndexes.__end_cap_.__value_;
  end = self->_charIndexes.__end_;
  if (end >= value)
  {
    begin = self->_charIndexes.__begin_;
    v22 = end - begin;
    if ((unint64_t)(v22 + 1) >> 61)
      sub_100007810();
    v23 = (char *)value - (char *)begin;
    v24 = ((char *)value - (char *)begin) >> 2;
    if (v24 <= v22 + 1)
      v24 = v22 + 1;
    if (v23 >= 0x7FFFFFFFFFFFFFF8)
      v25 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v25 = v24;
    if (v25)
    {
      v26 = (char *)sub_10002BA34((uint64_t)&self->_charIndexes.__end_cap_, v25);
      begin = self->_charIndexes.__begin_;
      end = self->_charIndexes.__end_;
    }
    else
    {
      v26 = 0;
    }
    v27 = (unint64_t *)&v26[8 * v22];
    v28 = (unint64_t *)&v26[8 * v25];
    *v27 = a3;
    v20 = v27 + 1;
    while (end != begin)
    {
      v29 = *--end;
      *--v27 = v29;
    }
    self->_charIndexes.__begin_ = v27;
    self->_charIndexes.__end_ = v20;
    self->_charIndexes.__end_cap_.__value_ = v28;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *end = a3;
    v20 = end + 1;
  }
  v30 = self->_positions.__end_cap_.__value_;
  self->_charIndexes.__end_ = v20;
  v31 = self->_positions.__end_;
  if (v31 >= v30)
  {
    v33 = self->_positions.__begin_;
    v34 = v31 - v33;
    v35 = v34 + 1;
    if ((unint64_t)(v34 + 1) >> 60)
      sub_100007810();
    v36 = (char *)v30 - (char *)v33;
    if (v36 >> 3 > v35)
      v35 = v36 >> 3;
    if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0)
      v37 = 0xFFFFFFFFFFFFFFFLL;
    else
      v37 = v35;
    if (v37)
    {
      v38 = (char *)sub_10001FB2C((uint64_t)&self->_positions.__end_cap_, v37);
      v33 = self->_positions.__begin_;
      v31 = self->_positions.__end_;
    }
    else
    {
      v38 = 0;
    }
    v39 = (CGPoint *)&v38[16 * v34];
    v40 = (CGPoint *)&v38[16 * v37];
    v39->x = v12;
    v39->y = v11;
    v32 = v39 + 1;
    if (v31 != v33)
    {
      do
      {
        v39[-1] = v31[-1];
        --v39;
        --v31;
      }
      while (v31 != v33);
      v33 = self->_positions.__begin_;
    }
    self->_positions.__begin_ = v39;
    self->_positions.__end_ = v32;
    self->_positions.__end_cap_.__value_ = v40;
    if (v33)
      operator delete(v33);
  }
  else
  {
    v31->x = v12;
    v31->y = v11;
    v32 = v31 + 1;
  }
  v41 = self->_glyphs.__end_cap_.__value_;
  self->_positions.__end_ = v32;
  v42 = self->_glyphs.__end_;
  if (v42 >= v41)
  {
    v44 = self->_glyphs.__begin_;
    v45 = (char *)v42 - (char *)v44;
    if ((char *)v42 - (char *)v44 <= -3)
      sub_100007810();
    v46 = v45 >> 1;
    v47 = (char *)v41 - (char *)v44;
    if (v47 <= (v45 >> 1) + 1)
      v48 = v46 + 1;
    else
      v48 = v47;
    if (v47 >= 0x7FFFFFFFFFFFFFFELL)
      v49 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v49 = v48;
    if (v49)
    {
      v50 = (char *)sub_100134070((uint64_t)&self->_glyphs.__end_cap_, v49);
      v44 = self->_glyphs.__begin_;
      v42 = self->_glyphs.__end_;
    }
    else
    {
      v50 = 0;
    }
    v51 = (unsigned __int16 *)&v50[2 * v46];
    v52 = (unsigned __int16 *)&v50[2 * v49];
    *v51 = a5;
    v43 = v51 + 1;
    while (v42 != v44)
    {
      v53 = *--v42;
      *--v51 = v53;
    }
    self->_glyphs.__begin_ = v51;
    self->_glyphs.__end_ = v43;
    self->_glyphs.__end_cap_.__value_ = v52;
    if (v44)
      operator delete(v44);
  }
  else
  {
    *v42 = a5;
    v43 = v42 + 1;
  }
  v54 = self->_rects.__end_cap_.__value_;
  self->_glyphs.__end_ = v43;
  v55 = self->_rects.__end_;
  if (v55 >= v54)
  {
    v57 = self->_rects.__begin_;
    v58 = v55 - v57;
    v59 = v58 + 1;
    if ((unint64_t)(v58 + 1) >> 59)
      sub_100007810();
    v60 = (char *)v54 - (char *)v57;
    if (v60 >> 4 > v59)
      v59 = v60 >> 4;
    if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFE0)
      v61 = 0x7FFFFFFFFFFFFFFLL;
    else
      v61 = v59;
    if (v61)
    {
      v62 = (char *)sub_100134CDC((uint64_t)&self->_rects.__end_cap_, v61);
      v57 = self->_rects.__begin_;
      v55 = self->_rects.__end_;
    }
    else
    {
      v62 = 0;
    }
    v63 = (CGRect *)&v62[32 * v58];
    v63->origin.x = x;
    v63->origin.y = y;
    v64 = (CGRect *)&v62[32 * v61];
    v63->size.width = width;
    v63->size.height = height;
    v56 = v63 + 1;
    if (v55 != v57)
    {
      do
      {
        size = v55[-1].size;
        v63[-1].origin = v55[-1].origin;
        v63[-1].size = size;
        --v63;
        --v55;
      }
      while (v55 != v57);
      v57 = self->_rects.__begin_;
    }
    self->_rects.__begin_ = v63;
    self->_rects.__end_ = v56;
    self->_rects.__end_cap_.__value_ = v64;
    if (v57)
      operator delete(v57);
  }
  else
  {
    v55->origin.x = x;
    v55->origin.y = y;
    v56 = v55 + 1;
    v55->size.width = width;
    v55->size.height = height;
  }
  self->_rects.__end_ = v56;
}

- (void)addAdornmentWithAttachmentPosition:(id)a3
{
  double var1;
  unint64_t var0;
  void *v6;
  void *v7;
  void *v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v19;

  var1 = a3.var1;
  var0 = a3.var0;
  if (self->_type != 3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258E98);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2CF78();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258EB8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPAdornments addAdornmentWithAttachmentPosition:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPAdornments.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 149, 0, "bad adornments type (expected kAdornmentsTypeAttachments");

  }
  value = self->_attachmentPositions.__end_cap_.__value_;
  end = self->_attachmentPositions.__end_;
  if (end >= value)
  {
    begin = self->_attachmentPositions.__begin_;
    v13 = (end - begin) >> 4;
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 60)
      sub_100007810();
    v15 = value - begin;
    if (v15 >> 3 > v14)
      v14 = v15 >> 3;
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0)
      v16 = 0xFFFFFFFFFFFFFFFLL;
    else
      v16 = v14;
    if (v16)
    {
      v17 = (char *)sub_10001FB2C((uint64_t)&self->_attachmentPositions.__end_cap_, v16);
      begin = self->_attachmentPositions.__begin_;
      end = self->_attachmentPositions.__end_;
    }
    else
    {
      v17 = 0;
    }
    v18 = &v17[16 * v13];
    v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v17[16 * v16];
    *(_QWORD *)v18 = var0;
    *((double *)v18 + 1) = var1;
    v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v18 + 16);
    if (end != begin)
    {
      do
      {
        *((_OWORD *)v18 - 1) = *((_OWORD *)end - 1);
        v18 -= 16;
        end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 16);
      }
      while (end != begin);
      begin = self->_attachmentPositions.__begin_;
    }
    self->_attachmentPositions.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v18;
    self->_attachmentPositions.__end_ = v11;
    self->_attachmentPositions.__end_cap_.__value_ = v19;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *(_QWORD *)end = var0;
    *((double *)end + 1) = var1;
    v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 16);
  }
  self->_attachmentPositions.__end_ = v11;
}

- (void)removeAdornmentAt:(unint64_t)a3
{
  unint64_t *end;
  unint64_t *begin;
  unint64_t *v7;
  char *v8;
  unsigned __int16 *v9;
  unsigned __int16 *v10;
  unsigned __int16 *v11;
  char *v12;
  CGRect *v13;
  CGRect *v14;
  CGRect *v15;
  char *v16;
  CGPoint *v17;
  CGPoint *v18;
  CGPoint *v19;
  char *v20;

  begin = self->_charIndexes.__begin_;
  end = self->_charIndexes.__end_;
  if (a3 < end - begin)
  {
    v7 = &begin[a3];
    v8 = (char *)((char *)end - (char *)(v7 + 1));
    if (end != v7 + 1)
      memmove(&begin[a3], v7 + 1, (char *)end - (char *)(v7 + 1));
    self->_charIndexes.__end_ = (unint64_t *)&v8[(_QWORD)v7];
  }
  v10 = self->_glyphs.__begin_;
  v9 = self->_glyphs.__end_;
  if (a3 < v9 - v10)
  {
    v11 = &v10[a3];
    v12 = (char *)((char *)v9 - (char *)(v11 + 1));
    if (v9 != v11 + 1)
      memmove(&v10[a3], v11 + 1, (char *)v9 - (char *)(v11 + 1));
    self->_glyphs.__end_ = (unsigned __int16 *)&v12[(_QWORD)v11];
  }
  v14 = self->_rects.__begin_;
  v13 = self->_rects.__end_;
  if (a3 < v13 - v14)
  {
    v15 = &v14[a3];
    v16 = (char *)((char *)v13 - (char *)&v15[1]);
    if (v13 != &v15[1])
      memmove(&v14[a3], &v15[1], (char *)v13 - (char *)&v15[1]);
    self->_rects.__end_ = (CGRect *)&v16[(_QWORD)v15];
  }
  v18 = self->_positions.__begin_;
  v17 = self->_positions.__end_;
  if (a3 < v17 - v18)
  {
    v19 = &v18[a3];
    v20 = (char *)((char *)v17 - (char *)&v19[1]);
    if (v17 != &v19[1])
      memmove(v19, &v19[1], (char *)v17 - (char *)&v19[1]);
    self->_positions.__end_ = (CGPoint *)&v20[(_QWORD)v19];
  }
}

- (void)incrementCharIndexes:(int64_t)a3 startingAt:(unint64_t)a4
{
  unint64_t *begin;
  unint64_t *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v7;

  begin = self->_charIndexes.__begin_;
  end = self->_charIndexes.__end_;
  while (begin != end)
  {
    if (*begin >= a4)
      *begin += a3;
    ++begin;
  }
  v6 = self->_attachmentPositions.__begin_;
  v7 = self->_attachmentPositions.__end_;
  while (v6 != v7)
  {
    if (*(_QWORD *)v6 >= a4)
      *(_QWORD *)v6 += a3;
    v6 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v6 + 16);
  }
}

- (int)type
{
  return self->_type;
}

- (double)ascent
{
  return self->_ascent;
}

- (double)descent
{
  return self->_descent;
}

- (double)advance
{
  return self->_advance;
}

- (CGColor)color
{
  return self->_color;
}

- (void)setColor:(CGColor *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (__CTFont)font
{
  return self->_font;
}

- (void)setFont:(__CTFont *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (__CTFont)flippedFont
{
  return self->_flippedFont;
}

- (void)setFlippedFont:(__CTFont *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (int)location
{
  return self->_location;
}

- (void)setLocation:(int)a3
{
  self->_location = a3;
}

- (double)verticalAdjustment
{
  return self->_verticalAdjustment;
}

- (void)setVerticalAdjustment:(double)a3
{
  self->_verticalAdjustment = a3;
}

- (CGPoint)textPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_textPosition.x;
  y = self->_textPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTextPosition:(CGPoint)a3
{
  self->_textPosition = a3;
}

- (BOOL)shouldRotate
{
  return self->_shouldRotate;
}

- (void)setShouldRotate:(BOOL)a3
{
  self->_shouldRotate = a3;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  CGRect *v4;
  CGPoint *v5;
  CGPoint *v6;
  unsigned __int16 *v7;
  unsigned __int16 *v8;
  unint64_t *v9;

  begin = self->_attachmentPositions.__begin_;
  if (begin)
  {
    self->_attachmentPositions.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_rects.__begin_;
  if (v4)
  {
    self->_rects.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_flippedPositions.__begin_;
  if (v5)
  {
    self->_flippedPositions.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_positions.__begin_;
  if (v6)
  {
    self->_positions.__end_ = v6;
    operator delete(v6);
  }
  v7 = self->_flippedGlyphs.__begin_;
  if (v7)
  {
    self->_flippedGlyphs.__end_ = v7;
    operator delete(v7);
  }
  v8 = self->_glyphs.__begin_;
  if (v8)
  {
    self->_glyphs.__end_ = v8;
    operator delete(v8);
  }
  v9 = self->_charIndexes.__begin_;
  if (v9)
  {
    self->_charIndexes.__end_ = v9;
    operator delete(v9);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 21) = 0;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
