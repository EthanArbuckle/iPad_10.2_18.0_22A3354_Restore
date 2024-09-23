@implementation PXStoryRelatedLayoutMetrics

- (BOOL)isEqual:(id)a3
{
  PXStoryRelatedLayoutMetrics *v4;
  PXStoryRelatedLayoutMetrics *v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  objc_super v22;

  v4 = (PXStoryRelatedLayoutMetrics *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v22.receiver = self;
      v22.super_class = (Class)PXStoryRelatedLayoutMetrics;
      if (!-[PXLayoutMetrics isEqual:](&v22, sel_isEqual_, v5))
        goto LABEL_13;
      -[PXStoryRelatedLayoutMetrics margins](self, "margins");
      -[PXStoryRelatedLayoutMetrics margins](v5, "margins");
      if (!PXEdgeInsetsEqualToEdgeInsets())
        goto LABEL_13;
      -[PXStoryRelatedLayoutMetrics interitemSpacing](self, "interitemSpacing");
      v7 = v6;
      -[PXStoryRelatedLayoutMetrics interitemSpacing](v5, "interitemSpacing");
      if (v7 != v8)
        goto LABEL_13;
      v9 = -[PXStoryRelatedLayoutMetrics layoutMode](self, "layoutMode");
      if (v9 != -[PXStoryRelatedLayoutMetrics layoutMode](v5, "layoutMode"))
        goto LABEL_13;
      -[PXStoryRelatedLayoutMetrics scrollOffset](self, "scrollOffset");
      v11 = v10;
      v13 = v12;
      -[PXStoryRelatedLayoutMetrics scrollOffset](v5, "scrollOffset");
      v15 = 0;
      if (v11 != v16 || v13 != v14)
        goto LABEL_14;
      -[PXStoryRelatedLayoutMetrics offscreenFraction](self, "offscreenFraction");
      v18 = v17;
      -[PXStoryRelatedLayoutMetrics offscreenFraction](v5, "offscreenFraction");
      if (v18 == v19)
      {
        v20 = -[PXStoryRelatedLayoutMetrics userInterfaceDirection](self, "userInterfaceDirection");
        v15 = v20 == -[PXStoryRelatedLayoutMetrics userInterfaceDirection](v5, "userInterfaceDirection");
      }
      else
      {
LABEL_13:
        v15 = 0;
      }
LABEL_14:

      goto LABEL_15;
    }
    v15 = 0;
  }
LABEL_15:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryRelatedLayoutMetrics;
  v3 = -[PXLayoutMetrics hash](&v6, sel_hash);
  -[PXStoryRelatedLayoutMetrics scrollOffset](self, "scrollOffset");
  return v3 ^ (2 * (uint64_t)v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryRelatedLayoutMetrics;
  result = -[PXLayoutMetrics copyWithZone:](&v6, sel_copyWithZone_, a3);
  if (result)
  {
    v5 = *(_OWORD *)&self->_margins.bottom;
    *(_OWORD *)((char *)result + 72) = *(_OWORD *)&self->_margins.top;
    *(_OWORD *)((char *)result + 88) = v5;
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_interitemSpacing;
    *((_QWORD *)result + 4) = self->_layoutMode;
    *(CGPoint *)((char *)result + 56) = self->_scrollOffset;
    *((_QWORD *)result + 5) = *(_QWORD *)&self->_offscreenFraction;
    *((_QWORD *)result + 6) = self->_userInterfaceDirection;
  }
  return result;
}

- (UIEdgeInsets)margins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margins.top;
  left = self->_margins.left;
  bottom = self->_margins.bottom;
  right = self->_margins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (void)setLayoutMode:(int64_t)a3
{
  self->_layoutMode = a3;
}

- (CGPoint)scrollOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_scrollOffset.x;
  y = self->_scrollOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setScrollOffset:(CGPoint)a3
{
  self->_scrollOffset = a3;
}

- (double)offscreenFraction
{
  return self->_offscreenFraction;
}

- (void)setOffscreenFraction:(double)a3
{
  self->_offscreenFraction = a3;
}

- (unint64_t)userInterfaceDirection
{
  return self->_userInterfaceDirection;
}

- (void)setUserInterfaceDirection:(unint64_t)a3
{
  self->_userInterfaceDirection = a3;
}

@end
