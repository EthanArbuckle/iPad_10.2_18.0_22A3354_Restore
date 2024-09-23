@implementation SKUIRatingStarsCache

- (SKUIRatingStarsCache)initWithProperties:(int64_t)a3
{
  char v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIRatingStarsCache *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIImage *emptyStarImage;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  UIImage *filledStarImage;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  UIImage *halfStarImage;
  NSMutableDictionary *v33;
  NSMutableDictionary *cachedImages;
  objc_super v36;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIRatingStarsCache initWithProperties:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v36.receiver = self;
  v36.super_class = (Class)SKUIRatingStarsCache;
  v13 = -[SKUIRatingStarsCache init](&v36, sel_init);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("Small");
    if ((v3 & 1) == 0)
      v15 = &stru_1E73A9FB0;
    if ((v3 & 4) != 0)
      v16 = CFSTR("Large");
    else
      v16 = v15;
    if ((v3 & 0x10) != 0)
      v17 = CFSTR("Selected");
    else
      v17 = &stru_1E73A9FB0;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@StarEmpty%@"), v16, v17);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v18, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_flatImageWithColor:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    emptyStarImage = v13->_emptyStarImage;
    v13->_emptyStarImage = (UIImage *)v21;

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@StarFull%@"), v16, v17);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v23, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_flatImageWithColor:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    filledStarImage = v13->_filledStarImage;
    v13->_filledStarImage = (UIImage *)v26;

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@StarHalf%@"), v16, v17);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v28, v14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_flatImageWithColor:", v30);
    v31 = objc_claimAutoreleasedReturnValue();
    halfStarImage = v13->_halfStarImage;
    v13->_halfStarImage = (UIImage *)v31;

    v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedImages = v13->_cachedImages;
    v13->_cachedImages = v33;

  }
  return v13;
}

+ (id)cacheWithProperties:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        +[SKUIRatingStarsCache cacheWithProperties:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (!cacheWithProperties__sCaches)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = (void *)cacheWithProperties__sCaches;
    cacheWithProperties__sCaches = (uint64_t)v13;

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a3);
  objc_msgSend((id)cacheWithProperties__sCaches, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProperties:", a3);
    objc_msgSend((id)cacheWithProperties__sCaches, "setObject:forKey:", v16, v15);
  }

  return v16;
}

- (id)ratingStarsImageForRating:(double)a3
{
  float v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  unint64_t v20;
  double v21;
  uint64_t i;
  double v23;
  double v24;
  void *v25;
  CGSize v27;

  v4 = a3 * 10.0;
  v5 = (uint64_t)rintf(v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v5);
  -[NSMutableDictionary objectForKey:](self->_cachedImages, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[UIImage size](self->_emptyStarImage, "size");
    v9 = v8;
    v11 = v10;
    -[UIImage size](self->_filledStarImage, "size");
    v13 = v12;
    v15 = v14;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    v18 = v17;
    v27.width = v9 * 5.0;
    v27.height = v11;
    UIGraphicsBeginImageContextWithOptions(v27, 0, v18);

    v19 = 0.0;
    v20 = -2;
    do
    {
      -[UIImage drawInRect:](self->_emptyStarImage, "drawInRect:", v19, 0.0, v9, v11);
      v19 = v9 + v19;
      v20 += 2;
    }
    while (v20 < 8);
    v21 = 0.0;
    if (v5 >= 2)
    {
      for (i = 2; i <= v5; i += 2)
      {
        -[UIImage drawInRect:](self->_filledStarImage, "drawInRect:", v21, 0.0, v13, v15);
        v21 = v13 + v21;
      }
    }
    if ((v5 & 0x8000000000000001) == 1)
    {
      -[UIImage size](self->_halfStarImage, "size");
      -[UIImage drawInRect:](self->_halfStarImage, "drawInRect:", v21, 0.0, v23, v24);
    }
    UIGraphicsGetImageFromCurrentImageContext();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    if (v7)
      -[NSMutableDictionary setObject:forKey:](self->_cachedImages, "setObject:forKey:", v7, v6);
  }
  objc_msgSend(v7, "imageFlippedForRightToLeftLayoutDirection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_halfStarImage, 0);
  objc_storeStrong((id *)&self->_filledStarImage, 0);
  objc_storeStrong((id *)&self->_emptyStarImage, 0);
  objc_storeStrong((id *)&self->_cachedImages, 0);
}

- (void)initWithProperties:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)cacheWithProperties:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
