@implementation PXYearsLayoutMetrics

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

- (void)setMultiColumnAspectRatio:(double)a3
{
  self->_multiColumnAspectRatio = a3;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (void)setDefaultItemAspectRatio:(double)a3
{
  self->_defaultItemAspectRatio = a3;
}

- (PXYearsLayoutMetrics)init
{
  PXYearsLayoutMetrics *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXYearsLayoutMetrics;
  result = -[PXYearsLayoutMetrics init](&v3, sel_init);
  if (result)
  {
    result->_defaultItemAspectRatio = 1.0;
    result->_multiColumnAspectRatio = 1.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXYearsLayoutMetrics;
  result = -[PXLayoutMetrics copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_QWORD *)result + 3) = self->_sizeClass;
  *((_QWORD *)result + 4) = self->_orientation;
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_interitemSpacing;
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_defaultItemAspectRatio;
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_multiColumnAspectRatio;
  v5 = *(_OWORD *)&self->_padding.bottom;
  *(_OWORD *)((char *)result + 72) = *(_OWORD *)&self->_padding.top;
  *(_OWORD *)((char *)result + 88) = v5;
  *((_QWORD *)result + 8) = self->_layoutStyle;
  return result;
}

- (unint64_t)hash
{
  unint64_t v3;
  int64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXYearsLayoutMetrics;
  v3 = -[PXLayoutMetrics hash](&v6, sel_hash);
  v4 = v3 ^ (2 * -[PXYearsLayoutMetrics sizeClass](self, "sizeClass"));
  return v4 ^ (4 * -[PXYearsLayoutMetrics orientation](self, "orientation"));
}

- (BOOL)isEqual:(id)a3
{
  PXYearsLayoutMetrics *v4;
  PXYearsLayoutMetrics *v5;
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
  uint64_t v17;
  BOOL v18;
  objc_super v20;

  v4 = (PXYearsLayoutMetrics *)a3;
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
      v20.receiver = self;
      v20.super_class = (Class)PXYearsLayoutMetrics;
      if (!-[PXLayoutMetrics isEqual:](&v20, sel_isEqual_, v5))
        goto LABEL_13;
      v6 = -[PXYearsLayoutMetrics sizeClass](v5, "sizeClass");
      if (v6 != -[PXYearsLayoutMetrics sizeClass](self, "sizeClass"))
        goto LABEL_13;
      v7 = -[PXYearsLayoutMetrics orientation](v5, "orientation");
      if (v7 != -[PXYearsLayoutMetrics orientation](self, "orientation"))
        goto LABEL_13;
      -[PXYearsLayoutMetrics interitemSpacing](v5, "interitemSpacing");
      v9 = v8;
      -[PXYearsLayoutMetrics interitemSpacing](self, "interitemSpacing");
      if (v9 != v10)
        goto LABEL_13;
      -[PXYearsLayoutMetrics defaultItemAspectRatio](v5, "defaultItemAspectRatio");
      v12 = v11;
      -[PXYearsLayoutMetrics defaultItemAspectRatio](self, "defaultItemAspectRatio");
      if (v12 != v13)
        goto LABEL_13;
      -[PXYearsLayoutMetrics multiColumnAspectRatio](v5, "multiColumnAspectRatio");
      v15 = v14;
      -[PXYearsLayoutMetrics multiColumnAspectRatio](self, "multiColumnAspectRatio");
      if (v15 == v16
        && (-[PXYearsLayoutMetrics padding](v5, "padding"),
            -[PXYearsLayoutMetrics padding](self, "padding"),
            PXEdgeInsetsEqualToEdgeInsets()))
      {
        v17 = -[PXYearsLayoutMetrics layoutStyle](v5, "layoutStyle");
        v18 = v17 == -[PXYearsLayoutMetrics layoutStyle](self, "layoutStyle");
      }
      else
      {
LABEL_13:
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

- (double)defaultItemAspectRatio
{
  return self->_defaultItemAspectRatio;
}

- (double)multiColumnAspectRatio
{
  return self->_multiColumnAspectRatio;
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

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(unint64_t)a3
{
  self->_layoutStyle = a3;
}

@end
