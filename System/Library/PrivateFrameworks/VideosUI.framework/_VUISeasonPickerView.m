@implementation _VUISeasonPickerView

- (_VUISeasonPickerView)initWithFrame:(CGRect)a3
{
  _VUISeasonPickerView *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  UICollectionView *collectionView;
  UICollectionView *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)_VUISeasonPickerView;
  v3 = -[_VUISeasonPickerView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_VUISeasonPickerView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc_init(MEMORY[0x1E0DC3610]);
    objc_msgSend(v5, "setScrollDirection:", 0);
    objc_msgSend(v5, "setMinimumLineSpacing:", 0.0);
    v6 = objc_alloc(MEMORY[0x1E0DC35B8]);
    v7 = objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    collectionView = v3->_collectionView;
    v3->_collectionView = (UICollectionView *)v7;

    -[UICollectionView setAlwaysBounceVertical:](v3->_collectionView, "setAlwaysBounceVertical:", 1);
    v9 = v3->_collectionView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[_VUISeasonPickerView addSubview:](v3, "addSubview:", v3->_collectionView);
    objc_initWeak(&location, v3);
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __38___VUISeasonPickerView_initWithFrame___block_invoke;
    v14[3] = &unk_1E9F99F98;
    objc_copyWeak(&v15, &location);
    v12 = (id)-[_VUISeasonPickerView registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v11, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
  return v3;
}

- (void)layoutSubviews
{
  UICollectionView *collectionView;

  collectionView = self->_collectionView;
  -[_VUISeasonPickerView bounds](self, "bounds");
  -[UICollectionView setFrame:](collectionView, "setFrame:");
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
