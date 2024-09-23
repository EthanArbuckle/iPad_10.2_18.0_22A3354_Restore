@implementation UIPrintPreviewPageCell

- (UIPrintPreviewPageCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  UIPrintPreviewPageCell *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v47;
  objc_super v48;
  _QWORD v49[3];

  height = a3.size.height;
  width = a3.size.width;
  v49[2] = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)UIPrintPreviewPageCell;
  v5 = -[UIPrintPreviewPageCell initWithFrame:](&v48, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(v6, "setContentMode:", 1);
    v47 = v6;
    objc_msgSend(v6, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    objc_msgSend(v6, "setFrame:", 0.0, 0.0, width, height);
    -[UIPrintPreviewPageCell setThumbnailView:](v5, "setThumbnailView:", v6);
    -[UIPrintPreviewPageCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v6);

    v9 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v9, "setClipsToBounds:", 1);
    objc_msgSend(v9, "setFrame:", 0.0, 0.0, width, height);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    objc_msgSend(v9, "setAlpha:", 0.0);
    -[UIPrintPreviewPageCell setDimmingView:](v5, "setDimmingView:", v9);
    -[UIPrintPreviewPageCell contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v9);

    v12 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[UIPrintPreviewPageCell setLoadingProgressView:](v5, "setLoadingProgressView:", v12);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewPageCell loadingProgressView](v5, "loadingProgressView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

    -[UIPrintPreviewPageCell loadingProgressView](v5, "loadingProgressView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setClipsToBounds:", 1);

    -[UIPrintPreviewPageCell loadingProgressView](v5, "loadingProgressView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", 0.0, 0.0, width, height);

    -[UIPrintPreviewPageCell loadingProgressView](v5, "loadingProgressView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHidden:", 1);

    -[UIPrintPreviewPageCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewPageCell loadingProgressView](v5, "loadingProgressView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v19);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    -[UIPrintPreviewPageCell setSpinner:](v5, "setSpinner:", v20);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewPageCell spinner](v5, "spinner");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setColor:", v21);

    -[UIPrintPreviewPageCell spinner](v5, "spinner");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIPrintPreviewPageCell loadingProgressView](v5, "loadingProgressView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewPageCell spinner](v5, "spinner");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v25);

    -[UIPrintPreviewPageCell loadingProgressView](v5, "loadingProgressView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0CB3718];
    -[UIPrintPreviewPageCell spinner](v5, "spinner");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewPageCell loadingProgressView](v5, "loadingProgressView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v28, 9, 0, v29, 9, 1.0, 0.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v30;
    v31 = (void *)MEMORY[0x1E0CB3718];
    -[UIPrintPreviewPageCell spinner](v5, "spinner");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewPageCell loadingProgressView](v5, "loadingProgressView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 10, 0, v33, 10, 1.0, 0.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addConstraints:", v35);

    -[UIPrintPreviewPageCell contentView](v5, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = 1036831949;
    objc_msgSend(v37, "setShadowOpacity:", v38);

    -[UIPrintPreviewPageCell contentView](v5, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setShadowRadius:", 4.0);

    -[UIPrintPreviewPageCell contentView](v5, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setShadowOffset:", 0.0, 2.0);

    -[UIPrintPreviewPageCell contentView](v5, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v44, "setShadowColor:", objc_msgSend(v45, "CGColor"));

  }
  return v5;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)UIPrintPreviewPageCell;
  -[UIPrintPreviewPageCell layoutSubviews](&v40, sel_layoutSubviews);
  -[UIPrintPreviewPageCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIPrintPreviewPageCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[UIPrintPreviewPageCell thumbnailSize](self, "thumbnailSize");
  v13 = v12;
  -[UIPrintPreviewPageCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;

  v17 = 0.0;
  v18 = v13 < v16;
  v19 = 0.0;
  if (v18)
  {
    -[UIPrintPreviewPageCell contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v22 = v21;
    -[UIPrintPreviewPageCell thumbnailSize](self, "thumbnailSize");
    v19 = (v22 - v23) * 0.5;

  }
  -[UIPrintPreviewPageCell thumbnailSize](self, "thumbnailSize");
  v25 = v24;
  -[UIPrintPreviewPageCell contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  v28 = v27;

  if (v25 < v28)
  {
    -[UIPrintPreviewPageCell contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v31 = v30;
    -[UIPrintPreviewPageCell thumbnailSize](self, "thumbnailSize");
    v17 = (v31 - v32) * 0.5;

  }
  -[UIPrintPreviewPageCell thumbnailSize](self, "thumbnailSize");
  v34 = v33;
  -[UIPrintPreviewPageCell thumbnailSize](self, "thumbnailSize");
  v36 = v35;
  -[UIPrintPreviewPageCell thumbnailView](self, "thumbnailView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", v17, v19, v34, v36);

  -[UIPrintPreviewPageCell dimmingView](self, "dimmingView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", v17, v19, v34, v36);

  -[UIPrintPreviewPageCell loadingProgressView](self, "loadingProgressView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", v17, v19, v34, v36);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPrintPreviewPageCell;
  -[UIPrintPreviewPageCell prepareForReuse](&v7, sel_prepareForReuse);
  -[UIPrintPreviewPageCell thumbnailView](self, "thumbnailView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[UIPrintPreviewPageCell thumbnailView](self, "thumbnailView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[UIPrintPreviewPageCell loadingProgressView](self, "loadingProgressView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[UIPrintPreviewPageCell spinner](self, "spinner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopAnimating");

}

- (void)setThumbnailImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[UIPrintPreviewPageCell thumbnailView](self, "thumbnailView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  if (v4)
  {
    -[UIPrintPreviewPageCell thumbnailView](self, "thumbnailView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 0);

    -[UIPrintPreviewPageCell loadingProgressView](self, "loadingProgressView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    -[UIPrintPreviewPageCell spinner](self, "spinner");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopAnimating");

  }
  else
  {
    -[UIPrintPreviewPageCell performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_showThumbnailProgressSpinner, 0, 0.25);
  }
}

- (void)showThumbnailProgressSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIPrintPreviewPageCell thumbnailView](self, "thumbnailView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[UIPrintPreviewPageCell loadingProgressView](self, "loadingProgressView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);

    -[UIPrintPreviewPageCell spinner](self, "spinner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startAnimating");

    -[UIPrintPreviewPageCell thumbnailView](self, "thumbnailView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

  }
}

- (void)setPageIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  self->_pageIndex = a3;
  -[UIPrintPreviewPageCell pageLabel](self, "pageLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIPrintPreviewPageCell pageLabelText:](self, "pageLabelText:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewPageCell pageLabel](self, "pageLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

  }
}

- (id)pageLabelText:(int64_t)a3
{
  void *v5;
  int v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v18;

  -[UIPrintPreviewPageCell printPreviewDelegate](self, "printPreviewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showingPageView");

  v7 = -[UIPrintPreviewPageCell pageLabelFormat](self, "pageLabelFormat");
  switch(v7)
  {
    case 2:
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13;
      if (v6)
        v14 = CFSTR("Page %ld");
      else
        v14 = CFSTR("Sheet %ld");
      break;
    case 1:
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("%ld of %ld");
LABEL_13:
      objc_msgSend(v9, "localizedStringForKey:value:table:", v11, v11, CFSTR("Localizable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v15, a3 + 1, -[UIPrintPreviewPageCell pageCount](self, "pageCount"));
      goto LABEL_14;
    case 0:
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v6)
        v11 = CFSTR("Page %ld of %ld");
      else
        v11 = CFSTR("Sheet %ld of %ld");
      goto LABEL_13;
    default:
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13;
      v14 = CFSTR("%ld");
      break;
  }
  objc_msgSend(v13, "localizedStringForKey:value:table:", v14, v14, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringWithFormat:", v15, a3 + 1, v18);
LABEL_14:
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (int64_t)pageLabelFormat
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  int64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;

  -[UIPrintPreviewPageCell printPreviewDelegate](self, "printPreviewDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showingPageView");

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Page %ld of %ld"), CFSTR("Page %ld of %ld"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 25.0;
  }
  else
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Sheet %ld of %ld"), CFSTR("Sheet %ld of %ld"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0.0;
  }
  objc_msgSend(v5, "localizedStringWithFormat:", v8, -[UIPrintPreviewPageCell pageCount](self, "pageCount"), -[UIPrintPreviewPageCell pageCount](self, "pageCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99D80];
  -[UIPrintPreviewPageCell pageLabel](self, "pageLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC32A0];
  objc_msgSend(v11, "dictionaryWithObject:forKey:", v13, *MEMORY[0x1E0DC32A0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeWithAttributes:", v15);
  v17 = v16;
  v19 = v18;

  v20 = v19 + 16.0;
  v21 = (v19 + 16.0) / 3.0;
  v22 = (v20 + -22.0) * 0.5;
  if (v4)
    v23 = v22;
  else
    v23 = v21;
  -[UIPrintPreviewPageCell thumbnailSize](self, "thumbnailSize");
  v25 = v24 - v9 - v23 - v21;
  if (v17 <= v25)
  {
    v40 = 0;
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("%ld of %ld"), CFSTR("%ld of %ld"), CFSTR("Localizable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringWithFormat:", v28, -[UIPrintPreviewPageCell pageCount](self, "pageCount"), -[UIPrintPreviewPageCell pageCount](self, "pageCount"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0C99D80];
    -[UIPrintPreviewPageCell pageLabel](self, "pageLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "font");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dictionaryWithObject:forKey:", v32, v14);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sizeWithAttributes:", v33);
    v35 = v34;

    if (v35 <= v25)
    {
      v40 = 1;
      v10 = v29;
    }
    else
    {
      v36 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v4)
        v39 = CFSTR("Page %ld");
      else
        v39 = CFSTR("Sheet %ld");
      objc_msgSend(v37, "localizedStringForKey:value:table:", v39, v39, CFSTR("Localizable"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringWithFormat:", v41, -[UIPrintPreviewPageCell pageCount](self, "pageCount"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = (void *)MEMORY[0x1E0C99D80];
      -[UIPrintPreviewPageCell pageLabel](self, "pageLabel");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "font");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "dictionaryWithObject:forKey:", v44, v14);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sizeWithAttributes:", v45);
      v47 = v46;

      if (v47 <= v25)
        v40 = 2;
      else
        v40 = 3;
    }
  }

  return v40;
}

- (void)addPageLabelAndImageView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  UIView *v28;
  void *v29;
  UIView *pageLabelBackgroundBlurView;
  UIView *v31;
  void *v32;
  void *v33;
  UILabel *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  UILabel *pageLabel;
  void *v40;
  UIView *v41;
  UIView *checkmarkImageView;
  void *v43;
  id v44;
  void *v45;
  UIView *v46;
  UIView *checkmarkBackgroundImageView;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  UIView *v52;
  UIView *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  UIView *v58;
  UIView *v59;
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
  UIView *pageLabelAndChekmarkView;
  UIView *v79;
  void *v80;
  id v81;
  double v82;
  double v83;
  double v84;
  UIView *v85;
  UIView *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  UIView *v100;
  void *v101;
  void *v102;
  void *v103;
  UIView *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  _QWORD v120[5];
  _QWORD v121[5];
  _QWORD v122[3];
  _QWORD v123[11];
  uint64_t v124;
  _QWORD v125[3];

  v3 = a3;
  v125[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[UIPrintPreviewPageCell printPreviewDelegate](self, "printPreviewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showingPageView");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 & 1) != 0)
    v10 = CFSTR("Page %ld of %ld");
  else
    v10 = CFSTR("Sheet %ld of %ld");
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, v10, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v11, 1, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC37E8];
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_scaledValueForValue:", 15.0);
  objc_msgSend(v13, "boldSystemFontOfSize:");
  v15 = objc_claimAutoreleasedReturnValue();

  v124 = *MEMORY[0x1E0DC32A0];
  v125[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, &v124, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeWithAttributes:", v16);
  v18 = v17;
  v20 = v19;

  v21 = v20 + 16.0;
  v22 = v21 / 3.0;
  if (v3)
    v23 = (v21 + -22.0) * 0.5;
  else
    v23 = v21 / 3.0;
  if (!self->_pageLabelBackgroundBlurView)
  {
    v24 = 0.0;
    if (v3)
      v24 = 25.0;
    v25 = v22 + v24 + v18 + v23;
    v26 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (UIView *)objc_msgSend(v26, "initWithEffect:", v27);

    -[UIView setFrame:](v28, "setFrame:", 0.0, 0.0, v25, v21);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](v28, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCornerRadius:", v21 * 0.5);

    -[UIView setClipsToBounds:](v28, "setClipsToBounds:", 1);
    -[UIView setUserInteractionEnabled:](v28, "setUserInteractionEnabled:", 0);
    pageLabelBackgroundBlurView = self->_pageLabelBackgroundBlurView;
    self->_pageLabelBackgroundBlurView = v28;
    v31 = v28;

    -[UIPrintPreviewPageCell contentView](self, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSubview:", v31);

    -[UIPrintPreviewPageCell contentView](self, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bringSubviewToFront:", v31);

  }
  if (!self->_pageLabel)
  {
    v34 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setText:](v34, "setText:", v12);
    -[UILabel setTextAlignment:](v34, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v34, "setTextColor:", v35);

    -[UILabel setFont:](v34, "setFont:", v15);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v34, "setBackgroundColor:", v36);

    -[UILabel setAlpha:](v34, "setAlpha:", 0.6);
    -[UILabel setOpaque:](v34, "setOpaque:", 0);
    -[UILabel setIsAccessibilityElement:](v34, "setIsAccessibilityElement:", 0);
    -[UILabel setUserInteractionEnabled:](v34, "setUserInteractionEnabled:", 0);
    -[UILabel layer](v34, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E98]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setCompositingFilter:", v38);

    -[UILabel sizeToFit](v34, "sizeToFit");
    pageLabel = self->_pageLabel;
    self->_pageLabel = v34;

  }
  v118 = (void *)v15;
  v119 = v12;
  if (!v3)
  {
    pageLabelAndChekmarkView = self->_pageLabelAndChekmarkView;
    if (pageLabelAndChekmarkView)
    {
      if (-[UIView tag](pageLabelAndChekmarkView, "tag") != 1)
        goto LABEL_30;
      v79 = self->_pageLabelAndChekmarkView;
      if (v79)
      {
        -[UIView subviews](v79, "subviews");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "makeObjectsPerformSelector:", sel_removeFromSuperview);

        -[UIView removeFromSuperview](self->_pageLabelAndChekmarkView, "removeFromSuperview");
      }
    }
    v81 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[UILabel bounds](self->_pageLabel, "bounds");
    v83 = v82;
    -[UILabel bounds](self->_pageLabel, "bounds");
    v85 = (UIView *)objc_msgSend(v81, "initWithFrame:", 0.0, 0.0, v83, v84);
    v86 = self->_pageLabelAndChekmarkView;
    self->_pageLabelAndChekmarkView = v85;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_pageLabelAndChekmarkView, "setBackgroundColor:", v87);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_pageLabelAndChekmarkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](self->_pageLabelAndChekmarkView, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](self->_pageLabelAndChekmarkView, "addSubview:", self->_pageLabel);
    -[UIPrintPreviewPageCell contentView](self, "contentView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "addSubview:", self->_pageLabelAndChekmarkView);

    -[UIPrintPreviewPageCell contentView](self, "contentView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "bringSubviewToFront:", self->_pageLabelAndChekmarkView);

    -[UIView setTag:](self->_pageLabelAndChekmarkView, "setTag:", 0);
    -[UIPrintPreviewPageCell contentView](self, "contentView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pageLabelAndChekmarkView, 9, 0, self->_pageLabelBackgroundBlurView, 9, 1.0, 0.0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = v91;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pageLabel, 3, 0, self->_pageLabelAndChekmarkView, 3, 1.0, 0.0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v121[1] = v92;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pageLabel, 5, 0, self->_pageLabelAndChekmarkView, 5, 1.0, 0.0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v121[2] = v93;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pageLabel, 4, 0, self->_pageLabelAndChekmarkView, 4, 1.0, 0.0);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v121[3] = v94;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pageLabel, 6, 0, self->_pageLabelAndChekmarkView, 6, 1.0, 0.0);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v121[4] = v95;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 5);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "addConstraints:", v96);

LABEL_30:
    -[UIPrintPreviewPageCell tapGestureRecognizer](self, "tapGestureRecognizer");
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    if (v97)
    {
      -[UIPrintPreviewPageCell tapGestureRecognizer](self, "tapGestureRecognizer");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintPreviewPageCell removeGestureRecognizer:](self, "removeGestureRecognizer:", v98);

      -[UIPrintPreviewPageCell setTapGestureRecognizer:](self, "setTapGestureRecognizer:", 0);
    }
    goto LABEL_32;
  }
  if (!self->_checkmarkImageView)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "checkmarkImage");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v40);
    checkmarkImageView = self->_checkmarkImageView;
    self->_checkmarkImageView = v41;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.00392156863, 0.478431373, 0.996078431, 1.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](self->_checkmarkImageView, "setTintColor:", v43);

    -[UIView setContentMode:](self->_checkmarkImageView, "setContentMode:", 2);
    -[UIView setUserInteractionEnabled:](self->_checkmarkImageView, "setUserInteractionEnabled:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_checkmarkImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  }
  if (!self->_checkmarkBackgroundImageView)
  {
    v44 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (UIView *)objc_msgSend(v44, "initWithImage:", v45);
    checkmarkBackgroundImageView = self->_checkmarkBackgroundImageView;
    self->_checkmarkBackgroundImageView = v46;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "colorWithAlphaComponent:", 0.45);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](self->_checkmarkBackgroundImageView, "setTintColor:", v49);

    -[UIView setContentMode:](self->_checkmarkBackgroundImageView, "setContentMode:", 2);
    -[UIView layer](self->_checkmarkBackgroundImageView, "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E98]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setCompositingFilter:", v51);

    -[UIView setUserInteractionEnabled:](self->_checkmarkBackgroundImageView, "setUserInteractionEnabled:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_checkmarkBackgroundImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  v52 = self->_pageLabelAndChekmarkView;
  if (v52)
  {
    if (-[UIView tag](v52, "tag"))
      goto LABEL_32;
    v53 = self->_pageLabelAndChekmarkView;
    if (v53)
    {
      -[UIView subviews](v53, "subviews");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "makeObjectsPerformSelector:", sel_removeFromSuperview);

      -[UIView removeFromSuperview](self->_pageLabelAndChekmarkView, "removeFromSuperview");
    }
  }
  -[UILabel bounds](self->_pageLabel, "bounds");
  v56 = v55 + 22.0 + 6.0;
  -[UILabel bounds](self->_pageLabel, "bounds");
  v58 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, v56, v57);
  v59 = self->_pageLabelAndChekmarkView;
  self->_pageLabelAndChekmarkView = v58;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_pageLabelAndChekmarkView, "setBackgroundColor:", v60);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_pageLabelAndChekmarkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setUserInteractionEnabled:](self->_pageLabelAndChekmarkView, "setUserInteractionEnabled:", 0);
  -[UIView setTag:](self->_pageLabelAndChekmarkView, "setTag:", 1);
  -[UIView addSubview:](self->_pageLabelAndChekmarkView, "addSubview:", self->_pageLabel);
  -[UIView addSubview:](self->_pageLabelAndChekmarkView, "addSubview:", self->_checkmarkImageView);
  -[UIView addSubview:](self->_pageLabelAndChekmarkView, "addSubview:", self->_checkmarkBackgroundImageView);
  -[UIPrintPreviewPageCell contentView](self, "contentView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addSubview:", self->_pageLabelAndChekmarkView);

  -[UIPrintPreviewPageCell contentView](self, "contentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "bringSubviewToFront:", self->_pageLabelAndChekmarkView);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_checkmarkBackgroundImageView, 8, 0, 0, 0, 1.0, 22.0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v123[0] = v117;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_checkmarkBackgroundImageView, 7, 0, 0, 0, 1.0, 22.0);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v123[1] = v116;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_checkmarkBackgroundImageView, 10, 0, self->_pageLabel, 10, 1.0, 0.0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v123[2] = v115;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_checkmarkBackgroundImageView, 5, 0, self->_pageLabelAndChekmarkView, 5, 1.0, 0.0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v123[3] = v114;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_checkmarkImageView, 8, 0, 0, 0, 1.0, 22.0);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v123[4] = v113;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_checkmarkImageView, 7, 0, 0, 0, 1.0, 22.0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v123[5] = v112;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_checkmarkImageView, 9, 0, self->_checkmarkBackgroundImageView, 9, 1.0, 0.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v123[6] = v63;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_checkmarkImageView, 10, 0, self->_pageLabel, 10, 1.0, 0.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v123[7] = v64;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pageLabel, 6, 0, self->_pageLabelAndChekmarkView, 6, 1.0, 0.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v123[8] = v65;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pageLabelAndChekmarkView, 7, 0, self->_pageLabel, 7, 1.0, 28.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v123[9] = v66;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pageLabel, 10, 0, self->_pageLabelAndChekmarkView, 10, 1.0, 0.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v123[10] = v67;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 11);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView addConstraints:](self->_pageLabelAndChekmarkView, "addConstraints:", v68);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pageLabelAndChekmarkView, 8, 0, self->_pageLabel, 8, 1.0, 0.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = v69;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pageLabel, 10, 0, self->_pageLabelAndChekmarkView, 10, 1.0, 0.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v122[1] = v70;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pageLabelAndChekmarkView, 5, 0, self->_pageLabelBackgroundBlurView, 5, 1.0, (v21 + -22.0) * 0.5);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v122[2] = v71;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 3);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintPreviewPageCell contentView](self, "contentView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "addConstraints:", v72);

  -[UIPrintPreviewPageCell tapGestureRecognizer](self, "tapGestureRecognizer");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v74)
  {
    v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_handleTap_);
    -[UIPrintPreviewPageCell setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v75);

    -[UIPrintPreviewPageCell tapGestureRecognizer](self, "tapGestureRecognizer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setDelegate:", self);

  }
  -[UIPrintPreviewPageCell tapGestureRecognizer](self, "tapGestureRecognizer");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPreviewPageCell addGestureRecognizer:](self, "addGestureRecognizer:", v77);

LABEL_32:
  v99 = (void *)MEMORY[0x1E0CB3718];
  v100 = self->_pageLabelBackgroundBlurView;
  -[UIPrintPreviewPageCell contentView](self, "contentView");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v100, 9, 0, v101, 9, 1.0, 0.0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = v102;
  v103 = (void *)MEMORY[0x1E0CB3718];
  v104 = self->_pageLabelBackgroundBlurView;
  -[UIPrintPreviewPageCell contentView](self, "contentView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v104, 4, 0, v105, 4, 1.0, -15.0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v120[1] = v106;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pageLabelBackgroundBlurView, 7, 0, self->_pageLabelAndChekmarkView, 7, 1.0, v22 + v23);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v120[2] = v107;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pageLabelBackgroundBlurView, 8, 0, 0, 0, 1.0, v21);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v120[3] = v108;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pageLabelAndChekmarkView, 10, 0, self->_pageLabelBackgroundBlurView, 10, 1.0, 0.0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v120[4] = v109;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 5);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintPreviewPageCell contentView](self, "contentView");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "addConstraints:", v110);

}

- (void)setInRange:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  float v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;

  v4 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[UIPrintPreviewPageCell dimmingView](self, "dimmingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alpha");
    *(float *)&v8 = v8;
    objc_msgSend(v6, "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFromValue:", v9);

    if (v4)
      v10 = 0.0;
    else
      v10 = 0.7;
    if (v4)
      v11 = 1.0;
    else
      v11 = 0.0;
    if (v4)
      v12 = 0.0;
    else
      v12 = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE((unint64_t)LODWORD(v10)));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setToValue:", v13);

    objc_msgSend(v25, "setAdditive:", 0);
    objc_msgSend(v25, "setDuration:", 0.100000001);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    -[UIPrintPreviewPageCell dimmingView](self, "dimmingView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAnimation:forKey:", v25, CFSTR("opacity"));

    -[UIPrintPreviewPageCell dimmingView](self, "dimmingView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAlpha:", v10);

    -[UIPrintPreviewPageCell checkmarkImageView](self, "checkmarkImageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAlpha:", v11);

    -[UIPrintPreviewPageCell checkmarkBackgroundImageView](self, "checkmarkBackgroundImageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAlpha:", v12);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  else
  {
    -[UIPrintPreviewPageCell dimmingView](self, "dimmingView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = 0.699999988;
    if (v4)
    {
      v21 = 0.0;
      v22 = 1.0;
    }
    else
    {
      v22 = 0.0;
    }
    if (v4)
      v23 = 0.0;
    else
      v23 = 1.0;
    objc_msgSend(v19, "setAlpha:", v21);

    -[UIPrintPreviewPageCell checkmarkImageView](self, "checkmarkImageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAlpha:", v22);

    -[UIPrintPreviewPageCell checkmarkBackgroundImageView](self, "checkmarkBackgroundImageView");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAlpha:", v23);
  }

}

- (BOOL)locationInTapTargetOfPageLabelBadge:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[UIView frame](self->_pageLabelBackgroundBlurView, "frame");
  v8 = CGRectInset(v7, -10.0, -10.0);
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v8, v6);
}

- (void)pageBadgeTapped:(id)a3
{
  void *v4;
  int v5;
  id v6;

  -[UIPrintPreviewPageCell printPreviewDelegate](self, "printPreviewDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canModifyPageRange");

  if (v5)
  {
    -[UIPrintPreviewPageCell printPreviewDelegate](self, "printPreviewDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pageBadgeTapped:", -[UIPrintPreviewPageCell pageIndex](self, "pageIndex"));

  }
}

- (void)handleTap:(id)a3
{
  objc_msgSend(a3, "locationInView:", self);
  if (-[UIPrintPreviewPageCell locationInTapTargetOfPageLabelBadge:](self, "locationInTapTargetOfPageLabelBadge:"))
    -[UIPrintPreviewPageCell pageBadgeTapped:](self, "pageBadgeTapped:", self);
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UIPrintPreviewPageCell printPreviewDelegate](self, "printPreviewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showingPageView");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = CFSTR("Page %ld");
  else
    v8 = CFSTR("Sheet %ld");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, v8, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v9, -[UIPrintPreviewPageCell pageIndex](self, "pageIndex") + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintPreviewPageCell printPreviewDelegate](self, "printPreviewDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "canModifyPageRange");

  if (v12)
  {
    -[UIPrintPreviewPageCell printPreviewDelegate](self, "printPreviewDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "pageIndexIsInRange:", -[UIPrintPreviewPageCell pageIndex](self, "pageIndex"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
      v17 = CFSTR("Page is in page range.");
    else
      v17 = CFSTR("Page is not in page range");
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, v17, CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(". %@"), v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v19;
  }
  return v10;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[UIPrintPreviewPageCell printPreviewDelegate](self, "printPreviewDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "canModifyPageRange"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Modify the page range starting at this page."), CFSTR("Modify the page range starting at this page."), CFSTR("Localizable"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1E9D97C98;
  }

  return v4;
}

- (UIImageView)thumbnailView
{
  return self->_thumbnailView;
}

- (void)setThumbnailView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailView, a3);
}

- (UIPrintPreviewDelegate)printPreviewDelegate
{
  return (UIPrintPreviewDelegate *)objc_loadWeakRetained((id *)&self->_printPreviewDelegate);
}

- (void)setPrintPreviewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_printPreviewDelegate, a3);
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(int64_t)a3
{
  self->_pageCount = a3;
}

- (int64_t)pageIndex
{
  return self->_pageIndex;
}

- (CGSize)thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
}

- (UIView)loadingProgressView
{
  return self->_loadingProgressView;
}

- (void)setLoadingProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingProgressView, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (UIView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (void)setCheckmarkImageView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkImageView, a3);
}

- (UIView)checkmarkBackgroundImageView
{
  return self->_checkmarkBackgroundImageView;
}

- (void)setCheckmarkBackgroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkBackgroundImageView, a3);
}

- (UILabel)pageLabel
{
  return self->_pageLabel;
}

- (void)setPageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_pageLabel, a3);
}

- (UIView)pageLabelAndChekmarkView
{
  return self->_pageLabelAndChekmarkView;
}

- (void)setPageLabelAndChekmarkView:(id)a3
{
  objc_storeStrong((id *)&self->_pageLabelAndChekmarkView, a3);
}

- (UIView)pageLabelBackgroundBlurView
{
  return self->_pageLabelBackgroundBlurView;
}

- (void)setPageLabelBackgroundBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_pageLabelBackgroundBlurView, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pageLabelBackgroundBlurView, 0);
  objc_storeStrong((id *)&self->_pageLabelAndChekmarkView, 0);
  objc_storeStrong((id *)&self->_pageLabel, 0);
  objc_storeStrong((id *)&self->_checkmarkBackgroundImageView, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_loadingProgressView, 0);
  objc_destroyWeak((id *)&self->_printPreviewDelegate);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
}

@end
