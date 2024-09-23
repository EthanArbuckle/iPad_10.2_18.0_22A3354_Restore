@implementation VideosExtrasCarouselViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataSource:", 0);
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "setCarouselCollectionViewDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasCarouselViewController;
  -[VideosExtrasCarouselViewController dealloc](&v4, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VideosExtrasCarouselViewController;
  -[VideosExtrasCarouselViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deselectItemAtIndexPath:animated:", v6, 1);

  }
  -[VideosExtrasCarouselViewController _ensureScrollViewSnaps](self, "_ensureScrollViewSnaps");

}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)VideosExtrasCarouselViewController;
  -[VideosExtrasCarouselViewController viewDidLoad](&v25, sel_viewDidLoad);
  -[VideosExtrasCarouselViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VideosExtrasCarouselViewController _loadCarouselCollectionViewInView:withContraintsAccumulator:](self, "_loadCarouselCollectionViewInView:withContraintsAccumulator:", v3, v4);
  objc_msgSend(v3, "addConstraints:", v4);
  if (-[VideosExtrasCarouselViewController _isPhone](self, "_isPhone"))
  {
    -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");
    -[VideosExtrasCarouselViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "carouselSize");

    -[VideosExtrasCarouselViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeAreaInsets");
    v11 = v10;
    -[VideosExtrasCarouselViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeAreaInsets");
    v15 = v14;

    v16 = v11 + v15;
    switch(v7)
    {
      case 0:
      case 1:
        if (v16 == 0.0)
          v17 = 30.0;
        else
          v17 = v11 + v15;
        *(double *)&v18 = 52.0;
        goto LABEL_13;
      case 2:
        if (v16 == 0.0)
          v17 = 30.0;
        else
          v17 = v11 + v15;
        *(double *)&v18 = 62.0;
LABEL_13:
        v19 = *(double *)&v18;
        break;
      case 3:
        if (v16 == 0.0)
          v17 = 30.0;
        else
          v17 = v11 + v15;
        v19 = 51.0;
        break;
      default:
        v17 = *MEMORY[0x1E0C9D820];
        v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        break;
    }
    objc_msgSend(v5, "bounds", v16);
    v21 = v20;
    objc_msgSend(v5, "bounds");
    v23 = v22;
    -[VideosExtrasCarouselViewController carouselCollectionViewLayout](self, "carouselCollectionViewLayout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v24, "setItemSize:", v21 - v17, v23 - v19);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v24, "setMinimumInteritemSpacing:", 0.0);
    objc_msgSend(v24, "invalidateLayout");

  }
  else
  {
    -[VideosExtrasCarouselViewController _updateOpacityOfTextInVisibleCells](self, "_updateOpacityOfTextInVisibleCells");
    -[VideosExtrasCarouselViewController _updateWindowSizeForVisibleCells](self, "_updateWindowSizeForVisibleCells");
  }

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  CGSize result;

  v8 = a4;
  objc_msgSend(a3, "cellForItemAtIndexPath:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || !-[VideosExtrasCarouselViewController _isPhone](self, "_isPhone"))
    goto LABEL_7;
  objc_msgSend(v9, "titleText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
    goto LABEL_6;
  objc_msgSend(v9, "subtitleText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(v9, "descriptionText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (!v19)
  {
    objc_msgSend(v9, "thumbnailMaxSize");
    goto LABEL_8;
  }
LABEL_7:
  objc_msgSend(v8, "itemSize");
LABEL_8:
  v14 = v12;
  v15 = v13;

  v16 = v14;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "item");
  objc_msgSend(v7, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;

  if (-[VideosExtrasCarouselViewController _isPhone](self, "_isPhone"))
  {
    v14 = *MEMORY[0x1E0C9D820];
    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("_VideosExtrasLockupCollectionViewCellReuseIdentifier"), v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setItemIndex:", v8);
    objc_msgSend(v16, "setZoomingImageTransitionIdentifier:", CFSTR("VideosExtrasCarouselZoomingImageTransitionIdentifier"));
  }
  else
  {
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("_VideosExtrasCarouselCollectionViewCellReuseIdentifier"), v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setWindowSize:", v11, v13);
    objc_msgSend(v16, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAlpha:", 0.0);

    objc_msgSend(v16, "descriptionLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAlpha:", 0.0);

    objc_msgSend(v16, "setItemIndex:", v8);
    objc_msgSend(v16, "setZoomingImageTransitionIdentifier:", CFSTR("VideosExtrasCarouselZoomingImageTransitionIdentifier"));
    -[VideosExtrasCarouselViewController carouselCollectionViewLayout](self, "carouselCollectionViewLayout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "itemWidth");
    v14 = v20;
    objc_msgSend(v16, "thumbnailImageContainerHeight");
    v15 = v21;

  }
  -[VideosExtrasCarouselViewController dataSource](self, "dataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "carouselViewController:configureCarouselCollectionViewCell:forItemAtIndex:withThumbnailImageContainerSize:", self, v16, v8, v14, v15);

  return v16;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[VideosExtrasCarouselViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "carouselViewController:didHighlightItemAtIndex:", self, objc_msgSend(v6, "item"));

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[VideosExtrasCarouselViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "item");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__VideosExtrasCarouselViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    v10[3] = &unk_1E9F9A240;
    v11 = v6;
    v12 = v7;
    objc_msgSend(v8, "carouselViewController:didSelectItemAtIndex:completionHandler:", self, v9, v10);

  }
}

uint64_t __78__VideosExtrasCarouselViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "deselectItemAtIndexPath:animated:", *(_QWORD *)(result + 40), 1);
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  objc_msgSend(a4, "updateConstraintsIfNeeded", a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  if (!-[VideosExtrasCarouselViewController _isPhone](self, "_isPhone", a3))
    -[VideosExtrasCarouselViewController _updateOpacityOfTextInVisibleCells](self, "_updateOpacityOfTextInVisibleCells");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double MidY;
  CGRect v17;

  y = a4.y;
  x = a4.x;
  if (-[VideosExtrasCarouselViewController _isPhone](self, "_isPhone", a3))
  {
    -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_effectiveContentInset");
    v11 = v10;

    v12 = v11 + a5->x;
    -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v12;
    MidY = CGRectGetMidY(v17);

    -[VideosExtrasCarouselViewController _findSnappingItemFromContentOffset:withVelocity:](self, "_findSnappingItemFromContentOffset:withVelocity:", &v15, x, y);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      -[VideosExtrasCarouselViewController _snapTargetContentOffset:toItemIndexPath:atItemOffset:](self, "_snapTargetContentOffset:toItemIndexPath:atItemOffset:", a5, v14, v15, MidY);

  }
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasCarouselViewController;
  -[VideosExtrasCarouselViewController didMoveToParentViewController:](&v4, sel_didMoveToParentViewController_, a3);
  -[VideosExtrasCarouselViewController _ensureScrollViewSnaps](self, "_ensureScrollViewSnaps");
}

- (void)_ensureScrollViewSnaps
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double MidY;
  double v17;
  double v18;
  CGRect v19;

  if (-[VideosExtrasCarouselViewController _isPhone](self, "_isPhone"))
  {
    -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_effectiveContentInset");
    v5 = v4;

    -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentOffset");
    v8 = v7;
    v17 = v7;
    v18 = v9;

    -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v15 = v5 + v8;
    MidY = CGRectGetMidY(v19);

    -[VideosExtrasCarouselViewController _findSnappingItemFromContentOffset:withVelocity:](self, "_findSnappingItemFromContentOffset:withVelocity:", &v15, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[VideosExtrasCarouselViewController _snapTargetContentOffset:toItemIndexPath:atItemOffset:](self, "_snapTargetContentOffset:toItemIndexPath:atItemOffset:", &v17, v11, v15, MidY);
      v12 = v17;
      v13 = v18;
      -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setContentOffset:", v12, v13);

    }
  }
}

- (id)_findSnappingItemFromContentOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4
{
  double x;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;

  x = a4.x;
  -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView", a4.x, a4.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentSize");
  v9 = v8;
  -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v9 - v11;

  if (v12 > 0.0 && a3->x >= v12)
  {
    v14 = 0;
    v24 = 1;
  }
  else
  {
    -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexPathForItemAtPoint:", a3->x, a3->y);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[VideosExtrasCarouselViewController carouselCollectionViewLayout](self, "carouselCollectionViewLayout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "minimumInteritemSpacing");
      v17 = v16;

      v18 = 10.0;
      if (v17 != 0.0)
        v18 = v17;
      if (x <= 0.0)
        v18 = -v18;
      a3->x = a3->x + v18;
      -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "indexPathForItemAtPoint:", a3->x, a3->y);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        -[VideosExtrasCarouselViewController carouselCollectionViewLayout](self, "carouselCollectionViewLayout");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "minimumLineSpacing");
        v22 = v21;

        a3->y = a3->y - v22;
        -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "indexPathForItemAtPoint:", a3->x, a3->y);
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v24 = 0;
  }
  -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "numberOfSections");

  if (!v14)
  {
    v27 = v26 - 1;
    if (v26 >= 1)
    {
      v28 = 0;
      do
      {
        -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "numberOfItemsInSection:", v28);

        if (v30 < 1)
        {
          v31 = 0;
          ++v28;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v28);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      while (v28 < v26 && !v31);
      do
      {
        -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "numberOfItemsInSection:", v27);

        if (v33 < 1)
        {
          v34 = 0;
          if (--v27 < 0)
            break;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v33 - 1, v27);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27 < 0)
            break;
        }
      }
      while (!v34);
      if (v24)
        v35 = v34;
      else
        v35 = v31;
      v14 = v35;

    }
  }
  return v14;
}

- (void)_snapTargetContentOffset:(CGPoint *)a3 toItemIndexPath:(id)a4 atItemOffset:(CGPoint)a5
{
  double x;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  id v35;

  x = a5.x;
  v35 = a4;
  -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;

  -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentSize");
  v13 = v12;

  -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_effectiveContentInset");
  v16 = v15;
  v18 = v17;

  v19 = v10 - v18 - v16;
  -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutAttributesForItemAtIndexPath:", v35);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "frame");
  v26 = v22;
  if (v22 >= v13 - v19)
  {
    if (v13 >= v19)
    {
      v34 = v13 - v10 + v18;
      goto LABEL_8;
    }
  }
  else if (CGRectGetMidX(*(CGRect *)&v22) < x)
  {
    -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "numberOfItemsInSection:", objc_msgSend(v35, "section")) - 1;
    v29 = objc_msgSend(v35, "item");

    if (v28 > v29)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v35, "item") + 1, objc_msgSend(v35, "section"));
      v30 = objc_claimAutoreleasedReturnValue();

      -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "layoutAttributesForItemAtIndexPath:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "frame");
      v26 = v33;
      v21 = v32;
      v35 = (id)v30;
    }
  }
  v34 = v26 - v16;
LABEL_8:
  a3->x = v34;

}

- (void)subviewsDidChangeForCarouselCollectionView:(id)a3
{
  if (!-[VideosExtrasCarouselViewController _isPhone](self, "_isPhone", a3))
    -[VideosExtrasCarouselViewController _updateOpacityOfTextInVisibleCells](self, "_updateOpacityOfTextInVisibleCells");
}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "appearState");
  v5 = objc_msgSend(v11, "itemIndex");
  if (!v4)
  {
    -[VideosExtrasCarouselViewController setIndexOfVisibleItem:](self, "setIndexOfVisibleItem:", v5);
    -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutIfNeeded");

    -[VideosExtrasCarouselViewController _updateOpacityOfTextInVisibleCells](self, "_updateOpacityOfTextInVisibleCells");
    -[VideosExtrasCarouselViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.0);

    -[VideosExtrasCarouselViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isNavigationBarHidden"))
    {
      -[VideosExtrasCarouselViewController setRevealingNavigationBarDuringTransition:](self, "setRevealingNavigationBarDuringTransition:", 1);
      objc_msgSend(v8, "setNavigationBarHidden:animated:", 0, 1);
      objc_msgSend(v8, "navigationBar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAlpha:", 0.0);

    }
  }
  -[VideosExtrasCarouselViewController carouselCollectionViewCellForItemAtIndex:](self, "carouselCollectionViewCellForItemAtIndex:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "prepareZoomingImageTransitionWithContext:", v11);

}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "appearState");
  if (!v5)
  {
    if (-[VideosExtrasCarouselViewController isRevealingNavigationBarDuringTransition](self, "isRevealingNavigationBarDuringTransition"))
    {
      -[VideosExtrasCarouselViewController navigationController](self, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "navigationBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlpha:", 1.0);

    }
    -[VideosExtrasCarouselViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1.0;
    goto LABEL_7;
  }
  if (v5 == 1)
  {
    -[VideosExtrasCarouselViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0.0;
LABEL_7:
    objc_msgSend(v6, "setAlpha:", v8);

  }
  -[VideosExtrasCarouselViewController carouselCollectionViewCellForItemAtIndex:](self, "carouselCollectionViewCellForItemAtIndex:", objc_msgSend(v4, "itemIndex"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performZoomingImageTransitionWithContext:", v4);

}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  -[VideosExtrasCarouselViewController carouselCollectionViewCellForItemAtIndex:](self, "carouselCollectionViewCellForItemAtIndex:", objc_msgSend(v6, "itemIndex"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "finalizeZoomingImageTransitionWithContext:transitionFinished:", v6, v4);
  v7 = objc_msgSend(v6, "appearState");

  if (v7 == 1)
  {
    -[VideosExtrasCarouselViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 1.0);

  }
  -[VideosExtrasCarouselViewController setRevealingNavigationBarDuringTransition:](self, "setRevealingNavigationBarDuringTransition:", 0);

}

- (unint64_t)indexOfVisibleItem
{
  void *v2;
  unint64_t v3;

  -[VideosExtrasCarouselViewController carouselCollectionViewLayout](self, "carouselCollectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfVisibleItem");

  return v3;
}

- (void)setIndexOfVisibleItem:(unint64_t)a3
{
  -[VideosExtrasCarouselViewController setIndexOfVisibleItem:animated:](self, "setIndexOfVisibleItem:animated:", a3, 0);
}

- (void)setIndexOfVisibleItem:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;

  v4 = a4;
  -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  -[VideosExtrasCarouselViewController carouselCollectionViewLayout](self, "carouselCollectionViewLayout");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIndexOfVisibleItem:animated:", a3, v4);

}

- (id)carouselCollectionViewCellForItemAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_loadCarouselCollectionViewInView:(id)a3 withContraintsAccumulator:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  VideosExtrasCarouselCollectionViewFlowLayout *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  VideosExtrasCarouselCollectionView *v22;
  VideosExtrasCarouselCollectionView *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  id v38;

  v38 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0DC49E8];
  v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v9 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (-[VideosExtrasCarouselViewController _isPhone](self, "_isPhone"))
  {
    v11 = objc_alloc_init(VideosExtrasCarouselCollectionViewFlowLayout);
    -[UICollectionViewFlowLayout setScrollDirection:](v11, "setScrollDirection:", 1);
    -[VideosExtrasCarouselViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeAreaInsets");
    v15 = v14;

    -[VideosExtrasCarouselViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safeAreaInsets");
    v19 = v18;

    if (v15 == 0.0)
      v20 = 15.0;
    else
      v20 = v15;
    if (v19 == 0.0)
      v21 = 15.0;
    else
      v21 = v19;
  }
  else
  {
    v11 = objc_alloc_init(VideosExtrasCarouselCollectionViewLayout);
    v21 = v10;
    v20 = v8;
  }
  -[VideosExtrasCarouselViewController setCarouselCollectionViewLayout:](self, "setCarouselCollectionViewLayout:", v11);
  v22 = [VideosExtrasCarouselCollectionView alloc];
  v23 = -[VideosExtrasCarouselCollectionView initWithFrame:collectionViewLayout:](v22, "initWithFrame:collectionViewLayout:", v11, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[VideosExtrasCarouselCollectionView setContentInset:](v23, "setContentInset:", v7, v20, v9, v21);
  -[VideosExtrasCarouselCollectionView setShowsHorizontalScrollIndicator:](v23, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasCarouselCollectionView setBackgroundColor:](v23, "setBackgroundColor:", v24);

  -[VideosExtrasCarouselCollectionView registerClass:forCellWithReuseIdentifier:](v23, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("_VideosExtrasCarouselCollectionViewCellReuseIdentifier"));
  -[VideosExtrasCarouselCollectionView registerClass:forCellWithReuseIdentifier:](v23, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("_VideosExtrasLockupCollectionViewCellReuseIdentifier"));
  -[VideosExtrasCarouselCollectionView setDataSource:](v23, "setDataSource:", self);
  -[VideosExtrasCarouselCollectionView setDelegate:](v23, "setDelegate:", self);
  -[VideosExtrasCarouselCollectionView setCarouselCollectionViewDelegate:](v23, "setCarouselCollectionViewDelegate:", self);
  -[VideosExtrasCarouselCollectionView setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VideosExtrasCarouselCollectionView _setContentInsetAdjustmentBehavior:](v23, "_setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(v38, "addSubview:", v23);
  v25 = 0.0;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 3, 0, v38, 3, 1.0, 0.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v26);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v23, v38, 10, v7, v8, v9, v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v27);

  -[VideosExtrasCarouselViewController navigationController](self, "navigationController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_opt_respondsToSelector();

  if ((v29 & 1) != 0)
  {
    -[VideosExtrasCarouselViewController navigationController](self, "navigationController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "mainTemplateViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "menuBarView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bounds");
    v25 = v33;

    v34 = (void *)MEMORY[0x1E0CB3718];
    if (v25 > 0.0)
    {
      v35 = 0;
      v36 = v38;
      goto LABEL_14;
    }
  }
  else
  {
    v34 = (void *)MEMORY[0x1E0CB3718];
  }
  -[VideosExtrasCarouselViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "safeAreaLayoutGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 1;
LABEL_14:
  objc_msgSend(v34, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 4, 0, v36, 4, 1.0, -v25);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v37);

  if (v35)
  {

  }
  -[VideosExtrasCarouselViewController setCarouselCollectionView:](self, "setCarouselCollectionView:", v23);

}

- (int64_t)_numberOfItems
{
  void *v3;
  int64_t v4;

  -[VideosExtrasCarouselViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInCarouselViewController:", self);

  return v4;
}

- (void)_updateOpacityOfTextInVisibleCells
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGRect v28;

  v27 = *MEMORY[0x1E0C80C00];
  if (!-[VideosExtrasCarouselViewController _isPhone](self, "_isPhone"))
  {
    -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "center");
    v6 = v5;
    -[VideosExtrasCarouselViewController carouselCollectionViewLayout](self, "carouselCollectionViewLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemWidth");
    v9 = v8;

    objc_msgSend(v3, "visibleCells");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v15, "bounds");
          objc_msgSend(v15, "convertRect:toView:", v4);
          v16 = vabdd_f64(CGRectGetMidX(v28), v6);
          v17 = 1.0;
          if (v16 >= v9 * 0.5)
          {
            v17 = 0.0;
            if (v16 <= v9)
            {
              MPULayoutLinearRelationMake();
              MPULayoutLinearRelationEvaluate();
              v17 = v18;
            }
          }
          objc_msgSend(v15, "titleLabel");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setAlpha:", v17);

          objc_msgSend(v15, "subtitleLabel");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setAlpha:", v17);

          objc_msgSend(v15, "descriptionLabel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setAlpha:", v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

  }
}

- (void)_updateWindowSizeForVisibleCells
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[VideosExtrasCarouselViewController carouselCollectionView](self, "carouselCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  objc_msgSend(v2, "visibleCells");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setWindowSize:", v5, v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (BOOL)_isPhone
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

- (VideosExtrasCarouselViewControllerDataSource)dataSource
{
  return (VideosExtrasCarouselViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (VideosExtrasCarouselViewControllerDelegate)delegate
{
  return (VideosExtrasCarouselViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VideosExtrasCarouselCollectionView)carouselCollectionView
{
  return self->_carouselCollectionView;
}

- (void)setCarouselCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_carouselCollectionView, a3);
}

- (VideosExtrasCarouselCollectionViewLayout)carouselCollectionViewLayout
{
  return self->_carouselCollectionViewLayout;
}

- (void)setCarouselCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_carouselCollectionViewLayout, a3);
}

- (BOOL)isRevealingNavigationBarDuringTransition
{
  return self->_revealingNavigationBarDuringTransition;
}

- (void)setRevealingNavigationBarDuringTransition:(BOOL)a3
{
  self->_revealingNavigationBarDuringTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carouselCollectionViewLayout, 0);
  objc_storeStrong((id *)&self->_carouselCollectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
