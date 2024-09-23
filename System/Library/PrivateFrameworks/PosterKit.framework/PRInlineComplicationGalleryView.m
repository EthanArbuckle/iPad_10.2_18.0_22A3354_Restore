@implementation PRInlineComplicationGalleryView

- (PRInlineComplicationGalleryView)initWithFrame:(CGRect)a3
{
  PRInlineComplicationGalleryView *v3;
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
  v41.super_class = (Class)PRInlineComplicationGalleryView;
  v3 = -[PRInlineComplicationGalleryView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithEffect:", v5);

    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRInlineComplicationGalleryView addSubview:](v3, "addSubview:", v6);
    v7 = objc_alloc(MEMORY[0x1E0DC35B8]);
    -[PRInlineComplicationGalleryView _makeLayout](v3, "_makeLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v8, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    collectionView = v3->_collectionView;
    v3->_collectionView = (UICollectionView *)v9;

    -[UICollectionView setDelegate:](v3->_collectionView, "setDelegate:", v3);
    v11 = v3->_collectionView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UICollectionView setShowsVerticalScrollIndicator:](v3->_collectionView, "setShowsVerticalScrollIndicator:", 0);
    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v3->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRInlineComplicationGalleryView addSubview:](v3, "addSubview:", v3->_collectionView);
    v29 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRInlineComplicationGalleryView leadingAnchor](v3, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v38;
    objc_msgSend(v6, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRInlineComplicationGalleryView trailingAnchor](v3, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v6;
    v42[1] = v34;
    objc_msgSend(v6, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRInlineComplicationGalleryView topAnchor](v3, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v31;
    objc_msgSend(v6, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRInlineComplicationGalleryView bottomAnchor](v3, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v27;
    -[UICollectionView leadingAnchor](v3->_collectionView, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRInlineComplicationGalleryView leadingAnchor](v3, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42[4] = v24;
    -[UICollectionView trailingAnchor](v3->_collectionView, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRInlineComplicationGalleryView trailingAnchor](v3, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42[5] = v14;
    -[UICollectionView topAnchor](v3->_collectionView, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRInlineComplicationGalleryView topAnchor](v3, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42[6] = v17;
    -[UICollectionView bottomAnchor](v3->_collectionView, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRInlineComplicationGalleryView bottomAnchor](v3, "bottomAnchor");
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
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v2 = objc_alloc_init(MEMORY[0x1E0DC35D8]);
  objc_msgSend(v2, "setInterSectionSpacing:", 20.0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setShowsSeparators:", 1);
  v5 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__PRInlineComplicationGalleryView__makeLayout__block_invoke;
  v9[3] = &unk_1E21850C0;
  v10 = v3;
  v6 = v3;
  v7 = (void *)objc_msgSend(v5, "initWithSectionProvider:configuration:", v9, v2);

  return v7;
}

id __46__PRInlineComplicationGalleryView__makeLayout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", *(_QWORD *)(a1 + 32), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentInsets:", 0.0, 16.0, 0.0, 16.0);
  v4 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 44.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeWithWidthDimension:heightDimension:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:absoluteOffset:", v7, CFSTR("PRInlineComplicationGalleryTitleElementKind"), 1, 0.0, -8.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBoundarySupplementaryItems:", v9);

  return v3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (PRInlineComplicationGalleryViewDelegate)delegate
{
  return (PRInlineComplicationGalleryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
