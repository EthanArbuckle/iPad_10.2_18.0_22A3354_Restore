@implementation PRWidgetSuggestionsView

- (PRWidgetSuggestionsView)initWithLayoutDelegate:(id)a3 usingSidebarLayout:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  PRWidgetSuggestionsView *v11;
  PRWidgetSuggestionsView *v12;
  PRSidebarWidgetSuggestionsCollectionViewLayout *v13;
  void *v14;
  PRSidebarWidgetSuggestionsCollectionViewLayout *v15;
  uint64_t v16;
  UICollectionView *collectionView;
  UICollectionView *v18;
  void *v19;
  objc_super v21;

  v4 = a4;
  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PRWidgetSuggestionsView;
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = -[PRWidgetSuggestionsView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    if (v4)
    {
      v13 = [PRSidebarWidgetSuggestionsCollectionViewLayout alloc];
      -[PRWidgetSuggestionsView traitCollection](v12, "traitCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "displayScale");
      v15 = -[PRSidebarWidgetSuggestionsCollectionViewLayout initWithDisplayScale:](v13, "initWithDisplayScale:");

      -[PRSidebarWidgetSuggestionsCollectionViewLayout setLayoutDelegate:](v15, "setLayoutDelegate:", v6);
    }
    else
    {
      -[PRWidgetSuggestionsView _makeLayout](v11, "_makeLayout");
      v15 = (PRSidebarWidgetSuggestionsCollectionViewLayout *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", v15, v7, v8, v9, v10);
    collectionView = v12->_collectionView;
    v12->_collectionView = (UICollectionView *)v16;

    v18 = v12->_collectionView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    -[UICollectionView setShowsVerticalScrollIndicator:](v12->_collectionView, "setShowsVerticalScrollIndicator:", 0);
    -[PRWidgetSuggestionsView addSubview:](v12, "addSubview:", v12->_collectionView);

  }
  return v12;
}

- (void)layoutSubviews
{
  UICollectionView *collectionView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRWidgetSuggestionsView;
  -[PRWidgetSuggestionsView layoutSubviews](&v4, sel_layoutSubviews);
  collectionView = self->_collectionView;
  -[PRWidgetSuggestionsView bounds](self, "bounds");
  -[UICollectionView setFrame:](collectionView, "setFrame:");
}

- (id)_makeLayout
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC35D8]);
  objc_msgSend(v2, "setInterSectionSpacing:", 20.0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35D0]), "initWithSectionProvider:configuration:", &__block_literal_global_22, v2);

  return v3;
}

id __38__PRWidgetSuggestionsView__makeLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3370];
  v4 = (void *)MEMORY[0x1E0DC3340];
  v5 = a3;
  objc_msgSend(v4, "estimatedDimension:", 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 60.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWithWidthDimension:heightDimension:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 60.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeWithWidthDimension:heightDimension:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0DC3350];
  v36[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "horizontalGroupWithLayoutSize:subitems:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1BC88], "interComplicationSpacingExcludingInnerInset");
  objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setInterItemSpacing:", v17);

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setInterGroupSpacing:", 16.0);
  objc_msgSend(v18, "setOrthogonalScrollingBehavior:", 0);
  objc_msgSend(MEMORY[0x1E0D1BC88], "gridUnitSize");
  v20 = v19;
  objc_msgSend(MEMORY[0x1E0D1BC88], "complicationEdgeInset");
  v22 = v20 + v21 * 2.0;
  objc_msgSend(MEMORY[0x1E0D1BC88], "interComplicationSpacingExcludingInnerInset");
  v24 = v22 * 4.0 + v23 * 3.0;
  v25 = v22 * 3.0 + v23 + v23;
  objc_msgSend(v5, "container");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "contentSize");
  v28 = v27;
  v30 = v29;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "scale");
  v33 = 1.0 / v32;

  v34 = (v30 - v25) * 0.5;
  if (v34 < 0.0)
    v34 = 0.0;
  objc_msgSend(v18, "setContentInsets:", v34, (v28 - v24) * 0.5 - v33, 0.0, (v28 - v24) * 0.5 - v33);

  return v18;
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
