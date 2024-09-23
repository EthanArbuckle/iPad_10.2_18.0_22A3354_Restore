@implementation RidesharingRatingView

- (RidesharingRatingView)initWithSelectedStars:(unint64_t)a3 updateBlock:(id)a4
{
  id v6;
  RidesharingRatingView *v7;
  RidesharingRatingView *v8;
  id v9;
  id updateBlock;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RidesharingRatingView;
  v7 = -[RidesharingRatingView initWithFrame:](&v12, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v8 = v7;
  if (v7)
  {
    -[RidesharingRatingView _commonInitWithStars:](v7, "_commonInitWithStars:", a3);
    v8->_stars = a3;
    v9 = objc_msgSend(v6, "copy");
    updateBlock = v8->_updateBlock;
    v8->_updateBlock = v9;

  }
  return v8;
}

- (RidesharingRatingView)initWithCoder:(id)a3
{
  RidesharingRatingView *v3;
  RidesharingRatingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RidesharingRatingView;
  v3 = -[RidesharingRatingView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[RidesharingRatingView _commonInitWithStars:](v3, "_commonInitWithStars:", 0);
  return v4;
}

- (void)_commonInitWithStars:(unint64_t)a3
{
  UIStackView *v4;
  UIStackView *stackView;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
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
  id v21;

  v4 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  stackView = self->_stackView;
  self->_stackView = v4;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 0);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 5.0);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 1);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  for (i = 0; i != 5; ++i)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("ridesharing_rating_star")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageWithRenderingMode:", 2));

    v9 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v8);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "setTag:", i);
    objc_msgSend(v9, "setContentMode:", 1);
    -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v9);

  }
  -[RidesharingRatingView addSubview:](self, "addSubview:", self->_stackView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_stackView, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingRatingView topAnchor](self, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  objc_msgSend(v12, "setActive:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_stackView, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingRatingView bottomAnchor](self, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  objc_msgSend(v15, "setActive:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](self->_stackView, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingRatingView centerXAnchor](self, "centerXAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  objc_msgSend(v18, "setActive:", 1);

  v21 = (id)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](self->_stackView, "widthAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingRatingView widthAnchor](self, "widthAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:multiplier:", v19, 1.0));
  objc_msgSend(v20, "setActive:", 1);

}

- (void)updateTheme
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = ((unint64_t)objc_msgSend(v8, "tag") & 0x8000000000000000) == 0
          && (unint64_t)objc_msgSend(v8, "tag") < self->_stars;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingRatingView theme](self, "theme"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ridesharingRatingStarColorOn:", v9));
        objc_msgSend(v8, "setTintColor:", v11);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[RidesharingRatingView handleStarTouches:withEvent:](self, "handleStarTouches:withEvent:", a3, a4);
  -[RidesharingRatingView performCallBackWithStarValue](self, "performCallBackWithStarValue");
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[RidesharingRatingView updateTheme](self, "updateTheme", a3, a4);
  -[RidesharingRatingView performCallBackWithStarValue](self, "performCallBackWithStarValue");
}

- (void)handleStarTouches:(id)a3 withEvent:(id)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  id v23;
  CGPoint v24;
  CGRect v25;

  v23 = a3;
  -[UIStackView bounds](self->_stackView, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allObjects"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));
  objc_msgSend(v14, "locationInView:", self->_stackView);
  v24.x = v15;
  v24.y = v16;
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  v17 = CGRectContainsPoint(v25, v24);

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allObjects"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));
    objc_msgSend(v19, "locationInView:", self->_stackView);
    v21 = v20;

    -[UIStackView bounds](self->_stackView, "bounds");
    self->_stars = (unint64_t)(v21 / (v22 / 5.0) + 1.0);
    -[RidesharingRatingView updateTheme](self, "updateTheme");
  }

}

- (void)performCallBackWithStarValue
{
  void (**updateBlock)(id, unint64_t);

  updateBlock = (void (**)(id, unint64_t))self->_updateBlock;
  if (updateBlock)
    updateBlock[2](self->_updateBlock, self->_stars);
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RidesharingRatingView\nStars:%lu"), self->_stars);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
