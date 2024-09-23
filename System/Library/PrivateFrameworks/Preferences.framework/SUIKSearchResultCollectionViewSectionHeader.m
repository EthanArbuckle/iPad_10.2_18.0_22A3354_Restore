@implementation SUIKSearchResultCollectionViewSectionHeader

- (SUIKSearchResultCollectionViewSectionHeader)init
{
  SUIKSearchResultCollectionViewSectionHeader *v2;
  SUIKSearchResultCollectionViewSectionHeader *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUIKSearchResultCollectionViewSectionHeader;
  v2 = -[SUIKSearchResultCollectionViewSectionHeader init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SUIKSearchResultCollectionViewSectionHeader _commonInit](v2, "_commonInit");
  return v3;
}

- (SUIKSearchResultCollectionViewSectionHeader)initWithFrame:(CGRect)a3
{
  SUIKSearchResultCollectionViewSectionHeader *v3;
  SUIKSearchResultCollectionViewSectionHeader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUIKSearchResultCollectionViewSectionHeader;
  v3 = -[SUIKSearchResultCollectionViewSectionHeader initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SUIKSearchResultCollectionViewSectionHeader _commonInit](v3, "_commonInit");
  return v4;
}

- (SUIKSearchResultCollectionViewSectionHeader)initWithCoder:(id)a3
{
  SUIKSearchResultCollectionViewSectionHeader *v3;
  SUIKSearchResultCollectionViewSectionHeader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUIKSearchResultCollectionViewSectionHeader;
  v3 = -[SUIKSearchResultCollectionViewSectionHeader initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[SUIKSearchResultCollectionViewSectionHeader _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  id v3;
  void *v4;
  void *v5;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  if (_commonInit_onceToken != -1)
    dispatch_once(&_commonInit_onceToken, &__block_literal_global_8);
  v3 = objc_alloc(MEMORY[0x1E0CEA658]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SUIKSearchResultCollectionViewSectionHeader setCategoryImageView:](self, "setCategoryImageView:", v4);

  -[SUIKSearchResultCollectionViewSectionHeader categoryImageView](self, "categoryImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SUIKSearchResultCollectionViewSectionHeader categoryImageView](self, "categoryImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUIKSearchResultCollectionViewSectionHeader addSubview:](self, "addSubview:", v6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  -[SUIKSearchResultCollectionViewSectionHeader categoryImageView](self, "categoryImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUIKSearchResultCollectionViewSectionHeader leadingAnchor](self, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v10);

  -[SUIKSearchResultCollectionViewSectionHeader categoryImageView](self, "categoryImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUIKSearchResultCollectionViewSectionHeader trailingAnchor](self, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v14);

  -[SUIKSearchResultCollectionViewSectionHeader categoryImageView](self, "categoryImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUIKSearchResultCollectionViewSectionHeader topAnchor](self, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v17, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v18);

  -[SUIKSearchResultCollectionViewSectionHeader bottomAnchor](self, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUIKSearchResultCollectionViewSectionHeader categoryImageView](self, "categoryImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v21, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v22);

  objc_msgSend(v31, "lastObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = 1148829696;
  objc_msgSend(v23, "setPriority:", v24);

  -[SUIKSearchResultCollectionViewSectionHeader categoryImageView](self, "categoryImageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", *(double *)&_commonInit_iconSize_1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v27);

  -[SUIKSearchResultCollectionViewSectionHeader categoryImageView](self, "categoryImageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToConstant:", *(double *)&_commonInit_iconSize_0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v30);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v31);
}

void __58__SUIKSearchResultCollectionViewSectionHeader__commonInit__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  PSBlankIconImage();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "size");
  _commonInit_iconSize_0 = v1;
  _commonInit_iconSize_1 = v2;

  objc_msgSend(MEMORY[0x1E0CEA718], "subtitleCellConfiguration");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_commonInit_cellConfig;
  _commonInit_cellConfig = v3;

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUIKSearchResultCollectionViewSectionHeader;
  -[SUIKSearchResultCollectionViewSectionHeader prepareForReuse](&v4, sel_prepareForReuse);
  -[SUIKSearchResultCollectionViewSectionHeader categoryImageView](self, "categoryImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

}

- (void)setCategoryImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUIKSearchResultCollectionViewSectionHeader categoryImageView](self, "categoryImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  double v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUIKSearchResultCollectionViewSectionHeader;
  -[SUIKSearchResultCollectionViewSectionHeader applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v4);
  if (_os_feature_enabled_impl())
  {
    v5 = (double)objc_msgSend(v4, "zIndex");
    -[SUIKSearchResultCollectionViewSectionHeader layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setZPosition:", v5);

  }
}

- (UIImageView)categoryImageView
{
  return self->_categoryImageView;
}

- (void)setCategoryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_categoryImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryImageView, 0);
}

@end
