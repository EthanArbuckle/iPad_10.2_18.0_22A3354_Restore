@implementation PXSearchTapToRadarFooter

- (PXSearchTapToRadarFooter)initWithFrame:(CGRect)a3
{
  PXSearchTapToRadarFooter *result;
  objc_class *v4;
  PXSearchTapToRadarFooter *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;
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
  UILabel *tapToRadarAppleInternalLabel;
  UILabel *v25;
  UILabel *tapToRadarDescriptionLabel;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  UILabel *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  PXSearchTapToRadarFooter *v53;
  objc_super v54;
  _QWORD v55[12];

  v55[10] = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)PXSearchTapToRadarFooter;
  result = -[PXSearchTapToRadarFooter initWithFrame:](&v54, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    v4 = (objc_class *)MEMORY[0x1E0DC3990];
    v53 = result;
    v5 = result;
    v6 = (UILabel *)objc_alloc_init(v4);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = v6;
    -[UILabel setTextAlignment:](v6, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v52, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7, "setTextColor:", v10);

    -[UILabel setAdjustsFontForContentSizeCategory:](v7, "setAdjustsFontForContentSizeCategory:", 1);
    -[PXSearchTapToRadarFooter addSubview:](v5, "addSubview:", v7);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v11, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v11, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v11, "setLineBreakMode:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11, "setTextColor:", v13);

    -[UILabel setAdjustsFontForContentSizeCategory:](v11, "setAdjustsFontForContentSizeCategory:", 1);
    -[PXSearchTapToRadarFooter addSubview:](v5, "addSubview:", v11);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v14, "setTitle:forState:", CFSTR("File Radar"), 0);
    objc_msgSend(v14, "addTarget:action:forControlEvents:", v5, sel__didSelectTapToRadarButton, 64);
    -[PXSearchTapToRadarFooter addSubview:](v5, "addSubview:", v14);
    -[UILabel topAnchor](v7, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchTapToRadarFooter topAnchor](v5, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v50, 1.25);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v49;
    -[UILabel centerXAnchor](v7, "centerXAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchTapToRadarFooter centerXAnchor](v5, "centerXAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v45;
    -[UILabel topAnchor](v11, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v7;
    -[UILabel bottomAnchor](v7, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v43, 1.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v42;
    -[UILabel centerXAnchor](v11, "centerXAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerXAnchor](v7, "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v55[3] = v39;
    -[UILabel widthAnchor](v11, "widthAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchTapToRadarFooter widthAnchor](v5, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintLessThanOrEqualToAnchor:multiplier:", v36, 0.75);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v55[4] = v35;
    objc_msgSend(v14, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v11, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v33, 1.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v55[5] = v32;
    objc_msgSend(v14, "centerXAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerXAnchor](v11, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v55[6] = v28;
    objc_msgSend(v14, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchTapToRadarFooter leadingAnchor](v5, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintGreaterThanOrEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v55[7] = v16;
    v17 = v14;
    v38 = v14;
    objc_msgSend(v14, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchTapToRadarFooter trailingAnchor](v5, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v55[8] = v20;
    -[PXSearchTapToRadarFooter bottomAnchor](v5, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v22, 1.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v55[9] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v31);
    tapToRadarAppleInternalLabel = v5->_tapToRadarAppleInternalLabel;
    v5->_tapToRadarAppleInternalLabel = v46;
    v25 = v46;

    tapToRadarDescriptionLabel = v5->_tapToRadarDescriptionLabel;
    v5->_tapToRadarDescriptionLabel = v11;

    return v53;
  }
  return result;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSearchTapToRadarFooter;
  -[PXSearchTapToRadarFooter prepareForReuse](&v5, sel_prepareForReuse);
  -[PXSearchTapToRadarFooter setTapToRadarHandler:](self, "setTapToRadarHandler:", 0);
  -[PXSearchTapToRadarFooter tapToRadarAppleInternalLabel](self, "tapToRadarAppleInternalLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[PXSearchTapToRadarFooter tapToRadarDescriptionLabel](self, "tapToRadarDescriptionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

}

- (void)_didSelectTapToRadarButton
{
  void *v3;
  void (**v4)(void);

  -[PXSearchTapToRadarFooter tapToRadarHandler](self, "tapToRadarHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXSearchTapToRadarFooter tapToRadarHandler](self, "tapToRadarHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)shouldDisplayRadarDescriptionLabel:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  id v9;

  v3 = a3;
  -[PXSearchTapToRadarFooter tapToRadarAppleInternalLabel](self, "tapToRadarAppleInternalLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    v7 = CFSTR("Apple Internal");
  else
    v7 = 0;
  if (v3)
    v8 = CFSTR("Unable to find something that exists in your photos? File a radar to help us support more search terms.");
  else
    v8 = 0;
  objc_msgSend(v5, "setText:", v7);

  -[PXSearchTapToRadarFooter tapToRadarDescriptionLabel](self, "tapToRadarDescriptionLabel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

}

- (id)tapToRadarHandler
{
  return self->_tapToRadarHandler;
}

- (void)setTapToRadarHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (UILabel)tapToRadarAppleInternalLabel
{
  return self->_tapToRadarAppleInternalLabel;
}

- (void)setTapToRadarAppleInternalLabel:(id)a3
{
  objc_storeStrong((id *)&self->_tapToRadarAppleInternalLabel, a3);
}

- (UILabel)tapToRadarDescriptionLabel
{
  return self->_tapToRadarDescriptionLabel;
}

- (void)setTapToRadarDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_tapToRadarDescriptionLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToRadarDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_tapToRadarAppleInternalLabel, 0);
  objc_storeStrong(&self->_tapToRadarHandler, 0);
}

@end
