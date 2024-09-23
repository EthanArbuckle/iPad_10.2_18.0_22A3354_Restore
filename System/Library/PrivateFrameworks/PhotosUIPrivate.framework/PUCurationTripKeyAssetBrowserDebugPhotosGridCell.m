@implementation PUCurationTripKeyAssetBrowserDebugPhotosGridCell

- (void)layoutSubviews
{
  UILabel *v3;
  UILabel *curationScoreLabel;
  UILabel *v5;
  UILabel *iconicSceneScoreLabel;
  UILabel *v7;
  UILabel *aestheticScoreLabel;
  UILabel *v9;
  UILabel *promotionScoreLabel;
  UILabel *v11;
  UILabel *titleLabel;
  UILabel *v13;
  UILabel *subtitleLabel;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PUCurationTripKeyAssetBrowserDebugPhotosGridCell;
  -[PUPhotosGridCell layoutSubviews](&v19, sel_layoutSubviews);
  if (!self->_curationScoreLabel)
  {
    __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke();
    v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
    curationScoreLabel = self->_curationScoreLabel;
    self->_curationScoreLabel = v3;

    -[PUCurationTripKeyAssetBrowserDebugPhotosGridCell addSubview:](self, "addSubview:", self->_curationScoreLabel);
    -[PUCurationTripKeyAssetBrowserDebugPhotosGridCell setCurationScore:](self, "setCurationScore:", self->_curationScore);
  }
  if (!self->_iconicSceneScoreLabel)
  {
    __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke();
    v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
    iconicSceneScoreLabel = self->_iconicSceneScoreLabel;
    self->_iconicSceneScoreLabel = v5;

    -[PUCurationTripKeyAssetBrowserDebugPhotosGridCell addSubview:](self, "addSubview:", self->_iconicSceneScoreLabel);
    -[PUCurationTripKeyAssetBrowserDebugPhotosGridCell setIconicSceneScore:](self, "setIconicSceneScore:", self->_iconicSceneScore);
  }
  if (!self->_aestheticScoreLabel)
  {
    __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke();
    v7 = (UILabel *)objc_claimAutoreleasedReturnValue();
    aestheticScoreLabel = self->_aestheticScoreLabel;
    self->_aestheticScoreLabel = v7;

    -[PUCurationTripKeyAssetBrowserDebugPhotosGridCell addSubview:](self, "addSubview:", self->_aestheticScoreLabel);
    -[PUCurationTripKeyAssetBrowserDebugPhotosGridCell setAestheticScore:](self, "setAestheticScore:", self->_aestheticScore);
  }
  if (!self->_promotionScoreLabel)
  {
    __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke();
    v9 = (UILabel *)objc_claimAutoreleasedReturnValue();
    promotionScoreLabel = self->_promotionScoreLabel;
    self->_promotionScoreLabel = v9;

    -[PUCurationTripKeyAssetBrowserDebugPhotosGridCell addSubview:](self, "addSubview:", self->_promotionScoreLabel);
    -[PUCurationTripKeyAssetBrowserDebugPhotosGridCell setPromotionScore:](self, "setPromotionScore:", self->_promotionScore);
    -[PUCurationTripKeyAssetBrowserDebugPhotosGridCell setColor:](self, "setColor:", self->_color);
  }
  if (!self->_titleLabel)
  {
    __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke();
    v11 = (UILabel *)objc_claimAutoreleasedReturnValue();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v11;

    -[PUCurationTripKeyAssetBrowserDebugPhotosGridCell addSubview:](self, "addSubview:", self->_titleLabel);
  }
  -[PUCurationTripKeyAssetBrowserDebugPhotosGridCell setTitle:](self, "setTitle:", self->_title);
  if (!self->_subtitleLabel)
  {
    __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke();
    v13 = (UILabel *)objc_claimAutoreleasedReturnValue();
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v13;

    -[PUCurationTripKeyAssetBrowserDebugPhotosGridCell addSubview:](self, "addSubview:", self->_subtitleLabel);
  }
  -[PUCurationTripKeyAssetBrowserDebugPhotosGridCell setSubtitle:](self, "setSubtitle:", self->_subtitle);
  -[PUCurationTripKeyAssetBrowserDebugPhotosGridCell bounds](self, "bounds");
  v16 = v15;
  v18 = v17 + -32.0;
  -[UILabel setFrame:](self->_iconicSceneScoreLabel, "setFrame:", v17 + -32.0, v15 + -17.0, 30.0, 15.0);
  -[UILabel setFrame:](self->_curationScoreLabel, "setFrame:", v18, v16 + -33.0, 30.0, 15.0);
  -[UILabel setFrame:](self->_aestheticScoreLabel, "setFrame:", v18, v16 + -49.0, 30.0, 15.0);
  -[UILabel setFrame:](self->_promotionScoreLabel, "setFrame:", v18, v16 + -65.0, 30.0, 15.0);
}

- (void)setCurationScore:(double)a3
{
  id v4;

  self->_curationScore = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_curationScoreLabel, "setText:", v4);

}

- (void)setIconicSceneScore:(double)a3
{
  id v4;

  self->_iconicSceneScore = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_iconicSceneScoreLabel, "setText:", v4);

}

- (void)setAestheticScore:(double)a3
{
  id v4;

  self->_aestheticScore = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_aestheticScoreLabel, "setText:", v4);

}

- (void)setPromotionScore:(double)a3
{
  id v4;

  self->_promotionScore = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_promotionScoreLabel, "setText:", v4);

}

- (void)setColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_color, a3);
  v5 = a3;
  -[UILabel setTextColor:](self->_promotionScoreLabel, "setTextColor:", v5);

}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  title = self->_title;
  self->_title = v5;

  -[UILabel setText:](self->_titleLabel, "setText:", v4);
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[PUCurationTripKeyAssetBrowserDebugPhotosGridCell bounds](self, "bounds");
  v8 = v7 + 2.0;
  v10 = v9 + -4.0;
  -[UILabel bounds](self->_titleLabel, "bounds");
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 2.0, v8, v10);
}

- (void)setSubtitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *subtitle;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  subtitle = self->_subtitle;
  self->_subtitle = v5;

  -[UILabel setText:](self->_subtitleLabel, "setText:", v4);
  -[UILabel sizeToFit](self->_subtitleLabel, "sizeToFit");
  -[PUCurationTripKeyAssetBrowserDebugPhotosGridCell bounds](self, "bounds");
  v8 = v7 + 18.0;
  v10 = v9 + -4.0;
  -[UILabel bounds](self->_subtitleLabel, "bounds");
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", 2.0, v8, v10);
}

- (double)curationScore
{
  return self->_curationScore;
}

- (double)iconicSceneScore
{
  return self->_iconicSceneScore;
}

- (double)aestheticScore
{
  return self->_aestheticScore;
}

- (double)promotionScore
{
  return self->_promotionScore;
}

- (UIColor)color
{
  return self->_color;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_promotionScoreLabel, 0);
  objc_storeStrong((id *)&self->_aestheticScoreLabel, 0);
  objc_storeStrong((id *)&self->_iconicSceneScoreLabel, 0);
  objc_storeStrong((id *)&self->_curationScoreLabel, 0);
}

id __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x1E0DC3990]);
  v1 = (void *)objc_msgSend(v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTextColor:", v2);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundColor:", v3);

  objc_msgSend(v1, "setAutoresizingMask:", 9);
  objc_msgSend(v1, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFont:", v4);

  return v1;
}

@end
