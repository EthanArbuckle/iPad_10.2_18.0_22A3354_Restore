@implementation PXDiagnosticsCurationViewCell

- (PXDiagnosticsCurationViewCell)initWithFrame:(CGRect)a3
{
  PXDiagnosticsCurationViewCell *v3;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;
  PXStateBadgeView *v7;
  PXStateBadgeView *clusterStateBadgeView;
  void *v9;
  PXStateBadgeView *v10;
  PXStateBadgeView *stateBadgeView;
  PXStateBadgeView *v12;
  PXStateBadgeView *alternateStateBadgeView;
  PXDedupingBadgeView *v14;
  PXDedupingBadgeView *dedupingBadgeView;
  PXTextSymbolView *v16;
  PXTextSymbolView *sdofOrHDRBadgeView;
  PXTextSymbolView *v18;
  PXTextSymbolView *favoriteBadgeView;
  PXTextSymbolView *v20;
  PXTextSymbolView *utilityBadgeView;
  PXTextSymbolView *v22;
  PXTextSymbolView *blurryBadgeView;
  PXScoreView *v24;
  PXScoreView *aestheticScoreView;
  PXScoreView *v26;
  PXScoreView *contentScoreView;
  PXScoreView *v28;
  PXScoreView *criteriaScoreView;
  PXSymbolBadgeView *v30;
  PXSymbolBadgeView *symbolBadgeView;
  PXScoreView *v32;
  PXScoreView *iconicScoreView;
  PXSymbolBadgeView *v34;
  PXSymbolBadgeView *dedupedSymbolBadgeView;
  PXIndexView *v36;
  PXIndexView *indexView;
  void *v38;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)PXDiagnosticsCurationViewCell;
  v3 = -[PXDiagnosticsCurationViewCell initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
    -[PXDiagnosticsCurationViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_imageView);

    v7 = -[PXStateBadgeView initWithState:]([PXStateBadgeView alloc], "initWithState:", 0);
    clusterStateBadgeView = v3->_clusterStateBadgeView;
    v3->_clusterStateBadgeView = v7;

    -[PXDiagnosticsCurationViewCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v3->_clusterStateBadgeView);

    v10 = -[PXStateBadgeView initWithState:]([PXStateBadgeView alloc], "initWithState:", CFSTR("Unknown"));
    stateBadgeView = v3->_stateBadgeView;
    v3->_stateBadgeView = v10;

    -[UIImageView addSubview:](v3->_imageView, "addSubview:", v3->_stateBadgeView);
    v12 = -[PXStateBadgeView initWithState:]([PXStateBadgeView alloc], "initWithState:", CFSTR("Unknown"));
    alternateStateBadgeView = v3->_alternateStateBadgeView;
    v3->_alternateStateBadgeView = v12;

    -[UIImageView addSubview:](v3->_imageView, "addSubview:", v3->_alternateStateBadgeView);
    v14 = -[PXDedupingBadgeView initWithDedupingType:]([PXDedupingBadgeView alloc], "initWithDedupingType:", CFSTR("None"));
    dedupingBadgeView = v3->_dedupingBadgeView;
    v3->_dedupingBadgeView = v14;

    -[UIImageView addSubview:](v3->_imageView, "addSubview:", v3->_dedupingBadgeView);
    v16 = -[PXTextSymbolView initWithSymbol:]([PXTextSymbolView alloc], "initWithSymbol:", CFSTR("🏞"));
    sdofOrHDRBadgeView = v3->_sdofOrHDRBadgeView;
    v3->_sdofOrHDRBadgeView = v16;

    -[UIImageView addSubview:](v3->_imageView, "addSubview:", v3->_sdofOrHDRBadgeView);
    v18 = -[PXTextSymbolView initWithSymbol:]([PXTextSymbolView alloc], "initWithSymbol:", CFSTR("💟"));
    favoriteBadgeView = v3->_favoriteBadgeView;
    v3->_favoriteBadgeView = v18;

    -[UIImageView addSubview:](v3->_imageView, "addSubview:", v3->_favoriteBadgeView);
    v20 = -[PXTextSymbolView initWithSymbol:]([PXTextSymbolView alloc], "initWithSymbol:", CFSTR("🚮"));
    utilityBadgeView = v3->_utilityBadgeView;
    v3->_utilityBadgeView = v20;

    -[UIImageView addSubview:](v3->_imageView, "addSubview:", v3->_utilityBadgeView);
    v22 = -[PXTextSymbolView initWithSymbol:]([PXTextSymbolView alloc], "initWithSymbol:", CFSTR("📳"));
    blurryBadgeView = v3->_blurryBadgeView;
    v3->_blurryBadgeView = v22;

    -[UIImageView addSubview:](v3->_imageView, "addSubview:", v3->_blurryBadgeView);
    v24 = -[PXScoreView initWithColorScale:]([PXScoreView alloc], "initWithColorScale:", 2);
    aestheticScoreView = v3->_aestheticScoreView;
    v3->_aestheticScoreView = v24;

    -[UIImageView addSubview:](v3->_imageView, "addSubview:", v3->_aestheticScoreView);
    v26 = -[PXScoreView initWithColorScale:]([PXScoreView alloc], "initWithColorScale:", 1);
    contentScoreView = v3->_contentScoreView;
    v3->_contentScoreView = v26;

    -[UIImageView addSubview:](v3->_imageView, "addSubview:", v3->_contentScoreView);
    v28 = -[PXScoreView initWithColorScale:]([PXScoreView alloc], "initWithColorScale:", 3);
    criteriaScoreView = v3->_criteriaScoreView;
    v3->_criteriaScoreView = v28;

    -[UIImageView addSubview:](v3->_imageView, "addSubview:", v3->_criteriaScoreView);
    v30 = -[PXSymbolBadgeView initWithIndex:]([PXSymbolBadgeView alloc], "initWithIndex:", 0);
    symbolBadgeView = v3->_symbolBadgeView;
    v3->_symbolBadgeView = v30;

    -[UIImageView addSubview:](v3->_imageView, "addSubview:", v3->_symbolBadgeView);
    v32 = -[PXScoreView initWithColorScale:]([PXScoreView alloc], "initWithColorScale:", 4);
    iconicScoreView = v3->_iconicScoreView;
    v3->_iconicScoreView = v32;

    -[UIImageView addSubview:](v3->_imageView, "addSubview:", v3->_iconicScoreView);
    v34 = -[PXSymbolBadgeView initWithIndex:]([PXSymbolBadgeView alloc], "initWithIndex:", 0);
    dedupedSymbolBadgeView = v3->_dedupedSymbolBadgeView;
    v3->_dedupedSymbolBadgeView = v34;

    -[UIImageView addSubview:](v3->_imageView, "addSubview:", v3->_dedupedSymbolBadgeView);
    v36 = objc_alloc_init(PXIndexView);
    indexView = v3->_indexView;
    v3->_indexView = v36;

    -[PXDiagnosticsCurationViewCell contentView](v3, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v3->_indexView);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXDiagnosticsCurationViewCell;
  -[PXDiagnosticsCurationViewCell layoutSubviews](&v11, sel_layoutSubviews);
  -[PXDiagnosticsCurationViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v10 = v4;
  v7 = v6;

  -[PXStateBadgeView setFrame:](self->_clusterStateBadgeView, "setFrame:", 1.0, 1.0, 16.0, 16.0);
  v8 = v7 + -6.0 + -16.0;
  -[UIImageView setFrame:](self->_imageView, "setFrame:", 3.0, 19.0, v5 + -6.0, v8);
  -[PXStateBadgeView setFrame:](self->_stateBadgeView, "setFrame:", 3.0, 3.0, 16.0, 16.0);
  -[PXStateBadgeView setFrame:](self->_alternateStateBadgeView, "setFrame:", v5 + -6.0 + -3.0 + -16.0, 3.0, 16.0, 16.0);
  -[PXDedupingBadgeView setFrame:](self->_dedupingBadgeView, "setFrame:", v5 + -6.0 + -3.0 + -32.0 + -1.0, 3.0, 16.0, 16.0);
  -[PXTextSymbolView setFrame:](self->_sdofOrHDRBadgeView, "setFrame:", 3.0, v8 + -32.0 + -1.0 + -3.0, 16.0, 16.0);
  -[PXTextSymbolView setFrame:](self->_favoriteBadgeView, "setFrame:", 3.0, v8 + -16.0 + -3.0, 16.0, 16.0);
  -[PXTextSymbolView setFrame:](self->_utilityBadgeView, "setFrame:", 20.0, v8 + -16.0 + -3.0, 16.0, 16.0);
  -[PXTextSymbolView setFrame:](self->_blurryBadgeView, "setFrame:", 37.0, v8 + -16.0 + -3.0, 16.0, 16.0);
  v9 = v5 + -6.0 + -3.0 + -24.0;
  -[PXScoreView setFrame:](self->_aestheticScoreView, "setFrame:", v9, v8 + -32.0 + -3.0 + -1.0, 24.0, 16.0);
  -[PXScoreView setFrame:](self->_contentScoreView, "setFrame:", v9, v8 + -16.0 + -3.0, 24.0, 16.0);
  -[PXScoreView setFrame:](self->_criteriaScoreView, "setFrame:", v9, v8 + -48.0 + -3.0 + -2.0, 24.0, 16.0);
  -[PXScoreView setFrame:](self->_iconicScoreView, "setFrame:", v9, v8 + -64.0 + -3.0 + -3.0, 24.0, 16.0);
  -[PXSymbolBadgeView setFrame:](self->_symbolBadgeView, "setFrame:", 3.0, 20.0, 16.0, 16.0);
  -[PXSymbolBadgeView setFrame:](self->_dedupedSymbolBadgeView, "setFrame:", v5 + -6.0 + -16.0 + -3.0, 3.0, 16.0, 16.0);
  -[PXIndexView setFrame:](self->_indexView, "setFrame:", v10 + -3.0 + -24.0, 4.0, 24.0, 13.0);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDiagnosticsCurationViewCell;
  -[PXDiagnosticsCurationViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PXDiagnosticsCurationViewCell setThumbnailImage:](self, "setThumbnailImage:", 0);
  -[PXDiagnosticsCurationViewCell setRepresentedAssetIdentifier:](self, "setRepresentedAssetIdentifier:", 0);
  -[PXStateBadgeView setState:](self->_clusterStateBadgeView, "setState:", 0);
  -[PXStateBadgeView setState:](self->_stateBadgeView, "setState:", CFSTR("Unknown"));
  -[PXStateBadgeView setHidden:](self->_stateBadgeView, "setHidden:", 1);
  -[PXStateBadgeView setState:](self->_alternateStateBadgeView, "setState:", CFSTR("Unknown"));
  -[PXStateBadgeView setHidden:](self->_alternateStateBadgeView, "setHidden:", 1);
  -[PXTextSymbolView setHidden:](self->_sdofOrHDRBadgeView, "setHidden:", 1);
  -[PXTextSymbolView setHidden:](self->_favoriteBadgeView, "setHidden:", 1);
  -[PXTextSymbolView setHidden:](self->_utilityBadgeView, "setHidden:", 1);
  -[PXTextSymbolView setHidden:](self->_blurryBadgeView, "setHidden:", 1);
  -[PXScoreView setScore:](self->_aestheticScoreView, "setScore:", -1.0);
  -[PXScoreView setScore:](self->_contentScoreView, "setScore:", -1.0);
  -[PXScoreView setScore:](self->_criteriaScoreView, "setScore:", -1.0);
  -[PXScoreView setScore:](self->_iconicScoreView, "setScore:", -1.0);
  -[PXTextSymbolView setSymbol:](self->_symbolBadgeView, "setSymbol:", 0);
  -[PXTextSymbolView setSymbol:](self->_dedupedSymbolBadgeView, "setSymbol:", 0);
  -[PXIndexView setIndex:](self->_indexView, "setIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (void)setThumbnailImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_thumbnailImage, a3);
  v5 = a3;
  -[UIImageView setImage:](self->_imageView, "setImage:", v5);

}

- (void)setDebugInfo:(id)a3
{
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
  char v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_storeStrong((id *)&self->_debugInfo, a3);
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDiagnosticsCurationViewCell setState:](self, "setState:", v5);

  -[PXDiagnosticsCurationViewCell setAlternateState:](self, "setAlternateState:", 0);
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("dedupingType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDiagnosticsCurationViewCell setDedupingType:](self, "setDedupingType:", v6);

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("isSDOFOrHDR"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDiagnosticsCurationViewCell setSDOFOrHDR:](self, "setSDOFOrHDR:", objc_msgSend(v7, "BOOLValue"));

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("isFavorite"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDiagnosticsCurationViewCell setFavorite:](self, "setFavorite:", objc_msgSend(v8, "BOOLValue"));

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("isUtility"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDiagnosticsCurationViewCell setUtility:](self, "setUtility:", objc_msgSend(v9, "BOOLValue"));

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("isBlurry"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDiagnosticsCurationViewCell setBlurry:](self, "setBlurry:", objc_msgSend(v10, "BOOLValue"));

  if (v20)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("aestheticScore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    -[PXDiagnosticsCurationViewCell setAestheticScore:](self, "setAestheticScore:");

    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("contentScore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    -[PXDiagnosticsCurationViewCell setContentScore:](self, "setContentScore:");

  }
  else
  {
    -[PXDiagnosticsCurationViewCell setAestheticScore:](self, "setAestheticScore:", -1.79769313e308);
    -[PXDiagnosticsCurationViewCell setContentScore:](self, "setContentScore:", -1.0);
  }
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("passesCriteria"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = objc_msgSend(v13, "BOOLValue");
    v16 = -0.5;
    if ((v15 & 1) != 0)
    {
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("criteriaScore"), -0.5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      -[PXDiagnosticsCurationViewCell setCriteriaScore:](self, "setCriteriaScore:");

      goto LABEL_9;
    }
  }
  else
  {
    v16 = -1.0;
  }
  -[PXDiagnosticsCurationViewCell setCriteriaScore:](self, "setCriteriaScore:", v16);
LABEL_9:
  if (v20)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("iconicScore"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    -[PXDiagnosticsCurationViewCell setIconicScore:](self, "setIconicScore:");

  }
  else
  {
    -[PXDiagnosticsCurationViewCell setIconicScore:](self, "setIconicScore:", -1.0);
  }
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("index"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDiagnosticsCurationViewCell setIndex:](self, "setIndex:", objc_msgSend(v19, "unsignedIntegerValue"));

}

- (void)setClusterState:(id)a3
{
  NSString **p_clusterState;
  id v6;

  p_clusterState = &self->_clusterState;
  objc_storeStrong((id *)&self->_clusterState, a3);
  v6 = a3;
  -[PXStateBadgeView setState:](self->_clusterStateBadgeView, "setState:", *p_clusterState);

}

- (void)setState:(id)a3
{
  NSString **p_state;
  id v6;

  p_state = &self->_state;
  objc_storeStrong((id *)&self->_state, a3);
  v6 = a3;
  -[PXStateBadgeView setState:](self->_stateBadgeView, "setState:", *p_state);

}

- (void)setAlternateState:(id)a3
{
  NSString **p_alternateState;
  id v6;

  p_alternateState = &self->_alternateState;
  objc_storeStrong((id *)&self->_alternateState, a3);
  v6 = a3;
  -[PXStateBadgeView setState:](self->_alternateStateBadgeView, "setState:", *p_alternateState);

}

- (void)setDedupingType:(id)a3
{
  NSString **p_dedupingType;
  id v6;

  p_dedupingType = &self->_dedupingType;
  objc_storeStrong((id *)&self->_dedupingType, a3);
  v6 = a3;
  -[PXDedupingBadgeView setDedupingType:](self->_dedupingBadgeView, "setDedupingType:", *p_dedupingType);

}

- (void)setSDOFOrHDR:(BOOL)a3
{
  self->_isSDOFOrHDR = a3;
  -[PXTextSymbolView setHidden:](self->_sdofOrHDRBadgeView, "setHidden:", !a3);
}

- (void)setFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
  -[PXTextSymbolView setHidden:](self->_favoriteBadgeView, "setHidden:", !a3);
}

- (void)setUtility:(BOOL)a3
{
  self->_isUtility = a3;
  -[PXTextSymbolView setHidden:](self->_utilityBadgeView, "setHidden:", !a3);
}

- (void)setBlurry:(BOOL)a3
{
  self->_isBlurry = a3;
  -[PXTextSymbolView setHidden:](self->_blurryBadgeView, "setHidden:", !a3);
}

- (void)setAestheticScore:(double)a3
{
  PXScoreView *aestheticScoreView;

  self->_aestheticScore = a3;
  aestheticScoreView = self->_aestheticScoreView;
  if (a3 == -1.79769313e308)
  {
    -[PXScoreView setHidden:](aestheticScoreView, "setHidden:", 1);
  }
  else
  {
    -[PXScoreView setHidden:](aestheticScoreView, "setHidden:", 0);
    -[PXScoreView setScore:](self->_aestheticScoreView, "setScore:", self->_aestheticScore);
  }
}

- (void)setContentScore:(double)a3
{
  PXScoreView *contentScoreView;

  self->_contentScore = a3;
  contentScoreView = self->_contentScoreView;
  if (a3 >= 0.0)
  {
    -[PXScoreView setHidden:](contentScoreView, "setHidden:", 0);
    -[PXScoreView setScore:](self->_contentScoreView, "setScore:", self->_contentScore);
  }
  else
  {
    -[PXScoreView setHidden:](contentScoreView, "setHidden:", 1);
  }
}

- (void)setCriteriaScore:(double)a3
{
  PXScoreView *criteriaScoreView;

  self->_criteriaScore = a3;
  criteriaScoreView = self->_criteriaScoreView;
  if (a3 >= -0.5)
  {
    -[PXScoreView setHidden:](criteriaScoreView, "setHidden:", 0);
    -[PXScoreView setScore:](self->_criteriaScoreView, "setScore:", self->_criteriaScore);
  }
  else
  {
    -[PXScoreView setHidden:](criteriaScoreView, "setHidden:", 1);
  }
}

- (void)setIconicScore:(double)a3
{
  self->_iconicScore = a3;
  -[PXScoreView setScore:](self->_iconicScoreView, "setScore:");
}

- (void)setSymbolIndex:(id)a3
{
  NSNumber **p_symbolIndex;
  id v6;

  p_symbolIndex = &self->_symbolIndex;
  objc_storeStrong((id *)&self->_symbolIndex, a3);
  v6 = a3;
  -[PXSymbolBadgeView setIndex:](self->_symbolBadgeView, "setIndex:", *p_symbolIndex);

}

- (void)setDedupedSymbolIndex:(id)a3
{
  NSNumber **p_dedupedSymbolIndex;
  id v6;

  p_dedupedSymbolIndex = &self->_dedupedSymbolIndex;
  objc_storeStrong((id *)&self->_dedupedSymbolIndex, a3);
  v6 = a3;
  -[PXSymbolBadgeView setIndex:](self->_dedupedSymbolBadgeView, "setIndex:", *p_dedupedSymbolIndex);

}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
  -[PXIndexView setIndex:](self->_indexView, "setIndex:");
}

- (void)setClusterParity:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  if (a3 == 2)
  {
    v4 = (void *)MEMORY[0x1E0DC3658];
    v7 = 0.7;
    v5 = 1.0;
    v6 = 1.0;
  }
  else
  {
    if (a3 != 1)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v4 = (void *)MEMORY[0x1E0DC3658];
    v5 = 0.7;
    v6 = 1.0;
    v7 = 1.0;
  }
  objc_msgSend(v4, "colorWithRed:green:blue:alpha:", v5, v6, v7, 0.5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  -[PXDiagnosticsCurationViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

}

- (void)setComparisonMatch:(BOOL)a3
{
  void *v4;
  id v5;

  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXDiagnosticsCurationViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (BOOL)isUtility
{
  return self->_isUtility;
}

- (BOOL)isBlurry
{
  return self->_isBlurry;
}

- (BOOL)isSDOFOrHDR
{
  return self->_isSDOFOrHDR;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (NSString)representedAssetIdentifier
{
  return self->_representedAssetIdentifier;
}

- (void)setRepresentedAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_representedAssetIdentifier, a3);
}

- (NSDictionary)debugInfo
{
  return self->_debugInfo;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)alternateState
{
  return self->_alternateState;
}

- (NSString)clusterState
{
  return self->_clusterState;
}

- (double)aestheticScore
{
  return self->_aestheticScore;
}

- (double)contentScore
{
  return self->_contentScore;
}

- (double)criteriaScore
{
  return self->_criteriaScore;
}

- (double)iconicScore
{
  return self->_iconicScore;
}

- (NSNumber)symbolIndex
{
  return self->_symbolIndex;
}

- (NSString)dedupingType
{
  return self->_dedupingType;
}

- (NSNumber)dedupedSymbolIndex
{
  return self->_dedupedSymbolIndex;
}

- (unint64_t)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dedupedSymbolIndex, 0);
  objc_storeStrong((id *)&self->_dedupingType, 0);
  objc_storeStrong((id *)&self->_symbolIndex, 0);
  objc_storeStrong((id *)&self->_clusterState, 0);
  objc_storeStrong((id *)&self->_alternateState, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_representedAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_indexView, 0);
  objc_storeStrong((id *)&self->_dedupedSymbolBadgeView, 0);
  objc_storeStrong((id *)&self->_symbolBadgeView, 0);
  objc_storeStrong((id *)&self->_iconicScoreView, 0);
  objc_storeStrong((id *)&self->_criteriaScoreView, 0);
  objc_storeStrong((id *)&self->_contentScoreView, 0);
  objc_storeStrong((id *)&self->_aestheticScoreView, 0);
  objc_storeStrong((id *)&self->_blurryBadgeView, 0);
  objc_storeStrong((id *)&self->_utilityBadgeView, 0);
  objc_storeStrong((id *)&self->_favoriteBadgeView, 0);
  objc_storeStrong((id *)&self->_sdofOrHDRBadgeView, 0);
  objc_storeStrong((id *)&self->_dedupingBadgeView, 0);
  objc_storeStrong((id *)&self->_alternateStateBadgeView, 0);
  objc_storeStrong((id *)&self->_stateBadgeView, 0);
  objc_storeStrong((id *)&self->_clusterStateBadgeView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

+ (double)cellHeightWithCellWidth:(double)a3
{
  return a3 + 6.0 + 16.0;
}

@end
