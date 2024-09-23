@implementation SKUIStarRatingButtonControl

- (SKUIStarRatingButtonControl)init
{
  SKUIStarRatingButtonControl *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIStarRatingButtonControl;
  v2 = -[SKUIStarRatingButtonControl initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStarRatingButtonControl setButtons:](v2, "setButtons:", v3);

    -[SKUIStarRatingButtonControl populate](v2, "populate");
  }
  return v2;
}

- (void)populate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
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
  void *v66;
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
  id v79;

  -[SKUIStarRatingButtonControl setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v79 = (id)objc_opt_new();
  objc_msgSend(v79, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setBackgroundColor:", v3);

  v4 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 11.0);
  objc_msgSend(v4, "systemFontOfSize:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setTextColor:", v6);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RATING_EXPLANATION"), &stru_1E73A9FB0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setText:", v8);

  -[SKUIStarRatingButtonControl addSubview:](self, "addSubview:", v79);
  objc_msgSend(v79, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStarRatingButtonControl topAnchor](self, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 1;
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(v79, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStarRatingButtonControl centerXAnchor](self, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  do
  {
    v16 = objc_alloc_init(MEMORY[0x1E0DC3518]);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("star"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:forState:", v18, 0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAccessibilityIdentifier:", v19);

    objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 8.0);
    v21 = v20;
    objc_msgSend(v16, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCornerRadius:", v21);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTintColor:", v23);

    objc_msgSend(v16, "setUserInteractionEnabled:", 1);
    objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel__starButtonTapped_, 64);
    -[SKUIStarRatingButtonControl buttons](self, "buttons");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v16);

    ++v12;
  }
  while (v12 != 6);
  -[SKUIStarRatingButtonControl buttons](self, "buttons");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndex:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SKUIStarRatingButtonControl addSubview:](self, "addSubview:", v26);
  objc_msgSend(v26, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStarRatingButtonControl leadingAnchor](self, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 1;
  objc_msgSend(v29, "setActive:", 1);

  objc_msgSend(v26, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 12.0);
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  objc_msgSend(v26, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStarRatingButtonControl bottomAnchor](self, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 8.0);
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, -v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  objc_msgSend(v26, "widthAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 36.0, 44.0);
  objc_msgSend(v38, "constraintEqualToConstant:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

  objc_msgSend(v26, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 36.0, 44.0);
  objc_msgSend(v40, "constraintEqualToConstant:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  do
  {
    -[SKUIStarRatingButtonControl buttons](self, "buttons");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectAtIndex:", v30 - 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIStarRatingButtonControl buttons](self, "buttons");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectAtIndex:", v30);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SKUIStarRatingButtonControl addSubview:](self, "addSubview:", v45);
    objc_msgSend(v45, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setActive:", 1);

    objc_msgSend(v45, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setActive:", 1);

    objc_msgSend(v45, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setActive:", 1);

    objc_msgSend(v45, "widthAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 36.0);
    objc_msgSend(v55, "constraintEqualToConstant:");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setActive:", 1);

    objc_msgSend(v45, "heightAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 36.0);
    objc_msgSend(v57, "constraintEqualToConstant:");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setActive:", 1);

    ++v30;
  }
  while (v30 != 4);
  -[SKUIStarRatingButtonControl buttons](self, "buttons");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "objectAtIndex:", 3);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIStarRatingButtonControl buttons](self, "buttons");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectAtIndex:", 4);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v62, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SKUIStarRatingButtonControl addSubview:](self, "addSubview:", v62);
  objc_msgSend(v62, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setActive:", 1);

  objc_msgSend(v62, "topAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setActive:", 1);

  objc_msgSend(v62, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setActive:", 1);

  objc_msgSend(v62, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStarRatingButtonControl trailingAnchor](self, "trailingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setActive:", 1);

  objc_msgSend(v62, "widthAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 36.0);
  objc_msgSend(v75, "constraintEqualToConstant:");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setActive:", 1);

  objc_msgSend(v62, "heightAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 36.0);
  objc_msgSend(v77, "constraintEqualToConstant:");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setActive:", 1);

}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)a3
{
  -[SKUIStarRatingButtonControl _updateForButtonIdentifier:](self, "_updateForButtonIdentifier:", (uint64_t)(float)(a3 * 5.0));
}

- (void)_starButtonTapped:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a3, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  -[SKUIStarRatingButtonControl _updateForButtonIdentifier:](self, "_updateForButtonIdentifier:", v5);
  -[SKUIStarRatingButtonControl delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "starRatingButtonControlDidUpdateValues");

}

- (void)_updateForButtonIdentifier:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  unint64_t v14;

  -[SKUIStarRatingButtonControl buttons](self, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      -[SKUIStarRatingButtonControl buttons](self, "buttons");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 >= a3)
        v11 = CFSTR("star");
      else
        v11 = CFSTR("star.fill");
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImage:forState:", v12, 0);

      ++v7;
      -[SKUIStarRatingButtonControl buttons](self, "buttons");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

    }
    while (v7 < v14);
  }
  self->_value = (float)a3 / 5.0;
}

- (SKUIStarRatingButtonControlDelegate)delegate
{
  return (SKUIStarRatingButtonControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
