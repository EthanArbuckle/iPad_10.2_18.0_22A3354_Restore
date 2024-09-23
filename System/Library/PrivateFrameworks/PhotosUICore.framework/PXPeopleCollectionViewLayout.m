@implementation PXPeopleCollectionViewLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat Width;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat y;
  CGPoint result;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  y = a3.y;
  x = a3.x;
  -[UICollectionViewFlowLayout minimumLineSpacing](self, "minimumLineSpacing", a3.x, a3.y, a4.x, a4.y);
  v7 = v6;
  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  v9 = v7 + v8;
  if (x - (double)(unint64_t)(x / (v7 + v8)) * (v7 + v8) <= v8 * 0.5)
    v10 = (unint64_t)(x / (v7 + v8));
  else
    v10 = (unint64_t)(x / (v7 + v8)) + 1;
  -[PXPeopleCollectionViewLayout collectionView](self, "collectionView", v8 * 0.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v11, "contentSize");
  v21 = v20;
  v30.origin.x = v13;
  v30.origin.y = v15;
  v30.size.width = v17;
  v30.size.height = v19;
  Width = CGRectGetWidth(v30);
  v31.origin.x = v13;
  v31.origin.y = v15;
  v31.size.width = v17;
  v31.size.height = v19;
  v32.size.height = CGRectGetHeight(v31);
  v32.origin.y = 0.0;
  v32.origin.x = x;
  v32.size.width = Width;
  v23 = CGRectGetMaxX(v32) - v21;
  if (v23 < 0.0)
    v23 = -v23;
  if (v23 >= v27)
  {
    v24 = v9 * (double)v10;
  }
  else
  {
    v33.origin.x = v13;
    v33.origin.y = v15;
    v33.size.width = v17;
    v33.size.height = v19;
    v24 = v21 - CGRectGetWidth(v33);
    v10 = -1;
  }
  -[PXPeopleCollectionViewLayout setFirstVisibleCellIndex:](self, "setFirstVisibleCellIndex:", v10);

  v25 = v24;
  v26 = y;
  result.y = v26;
  result.x = v25;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  CGFloat y;
  double v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;
  CGRect v24;

  y = a3.y;
  v5 = (double)-[PXPeopleCollectionViewLayout firstVisibleCellIndex](self, "firstVisibleCellIndex", a3.x);
  if (v5 == 1.84467441e19)
  {
    -[PXPeopleCollectionViewLayout collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[UICollectionViewFlowLayout collectionViewContentSize](self, "collectionViewContentSize");
    v16 = v15;
    v24.origin.x = v8;
    v24.origin.y = v10;
    v24.size.width = v12;
    v24.size.height = v14;
    v17 = v16 - CGRectGetWidth(v24);

  }
  else
  {
    -[UICollectionViewFlowLayout itemSize](self, "itemSize");
    v19 = v18;
    -[UICollectionViewFlowLayout minimumLineSpacing](self, "minimumLineSpacing");
    v17 = (v20 + v19) * v5;
  }
  v21 = v17;
  v22 = y;
  result.y = v22;
  result.x = v21;
  return result;
}

- (unint64_t)firstVisibleCellIndex
{
  return self->_firstVisibleCellIndex;
}

- (void)setFirstVisibleCellIndex:(unint64_t)a3
{
  self->_firstVisibleCellIndex = a3;
}

@end
