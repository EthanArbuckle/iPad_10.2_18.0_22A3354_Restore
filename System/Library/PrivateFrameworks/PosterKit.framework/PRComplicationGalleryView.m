@implementation PRComplicationGalleryView

- (PRComplicationGalleryView)initWithFrame:(CGRect)a3
{
  PRComplicationGalleryView *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  UICollectionView *collectionView;
  UICollectionView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  _QWORD v42[10];

  v42[8] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)PRComplicationGalleryView;
  v3 = -[PRComplicationGalleryView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithEffect:", v5);

    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRComplicationGalleryView addSubview:](v3, "addSubview:", v6);
    v7 = objc_alloc(MEMORY[0x1E0DC35B8]);
    -[PRComplicationGalleryView _makeLayout](v3, "_makeLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v8, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    collectionView = v3->_collectionView;
    v3->_collectionView = (UICollectionView *)v9;

    v11 = v3->_collectionView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UICollectionView setShowsVerticalScrollIndicator:](v3->_collectionView, "setShowsVerticalScrollIndicator:", 0);
    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v3->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRComplicationGalleryView addSubview:](v3, "addSubview:", v3->_collectionView);
    v29 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryView leadingAnchor](v3, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v38;
    objc_msgSend(v6, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryView trailingAnchor](v3, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v6;
    v42[1] = v34;
    objc_msgSend(v6, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryView topAnchor](v3, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v31;
    objc_msgSend(v6, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryView bottomAnchor](v3, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v27;
    -[UICollectionView leadingAnchor](v3->_collectionView, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryView leadingAnchor](v3, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42[4] = v24;
    -[UICollectionView trailingAnchor](v3->_collectionView, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryView trailingAnchor](v3, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42[5] = v14;
    -[UICollectionView topAnchor](v3->_collectionView, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryView topAnchor](v3, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42[6] = v17;
    -[UICollectionView bottomAnchor](v3->_collectionView, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryView bottomAnchor](v3, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42[7] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v21);

  }
  return v3;
}

- (id)_makeLayout
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = objc_alloc_init(MEMORY[0x1E0DC35D8]);
  objc_msgSend(v3, "setInterSectionSpacing:", 20.0);
  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__PRComplicationGalleryView__makeLayout__block_invoke;
  v7[3] = &unk_1E2184260;
  objc_copyWeak(&v8, &location);
  v5 = (void *)objc_msgSend(v4, "initWithSectionProvider:configuration:", v7, v3);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

id __40__PRComplicationGalleryView__makeLayout__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 60.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeWithWidthDimension:heightDimension:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1BC88], "containerEdgeInset");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "layoutStyleForSectionIndex:", a2);

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 60.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sizeWithWidthDimension:heightDimension:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 60.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sizeWithWidthDimension:heightDimension:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0DC3350];
    v38 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "verticalGroupWithLayoutSize:subitems:", v25, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3378], "flexibleSpacing:", 0.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setInterItemSpacing:", v29);

    objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setInterGroupSpacing:", 0.0);
    objc_msgSend(v30, "setOrthogonalScrollingBehavior:", 0);
    objc_msgSend(v30, "setContentInsets:", 0.0, 0.0, 24.0, 0.0);

  }
  else
  {
    v31 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 60.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sizeWithWidthDimension:heightDimension:", v32, v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = (void *)MEMORY[0x1E0DC3350];
    v39[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "horizontalGroupWithLayoutSize:subitems:", v20, v35);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D1BC88], "interComplicationSpacingExcludingInnerInset");
    objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setInterItemSpacing:", v36);

    objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v21);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setInterGroupSpacing:", 16.0);
    objc_msgSend(v30, "setOrthogonalScrollingBehavior:", 0);
    objc_msgSend(v30, "setContentInsets:", 0.0, v10 - 1.0 / v13, 12.0, v10 - 1.0 / v13);
  }

  return v30;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (PRComplicationGalleryViewDelegate)delegate
{
  return (PRComplicationGalleryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
