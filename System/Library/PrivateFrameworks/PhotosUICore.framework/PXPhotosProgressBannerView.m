@implementation PXPhotosProgressBannerView

- (PXPhotosProgressBannerView)initWithFrame:(CGRect)a3
{
  PXPhotosProgressBannerView *v3;
  id v4;
  void *v5;
  UITextView *v6;
  UITextView *titleTextView;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UITextView *v17;
  UITextView *subtitleTextView;
  void *v19;
  void *v20;
  void *v21;
  id v22;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;
  _QWORD v45[4];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)PXPhotosProgressBannerView;
  v3 = -[PXPhotosProgressBannerView initWithFrame:](&v44, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F58]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEffect:", v43);
    objc_msgSend(v5, "setAutoresizingMask:", 18);
    v42 = v5;
    -[PXPhotosProgressBannerView addSubview:](v3, "addSubview:", v5);
    v6 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    titleTextView = v3->_titleTextView;
    v3->_titleTextView = v6;

    -[UITextView setUserInteractionEnabled:](v3->_titleTextView, "setUserInteractionEnabled:", 0);
    v8 = *MEMORY[0x1E0DC4AA0];
    v9 = *MEMORY[0x1E0DC48D8];
    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4AA0], *MEMORY[0x1E0DC48D8], 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v3->_titleTextView, "setFont:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v3->_titleTextView, "setTextColor:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v3->_titleTextView, "setBackgroundColor:", v12);

    -[UITextView setScrollEnabled:](v3->_titleTextView, "setScrollEnabled:", 0);
    -[UITextView setTextAlignment:](v3->_titleTextView, "setTextAlignment:", 1);
    v13 = *MEMORY[0x1E0DC49E8];
    v14 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v15 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v16 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    -[UITextView setTextContainerInset:](v3->_titleTextView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], v14, v15, v16);
    v17 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    subtitleTextView = v3->_subtitleTextView;
    v3->_subtitleTextView = v17;

    -[UITextView setUserInteractionEnabled:](v3->_subtitleTextView, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v3->_subtitleTextView, "setTextColor:", v19);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v3->_subtitleTextView, "setBackgroundColor:", v20);

    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", v8, v9, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v3->_subtitleTextView, "setFont:", v21);

    -[UITextView setScrollEnabled:](v3->_subtitleTextView, "setScrollEnabled:", 0);
    -[UITextView setTextAlignment:](v3->_subtitleTextView, "setTextAlignment:", 1);
    -[UITextView setTextContainerInset:](v3->_subtitleTextView, "setTextContainerInset:", v13, v14, v15, v16);
    v22 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v46[0] = v3->_titleTextView;
    v46[1] = v3->_subtitleTextView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithArrangedSubviews:", v23);

    objc_msgSend(v24, "setAxis:", 1);
    objc_msgSend(v24, "setAlignment:", 3);
    objc_msgSend(v24, "setDistribution:", 2);
    objc_msgSend(v24, "setSpacing:", 0.0);
    -[PXPhotosProgressBannerView safeAreaInsets](v3, "safeAreaInsets");
    objc_msgSend(v24, "setLayoutMargins:");
    objc_msgSend(v24, "setLayoutMarginsRelativeArrangement:", 1);
    objc_msgSend(v24, "setDirectionalLayoutMargins:", 10.0, 20.0, 10.0, 20.0);
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v24);

    -[PXPhotosProgressBannerView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v24, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v39;
    objc_msgSend(v24, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v35;
    objc_msgSend(v24, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v29;
    objc_msgSend(v24, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v33);

  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPhotosProgressBannerView titleTextView](self, "titleTextView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setSubtitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPhotosProgressBannerView subtitleTextView](self, "subtitleTextView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (UITextView)titleTextView
{
  return self->_titleTextView;
}

- (UITextView)subtitleTextView
{
  return self->_subtitleTextView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTextView, 0);
  objc_storeStrong((id *)&self->_titleTextView, 0);
}

@end
