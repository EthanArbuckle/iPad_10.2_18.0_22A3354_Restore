@implementation PXSearchZeroKeywordGadgetLayout

- (void)setColumnWidth:(double)a3
{
  if (self->_columnWidth != a3)
  {
    self->_columnWidth = a3;
    -[PXSearchZeroKeywordGadgetLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGPoint result;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)PXSearchZeroKeywordGadgetLayout;
  -[PXSearchZeroKeywordGadgetLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v19, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, a4.x, a4.y);
  v6 = v5;
  v8 = v7;
  -[PXSearchZeroKeywordGadgetLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentInset");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "contentSize");
  v15 = v14;
  objc_msgSend(v9, "bounds");
  if (v6 < v13 + v15 - CGRectGetWidth(v21))
  {
    -[PXSearchZeroKeywordGadgetLayout columnWidth](self, "columnWidth");
    if (v16 > 0.0)
      v6 = v16 * (double)(uint64_t)fmax(round((v6 + v11) / v16), 0.0) - v11;
  }

  v17 = v6;
  v18 = v8;
  result.y = v18;
  result.x = v17;
  return result;
}

- (double)columnWidth
{
  return self->_columnWidth;
}

@end
