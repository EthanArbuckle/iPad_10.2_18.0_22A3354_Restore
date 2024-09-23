@implementation TVRatingBadgeLayout

+ (id)layoutWithLayout:(id)a3 element:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (!v8)
    v9 = (void *)objc_opt_new();
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___TVRatingBadgeLayout;
  v10 = objc_msgSendSuper2(&v21, sel_layoutWithLayout_element_, v9, v7);
  objc_msgSend(v7, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v13);

  }
  objc_msgSend(v11, "tv_tintColor2");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "color");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v9, "setFillColor:", v15);
  objc_msgSend(v9, "fillColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFillColor:", v17);

  }
  objc_msgSend(v11, "tv_ratingStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v9, "setRatingStyle:", v18);
    objc_msgSend(v9, "setRatingStyleAXSmall:", v18);
    objc_msgSend(v9, "setRatingStyleAXLarge:", v18);
  }
  objc_msgSend(v11, "tv_valueForStyle:", CFSTR("tv-interitem-spacing"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v11, "tv_interitemSpacing");
    objc_msgSend(v9, "setInteritemSpacing:");
    objc_msgSend(v9, "interitemSpacing");
    objc_msgSend(v9, "setInteritemSpacingAXSmall:");
    objc_msgSend(v9, "interitemSpacing");
    objc_msgSend(v9, "setInteritemSpacingAXLarge:");
  }

  return v9;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
}

- (NSString)ratingStyle
{
  return self->_ratingStyle;
}

- (void)setRatingStyle:(id)a3
{
  objc_storeStrong((id *)&self->_ratingStyle, a3);
}

- (NSString)ratingStyleAXSmall
{
  return self->_ratingStyleAXSmall;
}

- (void)setRatingStyleAXSmall:(id)a3
{
  objc_storeStrong((id *)&self->_ratingStyleAXSmall, a3);
}

- (NSString)ratingStyleAXLarge
{
  return self->_ratingStyleAXLarge;
}

- (void)setRatingStyleAXLarge:(id)a3
{
  objc_storeStrong((id *)&self->_ratingStyleAXLarge, a3);
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (double)interitemSpacingAXSmall
{
  return self->_interitemSpacingAXSmall;
}

- (void)setInteritemSpacingAXSmall:(double)a3
{
  self->_interitemSpacingAXSmall = a3;
}

- (double)interitemSpacingAXLarge
{
  return self->_interitemSpacingAXLarge;
}

- (void)setInteritemSpacingAXLarge:(double)a3
{
  self->_interitemSpacingAXLarge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingStyleAXLarge, 0);
  objc_storeStrong((id *)&self->_ratingStyleAXSmall, 0);
  objc_storeStrong((id *)&self->_ratingStyle, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
