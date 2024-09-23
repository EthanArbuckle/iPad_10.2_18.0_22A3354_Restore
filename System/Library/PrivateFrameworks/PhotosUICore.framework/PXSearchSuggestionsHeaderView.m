@implementation PXSearchSuggestionsHeaderView

- (PXSearchSuggestionsHeaderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PXSearchSuggestionsHeaderView *result;
  void *v8;
  PXSearchSuggestionsHeaderView *v9;
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
  PXSearchSuggestionsHeaderView *v30;
  objc_super v31;
  _QWORD v32[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v32[4] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)PXSearchSuggestionsHeaderView;
  result = -[PXSearchSuggestionsHeaderView initWithFrame:](&v31, sel_initWithFrame_);
  if (result)
  {
    v8 = (void *)MEMORY[0x1E0DC3658];
    v30 = result;
    v9 = result;
    objc_msgSend(v8, "tablePlainHeaderFooterBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchSuggestionsHeaderView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", x, y, width, height);
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fontDescriptorWithSymbolicTraits:", 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v29, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v13);

    objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v11, "setNumberOfLines:", 0);
    PXLocalizedStringFromTable(CFSTR("SEARCH_SUGGESTED_SEARCHES"), CFSTR("PhotosUICore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v14);

    -[PXSearchSuggestionsHeaderView addSubview:](v9, "addSubview:", v11);
    -[PXSearchSuggestionsHeaderView safeAreaLayoutGuide](v9, "safeAreaLayoutGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, 20.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v26;
    objc_msgSend(v11, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, -20.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v16;
    objc_msgSend(v11, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 4.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v19;
    objc_msgSend(v11, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -4.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v23);
    return v30;
  }
  return result;
}

@end
