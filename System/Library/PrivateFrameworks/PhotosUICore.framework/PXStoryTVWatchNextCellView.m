@implementation PXStoryTVWatchNextCellView

- (PXStoryTVWatchNextCellView)initWithFrame:(CGRect)a3
{
  PXStoryTVWatchNextCellView *v3;
  PXStoryTVWatchNextCellView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  PXGradientView *v10;
  PXGradientView *gradientView;
  void *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *titleLabel;
  void *v17;
  UILabel *v18;
  UILabel *subtitleLabel;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;
  _QWORD v48[6];
  _QWORD v49[4];

  v49[2] = *MEMORY[0x1E0C80C00];
  v47.receiver = self;
  v47.super_class = (Class)PXStoryTVWatchNextCellView;
  v3 = -[PXGFocusEffectView initWithFrame:](&v47, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXGFocusEffectView contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v10 = -[PXGradientView initWithFrame:]([PXGradientView alloc], "initWithFrame:", v6, v7, v8, v9);
    gradientView = v4->_gradientView;
    v4->_gradientView = v10;

    objc_msgSend(v5, "addSubview:", v4->_gradientView);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "colorWithAlphaComponent:", 0.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "colorWithAlphaComponent:", 0.5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v49[0] = v46;
    v49[1] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGradientView setColors:](v4->_gradientView, "setColors:", v14);

    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v15;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v17);

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 2);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v4->_titleLabel);
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v18;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v20);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v21 = v5;
    objc_msgSend(v5, "addSubview:", v4->_subtitleLabel);
    v38 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 20.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v42;
    -[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, -20.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v39;
    -[UILabel lastBaselineAnchor](v4->_titleLabel, "lastBaselineAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v4->_subtitleLabel, "firstBaselineAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, -23.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v35;
    -[UILabel leadingAnchor](v4->_subtitleLabel, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v23;
    -[UILabel trailingAnchor](v4->_subtitleLabel, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v21;
    v34 = v21;
    objc_msgSend(v21, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, -20.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v48[4] = v27;
    -[UILabel lastBaselineAnchor](v4->_subtitleLabel, "lastBaselineAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -20.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v48[5] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "activateConstraints:", v31);

  }
  return v4;
}

- (void)layoutSubviews
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIImageView *v21;
  UIImageView *v22;
  _PXStoryShapeView *v23;
  UIImageView *v24;
  _PXStoryShapeView *v25;
  void *v26;
  uint64_t v27;
  _PXStoryShapeView *v28;
  UIImageView *v29;
  id v30;
  _PXStoryShapeView *v31;
  _PXStoryShapeView *countdownRing;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  UIImageView *v39;
  UIImageView *countdownImage;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  UIImageView *v45;
  _PXStoryShapeView *v46;
  _QWORD v47[4];
  UIImageView *v48;
  _PXStoryShapeView *v49;
  _QWORD v50[5];
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)PXStoryTVWatchNextCellView;
  -[PXGFocusEffectView layoutSubviews](&v51, sel_layoutSubviews);
  -[PXGFocusEffectView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PXGFocusableView userData](self, "userData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGradientView setFrame:](self->_gradientView, "setFrame:", v5, v7, v9, v11);
  objc_msgSend(v12, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "spec");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "attributedStringForTitle:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v16);

  }
  else
  {
    -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", 0);
  }

  objc_msgSend(v12, "subtitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v12, "spec");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subtitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "attributedStringForSubtitle:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v20);

  }
  else
  {
    -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", 0);
  }

  if (v12 && objc_msgSend(v12, "countdownValue") != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!self->_countdownImage)
    {
      v31 = objc_alloc_init(_PXStoryShapeView);
      countdownRing = self->_countdownRing;
      self->_countdownRing = v31;

      -[_PXStoryShapeView setCenter:](self->_countdownRing, "setCenter:", 51.0, 51.0);
      -[_PXStoryShapeView setBounds:](self->_countdownRing, "setBounds:", 0.0, 0.0, 62.0, 62.0);
      -[PXGFocusEffectView contentView](self, "contentView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addSubview:", self->_countdownRing);

      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "moveToPoint:", 31.0, 0.0);
      objc_msgSend(v34, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 31.0, 31.0, 31.0, 4.72238898, 4.70238898);
      objc_msgSend(v34, "closePath");
      -[_PXStoryShapeView layer](self->_countdownRing, "layer");
      v28 = (_PXStoryShapeView *)objc_claimAutoreleasedReturnValue();
      v29 = objc_retainAutorelease(v34);
      -[_PXStoryShapeView setPath:](v28, "setPath:", -[UIImageView CGPath](v29, "CGPath"));
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "colorWithAlphaComponent:", 0.5);
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[_PXStoryShapeView setFillColor:](v28, "setFillColor:", objc_msgSend(v36, "CGColor"));

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[_PXStoryShapeView setStrokeColor:](v28, "setStrokeColor:", objc_msgSend(v37, "CGColor"));

      -[_PXStoryShapeView setLineWidth:](v28, "setLineWidth:", 4.0);
      -[_PXStoryShapeView setLineCap:](v28, "setLineCap:", *MEMORY[0x1E0CD3010]);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setTimingFunction:", v38);

      objc_msgSend(v30, "setDuration:", (double)objc_msgSend(v12, "countdownValue") + 1.0);
      objc_msgSend(v30, "setToValue:", &unk_1E53EE0D0);
      objc_msgSend(v30, "setFromValue:", &unk_1E53EE0E8);
      objc_msgSend(v30, "setRemovedOnCompletion:", 0);
      objc_msgSend(v30, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      -[_PXStoryShapeView addAnimation:forKey:](v28, "addAnimation:forKey:", v30, CFSTR("strokeEnd"));
      v39 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      countdownImage = self->_countdownImage;
      self->_countdownImage = v39;

      -[UIImageView setCenter:](self->_countdownImage, "setCenter:", 51.0, 51.0);
      -[UIImageView setBounds:](self->_countdownImage, "setBounds:", 0.0, 0.0, 25.0, 25.0);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](self->_countdownImage, "setTintColor:", v41);

      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("play.fill"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_countdownImage, "setImage:", v42);

      -[PXGFocusEffectView contentView](self, "contentView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addSubview:", self->_countdownImage);

      -[_PXStoryShapeView setAlpha:](self->_countdownRing, "setAlpha:", 0.0);
      -[UIImageView setAlpha:](self->_countdownImage, "setAlpha:", 0.0);
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __44__PXStoryTVWatchNextCellView_layoutSubviews__block_invoke;
      v50[3] = &unk_1E5149198;
      v50[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v50, 0.5);
      goto LABEL_13;
    }
  }
  else
  {
    v21 = self->_countdownImage;
    if (v21)
    {
      v22 = v21;
      v23 = self->_countdownRing;
      v24 = self->_countdownImage;
      self->_countdownImage = 0;

      v25 = self->_countdownRing;
      self->_countdownRing = 0;

      v26 = (void *)MEMORY[0x1E0DC3F10];
      v27 = MEMORY[0x1E0C809B0];
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __44__PXStoryTVWatchNextCellView_layoutSubviews__block_invoke_2;
      v47[3] = &unk_1E5148D08;
      v48 = v22;
      v49 = v23;
      v44[0] = v27;
      v44[1] = 3221225472;
      v44[2] = __44__PXStoryTVWatchNextCellView_layoutSubviews__block_invoke_3;
      v44[3] = &unk_1E5144558;
      v45 = v48;
      v46 = v49;
      v28 = v49;
      v29 = v48;
      objc_msgSend(v26, "animateWithDuration:animations:completion:", v47, v44, 0.5);

      v30 = v48;
LABEL_13:

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countdownRing, 0);
  objc_storeStrong((id *)&self->_countdownImage, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
}

uint64_t __44__PXStoryTVWatchNextCellView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setAlpha:", 1.0);
}

uint64_t __44__PXStoryTVWatchNextCellView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __44__PXStoryTVWatchNextCellView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

@end
