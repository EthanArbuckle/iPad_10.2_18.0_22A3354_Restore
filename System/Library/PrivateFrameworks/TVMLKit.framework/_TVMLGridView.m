@implementation _TVMLGridView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)_TVMLGridView;
  -[_TVGridView sizeThatFits:](&v14, sel_sizeThatFits_);
  v7 = v6;
  v9 = v8;
  -[_TVMLGridView headerView](self, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", width, height);
    v9 = v9 + v11;
  }
  v12 = v7;
  v13 = v9;
  result.height = v13;
  result.width = v12;
  return result;
}

- (id)rowMetricsForExpectedWidth:(double)a3 firstItemRowIndex:(int64_t *)a4
{
  double v7;
  double v8;
  double v9;
  double v10;

  -[_TVMLGridView contentInset](self, "contentInset");
  return -[_TVMLGridView rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:](self, "rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:", a4, a3, v7, v8, v9, v10);
}

- (id)rowMetricsForExpectedWidth:(double)a3 withContentInset:(UIEdgeInsets)a4 firstItemRowIndex:(int64_t *)a5
{
  double right;
  double bottom;
  double left;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  float64x2_t v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  int64_t *v51;
  uint64_t v52;
  float64x2_t v53;
  double top;
  uint64_t v55;
  uint64_t v56;
  _BYTE v57[24];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _OWORD v61[9];
  float64x2_t v62[2];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  -[_TVMLGridView collectionViewLayout](self, "collectionViewLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_TVMLGridView numberOfSections](self, "numberOfSections");
  -[_TVMLGridView delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "indexPathForPreferredFocusedViewInCollectionView:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "cellMetrics");
    v15 = *(double *)&v66;
  }
  else
  {
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v15 = 0.0;
    v66 = 0u;
  }
  objc_msgSend(v11, "minimumInteritemSpacing");
  v17 = v16;
  objc_msgSend(v11, "minimumLineSpacing");
  v19 = v18;
  v20 = a3 - (left + right);
  v51 = a5;
  if ((objc_msgSend(v11, "isHeterogeneous") & 1) != 0 || v15 <= 0.0)
  {
    -[_TVMLGridView delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_respondsToSelector();

    v22 = 0;
    v55 = 0x7FFFFFFFFFFFFFFFLL;
    if ((v26 & 1) != 0 && v12 >= 1)
    {
      v27 = 0;
      v22 = 0;
      v55 = 0x7FFFFFFFFFFFFFFFLL;
      v52 = v12;
      do
      {
        v28 = -[_TVMLGridView numberOfItemsInSection:](self, "numberOfItemsInSection:", v27);
        if (v28 >= 1)
        {
          v29 = v28;
          v30 = 0;
          v31 = v20;
          do
          {
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v30, v27);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[_TVMLGridView delegate](self, "delegate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "collectionView:layout:sizeForItemAtIndexPath:", self, v11, v32);
            v35 = v34;

            if (v31 < fmin(v35, v20))
            {
              ++v22;
              v31 = v20;
            }
            if (v14 && objc_msgSend(v14, "section") == v27)
            {
              v36 = objc_msgSend(v14, "item");
              v37 = v55;
              if (v30 == v36)
                v37 = v22;
              v55 = v37;
            }
            v31 = v31 - (v17 + v35);

            ++v30;
          }
          while (v29 != v30);
          ++v22;
          v12 = v52;
        }
        ++v27;
      }
      while (v27 != v12);
    }
  }
  else if (v12 < 1)
  {
    v22 = 0;
    v55 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v21 = 0;
    v22 = 0;
    v23 = (uint64_t)((v20 + v17) / (fmin(v15, v20) + v17));
    v55 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v24 = -[_TVMLGridView numberOfItemsInSection:](self, "numberOfItemsInSection:", v21);
      if (v14 && v21 == objc_msgSend(v14, "section") && objc_msgSend(v14, "item") < v24)
        v55 = v22 + (objc_msgSend(v14, "item") + v23) / v23 - 1;
      v22 += (v23 - 1 + v24) / v23;
      ++v21;
    }
    while (v12 != v21);
  }
  v64 = 0u;
  v65 = 0u;
  v63 = 0u;
  memset(v62, 0, sizeof(v62));
  if (v11)
    objc_msgSend(v11, "cellMetrics");
  else
    memset(v61, 0, sizeof(v61));
  v38 = TVRowMetricsMakeWithCellMetrics((uint64_t)v61, (uint64_t)v62);
  v39 = v22 - 1;
  if (v22 < 1)
  {
    v40 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2 * v22 - 1, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v53 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&top, 0);
    do
    {
      v42 = *(float64x2_t *)((char *)v62 + 8);
      v43 = v62[1].f64[1];
      v45 = *((double *)&v65 + 1);
      v44 = *(double *)&v65;
      if (v41)
      {
        if (v39 == v41)
        {
          v43 = bottom + v62[1].f64[1];
          v45 = fmax(*((double *)&v65 + 1) - bottom, 0.0);
          v42.f64[0] = bottom + v62[0].f64[1];
        }
      }
      else
      {
        v42 = vaddq_f64(v53, *(float64x2_t *)((char *)v62 + 8));
        v44 = fmax(*(double *)&v65 - top, 0.0);
      }
      v56 = *(_QWORD *)&v62[0].f64[0];
      *(float64x2_t *)v57 = v42;
      v58 = v63;
      v59 = v64;
      *(double *)&v57[16] = v43;
      *(double *)&v60 = v44;
      *((double *)&v60 + 1) = v45;
      objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v56);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObject:", v46);

      if (v41 < v39)
      {
        v56 = 1;
        *(_QWORD *)v57 = v19;
        *(_OWORD *)&v57[8] = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v56);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v47);

      }
      ++v41;
    }
    while (v22 != v41);
  }
  if (v51)
  {
    if (v55 == 0x7FFFFFFFFFFFFFFFLL)
      v48 = 0;
    else
      v48 = v55;
    *v51 = v48 + v55;
  }
  v49 = (void *)objc_msgSend(v40, "copy");

  return v49;
}

- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating
{
  return 0;
}

- (BOOL)configureForListTemplate
{
  return self->_configureForListTemplate;
}

- (void)setConfigureForListTemplate:(BOOL)a3
{
  self->_configureForListTemplate = a3;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
