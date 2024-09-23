@implementation PXMonthsLayoutMetrics

- (void)setSizeClass:(int64_t)a3
{
  self->_sizeClass = a3;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (void)setDisplaceTopLeadingCardTitle:(BOOL)a3
{
  self->_displaceTopLeadingCardTitle = a3;
}

- (void)setDefaultSectionAspectRatio:(double)a3
{
  self->_defaultSectionAspectRatio = a3;
}

- (void)setChapterHeaderPadding:(UIEdgeInsets)a3
{
  self->_chapterHeaderPadding = a3;
}

- (void)setChapterHeaderHeight:(double)a3
{
  self->_chapterHeaderHeight = a3;
}

- (PXMonthsLayoutMetrics)init
{
  PXMonthsLayoutMetrics *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMonthsLayoutMetrics;
  result = -[PXMonthsLayoutMetrics init](&v3, sel_init);
  if (result)
  {
    result->_defaultSectionAspectRatio = 1.0;
    result->_chapterHeaderHeight = 50.0;
    result->_displaceTopLeadingCardTitle = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXMonthsLayoutMetrics;
  result = -[PXLayoutMetrics copyWithZone:](&v7, sel_copyWithZone_, a3);
  *((_QWORD *)result + 4) = self->_sizeClass;
  *((_QWORD *)result + 5) = self->_orientation;
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_interitemSpacing;
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_defaultSectionAspectRatio;
  v5 = *(_OWORD *)&self->_padding.bottom;
  *((_OWORD *)result + 5) = *(_OWORD *)&self->_padding.top;
  *((_OWORD *)result + 6) = v5;
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_chapterHeaderHeight;
  v6 = *(_OWORD *)&self->_chapterHeaderPadding.bottom;
  *((_OWORD *)result + 7) = *(_OWORD *)&self->_chapterHeaderPadding.top;
  *((_OWORD *)result + 8) = v6;
  *((_BYTE *)result + 24) = self->_displaceTopLeadingCardTitle;
  *((_QWORD *)result + 9) = self->_layoutStyle;
  return result;
}

- (unint64_t)hash
{
  unint64_t v3;
  int64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXMonthsLayoutMetrics;
  v3 = -[PXLayoutMetrics hash](&v6, sel_hash);
  v4 = v3 ^ (2 * -[PXMonthsLayoutMetrics sizeClass](self, "sizeClass"));
  return v4 ^ (4 * -[PXMonthsLayoutMetrics orientation](self, "orientation"));
}

- (BOOL)isEqual:(id)a3
{
  PXMonthsLayoutMetrics *v4;
  PXMonthsLayoutMetrics *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  BOOL v18;
  uint64_t v20;
  objc_super v21;

  v4 = (PXMonthsLayoutMetrics *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v21.receiver = self;
      v21.super_class = (Class)PXMonthsLayoutMetrics;
      if (!-[PXLayoutMetrics isEqual:](&v21, sel_isEqual_, v5))
        goto LABEL_12;
      v6 = -[PXMonthsLayoutMetrics sizeClass](v5, "sizeClass");
      if (v6 != -[PXMonthsLayoutMetrics sizeClass](self, "sizeClass"))
        goto LABEL_12;
      v7 = -[PXMonthsLayoutMetrics orientation](v5, "orientation");
      if (v7 != -[PXMonthsLayoutMetrics orientation](self, "orientation"))
        goto LABEL_12;
      -[PXMonthsLayoutMetrics interitemSpacing](v5, "interitemSpacing");
      v9 = v8;
      -[PXMonthsLayoutMetrics interitemSpacing](self, "interitemSpacing");
      if (v9 != v10)
        goto LABEL_12;
      -[PXMonthsLayoutMetrics defaultSectionAspectRatio](v5, "defaultSectionAspectRatio");
      v12 = v11;
      -[PXMonthsLayoutMetrics defaultSectionAspectRatio](self, "defaultSectionAspectRatio");
      if (v12 != v13)
        goto LABEL_12;
      -[PXMonthsLayoutMetrics padding](v5, "padding");
      -[PXMonthsLayoutMetrics padding](self, "padding");
      if (!PXEdgeInsetsEqualToEdgeInsets())
        goto LABEL_12;
      -[PXMonthsLayoutMetrics chapterHeaderHeight](v5, "chapterHeaderHeight");
      v15 = v14;
      -[PXMonthsLayoutMetrics chapterHeaderHeight](self, "chapterHeaderHeight");
      if (v15 == v16
        && (-[PXMonthsLayoutMetrics chapterHeaderPadding](v5, "chapterHeaderPadding"),
            -[PXMonthsLayoutMetrics chapterHeaderPadding](self, "chapterHeaderPadding"),
            PXEdgeInsetsEqualToEdgeInsets())
        && (v17 = -[PXMonthsLayoutMetrics displaceTopLeadingCardTitle](v5, "displaceTopLeadingCardTitle"),
            v17 == -[PXMonthsLayoutMetrics displaceTopLeadingCardTitle](self, "displaceTopLeadingCardTitle")))
      {
        v20 = -[PXMonthsLayoutMetrics layoutStyle](v5, "layoutStyle");
        v18 = v20 == -[PXMonthsLayoutMetrics layoutStyle](self, "layoutStyle");
      }
      else
      {
LABEL_12:
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (int64_t)sizeClass
{
  return self->_sizeClass;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (double)defaultSectionAspectRatio
{
  return self->_defaultSectionAspectRatio;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)chapterHeaderHeight
{
  return self->_chapterHeaderHeight;
}

- (UIEdgeInsets)chapterHeaderPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_chapterHeaderPadding.top;
  left = self->_chapterHeaderPadding.left;
  bottom = self->_chapterHeaderPadding.bottom;
  right = self->_chapterHeaderPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)displaceTopLeadingCardTitle
{
  return self->_displaceTopLeadingCardTitle;
}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(unint64_t)a3
{
  self->_layoutStyle = a3;
}

@end
