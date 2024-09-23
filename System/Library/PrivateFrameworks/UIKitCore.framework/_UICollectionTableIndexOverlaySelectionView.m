@implementation _UICollectionTableIndexOverlaySelectionView

- (_UICollectionTableIndexOverlaySelectionView)initWithHost:(id)a3
{
  id v4;
  _UICollectionTableIndexOverlaySelectionView *v5;
  _UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout *v6;
  _UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout *flowLayout;
  UICollectionView *v8;
  uint64_t v9;
  UICollectionView *collectionView;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UICollectionTableIndexOverlaySelectionView;
  v5 = -[UIView init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout);
    flowLayout = v5->_flowLayout;
    v5->_flowLayout = v6;

    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v5->_flowLayout, "setMinimumLineSpacing:", 0.0);
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v5->_flowLayout, "setMinimumInteritemSpacing:", 0.0);
    v8 = [UICollectionView alloc];
    v9 = -[UICollectionView initWithFrame:collectionViewLayout:](v8, "initWithFrame:collectionViewLayout:", v5->_flowLayout, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    collectionView = v5->_collectionView;
    v5->_collectionView = (UICollectionView *)v9;

    -[UICollectionView setDelegate:](v5->_collectionView, "setDelegate:", v5);
    -[UICollectionView setDataSource:](v5->_collectionView, "setDataSource:", v5);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v5->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("IndexOverlayCell"));
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v5->_collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("ExternalDoneKind"), CFSTR("ExternalDoneReuse"));
    -[UICollectionView setBackgroundColor:](v5->_collectionView, "setBackgroundColor:", 0);
    -[UIView addSubview:](v5, "addSubview:", v5->_collectionView);
    +[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v11);

    objc_storeWeak((id *)&v5->_host, v4);
  }

  return v5;
}

- (void)layoutSubviews
{
  UICollectionView *collectionView;
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
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _BOOL4 v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  _UICollectionTableIndexOverlaySelectionViewCollectionViewCell *v35;

  collectionView = self->_collectionView;
  -[UIView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  -[UICollectionView setFrame:](collectionView, "setFrame:", v5 + v15, v7 + v12, v9 - (v15 + v13), v11 - (v12 + v14));
  -[UIView bounds](self->_collectionView, "bounds");
  v17 = v16;
  v18 = -[_UICollectionTableIndexOverlaySelectionView collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", self->_collectionView, 0);
  v19 = v18;
  v20 = 3.0;
  v21 = 3.0;
  if (v18 >= 9)
  {
    v22 = (double)(v18 + 1);
    v23 = 2.5;
    v24 = 3.0;
    do
    {
      v24 = v24 + 1.0;
      v20 = ceil(v24);
      if (v21 * v20 < v22)
        v23 = v23 + 0.833333333;
      v21 = ceil(v23);
    }
    while (v20 * v21 < v22);
  }
  UIFloorToViewScale(self);
  v26 = v25;
  UIFloorToViewScale(self);
  v28 = v27;
  -[UICollectionViewFlowLayout setItemSize:](self->_flowLayout, "setItemSize:", v26, v27);
  v29 = v26 * (double)(v19 % (int)v20);
  v30 = -[UIView _shouldReverseLayoutDirection](self->_collectionView, "_shouldReverseLayoutDirection");
  v31 = v17 - (v17 - v29) - v29;
  if (!v30)
    v31 = v26 * (double)(v19 % (int)v20);
  -[_UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout setFrameForDoneButton:](self->_flowLayout, "setFrameForDoneButton:", v31, (v21 + -1.0) * v28, v17 - v29, v28);
  v35 = -[_UICollectionTableIndexOverlaySelectionViewCollectionViewCell initWithFrame:]([_UICollectionTableIndexOverlaySelectionViewCollectionViewCell alloc], "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), v26, v28);
  -[_UICollectionTableIndexOverlaySelectionViewCollectionViewCell setText:](v35, "setText:", CFSTR("A"));
  -[UIView layoutBelowIfNeeded](v35, "layoutBelowIfNeeded");
  -[_UICollectionTableIndexOverlaySelectionViewCollectionViewCell label](v35, "label");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bounds");
  v34 = (v26 - v33) * 0.5;

  -[_UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout setRightMarginForDoneButton:](self->_flowLayout, "setRightMarginForDoneButton:", v34);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id WeakRetained;
  void *v5;
  int64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  objc_msgSend(WeakRetained, "_dataSourceSectionIndexTitles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("IndexOverlayCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  objc_msgSend(WeakRetained, "_dataSourceSectionIndexTitles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "item");
  if (v10 >= objc_msgSend(v9, "count"))
  {
    v11 = &stru_1E16EDF20;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndex:", v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setText:", v11);
  objc_msgSend(v7, "button");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__cellTapped_, 64);

  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", CFSTR("ExternalDoneKind"), CFSTR("ExternalDoneReuse"), a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Done"), CFSTR("Done"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

  objc_msgSend(v6, "setTextAlignment:", 2);
  objc_msgSend(v6, "button");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__doneTapped, 64);

  return v6;
}

- (void)_cellTapped:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  id v8;
  id v9;

  objc_msgSend(a3, "superview");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionView indexPathForCell:](self->_collectionView, "indexPathForCell:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "item");

  objc_msgSend(v9, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self = (_UICollectionTableIndexOverlaySelectionView *)((char *)self + 432);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  objc_msgSend(WeakRetained, "_sectionIndexChangedToIndex:title:", v5, v6);

  v8 = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  objc_msgSend(v8, "_transitionIndexOverlaySelectionViewToVisible:", 0);

}

- (void)_doneTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  objc_msgSend(WeakRetained, "_transitionIndexOverlaySelectionViewToVisible:", 0);

}

- (void)reloadData
{
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
