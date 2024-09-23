@implementation SKUIReviewInAppRatingButtonViewController

- (SKUIReviewInAppRatingButtonViewController)initWithTitle:(id)a3 style:(unint64_t)a4
{
  id v7;
  SKUIReviewInAppRatingButtonViewController *v8;
  SKUIReviewInAppRatingButtonViewController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKUIReviewInAppRatingButtonViewController;
  v8 = -[SKUIReviewInAppRatingButtonViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_titleString, a3);
    v9->_style = a4;
    v9->_enabled = 1;
  }

  return v9;
}

- (void)viewDidLoad
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)SKUIReviewInAppRatingButtonViewController;
  -[SKUIReviewInAppRatingButtonViewController viewDidLoad](&v28, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingButtonViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc(MEMORY[0x1E0DC3990]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SKUIReviewInAppRatingButtonViewController titleString](self, "titleString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

  -[SKUIReviewInAppRatingButtonViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v9);

  if (-[SKUIReviewInAppRatingButtonViewController style](self, "style") == 1)
  {
    v10 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v6, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pointSize");
    objc_msgSend(v10, "boldSystemFontOfSize:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v12);

  }
  objc_msgSend(v6, "setTextAlignment:", 1);
  -[SKUIReviewInAppRatingButtonViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v6);

  -[SKUIReviewInAppRatingButtonViewController setTitleLabel:](self, "setTitleLabel:", v6);
  v23 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v6, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingButtonViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v24;
  objc_msgSend(v6, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingButtonViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v17;
  objc_msgSend(v6, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingButtonViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v22);

}

- (void)setEnabled:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  void *v6;
  id v7;

  v4 = a3;
  self->_enabled = a3;
  if (a3)
  {
    -[SKUIReviewInAppRatingButtonViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tintColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  }
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingButtonViewController titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

  if (v4)
  {

    v7 = v3;
  }

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end
