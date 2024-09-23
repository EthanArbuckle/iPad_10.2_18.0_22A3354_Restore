@implementation SKUIComposeReviewHeaderView

- (SKUIComposeReviewHeaderView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  SKUIComposeReviewHeaderView *v5;
  SKUIComposeReviewHeaderView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  SKStarRatingControl *ratingControl;
  SKStarRatingControl *v17;
  void *v18;
  void *v19;
  SKUIComposeTextFieldListView *v20;
  uint64_t v21;
  SKUIComposeTextFieldListView *textFieldListView;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SKUIComposeReviewHeaderView;
  v5 = -[SKUIComposeReviewHeaderView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star.fill"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SKGetRatingStarsImage();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SKGetRatingStarsImage();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWithTintColor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithTintColor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD8058]), "initWithBackgroundImage:foregroundImage:", v12, v14);
    ratingControl = v6->_ratingControl;
    v6->_ratingControl = (SKStarRatingControl *)v15;

    v17 = v6->_ratingControl;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("RATING_EXPLANATION"), &stru_1E73A9FB0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKStarRatingControl setExplanationText:](v17, "setExplanationText:", v19);

    -[SKStarRatingControl setStarWidth:](v6->_ratingControl, "setStarWidth:", 27.5);
    -[SKStarRatingControl setHitPadding:](v6->_ratingControl, "setHitPadding:", 70.0, 3.0);
    -[SKStarRatingControl sizeToFit](v6->_ratingControl, "sizeToFit");
    -[SKUIComposeReviewHeaderView addSubview:](v6, "addSubview:", v6->_ratingControl);
    -[SKStarRatingControl addTarget:action:forControlEvents:](v6->_ratingControl, "addTarget:action:forControlEvents:", v6, sel_starRatingControlDidUpdateValues_, 4096);
    v20 = [SKUIComposeTextFieldListView alloc];
    v21 = -[SKUIComposeTextFieldListView initWithFrame:style:](v20, "initWithFrame:style:", v6->_style, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    textFieldListView = v6->_textFieldListView;
    v6->_textFieldListView = (SKUIComposeTextFieldListView *)v21;

    -[SKUIComposeTextFieldListView setDelegate:](v6->_textFieldListView, "setDelegate:", v6);
    -[SKUIComposeTextFieldListView reloadData](v6->_textFieldListView, "reloadData");
    -[SKUIComposeReviewHeaderView addSubview:](v6, "addSubview:", v6->_textFieldListView);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIComposeTextFieldListView setDelegate:](self->_textFieldListView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIComposeReviewHeaderView;
  -[SKUIComposeReviewHeaderView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  float v6;
  double v7;
  double v8;
  double v9;

  -[SKUIComposeReviewHeaderView bounds](self, "bounds");
  v4 = v3;
  -[SKStarRatingControl frame](self->_ratingControl, "frame");
  v6 = (v4 - v5) * 0.5;
  -[SKStarRatingControl setFrame:](self->_ratingControl, "setFrame:", floorf(v6), 5.0);
  -[SKUIComposeTextFieldListView frame](self->_textFieldListView, "frame");
  v8 = v7;
  -[SKUIComposeTextFieldListView height](self->_textFieldListView, "height");
  -[SKUIComposeTextFieldListView setFrame:](self->_textFieldListView, "setFrame:", v8, 44.0, v4, v9);
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[SKUIComposeReviewHeaderView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[SKUIComposeTextFieldListView height](self->_textFieldListView, "height");
  -[SKUIComposeReviewHeaderView setFrame:](self, "setFrame:", v4, v6, v8, v9 + 44.0);
}

- (UIResponder)initialFirstResponder
{
  return -[SKUIComposeTextFieldListView initialFirstResponder](self->_textFieldListView, "initialFirstResponder");
}

- (float)rating
{
  float result;

  -[SKStarRatingControl value](self->_ratingControl, "value");
  return result;
}

- (void)setRating:(float)a3
{
  -[SKStarRatingControl setValue:](self->_ratingControl, "setValue:");
}

- (void)setReview:(id)a3
{
  SKUIReviewMetadata *review;
  SKStarRatingControl *ratingControl;
  SKUIReviewMetadata *v7;

  review = (SKUIReviewMetadata *)a3;
  v7 = review;
  if (self->_review != review)
  {
    objc_storeStrong((id *)&self->_review, a3);
    review = self->_review;
  }
  ratingControl = self->_ratingControl;
  -[SKUIReviewMetadata rating](review, "rating");
  -[SKStarRatingControl setValue:](ratingControl, "setValue:");
  -[SKUIComposeTextFieldListView reloadData](self->_textFieldListView, "reloadData");

}

- (NSString)title
{
  return (NSString *)-[SKUIComposeTextFieldListView textForFieldAtIndex:](self->_textFieldListView, "textForFieldAtIndex:", 0);
}

- (int64_t)numberOfColumnsInTextFieldList:(id)a3
{
  return 1;
}

- (int64_t)numberOfFieldsInTextFieldList:(id)a3
{
  return 1;
}

- (id)textFieldList:(id)a3 configurationForFieldAtIndex:(unint64_t)a4
{
  SKUIComposeTextFieldConfiguration *v6;
  int64_t style;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = objc_alloc_init(SKUIComposeTextFieldConfiguration);
  if (!a4)
  {
    style = self->_style;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (style == 1)
    {
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SUBJECT_LABEL"), &stru_1E73A9FB0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIComposeTextFieldConfiguration setLabel:](v6, "setLabel:", v10);
    }
    else
    {
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SUBJECT_PLACEHOLDER"), &stru_1E73A9FB0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIComposeTextFieldConfiguration setPlaceholder:](v6, "setPlaceholder:", v10);
    }

    -[SKUIComposeTextFieldConfiguration setMaxLength:](v6, "setMaxLength:", -[SKUIReviewMetadata titleMaxLength](self->_review, "titleMaxLength"));
    -[SKUIReviewMetadata title](self->_review, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIComposeTextFieldConfiguration setValue:](v6, "setValue:", v11);

  }
  return v6;
}

- (void)starRatingControlDidUpdateValues:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeHeaderViewValidityDidChange:", self);

}

- (void)starRatingButtonControlDidUpdateValues
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeHeaderViewValidityDidChange:", self);

}

- (void)textFieldListValidityDidChange:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeHeaderViewValidityDidChange:", self);

}

- (void)textFieldListValuesDidChange:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeHeaderViewValuesDidChange:", self);

}

- (int64_t)composeReviewStyle
{
  return self->_style;
}

- (SKUIComposeReviewHeaderDelegate)delegate
{
  return (SKUIComposeReviewHeaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKUIReviewMetadata)review
{
  return self->_review;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldListView, 0);
  objc_storeStrong((id *)&self->_review, 0);
  objc_storeStrong((id *)&self->_buttonRatingControl, 0);
  objc_storeStrong((id *)&self->_ratingControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
