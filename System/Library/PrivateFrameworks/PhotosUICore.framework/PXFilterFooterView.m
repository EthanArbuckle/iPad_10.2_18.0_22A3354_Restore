@implementation PXFilterFooterView

- (void)_showFilterUI:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PXFilterFooterView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "filterFooterViewDidTapShowFilter:sender:", self, v5);

}

- (void)_updateDisplay
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v3 = -[PXContentFilterState isFiltering](self->_contentFilterState, "isFiltering");
  -[PXFilterFooterView libraryFilterState](self, "libraryFilterState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFiltering"))
  {
    objc_msgSend(v4, "localizedFooterDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFilterFooterView sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (((objc_msgSend(v6, "hasPreview") ^ 1 | v3) & 1) == 0)
    {
      v7 = objc_msgSend(v4, "viewMode");

      if (v7 != 2)
        goto LABEL_7;
      PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_FilterFooter_Previewing"));
      v6 = v5;
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v5 = 0;
  }
LABEL_7:
  -[UILabel setText:](self->_captionLabel, "setText:", 0);
  if (v5)
    v8 = v3;
  else
    v8 = 0;
  if (v8)
  {
    PXLocalizedStringFromTable(CFSTR("PXContentFilterFooterCaptionFilteredBy_Lowercase"), CFSTR("PhotosUICore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_FilterFooterFormat"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_captionLabel, "setText:", v11, v5, v9);

    if (!v3)
      goto LABEL_19;
  }
  else if (v5)
  {
    -[UILabel setText:](self->_captionLabel, "setText:", v5);
    if (!v3)
      goto LABEL_19;
  }
  else
  {
    if (!v3)
    {
LABEL_19:
      -[UIButton setAttributedTitle:forState:](self->_filterButton, "setAttributedTitle:forState:", 0, 0);
      -[UIButton titleLabel](self->_filterButton, "titleLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", 0);
      goto LABEL_20;
    }
    PXLocalizedStringFromTable(CFSTR("PXContentFilterFooterCaptionFilteredBy"), CFSTR("PhotosUICore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_captionLabel, "setText:", v12);

  }
  -[PXContentFilterState localizedFooterDescription](self->_contentFilterState, "localizedFooterDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v14, "setLineBreakMode:", 4);
  v21[0] = *MEMORY[0x1E0DC1138];
  MEMORY[0x1A85CC970](10, 0x8000, 9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0DC1178];
  v22[0] = v15;
  v22[1] = v14;
  v17 = *MEMORY[0x1E0DC1140];
  v21[1] = v16;
  v21[2] = v17;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v13, v19);
  -[UIButton setAttributedTitle:forState:](self->_filterButton, "setAttributedTitle:forState:", v20, 0);

LABEL_20:
  -[PXFilterFooterView setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)_performLayoutInRect:(CGRect)a3 updateSubviewFrames:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  UILabel *v8;
  UIButton *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  v8 = self->_captionLabel;
  v9 = self->_filterButton;
  -[UILabel sizeThatFits:](v8, "sizeThatFits:", width, height);
  UISizeRoundToViewScale();
  v11 = v10;
  v13 = v12;
  -[UIButton sizeThatFits:](v9, "sizeThatFits:", width, height);
  UISizeRoundToViewScale();
  -[UIButton titleLabel](v9, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeToFit");
  objc_msgSend(v14, "frame");
  v16 = v15;
  objc_msgSend(v14, "frame");
  if (v13 >= v17)
    v18 = v13;
  else
    v18 = v17;
  if (v4)
  {
    v19 = v17;
    if (v16 >= width - v11 + -2.0)
      v16 = width - v11 + -2.0;
    v27 = (v18 - v17) * 0.5;
    v20 = (width - (v11 + 2.0 + v16)) * 0.5;
    v21 = -[PXFilterFooterView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection", (v18 - v13) * 0.5);
    v22 = v16 + v20 + 2.0;
    if (v21 == 1)
      v23 = (width - (v11 + 2.0 + v16)) * 0.5;
    else
      v23 = v11 + v20 + 2.0;
    if (v21 != 1)
      v22 = (width - (v11 + 2.0 + v16)) * 0.5;
    -[UILabel setFrame:](v8, "setFrame:", v22, v26, v11, v13);
    -[UIButton setFrame:](v9, "setFrame:", v23, v27, v16, v19);
  }

  v24 = width;
  v25 = v18;
  result.height = v25;
  result.width = v24;
  return result;
}

- (PXFilterFooterView)initWithFrame:(CGRect)a3
{
  PXFilterFooterView *v3;
  id v4;
  UILabel *v5;
  void *v6;
  void *v7;
  UILabel *captionLabel;
  UILabel *v9;
  UIButton *v10;
  void *v11;
  UIButton *filterButton;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXFilterFooterView;
  v3 = -[PXFilterFooterView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    MEMORY[0x1A85CC970](10, 0x8000, 9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5, "setFont:", v6);

    -[UILabel setLineBreakMode:](v5, "setLineBreakMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5, "setTextColor:", v7);

    -[PXFilterFooterView addSubview:](v3, "addSubview:", v5);
    captionLabel = v3->_captionLabel;
    v3->_captionLabel = v5;
    v9 = v5;

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v10 = (UIButton *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[UIButton setContentHorizontalAlignment:](v10, "setContentHorizontalAlignment:", 1);
    -[UIButton addTarget:action:forControlEvents:](v10, "addTarget:action:forControlEvents:", v3, sel__showFilterUI_, 64);
    -[PXFilterFooterView addSubview:](v3, "addSubview:", v10);
    filterButton = v3->_filterButton;
    v3->_filterButton = v10;

  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXFilterFooterView _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFitsCaption:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UILabel sizeThatFits:](self->_captionLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFilterFooterView;
  -[PXFilterFooterView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXFilterFooterView bounds](self, "bounds");
  -[PXFilterFooterView _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 1);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXFilterFooterView;
  v4 = a3;
  -[PXFilterFooterView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXFilterFooterView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
    -[PXFilterFooterView _updateDisplay](self, "_updateDisplay");
}

- (void)setSharedLibraryStatusProvider:(id)a3
{
  PXSharedLibraryStatusProvider *v5;
  PXLibraryFilterState *libraryFilterState;
  PXSharedLibraryStatusProvider *v7;
  char v8;
  PXLibraryFilterState *v9;
  PXSharedLibraryStatusProvider *v10;

  v10 = (PXSharedLibraryStatusProvider *)a3;
  v5 = self->_sharedLibraryStatusProvider;
  libraryFilterState = (PXLibraryFilterState *)v10;
  if (v5 == v10)
    goto LABEL_4;
  v7 = v5;
  v8 = -[PXSharedLibraryStatusProvider isEqual:](v5, "isEqual:", v10);

  if ((v8 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, a3);
    v9 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v10);
    libraryFilterState = self->_libraryFilterState;
    self->_libraryFilterState = v9;
LABEL_4:

  }
  -[PXFilterFooterView _updateDisplay](self, "_updateDisplay");

}

- (void)setLibraryFilterState:(id)a3
{
  PXLibraryFilterState *v4;
  PXLibraryFilterState *libraryFilterState;
  PXLibraryFilterState *v6;
  BOOL v7;
  PXLibraryFilterState *v8;
  PXLibraryFilterState *v9;

  v9 = (PXLibraryFilterState *)a3;
  v4 = self->_libraryFilterState;
  libraryFilterState = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[PXLibraryFilterState isEqual:](v4, "isEqual:", v9);

  if (!v7)
  {
    v8 = v9;
    libraryFilterState = self->_libraryFilterState;
    self->_libraryFilterState = v8;
LABEL_4:

  }
  -[PXFilterFooterView _updateDisplay](self, "_updateDisplay");

}

- (void)setContentFilterState:(id)a3
{
  PXContentFilterState *v4;
  PXContentFilterState *contentFilterState;
  PXContentFilterState *v6;
  BOOL v7;
  PXContentFilterState *v8;
  PXContentFilterState *v9;

  v9 = (PXContentFilterState *)a3;
  v4 = self->_contentFilterState;
  contentFilterState = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[PXContentFilterState isEqual:](v4, "isEqual:", v9);

  if (!v7)
  {
    v8 = v9;
    contentFilterState = self->_contentFilterState;
    self->_contentFilterState = v8;
LABEL_4:

  }
  -[PXFilterFooterView _updateDisplay](self, "_updateDisplay");

}

- (void)setCaptionColor:(id)a3
{
  -[UILabel setTextColor:](self->_captionLabel, "setTextColor:", a3);
}

- (PXFilterFooterViewDelegate)delegate
{
  return (PXFilterFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXContentFilterState)contentFilterState
{
  return self->_contentFilterState;
}

- (UIColor)captionColor
{
  return self->_captionColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captionColor, 0);
  objc_storeStrong((id *)&self->_contentFilterState, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_filterButton, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
}

@end
