@implementation _TVGridViewFlowLayout

- (_TVGridViewFlowLayout)init
{
  _TVGridViewFlowLayout *v2;
  _TVGridViewFlowLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVGridViewFlowLayout;
  v2 = -[_TVCollectionViewFlowLayout init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UICollectionViewFlowLayout setScrollDirection:](v2, "setScrollDirection:", 0);
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v3, "setMinimumInteritemSpacing:", 0.0);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v3, "setMinimumLineSpacing:", 0.0);
  }
  return v3;
}

- (void)setCellMetrics:(TVCellMetrics *)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double width;
  double height;

  self->_cellMetrics.cellSize = a3->cellSize;
  v4 = *(_OWORD *)&a3->cellInset.bottom;
  v6 = *(_OWORD *)&a3->cellPadding.top;
  v5 = *(_OWORD *)&a3->cellPadding.bottom;
  *(_OWORD *)&self->_cellMetrics.cellInset.top = *(_OWORD *)&a3->cellInset.top;
  *(_OWORD *)&self->_cellMetrics.cellInset.bottom = v4;
  *(_OWORD *)&self->_cellMetrics.cellPadding.top = v6;
  *(_OWORD *)&self->_cellMetrics.cellPadding.bottom = v5;
  v7 = *(_OWORD *)&a3->cellMargin.bottom;
  v9 = *(_OWORD *)&a3->cellInsetAlt.top;
  v8 = *(_OWORD *)&a3->cellInsetAlt.bottom;
  *(_OWORD *)&self->_cellMetrics.cellMargin.top = *(_OWORD *)&a3->cellMargin.top;
  *(_OWORD *)&self->_cellMetrics.cellMargin.bottom = v7;
  *(_OWORD *)&self->_cellMetrics.cellInsetAlt.top = v9;
  *(_OWORD *)&self->_cellMetrics.cellInsetAlt.bottom = v8;
  width = a3->cellSize.width;
  if (a3->cellSize.width == 0.0)
    height = a3->cellSize.height;
  else
    height = a3->cellSize.width;
  if (height > 2.22044605e-16 && a3->cellSize.height > 2.22044605e-16)
    -[UICollectionViewFlowLayout setItemSize:](self, "setItemSize:");
  -[_TVCollectionViewFlowLayout setHeterogeneous:](self, "setHeterogeneous:", width == 0.0);
}

- (double)expectedLineSpacing
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[144];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  -[_TVGridViewFlowLayout cellMetrics](self, "cellMetrics");
  TVRowMetricsMakeWithCellMetrics((uint64_t)v15, (uint64_t)&v16);
  if (*((double *)&v16 + 1) <= 0.0)
    return NAN;
  v12 = v18;
  v13 = v19;
  v14 = v20;
  v10 = v16;
  v11 = v17;
  objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v2;
  v12 = v18;
  v13 = v19;
  v14 = v20;
  v10 = v16;
  v11 = v17;
  objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  +[TVMLUtilities rowSpacingMetricsForRowMetrics:](TVMLUtilities, "rowSpacingMetricsForRowMetrics:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "tv_rowMetricsValue");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
  }

  v8 = *((double *)&v10 + 1);
  return v8;
}

- (TVCellMetrics)cellMetrics
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  CGSize cellSize;

  v3 = *(_OWORD *)&self[4].cellInsetAlt.bottom;
  *(_OWORD *)&retstr->cellInsetAlt.bottom = *(_OWORD *)&self[4].cellInsetAlt.top;
  *(_OWORD *)&retstr->cellMargin.top = v3;
  *(_OWORD *)&retstr->cellMargin.bottom = *(_OWORD *)&self[4].cellMargin.top;
  v4 = *(_OWORD *)&self[4].cellPadding.bottom;
  *(_OWORD *)&retstr->cellPadding.bottom = *(_OWORD *)&self[4].cellPadding.top;
  *(_OWORD *)&retstr->cellInset.top = v4;
  v5 = *(_OWORD *)&self[4].cellInset.bottom;
  *(_OWORD *)&retstr->cellInset.bottom = *(_OWORD *)&self[4].cellInset.top;
  *(_OWORD *)&retstr->cellInsetAlt.top = v5;
  cellSize = self[4].cellSize;
  retstr->cellSize = *(CGSize *)&self[3].cellMargin.bottom;
  *(CGSize *)&retstr->cellPadding.top = cellSize;
  return self;
}

@end
