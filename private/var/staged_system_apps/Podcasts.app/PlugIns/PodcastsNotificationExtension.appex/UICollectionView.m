@implementation UICollectionView

- (id)sectionHeaderIndexPathForItemIndexPath:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, objc_msgSend(a3, "section")));
  else
    return 0;
}

- (id)sectionHeaderViewForIndexPath:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[UICollectionView supplementaryViewForElementKind:atIndexPath:](self, "supplementaryViewForElementKind:atIndexPath:", UICollectionElementKindSectionHeader, a3));
  else
    return 0;
}

- (id)sectionHeaderViewForItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView sectionHeaderIndexPathForItemIndexPath:](self, "sectionHeaderIndexPathForItemIndexPath:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView sectionHeaderViewForIndexPath:](self, "sectionHeaderViewForIndexPath:", v4));

  return v5;
}

- (void)mt_registerCellClass:(Class)a3
{
  NSString *v5;
  id v6;

  v5 = NSStringFromClass(a3);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self, "registerClass:forCellWithReuseIdentifier:", a3, v6);

}

- (void)mt_registerSupplementaryViewClass:(Class)a3 forSupplementaryViewOfKind:(id)a4
{
  id v6;
  NSString *v7;
  id v8;

  v6 = a4;
  v7 = NSStringFromClass(a3);
  v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](self, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", a3, v6, v8);

}

- (id)mt_dequeueReusableCellClass:(Class)a3 forIndexPath:(id)a4
{
  id v6;
  NSString *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = NSStringFromClass(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](self, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6));

  return v9;
}

- (id)mt_dequeueReusableSupplementaryViewClass:(Class)a3 supplementaryViewKind:(id)a4 forIndexPath:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = NSStringFromClass(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:](self, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v11, v8));

  return v12;
}

@end
