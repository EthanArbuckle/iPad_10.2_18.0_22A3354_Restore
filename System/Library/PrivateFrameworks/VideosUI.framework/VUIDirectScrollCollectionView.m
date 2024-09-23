@implementation VUIDirectScrollCollectionView

- (VUIDirectScrollCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  VUIDirectScrollCollectionView *v4;
  VUIDirectScrollCollectionView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VUIDirectScrollCollectionView;
  v4 = -[VUIDirectScrollCollectionView initWithFrame:collectionViewLayout:](&v13, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[VUIDirectScrollCollectionView panGestureRecognizer](v4, "panGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowedTouchTypes:", v9);

    -[VUIDirectScrollCollectionView setBounces:](v5, "setBounces:", 1);
    -[VUIDirectScrollCollectionView setShowsVerticalScrollIndicator:](v5, "setShowsVerticalScrollIndicator:", 0);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC42E8]), "initWithTarget:action:", v5, sel__downArrowAction_);
    objc_msgSend(v10, "setAllowedPressTypes:", &unk_1EA0BB8B0);
    -[VUIDirectScrollCollectionView addGestureRecognizer:](v5, "addGestureRecognizer:", v10);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC42E8]), "initWithTarget:action:", v5, sel__upArrowAction_);
    objc_msgSend(v11, "setAllowedPressTypes:", &unk_1EA0BB8C8);
    -[VUIDirectScrollCollectionView addGestureRecognizer:](v5, "addGestureRecognizer:", v11);

  }
  return v5;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)_downArrowAction:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  CGRect v15;

  v14 = a3;
  if (objc_msgSend(v14, "state") == 1 || objc_msgSend(v14, "state") == 2)
  {
    -[VUIDirectScrollCollectionView contentOffset](self, "contentOffset");
    v5 = v4;
    v7 = v6;
    -[VUIDirectScrollCollectionView contentSize](self, "contentSize");
    v9 = v8;
    -[VUIDirectScrollCollectionView bounds](self, "bounds");
    v10 = v9 - CGRectGetHeight(v15);
    -[VUIDirectScrollCollectionView _tapScrollDelta](self, "_tapScrollDelta");
    v12 = v7 + v11;
    if (v10 >= v12)
      v13 = v12;
    else
      v13 = v10;
    -[VUIDirectScrollCollectionView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v5, v13);
  }

}

- (void)_upArrowAction:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "state") == 1 || objc_msgSend(v9, "state") == 2)
  {
    -[VUIDirectScrollCollectionView contentOffset](self, "contentOffset");
    v5 = v4;
    v7 = v6;
    -[VUIDirectScrollCollectionView _tapScrollDelta](self, "_tapScrollDelta");
    -[VUIDirectScrollCollectionView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v5, fmax(v7 - v8, 0.0));
  }

}

- (double)_tapScrollDelta
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[VUIDirectScrollCollectionView collectionViewLayout](self, "collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemSize");
  v4 = v3;
  objc_msgSend(v2, "minimumLineSpacing");
  v6 = fmax(v4 + v5, 150.0);

  return v6;
}

@end
