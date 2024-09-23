@implementation _TVMLShelfView

- (_TVMLShelfView)initWithFrame:(CGRect)a3 shelfViewLayout:(id)a4
{
  -[_TVMLShelfView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return 0;
}

- (_TVMLShelfView)initWithFrame:(CGRect)a3 _shelfViewLayout:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVMLShelfView;
  return -[_TVShelfView initWithFrame:shelfViewLayout:](&v5, sel_initWithFrame_shelfViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TVMLShelfView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVMLShelfView;
  return -[_TVShelfView initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (_TVMLShelfView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TVMLShelfViewLayout *v8;
  _TVMLShelfView *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(_TVMLShelfViewLayout);
  v9 = -[_TVMLShelfView initWithFrame:_shelfViewLayout:](self, "initWithFrame:_shelfViewLayout:", v8, x, y, width, height);

  return v9;
}

- (_TVMLShelfView)init
{
  return -[_TVMLShelfView initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (void)tv_setShowcaseFactor:(double)a3
{
  void *v5;

  self->_showcaseFactor = a3;
  -[_TVMLShelfView collectionViewLayout](self, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowcaseFactor:", a3);

  -[_TVMLShelfView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  CGFloat v9;
  void *v10;
  CATransform3D v11;
  objc_super v12;

  -[_TVMLShelfView contentInset](self, "contentInset");
  v4 = v3;
  -[_TVMLShelfView contentOffset](self, "contentOffset");
  if (v5 != -v4)
    -[_TVMLShelfView setContentOffset:](self, "setContentOffset:");
  v12.receiver = self;
  v12.super_class = (Class)_TVMLShelfView;
  -[_TVMLShelfView layoutSubviews](&v12, sel_layoutSubviews);
  -[_TVMLShelfView collectionViewLayout](self, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerAllowance");
  v8 = v7;

  v9 = -(v8 * self->_showcaseFactor);
  -[_TVMLShelfView layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeTranslation(&v11, 0.0, v9, 0.0);
  objc_msgSend(v10, "setSublayerTransform:", &v11);

}

- (id)rowMetricsForExpectedWidth:(double)a3 firstItemRowIndex:(int64_t *)a4
{
  double v7;
  double v8;
  double v9;
  double v10;

  -[_TVMLShelfView contentInset](self, "contentInset");
  return -[_TVMLShelfView rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:](self, "rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:", a4, a3, v7, v8, v9, v10);
}

- (id)rowMetricsForExpectedWidth:(double)a3 withContentInset:(UIEdgeInsets)a4 firstItemRowIndex:(int64_t *)a5
{
  return -[_TVMLShelfView _rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:forShowcase:](self, "_rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:forShowcase:", a5, 0, a3, a4.top, a4.left, a4.bottom, a4.right);
}

- (id)showcaseRowMetricsForExpectedWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  -[_TVMLShelfView contentInset](self, "contentInset");
  return -[_TVMLShelfView showcaseRowMetricsForExpectedWidth:withContentInset:](self, "showcaseRowMetricsForExpectedWidth:withContentInset:", a3, v5, v6, v7, v8);
}

- (id)showcaseRowMetricsForExpectedWidth:(double)a3 withContentInset:(UIEdgeInsets)a4
{
  return -[_TVMLShelfView _rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:forShowcase:](self, "_rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:forShowcase:", 0, 1, a3, a4.top, a4.left, a4.bottom, a4.right);
}

- (id)_rowMetricsForExpectedWidth:(double)a3 withContentInset:(UIEdgeInsets)a4 firstItemRowIndex:(int64_t *)a5 forShowcase:(BOOL)a6
{
  _BOOL8 v6;
  double bottom;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  float64x2_t v26;
  double top;
  _OWORD v28[5];
  _OWORD v29[2];
  __int128 v30;
  __int128 v31;
  double v32[4];

  v6 = a6;
  bottom = a4.bottom;
  top = a4.top;
  -[_TVShelfView shelfFlowLayout](self, "shelfFlowLayout", a3, a4.top, a4.left, a4.bottom, a4.right);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentRowMetricsForShowcase:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minimumLineSpacing");
  v13 = v12;
  v14 = objc_msgSend(v10, "computedRowCount");
  if (v14 < 1)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2 * v14 - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v26 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&top, 0);
    v15 = 0uLL;
    do
    {
      if (v17)
      {
        *(_QWORD *)&v29[0] = 1;
        *((_QWORD *)&v29[0] + 1) = v13;
        v29[1] = v15;
        v30 = v15;
        v31 = v15;
        *(_OWORD *)v32 = v15;
        objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", v29);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v18);

        v15 = 0uLL;
      }
      v31 = v15;
      *(_OWORD *)v32 = v15;
      v29[1] = v15;
      v30 = v15;
      v29[0] = v15;
      objc_msgSend(v11, "objectAtIndex:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "tv_rowMetricsValue");
      }
      else
      {
        v31 = 0u;
        *(_OWORD *)v32 = 0u;
        v30 = 0u;
        memset(v29, 0, sizeof(v29));
      }

      if (!v17)
      {
        *(float64x2_t *)((char *)v29 + 8) = vaddq_f64(v26, *(float64x2_t *)((char *)v29 + 8));
        v32[0] = fmax(v32[0] - top, 0.0);
      }
      if (v14 - 1 == v17)
      {
        *((double *)v29 + 1) = bottom + *((double *)v29 + 1);
        *((double *)&v29[1] + 1) = bottom + *((double *)&v29[1] + 1);
        v32[1] = fmax(v32[1] - bottom, 0.0);
      }
      v28[2] = v30;
      v28[3] = v31;
      v28[4] = *(_OWORD *)v32;
      v28[0] = v29[0];
      v28[1] = v29[1];
      objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", v28);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v21);

      ++v17;
      v15 = 0uLL;
    }
    while (v14 != v17);
  }
  -[_TVMLShelfView delegate](self, "delegate", *(double *)&v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "indexPathForPreferredFocusedViewInCollectionView:", self);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = 2 * (objc_msgSend(v23, "item") % v14);
  v24 = (void *)objc_msgSend(v16, "copy");

  return v24;
}

- (BOOL)shouldBindRowsTogether
{
  return 1;
}

- (UIEdgeInsets)_selectionMarginsForCell:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  UIEdgeInsets result;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_TVMLShelfView;
  -[_TVShelfView _selectionMarginsForCell:](&v24, sel__selectionMarginsForCell_, v4);
  v8 = v5;
  v10 = v9;
  v11 = v6;
  v12 = v7;
  if (v9 == *(double *)(MEMORY[0x24BDF7718] + 8)
    && v5 == *MEMORY[0x24BDF7718]
    && v7 == *(double *)(MEMORY[0x24BDF7718] + 24)
    && v6 == *(double *)(MEMORY[0x24BDF7718] + 16))
  {
    objc_msgSend(v4, "tv_focusMargin");
    v8 = v16;
    v10 = v17;
    v11 = v18;
    v12 = v19;
  }

  v20 = v8;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating
{
  return 0;
}

@end
