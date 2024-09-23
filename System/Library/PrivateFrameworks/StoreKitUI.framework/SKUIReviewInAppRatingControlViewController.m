@implementation SKUIReviewInAppRatingControlViewController

- (SKUIReviewInAppRatingControlViewController)initWithCoder:(id)a3
{
  SKUIReviewInAppRatingControlViewController *v3;
  SKUIReviewInAppRatingControlViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUIReviewInAppRatingControlViewController;
  v3 = -[SKUIReviewInAppRatingControlViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[SKUIReviewInAppRatingControlViewController commonInit](v3, "commonInit");
  return v4;
}

- (SKUIReviewInAppRatingControlViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SKUIReviewInAppRatingControlViewController *v4;
  SKUIReviewInAppRatingControlViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIReviewInAppRatingControlViewController;
  v4 = -[SKUIReviewInAppRatingControlViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[SKUIReviewInAppRatingControlViewController commonInit](v4, "commonInit");
  return v5;
}

- (void)commonInit
{
  SKUIStarRatingControl *v3;
  SKUIStarRatingControl *ratingControl;

  v3 = objc_alloc_init(SKUIStarRatingControl);
  ratingControl = self->_ratingControl;
  self->_ratingControl = v3;

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double v5;
  double v6;
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
  double v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)SKUIReviewInAppRatingControlViewController;
  -[SKUIReviewInAppRatingControlViewController viewDidLoad](&v20, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  *(float *)&v5 = v5;
  -[SKUIStarRatingControl setStarWidth:](self->_ratingControl, "setStarWidth:", v5);
  LODWORD(v6) = 20.0;
  -[SKUIStarRatingControl setStarSpacing:](self->_ratingControl, "setStarSpacing:", v6);
  -[SKUIReviewInAppRatingControlViewController ratingControl](self, "ratingControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingControlViewController _repeatedTemplateImageForImage:](self, "_repeatedTemplateImageForImage:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEmptyStarsImage:", v8);

  -[SKUIReviewInAppRatingControlViewController ratingControl](self, "ratingControl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingControlViewController _repeatedTemplateImageForImage:](self, "_repeatedTemplateImageForImage:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFilledStarsImage:", v10);

  -[SKUIReviewInAppRatingControlViewController ratingControl](self, "ratingControl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserInteractionEnabled:", 1);

  -[SKUIReviewInAppRatingControlViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingControlViewController ratingControl](self, "ratingControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  -[SKUIReviewInAppRatingControlViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToConstant:", 44.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v17) = 1148829696;
  objc_msgSend(v16, "setPriority:", v17);
  v18 = (void *)MEMORY[0x1E0CB3718];
  v21[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v19);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SKUIReviewInAppRatingControlViewController;
  -[SKUIReviewInAppRatingControlViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[SKUIReviewInAppRatingControlViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SKUIReviewInAppRatingControlViewController ratingControl](self, "ratingControl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[SKUIReviewInAppRatingControlViewController ratingControl](self, "ratingControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v4 = v3;

  v5 = 44.0;
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (id)_repeatedTemplateImageForImage:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  void *v8;
  double v9;
  CGFloat v10;
  unint64_t i;
  void *v12;
  void *v13;
  CGSize v15;

  v3 = a3;
  objc_msgSend(v3, "size");
  v5 = v4;
  objc_msgSend(v3, "size");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;
  v15.width = v5 * 5.0 + 80.0;
  v15.height = v7;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v10);

  for (i = 0; i != 5; ++i)
    objc_msgSend(v3, "drawAtPoint:", (float)((float)i * 20.0) + (double)i * v5, 0.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v12, "imageWithRenderingMode:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (SKUIStarRatingControl)ratingControl
{
  return self->_ratingControl;
}

- (void)setRatingControl:(id)a3
{
  objc_storeStrong((id *)&self->_ratingControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingControl, 0);
}

@end
