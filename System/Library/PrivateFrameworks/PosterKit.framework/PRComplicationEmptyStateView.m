@implementation PRComplicationEmptyStateView

- (PRComplicationEmptyStateView)initWithFrame:(CGRect)a3
{
  PRComplicationEmptyStateView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PRComplicationEmptyStateView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[6];

  v37[4] = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)PRComplicationEmptyStateView;
  v3 = -[PRComplicationEmptyStateView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC1448]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v30);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("plus.circle.fill"), v35);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithTintColor:", v6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v4;
    objc_msgSend(v4, "setImage:", v34);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PRBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EDIT_COMPLICATIONS_PROMPT"), &stru_1E2186E08, CFSTR("PosterKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedUppercaseString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v32);
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("%@ %@"));
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithFormat:options:locale:", v28, 0, 0, v31, v29);
    v9 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v9, "setFont:", v30);
    objc_msgSend(v9, "setTextAlignment:", 1);
    objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v9, "setAttributedText:", v27);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v10);

    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v9, "setNumberOfLines:", 0);
    -[PRComplicationEmptyStateView addSubview:](v3, "addSubview:", v9);
    v21 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v9, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationEmptyStateView leadingAnchor](v3, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v24;
    objc_msgSend(v9, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationEmptyStateView trailingAnchor](v3, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v11;
    objc_msgSend(v9, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationEmptyStateView topAnchor](v3, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = v3;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v15;
    objc_msgSend(v9, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationEmptyStateView bottomAnchor](v14, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v19);

    v3 = v14;
    -[PRComplicationEmptyStateView setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 0);

  }
  return v3;
}

@end
