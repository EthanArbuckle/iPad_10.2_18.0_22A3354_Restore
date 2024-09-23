@implementation PFPosterLayout

- (BOOL)supportsBothOrientations
{
  return self->_portraitLayout && self->_landscapeLayout != 0;
}

- (BOOL)isUsingHeadroom
{
  return -[PFPosterOrientedLayout isUsingHeadroom](self->_portraitLayout, "isUsingHeadroom")
      || -[PFPosterOrientedLayout isUsingHeadroom](self->_landscapeLayout, "isUsingHeadroom");
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  CGSize result;

  -[PFPosterOrientedLayout imageSize](self->_portraitLayout, "imageSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (PFPosterLayout)initWithPortraitLayout:(id)a3 landscapeLayout:(id)a4
{
  PFPosterOrientedLayout *v6;
  PFPosterOrientedLayout *v7;
  PFPosterLayout *v8;
  PFPosterOrientedLayout *portraitLayout;
  PFPosterOrientedLayout *v10;
  PFPosterOrientedLayout *landscapeLayout;
  objc_super v13;

  v6 = (PFPosterOrientedLayout *)a3;
  v7 = (PFPosterOrientedLayout *)a4;
  v13.receiver = self;
  v13.super_class = (Class)PFPosterLayout;
  v8 = -[PFPosterLayout init](&v13, sel_init);
  portraitLayout = v8->_portraitLayout;
  v8->_portraitLayout = v6;
  v10 = v6;

  landscapeLayout = v8->_landscapeLayout;
  v8->_landscapeLayout = v7;

  return v8;
}

- (id)layoutByUpdatingConfiguration:(id)a3
{
  PFPosterOrientedLayout *portraitLayout;
  id v5;
  void *v6;
  void *v7;
  PFPosterOrientedLayout *landscapeLayout;
  void *v9;
  void *v10;
  PFPosterLayout *v11;

  portraitLayout = self->_portraitLayout;
  v5 = a3;
  objc_msgSend(v5, "portraitConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterOrientedLayout layoutByUpdatingConfiguration:](portraitLayout, "layoutByUpdatingConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  landscapeLayout = self->_landscapeLayout;
  objc_msgSend(v5, "landscapeConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFPosterOrientedLayout layoutByUpdatingConfiguration:](landscapeLayout, "layoutByUpdatingConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PFPosterLayout initWithPortraitLayout:landscapeLayout:]([PFPosterLayout alloc], "initWithPortraitLayout:landscapeLayout:", v7, v10);
  return v11;
}

- (id)layoutByUpdatingNormalizedPortraitVisibleFrame:(CGRect)a3 landscapeVisibleFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  PFPosterOrientedLayout *v13;
  PFPosterOrientedLayout *v14;
  uint64_t v15;
  uint64_t v16;
  PFPosterLayout *v17;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v13 = self->_portraitLayout;
  v14 = self->_landscapeLayout;
  v19.origin.x = v11;
  v19.origin.y = v10;
  v19.size.width = v9;
  v19.size.height = v8;
  if (!CGRectIsEmpty(v19))
  {
    v20.origin.x = v11;
    v20.origin.y = v10;
    v20.size.width = v9;
    v20.size.height = v8;
    if (!CGRectIsInfinite(v20))
    {
      -[PFPosterOrientedLayout layoutByUpdatingNormalizedVisibleFrame:](self->_portraitLayout, "layoutByUpdatingNormalizedVisibleFrame:", v11, v10, v9, v8);
      v15 = objc_claimAutoreleasedReturnValue();

      v13 = (PFPosterOrientedLayout *)v15;
    }
  }
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  if (!CGRectIsEmpty(v21))
  {
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    if (!CGRectIsInfinite(v22))
    {
      -[PFPosterOrientedLayout layoutByUpdatingNormalizedVisibleFrame:](self->_landscapeLayout, "layoutByUpdatingNormalizedVisibleFrame:", x, y, width, height);
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (PFPosterOrientedLayout *)v16;
    }
  }
  v17 = -[PFPosterLayout initWithPortraitLayout:landscapeLayout:]([PFPosterLayout alloc], "initWithPortraitLayout:landscapeLayout:", v13, v14);

  return v17;
}

- (id)layoutByUpgradingToConfiguration:(id)a3
{
  PFPosterOrientedLayout *portraitLayout;
  id v5;
  void *v6;
  void *v7;
  PFPosterOrientedLayout *landscapeLayout;
  void *v9;
  void *v10;
  PFPosterLayout *v11;

  portraitLayout = self->_portraitLayout;
  v5 = a3;
  objc_msgSend(v5, "portraitConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterOrientedLayout layoutByUpgradingToConfiguration:](portraitLayout, "layoutByUpgradingToConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  landscapeLayout = self->_landscapeLayout;
  objc_msgSend(v5, "landscapeConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFPosterOrientedLayout layoutByUpgradingToConfiguration:](landscapeLayout, "layoutByUpgradingToConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PFPosterLayout initWithPortraitLayout:landscapeLayout:]([PFPosterLayout alloc], "initWithPortraitLayout:landscapeLayout:", v7, v10);
  return v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  id v5;

  -[PFPosterOrientedLayout dictionaryRepresentation](self->_portraitLayout, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterOrientedLayout dictionaryRepresentation](self->_landscapeLayout, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E45CA808, CFSTR("version"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR("portrait"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("landscape"));

  return v5;
}

- (PFPosterOrientedLayout)portraitLayout
{
  return self->_portraitLayout;
}

- (PFPosterOrientedLayout)landscapeLayout
{
  return self->_landscapeLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeLayout, 0);
  objc_storeStrong((id *)&self->_portraitLayout, 0);
}

+ (id)layoutWithDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PFPosterLayout *v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("portrait"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PFPosterOrientedLayout layoutWithDictionaryRepresentation:](PFPosterOrientedLayout, "layoutWithDictionaryRepresentation:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("landscape"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PFPosterOrientedLayout layoutWithDictionaryRepresentation:](PFPosterOrientedLayout, "layoutWithDictionaryRepresentation:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[PFPosterLayout initWithPortraitLayout:landscapeLayout:]([PFPosterLayout alloc], "initWithPortraitLayout:landscapeLayout:", v6, v8);
  }
  else
  {
    +[PFPosterOrientedLayout layoutWithDictionaryRepresentation:](PFPosterOrientedLayout, "layoutWithDictionaryRepresentation:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PFPosterLayout initWithPortraitLayout:landscapeLayout:]([PFPosterLayout alloc], "initWithPortraitLayout:landscapeLayout:", v6, 0);
  }

  return v9;
}

@end
