@implementation _TVGridViewController

- (void)updateWithViewElement:(id)a3 cellMetrics:(TVCellMetrics *)a4
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[9];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TVGridViewController;
  v4 = *(_OWORD *)&a4->cellMargin.top;
  v8[6] = *(_OWORD *)&a4->cellInsetAlt.bottom;
  v8[7] = v4;
  v8[8] = *(_OWORD *)&a4->cellMargin.bottom;
  v5 = *(_OWORD *)&a4->cellInset.top;
  v8[2] = *(_OWORD *)&a4->cellPadding.bottom;
  v8[3] = v5;
  v6 = *(_OWORD *)&a4->cellInsetAlt.top;
  v8[4] = *(_OWORD *)&a4->cellInset.bottom;
  v8[5] = v6;
  v7 = *(_OWORD *)&a4->cellPadding.top;
  v8[0] = a4->cellSize;
  v8[1] = v7;
  -[_TVMLCollectionViewController updateWithViewElement:cellMetrics:](&v9, sel_updateWithViewElement_cellMetrics_, a3, v8);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVGridViewController;
  -[_TVMLCollectionViewController viewDidLoad](&v4, sel_viewDidLoad);
  if (self->_configureForListTemplate)
  {
    -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCollectionGradientMask:", 1);

  }
}

- (id)makeCollectionViewWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TVMLGridView *v8;
  _TVGridViewFlowLayout *v9;
  _TVMLGridView *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = [_TVMLGridView alloc];
  v9 = objc_alloc_init(_TVGridViewFlowLayout);
  v10 = -[_TVGridView initWithFrame:collectionViewLayout:](v8, "initWithFrame:collectionViewLayout:", v9, x, y, width, height);

  -[_TVMLGridView setConfigureForListTemplate:](v10, "setConfigureForListTemplate:", self->_configureForListTemplate);
  return v10;
}

- (BOOL)contentFlowsVertically
{
  return 1;
}

- (void)updateViewLayoutAnimated:(BOOL)a3 relayout:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;

  v4 = a4;
  -[_TVMLCollectionViewController collectionView](self, "collectionView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVMLCollectionViewController cellMetrics](self, "cellMetrics");
  objc_msgSend(v7, "setCellMetrics:", &v15);
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "valueForStyle:", CFSTR("tv-line-spacing"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "tv_lineSpacing");
    v12 = v11;
  }
  else
  {
    v12 = NAN;
  }

  objc_msgSend(v9, "tv_interitemSpacing");
  v14 = v13;
  objc_msgSend(v7, "expectedLineSpacing");
  objc_msgSend(v7, "setMinimumInteritemSpacing:", v14);
  objc_msgSend(v7, "setMinimumLineSpacing:", v12);
  if (v4)
    objc_msgSend(v7, "invalidateLayout");

}

- (BOOL)shouldHeaderFloatByDefault
{
  return !self->_configureForListTemplate;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v6 = a5;
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "prototypeForItemAtIndex:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMLCollectionViewController expectedCellSizeForElement:atIndexPath:](self, "expectedCellSizeForElement:atIndexPath:", v10, v6);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  v7 = a4;
  v9 = *MEMORY[0x24BDF7718];
  v8 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v10 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v11 = *(double *)(MEMORY[0x24BDF7718] + 24);
  if (a5 >= 1)
  {
    -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      objc_msgSend(v7, "minimumLineSpacing");
      v9 = v17;
    }
  }

  v18 = v9;
  v19 = v8;
  v20 = v10;
  v21 = v11;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

@end
