@implementation CHAchievementsCollectionViewCell

- (CHAchievementsCollectionViewCell)initWithFrame:(CGRect)a3
{
  CHAchievementsCollectionViewCell *v3;
  CHAchievementsCellContentView *v4;
  CHAchievementsCellContentView *cellContentView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CHAchievementsCollectionViewCell;
  v3 = -[CHAchievementsCollectionViewCell initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[CHAchievementsCellContentView initWithFrame:]([CHAchievementsCellContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    cellContentView = v3->_cellContentView;
    v3->_cellContentView = v4;

    -[CHAchievementsCellContentView setTranslatesAutoresizingMaskIntoConstraints:](v3->_cellContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v6, "addSubview:", v3->_cellContentView);

    -[CHAchievementsCollectionViewCell applyViewConstraints](v3, "applyViewConstraints");
  }
  return v3;
}

- (void)applyViewConstraints
{
  void *v3;
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
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView leadingAnchor](self->_cellContentView, "leadingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCollectionViewCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  objc_msgSend(v6, "setActive:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView topAnchor](self->_cellContentView, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCollectionViewCell contentView](self, "contentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
  objc_msgSend(v10, "setActive:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView trailingAnchor](self->_cellContentView, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCollectionViewCell contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
  objc_msgSend(v14, "setActive:", 1);

  v18 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView bottomAnchor](self->_cellContentView, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCollectionViewCell contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v16));
  objc_msgSend(v17, "setActive:", 1);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHAchievementsCollectionViewCell;
  -[CHAchievementsCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  -[CHAchievementsCellContentView prepareForReuse](self->_cellContentView, "prepareForReuse");
}

- (void)setPreferredWidth:(double)a3
{
  -[CHAchievementsCellContentView setPreferredWidth:](self->_cellContentView, "setPreferredWidth:", a3);
}

- (void)setAppliesLargeCellInset:(BOOL)a3
{
  -[CHAchievementsCellContentView setAppliesLargeCellInset:](self->_cellContentView, "setAppliesLargeCellInset:", a3);
}

- (CGRect)badgeRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CHAchievementsCellContentView badgeRect](self->_cellContentView, "badgeRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)configureWithAchievement:(id)a3 badgeImageFactory:(id)a4 locProvider:(id)a5
{
  -[CHAchievementsCollectionViewCell configureWithAchievement:badgeImageFactory:locProvider:shouldShowProgressBar:formatForFriend:](self, "configureWithAchievement:badgeImageFactory:locProvider:shouldShowProgressBar:formatForFriend:", a3, a4, a5, 1, 0);
}

- (void)configureWithAchievement:(id)a3 badgeImageFactory:(id)a4 locProvider:(id)a5 shouldShowProgressBar:(BOOL)a6 formatForFriend:(BOOL)a7
{
  -[CHAchievementsCellContentView configureWithAchievement:badgeImageFactory:locProvider:shouldShowProgressBar:formatForFriend:](self->_cellContentView, "configureWithAchievement:badgeImageFactory:locProvider:shouldShowProgressBar:formatForFriend:", a3, a4, a5, a6, a7);
}

- (void)setBadgeHidden:(BOOL)a3
{
  -[CHAchievementsCellContentView setBadgeHidden:](self->_cellContentView, "setBadgeHidden:", a3);
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (BOOL)appliesLargeCellInset
{
  return self->_appliesLargeCellInset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellContentView, 0);
}

@end
