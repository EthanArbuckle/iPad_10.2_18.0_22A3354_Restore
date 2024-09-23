@implementation SXColumnLayout

- (double)widthForColumnRange:(_NSRange)a3 ignoreMargin:(unint64_t)a4 ignoreGutter:(unint64_t)a5 ignoreViewportPadding:(unint64_t)a6
{
  NSUInteger numberOfColumns;
  unint64_t length;
  double v12;
  double v13;
  _BOOL4 v14;
  BOOL v15;
  int v16;
  _BOOL4 v17;
  double v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  int v25;
  double rightMargin;
  int v27;
  char v28;
  double gutter;
  double leftScreenMargin;
  float v31;
  _BOOL4 v33;
  int v35;

  numberOfColumns = self->_numberOfColumns;
  if (a3.length >= numberOfColumns)
    length = self->_numberOfColumns;
  else
    length = a3.length;
  v12 = (double)((length - 1) * self->_gutter);
  v13 = self->_columnWidth * (double)length;
  v14 = (self->_leftColumnOffset | a3.location) == 0;
  if (self->_rightColumnOffset)
    v15 = 0;
  else
    v15 = a3.location + a3.length >= numberOfColumns;
  v16 = v15;
  v17 = (a4 & 0xFFFFFFFFFFFFFFFDLL) != 1 && -[SXDocumentLayout margin](self->_documentLayout, "margin") != 0;
  v18 = v13 + v12;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v19 = (a6 & 0xFFFFFFFFFFFFFFFDLL) == 1;
    v20 = (a6 & 0xFFFFFFFFFFFFFFFELL) == 2;
    v21 = 1;
  }
  else
  {
    v21 = -[SXDocumentLayout margin](self->_documentLayout, "margin") == 0;
    v22 = a6 & 0xFFFFFFFFFFFFFFFDLL;
    v19 = (a6 & 0xFFFFFFFFFFFFFFFDLL) == 1;
    v23 = a6 & 0xFFFFFFFFFFFFFFFELL;
    v20 = (a6 & 0xFFFFFFFFFFFFFFFELL) == 2;
    if (!a4)
    {
      v33 = v19;
      if (-[SXDocumentLayout margin](self->_documentLayout, "margin")
        || self->_viewportSize.width != self->_constrainedViewportSize.width)
      {
        if (v22 == 1 && v14)
          v18 = v18 + self->_leftMargin;
        v19 = v33;
        if (v23 == 2)
          v35 = v16;
        else
          v35 = 0;
        if (v35 == 1)
        {
          v18 = v18 + self->_rightMargin;
          v20 = 1;
        }
        goto LABEL_25;
      }
      v19 = v33;
    }
  }
  v24 = !v14;
  v25 = v16 ^ 1;
  if (v17 || !v21 || (v24 & 1) != 0 || (v25 & 1) != 0)
  {
    if (((v17 | v24) & 1) != 0)
    {
      if (((!v21 | v25) & 1) != 0)
        goto LABEL_25;
      rightMargin = self->_rightMargin;
    }
    else
    {
      rightMargin = self->_leftMargin;
    }
  }
  else
  {
    rightMargin = self->_leftMargin + self->_rightMargin;
  }
  v18 = v18 + rightMargin;
LABEL_25:
  if (a5)
  {
    v27 = a5 != 3 || v14;
    if (((v27 | v16) & 1) == 0)
    {
      gutter = (double)self->_gutter;
      goto LABEL_38;
    }
    if ((a5 | 2) == 3 && !v14)
    {
      leftScreenMargin = (double)(self->_gutter / 2);
      goto LABEL_41;
    }
    if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2)
      v28 = v16;
    else
      v28 = 1;
    if ((v28 & 1) == 0)
    {
      gutter = (double)(self->_gutter / 2);
LABEL_38:
      v18 = v18 + gutter;
    }
  }
  if (!v19 || !v14)
    goto LABEL_42;
  leftScreenMargin = self->_leftScreenMargin;
LABEL_41:
  v18 = v18 + leftScreenMargin;
LABEL_42:
  if ((v20 & v16) == 1)
    v18 = v18 + self->_rightScreenMargin;
  v31 = v18;
  return roundf(v31);
}

- (SXColumnLayout)initWithConstrainedViewportSize:(CGSize)a3 viewportSize:(CGSize)a4 layoutWidth:(double)a5 documentLayout:(id)a6 numberOfLayoutColumns:(unint64_t)a7 leftMargin:(double)a8 rightMargin:(double)a9 numberOfColumns:(unint64_t)a10 columnWidth:(double)a11 leftScreenMargin:(double)a12 rightScreenMargin:(double)a13 contentScaleFactor:(double)a14
{
  CGFloat height;
  CGFloat width;
  CGFloat v22;
  CGFloat v23;
  id v25;
  SXColumnLayout *v26;
  SXColumnLayout *v27;
  objc_super v29;

  height = a4.height;
  width = a4.width;
  v22 = a3.height;
  v23 = a3.width;
  v25 = a6;
  v29.receiver = self;
  v29.super_class = (Class)SXColumnLayout;
  v26 = -[SXColumnLayout init](&v29, sel_init);
  v27 = v26;
  if (v26)
  {
    v26->_constrainedViewportSize.width = v23;
    v26->_constrainedViewportSize.height = v22;
    v26->_viewportSize.width = width;
    v26->_viewportSize.height = height;
    v26->_layoutWidth = objc_msgSend(v25, "width");
    objc_storeStrong((id *)&v27->_documentLayout, a6);
    v27->_leftMargin = a8;
    v27->_rightMargin = a9;
    v27->_gutter = objc_msgSend(v25, "gutter");
    v27->_numberOfColumns = a10;
    v27->_columnWidth = a11;
    v27->_layoutColumns = a7;
    v27->_leftScreenMargin = a12;
    v27->_rightScreenMargin = a13;
    v27->_contentScaleFactor = a14;
  }

  return v27;
}

- (void)setMinimumViewportWidthForLooseLayout:(double)a3
{
  self->_minimumViewportWidthForLooseLayout = a3;
}

- (id)columnLayoutForComponentBlueprint:(id)a3 unitConverter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  double leftScreenMargin;
  double leftMargin;
  double rightScreenMargin;
  double rightMargin;
  double columnWidth;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  SXColumnLayout *v30;
  double v31;
  SXDocumentLayout *documentLayout;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  SXColumnLayout *v36;
  int64_t leftColumnOffset;
  int64_t rightColumnOffset;
  int64_t v39;
  unint64_t numberOfColumns;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "componentLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ignoreDocumentMargin") == 3 || objc_msgSend(v8, "ignoreDocumentMargin") == 1;
  v10 = objc_msgSend(v8, "ignoreDocumentMargin") == 3 || objc_msgSend(v8, "ignoreDocumentMargin") == 2;
  if (objc_msgSend(v6, "columnRange"))
    v11 = 0;
  else
    v11 = self->_leftColumnOffset == 0;
  v12 = objc_msgSend(v6, "columnRange");
  objc_msgSend(v6, "columnRange");
  v14 = v13 + v12 == self->_numberOfColumns && self->_rightColumnOffset == 0;
  v15 = objc_msgSend(v8, "ignoreViewportPadding") != 1 && objc_msgSend(v8, "ignoreViewportPadding") != 3;
  v16 = objc_msgSend(v8, "ignoreViewportPadding") != 2 && objc_msgSend(v8, "ignoreViewportPadding") != 3;
  v17 = self->_viewportSize.width - self->_constrainedViewportSize.width < 2.22044605e-16
     && -[SXDocumentLayout margin](self->_documentLayout, "margin") == 0;
  leftScreenMargin = 0.0;
  leftMargin = 0.0;
  if (v11 && (v9 || v17))
    leftMargin = self->_leftMargin;
  if (v11 && !v15)
  {
    leftMargin = self->_leftMargin;
    leftScreenMargin = self->_leftScreenMargin;
  }
  rightScreenMargin = 0.0;
  rightMargin = 0.0;
  if (v14 && (v10 || v17))
    rightMargin = self->_rightMargin;
  if (v14 && !v16)
  {
    rightMargin = self->_rightMargin;
    rightScreenMargin = self->_rightScreenMargin;
  }
  columnWidth = self->_columnWidth;
  objc_msgSend(v6, "componentSizer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contentInsetsWithUnitConverter:", v7);
  v25 = v24;
  v27 = v26;

  v28 = v25 + v27;
  if (v28 > 0.0)
  {
    objc_msgSend(v6, "columnRange");
    columnWidth = columnWidth - v28 / (double)v29;
  }
  v30 = [SXColumnLayout alloc];
  v31 = (double)-[SXDocumentLayout width](self->_documentLayout, "width");
  documentLayout = self->_documentLayout;
  objc_msgSend(v8, "columnRange");
  v34 = v33;
  objc_msgSend(v6, "columnRange");
  v36 = -[SXColumnLayout initWithConstrainedViewportSize:viewportSize:layoutWidth:documentLayout:numberOfLayoutColumns:leftMargin:rightMargin:numberOfColumns:columnWidth:leftScreenMargin:rightScreenMargin:contentScaleFactor:](v30, "initWithConstrainedViewportSize:viewportSize:layoutWidth:documentLayout:numberOfLayoutColumns:leftMargin:rightMargin:numberOfColumns:columnWidth:leftScreenMargin:rightScreenMargin:contentScaleFactor:", documentLayout, v34, v35, self->_constrainedViewportSize.width, self->_constrainedViewportSize.height, self->_viewportSize.width, self->_viewportSize.height, v31, leftMargin, rightMargin, columnWidth, *(_QWORD *)&leftScreenMargin, *(_QWORD *)&rightScreenMargin, *(_QWORD *)&self->_contentScaleFactor);
  leftColumnOffset = self->_leftColumnOffset;
  v36->_leftColumnOffset = objc_msgSend(v6, "columnRange") + leftColumnOffset;
  v39 = self->_leftColumnOffset;
  rightColumnOffset = self->_rightColumnOffset;
  numberOfColumns = self->_numberOfColumns;
  v41 = -[SXColumnLayout leftColumnOffset](v36, "leftColumnOffset");
  v36->_rightColumnOffset = v39
                          + rightColumnOffset
                          + numberOfColumns
                          - (v41
                           + -[SXColumnLayout numberOfColumns](v36, "numberOfColumns"));
  -[SXColumnLayout setMinimumViewportWidthForLooseLayout:](v36, "setMinimumViewportWidthForLooseLayout:", self->_minimumViewportWidthForLooseLayout);
  if ((objc_msgSend(v8, "ignoreDocumentGutter") == 3 || objc_msgSend(v8, "ignoreDocumentGutter") == 1)
    && -[SXColumnLayout leftColumnOffset](v36, "leftColumnOffset"))
  {
    -[SXColumnLayout setLeftInset:](v36, "setLeftInset:", (double)(self->_gutter / 2));
  }
  if ((objc_msgSend(v8, "ignoreDocumentGutter") == 3 || objc_msgSend(v8, "ignoreDocumentGutter") == 2)
    && -[SXColumnLayout rightColumnOffset](v36, "rightColumnOffset"))
  {
    -[SXColumnLayout setRightInset:](v36, "setRightInset:", (double)(self->_gutter / 2));
  }
  objc_msgSend(v8, "minimumHeight");
  if (v42)
  {
    v43 = objc_msgSend(v8, "minimumHeight");
    objc_msgSend(v7, "convertValueToPoints:", v43, v44);
    -[SXColumnLayout setMinimumHeight:](v36, "setMinimumHeight:");
  }

  return v36;
}

- (_NSRange)convertColumnRange:(_NSRange)a3 minimumColumnLength:(int64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  double width;
  double minimumViewportWidthForLooseLayout;
  double v10;
  unint64_t v11;
  uint64_t v12;
  double layoutColumns;
  BOOL v15;
  double v16;
  float v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  NSUInteger v29;
  int64_t v30;
  NSUInteger numberOfColumns;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  width = self->_constrainedViewportSize.width;
  minimumViewportWidthForLooseLayout = self->_minimumViewportWidthForLooseLayout;
  if (width <= minimumViewportWidthForLooseLayout)
  {
    if (width >= minimumViewportWidthForLooseLayout
      || (v10 = (double)a3.length,
          (double)a3.length / (double)-[SXDocumentLayout columns](self->_documentLayout, "columns") >= 0.25))
    {
      v29 = 0;
      numberOfColumns = self->_numberOfColumns;
      goto LABEL_49;
    }
  }
  else
  {
    v10 = (double)a3.length;
  }
  v11 = self->_numberOfColumns;
  if (v11 >= a4)
    v12 = a4;
  else
    v12 = self->_numberOfColumns;
  if (v12 >= length)
    v12 = length;
  layoutColumns = (double)self->_layoutColumns;
  v15 = v10 / layoutColumns <= 0.45 && v12 == 1;
  v16 = (double)v11 / layoutColumns;
  v17 = v16 * (double)location;
  v18 = llroundf(v17);
  *(float *)&v16 = v16 * (double)(location + length);
  v19 = llroundf(*(float *)&v16) - v18;
  v20 = v12 + v18 - v11;
  if (v12 + v18 < v11)
    v20 = 0;
  if (v18 >= -1)
    v21 = -1;
  else
    v21 = v18;
  v22 = v18 - v21;
  if (v20 >= v22)
    v20 = v22;
  v23 = v18 - v20;
  if (v19 < v12)
    v18 = v23;
  else
    v12 = v19;
  if (v12 != 1)
    v15 = 1;
  v24 = 1;
  if (v18)
    v25 = v18 + 2 <= (uint64_t)v11;
  else
    v25 = 1;
  v26 = !v25;
  v27 = v18 - v26;
  if (v11 < 2)
    v27 = v18;
  else
    v24 = 2;
  if (v15)
  {
    v28 = v18;
  }
  else
  {
    v12 = v24;
    v28 = v27;
  }
  if (v28 >= (uint64_t)(v11 - 1))
    v29 = v11 - 1;
  else
    v29 = v28;
  if (v12 <= 1)
    v12 = 1;
  v30 = v11 - v29;
  if (v12 >= v30)
    numberOfColumns = v30;
  else
    numberOfColumns = v12;
LABEL_49:
  result.length = numberOfColumns;
  result.location = v29;
  return result;
}

- (double)xPositionForColumnIndex:(int64_t)a3 ignoreMargin:(unint64_t)a4 ignoreGutter:(unint64_t)a5 ignoreViewportPadding:(unint64_t)a6
{
  double v10;
  double leftInset;
  _BOOL4 v12;
  double v13;
  unint64_t v14;
  float v15;

  v10 = self->_columnWidth * (double)a3 + (double)(self->_gutter * a3);
  leftInset = self->_leftInset;
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    v12 = 1;
  }
  else if (-[SXDocumentLayout margin](self->_documentLayout, "margin"))
  {
    v12 = 0;
  }
  else
  {
    v12 = self->_viewportSize.width == self->_constrainedViewportSize.width;
  }
  v13 = leftInset + v10;
  v14 = a6 & 0xFFFFFFFFFFFFFFFDLL;
  if (self->_leftColumnOffset + a3)
  {
    v13 = v13 + self->_leftMargin;
    if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      v13 = v13 - (double)(self->_gutter / 2);
  }
  else if (v14 != 1 && !v12)
  {
    v13 = v13 + self->_leftMargin;
  }
  if (v14 != 1)
    v13 = v13 + self->_leftScreenMargin;
  v15 = v13;
  return roundf(v15);
}

- (BOOL)isEqual:(id)a3
{
  SXColumnLayout *v4;
  SXColumnLayout *v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  v4 = (SXColumnLayout *)a3;
  v5 = v4;
  if (self == v4)
    v8 = 1;
  else
    v8 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (v5->_constrainedViewportSize.width == self->_constrainedViewportSize.width
        ? (v6 = v5->_constrainedViewportSize.height == self->_constrainedViewportSize.height)
        : (v6 = 0),
          v6
       && (v5->_viewportSize.width == self->_viewportSize.width
         ? (v7 = v5->_viewportSize.height == self->_viewportSize.height)
         : (v7 = 0),
           v7
        && v5->_layoutWidth == self->_layoutWidth
        && v5->_leftMargin == self->_leftMargin
        && v5->_rightMargin == self->_rightMargin
        && v5->_gutter == self->_gutter
        && v5->_numberOfColumns == self->_numberOfColumns
        && v5->_columnWidth == self->_columnWidth
        && v5->_minimumHeight == self->_minimumHeight
        && v5->_leftScreenMargin == self->_leftScreenMargin
        && v5->_rightScreenMargin == self->_rightScreenMargin))
      && v5->_contentScaleFactor == self->_contentScaleFactor;

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithConstrainedViewportSize:viewportSize:layoutWidth:documentLayout:numberOfLayoutColumns:leftMargin:rightMargin:numberOfColumns:columnWidth:leftScreenMargin:rightScreenMargin:contentScaleFactor:", self->_documentLayout, self->_layoutColumns, self->_numberOfColumns, self->_constrainedViewportSize.width, self->_constrainedViewportSize.height, self->_viewportSize.width, self->_viewportSize.height, (double)self->_layoutWidth, self->_leftMargin, self->_rightMargin, self->_columnWidth, *(_QWORD *)&self->_leftScreenMargin, *(_QWORD *)&self->_rightScreenMargin, *(_QWORD *)&self->_contentScaleFactor);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; columns: %lu"), self->_numberOfColumns);
  objc_msgSend(v3, "appendFormat:", CFSTR("; columnWidth: %f"), *(_QWORD *)&self->_columnWidth);
  NSStringFromCGSize(self->_constrainedViewportSize);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; constrainedViewportSize: %@"), v4);

  NSStringFromCGSize(self->_viewportSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; viewportSize: %@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("; layoutWidth: %lu"), self->_layoutWidth);
  objc_msgSend(v3, "appendFormat:", CFSTR("; leftMargin: %lu"), *(_QWORD *)&self->_leftMargin);
  objc_msgSend(v3, "appendFormat:", CFSTR("; rightMargin: %lu"), *(_QWORD *)&self->_rightMargin);
  objc_msgSend(v3, "appendFormat:", CFSTR("; gutter: %lu"), self->_gutter);
  objc_msgSend(v3, "appendFormat:", CFSTR("; leftColumnOffset: %lu"), self->_leftColumnOffset);
  objc_msgSend(v3, "appendFormat:", CFSTR("; rightColumnOffset: %lu"), self->_rightColumnOffset);
  objc_msgSend(v3, "appendFormat:", CFSTR("; leftInset: %f"), *(_QWORD *)&self->_leftInset);
  objc_msgSend(v3, "appendFormat:", CFSTR("; rightInset: %f"), *(_QWORD *)&self->_rightInset);
  objc_msgSend(v3, "appendFormat:", CFSTR("; minimumHeight: %f"), *(_QWORD *)&self->_minimumHeight);
  objc_msgSend(v3, "appendFormat:", CFSTR("; leftScreenMargin: %f"), *(_QWORD *)&self->_leftScreenMargin);
  objc_msgSend(v3, "appendFormat:", CFSTR("; rightScreenMargin: %f"), *(_QWORD *)&self->_rightScreenMargin);
  objc_msgSend(v3, "appendFormat:", CFSTR("; documentLayout: {width: %lu, columns: %lu, margin: %lu, columns: %lu}"),
    -[SXDocumentLayout width](self->_documentLayout, "width"),
    -[SXDocumentLayout columns](self->_documentLayout, "columns"),
    -[SXDocumentLayout margin](self->_documentLayout, "margin"),
    -[SXDocumentLayout gutter](self->_documentLayout, "gutter"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; contentScaleFactor: %f"), *(_QWORD *)&self->_contentScaleFactor);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CGSize)constrainedViewportSize
{
  double width;
  double height;
  CGSize result;

  width = self->_constrainedViewportSize.width;
  height = self->_constrainedViewportSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)viewportSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewportSize.width;
  height = self->_viewportSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (SXDocumentLayout)documentLayout
{
  return self->_documentLayout;
}

- (int64_t)layoutWidth
{
  return self->_layoutWidth;
}

- (double)leftMargin
{
  return self->_leftMargin;
}

- (double)rightMargin
{
  return self->_rightMargin;
}

- (int64_t)gutter
{
  return self->_gutter;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (double)columnWidth
{
  return self->_columnWidth;
}

- (int64_t)leftColumnOffset
{
  return self->_leftColumnOffset;
}

- (int64_t)rightColumnOffset
{
  return self->_rightColumnOffset;
}

- (void)setRightColumnOffset:(int64_t)a3
{
  self->_rightColumnOffset = a3;
}

- (double)leftInset
{
  return self->_leftInset;
}

- (void)setLeftInset:(double)a3
{
  self->_leftInset = a3;
}

- (double)rightInset
{
  return self->_rightInset;
}

- (void)setRightInset:(double)a3
{
  self->_rightInset = a3;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (double)minimumViewportWidthForLooseLayout
{
  return self->_minimumViewportWidthForLooseLayout;
}

- (double)leftScreenMargin
{
  return self->_leftScreenMargin;
}

- (double)rightScreenMargin
{
  return self->_rightScreenMargin;
}

- (double)contentScaleFactor
{
  return self->_contentScaleFactor;
}

- (unint64_t)layoutColumns
{
  return self->_layoutColumns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentLayout, 0);
}

@end
