@implementation SKUIComposeReviewSampleCardView

- (SKUIComposeReviewSampleCardView)initWithFrame:(CGRect)a3
{
  SKUIComposeReviewSampleCardView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUIComposeReviewSampleCardView;
  v3 = -[SKUIComposeReviewSampleCardView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIComposeReviewSampleCardView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[SKUIComposeReviewSampleCardView _setupView](v3, "_setupView");
  }
  return v3;
}

- (void)_setupView
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;

  -[SKUIComposeReviewSampleCardView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerRadius:", 12.0);

  -[SKUIComposeReviewSampleCardView setClipsToBounds:](self, "setClipsToBounds:", 0);
  v106 = (id)objc_opt_new();
  objc_msgSend(v106, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 5.0);
  v6 = v5;
  objc_msgSend(v106, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v6);

  -[SKUIComposeReviewSampleCardView addSubview:](self, "addSubview:", v106);
  objc_msgSend(v106, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewSampleCardView topAnchor](self, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 16.0);
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  objc_msgSend(v106, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewSampleCardView leadingAnchor](self, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 20.0, 24.0);
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  objc_msgSend(v106, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", 66.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  objc_msgSend(v106, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 11.0, 14.0);
  objc_msgSend(v16, "constraintEqualToConstant:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SKUIComposeReviewSampleCardView addSubview:](self, "addSubview:", v18);
  objc_msgSend(v18, "layoutSubviews");
  objc_msgSend(v18, "firstBaselineAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewSampleCardView topAnchor](self, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 50.0, 60.0);
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  objc_msgSend(v18, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewSampleCardView leadingAnchor](self, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 20.0, 24.0);
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  SKUIFontLimitedPreferredFontForTextStyle(11, 7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFont:", v26);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTextColor:", v27);

  -[SKUIComposeReviewSampleCardView addSubview:](self, "addSubview:", v25);
  objc_msgSend(v25, "firstBaselineAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstBaselineAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 5.0, 7.0);
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  objc_msgSend(v25, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewSampleCardView trailingAnchor](self, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 20.0, 24.0);
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, -v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  objc_msgSend(v25, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewSampleCardView centerXAnchor](self, "centerXAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 20.0, 24.0);
  objc_msgSend(v35, "constraintGreaterThanOrEqualToAnchor:constant:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("NICKNAME_VIEW_PLACEHOLDER"), &stru_1E73A9FB0, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setText:", v39);

  v40 = (void *)objc_opt_new();
  objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v41 = (void *)MEMORY[0x1E0DC3888];
  SKUIFontLimitedPreferredFontForTextStyle(30, 7);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "configurationWithFont:", v42);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "imageNamed:inBundle:", CFSTR("arrow.backward.extended"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "imageWithSymbolConfiguration:", v105);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "setImage:", v104);
  -[SKUIComposeReviewSampleCardView addSubview:](self, "addSubview:", v40);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTintColor:", v46);

  objc_msgSend(v40, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, 14.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  objc_msgSend(v40, "centerYAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "centerYAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

  v53 = (void *)objc_opt_new();
  objc_msgSend(v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setBackgroundColor:", v54);

  objc_msgSend(v53, "layer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setCornerRadius:", 5.0);

  -[SKUIComposeReviewSampleCardView addSubview:](self, "addSubview:", v53);
  objc_msgSend(v53, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstBaselineAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 13.0, 17.0);
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setActive:", 1);

  objc_msgSend(v53, "widthAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 222.0, 288.0);
  objc_msgSend(v59, "constraintEqualToConstant:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setActive:", 1);

  objc_msgSend(v53, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewSampleCardView leadingAnchor](self, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 20.0, 24.0);
  objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setActive:", 1);

  objc_msgSend(v53, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewSampleCardView trailingAnchor](self, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 20.0, 24.0);
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, -v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setActive:", 1);

  objc_msgSend(v53, "heightAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 11.0, 14.0);
  objc_msgSend(v68, "constraintEqualToConstant:");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setActive:", 1);

  v70 = (void *)objc_opt_new();
  objc_msgSend(v70, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setBackgroundColor:", v71);

  objc_msgSend(v70, "layer");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setCornerRadius:", 5.0);

  -[SKUIComposeReviewSampleCardView addSubview:](self, "addSubview:", v70);
  objc_msgSend(v70, "topAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "bottomAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 7.0, 9.0);
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setActive:", 1);

  objc_msgSend(v70, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewSampleCardView leadingAnchor](self, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 20.0, 24.0);
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setActive:", 1);

  objc_msgSend(v70, "trailingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewSampleCardView trailingAnchor](self, "trailingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 20.0, 24.0);
  objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80, -v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setActive:", 1);

  objc_msgSend(v70, "heightAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 11.0, 14.0);
  objc_msgSend(v83, "constraintEqualToConstant:");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setActive:", 1);

  v85 = (void *)objc_opt_new();
  objc_msgSend(v85, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setBackgroundColor:", v86);

  objc_msgSend(v85, "layer");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setCornerRadius:", 5.0);

  -[SKUIComposeReviewSampleCardView addSubview:](self, "addSubview:", v85);
  objc_msgSend(v85, "topAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "bottomAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 7.0, 9.0);
  objc_msgSend(v88, "constraintEqualToAnchor:constant:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setActive:", 1);

  objc_msgSend(v85, "leadingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewSampleCardView leadingAnchor](self, "leadingAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 20.0, 24.0);
  objc_msgSend(v91, "constraintEqualToAnchor:constant:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setActive:", 1);

  objc_msgSend(v85, "trailingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewSampleCardView trailingAnchor](self, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 20.0, 24.0);
  objc_msgSend(v94, "constraintEqualToAnchor:constant:", v95, -v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setActive:", 1);

  objc_msgSend(v85, "heightAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 11.0, 14.0);
  objc_msgSend(v98, "constraintEqualToConstant:");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setActive:", 1);

  objc_msgSend(v85, "bottomAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewSampleCardView bottomAnchor](self, "bottomAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 20.0, 24.0);
  objc_msgSend(v100, "constraintEqualToAnchor:constant:", v101, -v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setActive:", 1);

}

@end
