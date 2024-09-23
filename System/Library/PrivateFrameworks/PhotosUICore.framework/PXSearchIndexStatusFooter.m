@implementation PXSearchIndexStatusFooter

- (PXSearchIndexStatusFooter)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PXSearchIndexStatusFooter *result;
  objc_class *v8;
  PXSearchIndexStatusFooter *v9;
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
  PXSearchIndexStatusFooter *v33;
  objc_super v34;
  _QWORD v35[7];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v35[5] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)PXSearchIndexStatusFooter;
  result = -[PXSearchIndexStatusFooter initWithFrame:](&v34, sel_initWithFrame_);
  if (result)
  {
    v8 = (objc_class *)MEMORY[0x1E0DC3438];
    v33 = result;
    v9 = result;
    v32 = (void *)objc_msgSend([v8 alloc], "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v32, "startAnimating");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", x, y, width, height);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v11);

    objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v12);

    objc_msgSend(v10, "setTextAlignment:", 1);
    PXLocalizedStringFromTable(CFSTR("SEARCH_PROGRESS_TITLE"), CFSTR("PhotosUICore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v10;
    objc_msgSend(v10, "setText:", v13);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithFrame:", x, y, width, height);
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v14, "setAlignment:", 3);
    objc_msgSend(v14, "setDistribution:", 0);
    objc_msgSend(v14, "setAxis:", 0);
    objc_msgSend(v14, "setSpacing:", 8.0);
    objc_msgSend(v14, "addArrangedSubview:", v32);
    objc_msgSend(v14, "addArrangedSubview:", v10);
    -[PXSearchIndexStatusFooter addSubview:](v9, "addSubview:", v14);
    objc_msgSend(v14, "centerXAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchIndexStatusFooter centerXAnchor](v9, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v28;
    objc_msgSend(v14, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchIndexStatusFooter topAnchor](v9, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v26, 1.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v25;
    objc_msgSend(v14, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchIndexStatusFooter leadingAnchor](v9, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v15, 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v16;
    objc_msgSend(v14, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchIndexStatusFooter trailingAnchor](v9, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintLessThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v18, 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v19;
    -[PXSearchIndexStatusFooter bottomAnchor](v9, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v21, 1.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v23);
    return v33;
  }
  return result;
}

@end
