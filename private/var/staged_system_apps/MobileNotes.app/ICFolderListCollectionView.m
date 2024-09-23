@implementation ICFolderListCollectionView

- (BOOL)shouldShowMoveHeader
{
  return self->_shouldShowMoveHeader;
}

- (BOOL)shouldShowAllowNotificationsView
{
  return self->_shouldShowAllowNotificationsView;
}

- (void)setShouldShowAllowNotificationsView:(BOOL)a3
{
  id v4;

  if (self->_shouldShowAllowNotificationsView != a3)
  {
    self->_shouldShowAllowNotificationsView = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderListCollectionView createLayout](self, "createLayout"));
    -[ICFolderListCollectionView setCollectionViewLayout:](self, "setCollectionViewLayout:", v4);

  }
}

- (void)setHasGroupInset:(BOOL)a3
{
  self->_hasGroupInset = a3;
}

- (ICFolderListCollectionView)initWithPresentingViewController:(id)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5 viewControllerManager:(id)a6
{
  ICFolderListCollectionView *v6;
  ICFolderListCollectionView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICFolderListCollectionView;
  v6 = -[ICCollectionView initWithPresentingViewController:legacyManagedObjectContext:modernManagedObjectContext:viewControllerManager:](&v9, "initWithPresentingViewController:legacyManagedObjectContext:modernManagedObjectContext:viewControllerManager:", a3, a4, a5, a6);
  v7 = v6;
  if (v6)
  {
    v6->_hasSwipeActions = 1;
    -[ICFolderListCollectionView setDragInteractionEnabled:](v6, "setDragInteractionEnabled:", 1);
    -[ICFolderListCollectionView setSpringLoaded:](v7, "setSpringLoaded:", 1);
  }
  return v7;
}

- (BOOL)hasSwipeActions
{
  return self->_hasSwipeActions;
}

- (BOOL)hasGroupInset
{
  return self->_hasGroupInset;
}

- (id)createLayout
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id location;

  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000B774;
  v13[3] = &unk_100554300;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  v3 = objc_retainBlock(v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[ICFolderListCollectionView shouldShowMoveHeader](self, "shouldShowMoveHeader"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
    +[ICMoveHeaderView absoluteHeight](ICMoveHeaderView, "absoluteHeight");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v5, v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v7, UICollectionElementKindSectionHeader, 1));
    objc_msgSend(v4, "addObject:", v8);
LABEL_5:

    goto LABEL_6;
  }
  if (-[ICFolderListCollectionView shouldShowAllowNotificationsView](self, "shouldShowAllowNotificationsView"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 128.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v5, v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v7, UICollectionElementKindSectionHeader, 1));
    objc_msgSend(v4, "addObject:", v8);
    goto LABEL_5;
  }
LABEL_6:
  v9 = objc_alloc_init((Class)UICollectionViewCompositionalLayoutConfiguration);
  v10 = objc_msgSend(v4, "copy");
  objc_msgSend(v9, "setBoundarySupplementaryItems:", v10);

  v11 = objc_msgSend(objc_alloc((Class)UICollectionViewCompositionalLayout), "initWithSectionProvider:configuration:", v3, v9);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v11;
}

- (void)setShouldShowMoveHeader:(BOOL)a3
{
  id v4;

  if (self->_shouldShowMoveHeader != a3)
  {
    self->_shouldShowMoveHeader = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderListCollectionView createLayout](self, "createLayout"));
    -[ICFolderListCollectionView setCollectionViewLayout:](self, "setCollectionViewLayout:", v4);

  }
}

- (void)deselectAllTagsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderListCollectionView tagContainerCell](self, "tagContainerCell"));
  objc_msgSend(v4, "deselectAllItemsAnimated:", v3);

}

- (void)selectTagsWithTagSelection:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderListCollectionView tagContainerCell](self, "tagContainerCell"));
  objc_msgSend(v7, "selectTagsWithTagSelection:animated:", v6, v4);

}

- (ICTagContainerCell)tagContainerCell
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICTagContainerItemIdentifier sharedItemIdentifier](ICTagContainerItemIdentifier, "sharedItemIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForItemIdentifier:", v4));

  if (v5)
  {
    v6 = objc_opt_class(ICTagContainerCell);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListCollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v5));
    v8 = ICDynamicCast(v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  }
  else
  {
    v9 = 0;
  }

  return (ICTagContainerCell *)v9;
}

- (void)setHasSwipeActions:(BOOL)a3
{
  self->_hasSwipeActions = a3;
}

@end
