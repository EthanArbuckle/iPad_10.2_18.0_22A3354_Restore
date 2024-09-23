@implementation SKUIReviewInAppRatingHeaderView

- (SKUIReviewInAppRatingHeaderView)initWithTitle:(id)a3 message:(id)a4 icon:(id)a5
{
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  SKUIReviewInAppRatingHeaderView *v16;
  uint64_t v17;
  UIImageView *imageView;
  uint64_t v19;
  UILabel *titleLabel;
  void *v21;
  uint64_t v22;
  UILabel *messageLabel;
  void *v24;
  SKUIStarRatingControl *v25;
  SKUIStarRatingControl *ratingView;
  SKUIStarRatingControl *v27;
  void *v28;
  void *v29;
  void *v30;
  SKUIStarRatingControl *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)SKUIReviewInAppRatingHeaderView;
  v12 = *MEMORY[0x1E0C9D648];
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v16 = -[SKUIReviewInAppRatingHeaderView initWithFrame:](&v36, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v13, v14, v15);
  if (v16)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v12, v13, v14, v15);
    imageView = v16->_imageView;
    v16->_imageView = (UIImageView *)v17;

    -[UIImageView setImage:](v16->_imageView, "setImage:", v11);
    -[SKUIReviewInAppRatingHeaderView addSubview:](v16, "addSubview:", v16->_imageView);
    objc_storeStrong((id *)&v16->_title, a3);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v12, v13, v14, v15);
    titleLabel = v16->_titleLabel;
    v16->_titleLabel = (UILabel *)v19;

    -[SKUIReviewInAppRatingHeaderView _titleLabelFont](v16, "_titleLabelFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v16->_titleLabel, "setFont:", v21);

    -[UILabel setText:](v16->_titleLabel, "setText:", v9);
    -[UILabel setNumberOfLines:](v16->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v16->_titleLabel, "setTextAlignment:", 1);
    -[SKUIReviewInAppRatingHeaderView addSubview:](v16, "addSubview:", v16->_titleLabel);
    objc_storeStrong((id *)&v16->_message, a4);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v12, v13, v14, v15);
    messageLabel = v16->_messageLabel;
    v16->_messageLabel = (UILabel *)v22;

    -[SKUIReviewInAppRatingHeaderView _messageLabelFont](v16, "_messageLabelFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v16->_messageLabel, "setFont:", v24);

    -[UILabel setText:](v16->_messageLabel, "setText:", v10);
    -[UILabel setNumberOfLines:](v16->_messageLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v16->_messageLabel, "setTextAlignment:", 1);
    -[SKUIReviewInAppRatingHeaderView addSubview:](v16, "addSubview:", v16->_messageLabel);
    v25 = objc_alloc_init(SKUIStarRatingControl);
    ratingView = v16->_ratingView;
    v16->_ratingView = v25;

    v27 = v16->_ratingView;
    v28 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "imageNamed:inBundle:", CFSTR("LightRateControl"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStarRatingControl setEmptyStarsImage:](v27, "setEmptyStarsImage:", v30);

    v31 = v16->_ratingView;
    v32 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "imageNamed:inBundle:", CFSTR("RateControlFilled"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStarRatingControl setFilledStarsImage:](v31, "setFilledStarsImage:", v34);

    -[SKUIStarRatingControl setUserInteractionEnabled:](v16->_ratingView, "setUserInteractionEnabled:", 0);
    -[SKUIReviewInAppRatingHeaderView addSubview:](v16, "addSubview:", v16->_ratingView);
  }

  return v16;
}

- (void)setCompletedWithRating:(int64_t)a3
{
  void *v5;

  -[SKUIReviewInAppRatingHeaderView ratingView](self, "ratingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserRating:", a3);

  -[SKUIReviewInAppRatingHeaderView setCompleted:](self, "setCompleted:", 1);
}

- (void)setCompleted:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (self->_completed != a3)
  {
    v4 = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IN_APP_REVIEW_SUCCESSFUL_TITLE"), &stru_1E73A9FB0, 0);
    }
    else
    {
      -[SKUIReviewInAppRatingHeaderView title](self, "title");
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIReviewInAppRatingHeaderView titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    if (v4)
    {

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IN_APP_REVIEW_SUCCESSFUL_MESSAGE"), &stru_1E73A9FB0, 0);
    }
    else
    {
      -[SKUIReviewInAppRatingHeaderView message](self, "message");
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIReviewInAppRatingHeaderView messageLabel](self, "messageLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    if (v4)
    {

      v8 = v3;
    }

    -[SKUIReviewInAppRatingHeaderView setNeedsLayout](self, "setNeedsLayout");
    -[SKUIReviewInAppRatingHeaderView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    self->_completed = v4;
  }
}

- (void)setContentSize:(CGSize)a3
{
  if (self->_contentSize.width != a3.width || self->_contentSize.height != a3.height)
  {
    self->_contentSize = a3;
    -[SKUIReviewInAppRatingHeaderView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  -[SKUIReviewInAppRatingHeaderView contentSize](self, "contentSize", a3.width, a3.height);
  if (*MEMORY[0x1E0C9D820] == v6 && *(double *)(MEMORY[0x1E0C9D820] + 8) == v5)
  {
    v10 = 170.0;
  }
  else
  {
    -[SKUIReviewInAppRatingHeaderView contentSize](self, "contentSize");
    width = v8;
    -[SKUIReviewInAppRatingHeaderView contentSize](self, "contentSize");
    v10 = fmax(v9, 170.0);
  }
  v11 = width;
  result.height = v10;
  result.width = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[SKUIReviewInAppRatingHeaderView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double (**v7)(_QWORD, double, double, double);
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat MinY;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double MaxY;
  BOOL v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  BOOL v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  _QWORD aBlock[4];
  CGRect v71;
  objc_super v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  v72.receiver = self;
  v72.super_class = (Class)SKUIReviewInAppRatingHeaderView;
  -[SKUIReviewInAppRatingHeaderView layoutSubviews](&v72, sel_layoutSubviews);
  -[SKUIReviewInAppRatingHeaderView bounds](self, "bounds");
  v74 = CGRectInset(v73, 20.0, 20.0);
  x = v74.origin.x;
  y = v74.origin.y;
  width = v74.size.width;
  height = v74.size.height;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__SKUIReviewInAppRatingHeaderView_layoutSubviews__block_invoke;
  aBlock[3] = &__block_descriptor_64_e52__CGRect__CGPoint_dd__CGSize_dd__32__0_CGSize_dd_8d24l;
  v71 = v74;
  v7 = (double (**)(_QWORD, double, double, double))_Block_copy(aBlock);
  -[SKUIReviewInAppRatingHeaderView imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width, height);
  v10 = v9;
  v12 = v11;

  v75.origin.x = x;
  v75.origin.y = y;
  v75.size.width = width;
  v69 = width;
  v75.size.height = height;
  MinY = CGRectGetMinY(v75);
  v14 = v7[2](v7, v10, v12, MinY);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[SKUIReviewInAppRatingHeaderView imageView](self, "imageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  -[SKUIReviewInAppRatingHeaderView titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sizeThatFits:", width, height);
  v24 = v23;
  v26 = v25;

  v76.origin.x = v14;
  v76.origin.y = v16;
  v76.size.width = v18;
  v76.size.height = v20;
  MaxY = CGRectGetMaxY(v76);
  v77.origin.x = v14;
  v77.origin.y = v16;
  v77.size.width = v18;
  v77.size.height = v20;
  v28 = CGRectGetHeight(v77) <= 0.0;
  v29 = 15.0;
  if (v28)
    v29 = 0.0;
  v30 = v7[2](v7, v24, v26, MaxY + v29);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  -[SKUIReviewInAppRatingHeaderView titleLabel](self, "titleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", v30, v32, v34, v36);

  -[SKUIReviewInAppRatingHeaderView messageLabel](self, "messageLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "sizeThatFits:", v69, height);
  v40 = v39;
  v42 = v41;

  v78.origin.x = v30;
  v78.origin.y = v32;
  v78.size.width = v34;
  v78.size.height = v36;
  v43 = CGRectGetMaxY(v78);
  v79.origin.x = v30;
  v79.origin.y = v32;
  v79.size.width = v34;
  v79.size.height = v36;
  v28 = CGRectGetHeight(v79) <= 0.0;
  v44 = 2.0;
  if (v28)
    v44 = 0.0;
  v45 = v7[2](v7, v40, v42, v43 + v44);
  v47 = v46;
  v49 = v48;
  v51 = v50;
  -[SKUIReviewInAppRatingHeaderView messageLabel](self, "messageLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

  v53 = -[SKUIReviewInAppRatingHeaderView completed](self, "completed");
  -[SKUIReviewInAppRatingHeaderView ratingView](self, "ratingView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v53)
  {
    objc_msgSend(v54, "sizeToFit");

    -[SKUIReviewInAppRatingHeaderView ratingView](self, "ratingView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "frame");
    v58 = v57;
    v60 = v59;

    v80.origin.x = v45;
    v80.origin.y = v47;
    v80.size.width = v49;
    v80.size.height = v51;
    v61 = CGRectGetMaxY(v80);
    v81.origin.x = v45;
    v81.origin.y = v47;
    v81.size.width = v49;
    v81.size.height = v51;
    v28 = CGRectGetHeight(v81) <= 0.0;
    v62 = 6.0;
    if (v28)
      v62 = 0.0;
    v45 = v7[2](v7, v58, v60, v61 + v62);
    v47 = v63;
    v49 = v64;
    v51 = v65;
    -[SKUIReviewInAppRatingHeaderView ratingView](self, "ratingView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setFrame:", v45, v47, v49, v51);

    -[SKUIReviewInAppRatingHeaderView ratingView](self, "ratingView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setAlpha:", 1.0);
    v67 = 11.0;
  }
  else
  {
    objc_msgSend(v54, "setAlpha:", 0.0);
    v67 = 20.0;
  }

  v82.origin.x = v45;
  v82.origin.y = v47;
  v82.size.width = v49;
  v82.size.height = v51;
  v68 = v67 + CGRectGetMaxY(v82);
  -[SKUIReviewInAppRatingHeaderView bounds](self, "bounds");
  -[SKUIReviewInAppRatingHeaderView setContentSize:](self, "setContentSize:", CGRectGetWidth(v83), v68);

}

double __49__SKUIReviewInAppRatingHeaderView_layoutSubviews__block_invoke(CGRect *a1, double a2)
{
  CGFloat v2;
  void *v3;
  double v4;
  double v5;

  v2 = CGRectGetMidX(a1[1]) + a2 * -0.5;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  return round(v2 * v5) / v5;
}

- (id)_titleLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AD0], 0, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_messageLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B08], 0x8000, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (SKUIStarRatingControl)ratingView
{
  return self->_ratingView;
}

- (void)setRatingView:(id)a3
{
  objc_storeStrong((id *)&self->_ratingView, a3);
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
