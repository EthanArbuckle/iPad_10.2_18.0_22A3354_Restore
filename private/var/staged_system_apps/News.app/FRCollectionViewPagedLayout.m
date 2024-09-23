@implementation FRCollectionViewPagedLayout

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -CGRectGetWidth(a3);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v25 = CGRectInset(v24, v8, 0.0);
  v22.receiver = self;
  v22.super_class = (Class)FRCollectionViewPagedLayout;
  v9 = -[FRCollectionViewFeedPickerLayout layoutAttributesForElementsInRect:](&v22, "layoutAttributesForElementsInRect:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:copyItems:", v10, 1);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = -[FRCollectionViewPagedLayout adjustLayoutAttributeForPageOffset:](self, "adjustLayoutAttributeForPageOffset:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v15), (_QWORD)v18);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v13);
  }

  return v11;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FRCollectionViewPagedLayout;
  v4 = -[FRCollectionViewFeedPickerLayout layoutAttributesForItemAtIndexPath:](&v9, "layoutAttributesForItemAtIndexPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "copy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewPagedLayout adjustLayoutAttributeForPageOffset:](self, "adjustLayoutAttributeForPageOffset:", v6));
  return v7;
}

- (CGSize)collectionViewContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  unint64_t v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGSize result;

  v24.receiver = self;
  v24.super_class = (Class)FRCollectionViewPagedLayout;
  -[FRCollectionViewPagedLayout collectionViewContentSize](&v24, "collectionViewContentSize");
  v4 = v3;
  v6 = v5;
  -[FRCollectionViewPagedLayout pageSize](self, "pageSize");
  if (v7 > 0.0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewPagedLayout collectionView](self, "collectionView"));
    v9 = (double)(uint64_t)objc_msgSend(v8, "numberOfItemsInSection:", 0);
    -[FRCollectionViewPagedLayout pageSize](self, "pageSize");
    v11 = v10;
    -[FRCollectionViewPagedLayout pageSize](self, "pageSize");
    v13 = v9 / (v11 * v12);
    v14 = vcvtps_u32_f32(v13);

    v15 = -[FRCollectionViewPagedLayout scrollDirection](self, "scrollDirection");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewPagedLayout collectionView](self, "collectionView"));
    objc_msgSend(v16, "bounds");
    v19 = (double)v14;
    if (v15 == (id)1)
    {
      v20 = v17;
      -[FRCollectionViewPagedLayout pageSpacing](self, "pageSpacing");
      v4 = v21 * (double)(v14 - 1) + v20 * v19;
    }
    else
    {
      v6 = v18 * v19;
    }

  }
  v22 = v4;
  v23 = v6;
  result.height = v23;
  result.width = v22;
  return result;
}

- (id)adjustLayoutAttributeForPageOffset:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;

  v4 = a3;
  -[FRCollectionViewPagedLayout pageSize](self, "pageSize");
  if (v5 > 0.0)
  {
    -[FRCollectionViewPagedLayout pageSize](self, "pageSize");
    v7 = v6;
    -[FRCollectionViewPagedLayout pageSize](self, "pageSize");
    v9 = (unint64_t)(v7 * v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPath"));
    v11 = (unint64_t)objc_msgSend(v10, "item") / v9;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPath"));
    v13 = (unint64_t)objc_msgSend(v12, "item");

    if (-[FRCollectionViewPagedLayout scrollDirection](self, "scrollDirection") == (id)1)
    {
      v14 = v13 % v9;
      -[FRCollectionViewPagedLayout pageSize](self, "pageSize");
      v16 = v15;
      v17 = (unint64_t)v15;
      v18 = v14 / (unint64_t)v15;
      v19 = v14 % (unint64_t)v15;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewPagedLayout collectionView](self, "collectionView"));
      objc_msgSend(v20, "bounds");
      v22 = v21;
      -[FRCollectionViewPagedLayout sectionInset](self, "sectionInset");
      v24 = v22 - v23;
      -[FRCollectionViewPagedLayout sectionInset](self, "sectionInset");
      v26 = v24 - v25;
      -[FRCollectionViewPagedLayout itemSize](self, "itemSize");
      v28 = v26 - v27 * (double)(unint64_t)v16;

      if (v17 >= 2)
        v29 = v28 / (double)(v17 - 1);
      else
        v29 = v28;
      +[FRMacros deviceScreenScaleFromPotentialBackgroundThread](FRMacros, "deviceScreenScaleFromPotentialBackgroundThread");
      v31 = v30;
      -[FRCollectionViewPagedLayout sectionInset](self, "sectionInset");
      v33 = v32;
      -[FRCollectionViewPagedLayout itemSize](self, "itemSize");
      v35 = v33 + (double)v19 * (v29 + v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewPagedLayout collectionView](self, "collectionView"));
      objc_msgSend(v36, "bounds");
      v38 = v35 + (double)v11 * v37;
      -[FRCollectionViewPagedLayout pageSpacing](self, "pageSpacing");
      v40 = v38 + (double)v11 * v39;

      -[FRCollectionViewPagedLayout sectionInset](self, "sectionInset");
      v42 = v41;
      -[FRCollectionViewPagedLayout itemSize](self, "itemSize");
      v44 = v43;
      -[FRCollectionViewPagedLayout minimumLineSpacing](self, "minimumLineSpacing");
      v46 = v42 + (double)v18 * (v44 + v45);
      -[FRCollectionViewPagedLayout itemSize](self, "itemSize");
      v48 = v47;
      -[FRCollectionViewPagedLayout itemSize](self, "itemSize");
      objc_msgSend(v4, "setFrame:", round(v31 * v40) / v31, round(v31 * v46) / v31, round(v31 * v48) / v31, round(v31 * v49) / v31);
    }
    else
    {
      objc_msgSend(v4, "center");
      v51 = v50;
      objc_msgSend(v4, "center");
      v53 = v52;
      -[FRCollectionViewPagedLayout pageOffset](self, "pageOffset");
      objc_msgSend(v4, "setCenter:", v51, v53 + v54 * (double)v11);
    }
  }
  return v4;
}

- (CGSize)pageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pageSize.width;
  height = self->_pageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPageSize:(CGSize)a3
{
  self->_pageSize = a3;
}

- (double)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(double)a3
{
  self->_pageOffset = a3;
}

- (double)pageSpacing
{
  return self->_pageSpacing;
}

- (void)setPageSpacing:(double)a3
{
  self->_pageSpacing = a3;
}

@end
