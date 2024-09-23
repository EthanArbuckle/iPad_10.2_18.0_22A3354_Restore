@implementation PXSearchResultsHeaderView

- (PXSearchResultsHeaderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PXSearchResultsHeaderView *v7;
  PXSearchResultsHeaderView *v8;
  void *v9;
  id *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  objc_super v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v26.receiver = self;
  v26.super_class = (Class)PXSearchResultsHeaderView;
  v7 = -[PXSearchResultsHeaderView initWithFrame:](&v26, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0DC3658];
    v10 = v7;
    objc_msgSend(v9, "systemGroupedBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
    objc_msgSend(v10, "setBackgroundColor:", v11);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithFrame:", x, y, width, height);
    v14 = v10[62];
    v10[62] = (id)v13;

    objc_msgSend(v10[62], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10[62], "setLayoutMarginsRelativeArrangement:", 1);
    objc_msgSend(v10, "addSubview:", v10[62]);
    v15 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    v16 = v10[63];
    v10[63] = v15;

    objc_msgSend(v10[63], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B58], 32770, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10[63], "setFont:", v17);

    objc_msgSend(v10[63], "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v10[63], "setBackgroundColor:", v11);
    objc_msgSend(v10[63], "setNumberOfLines:", 0);
    objc_msgSend(v10[62], "addArrangedSubview:", v10[63]);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v10[64];
    v10[64] = (id)v18;

    objc_msgSend(v10[64], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "px_defaultFontForTextStyle:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], 0x8000);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10[64], "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFont:", v20);

    objc_msgSend(v10[64], "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAdjustsFontSizeToFitWidth:", 1);

    objc_msgSend(v10[64], "titleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAdjustsFontForContentSizeCategory:", 1);

    LODWORD(v24) = 1144750080;
    objc_msgSend(v10[64], "setContentHuggingPriority:forAxis:", 0, v24);
    objc_msgSend(v10[62], "addArrangedSubview:", v10[64]);
    objc_msgSend(v10, "setupConstraints");
    objc_msgSend(v10, "updateStackViewMarginsForTextSize");
    objc_msgSend(v10, "updateAlignmentForTextSize");

  }
  return v8;
}

- (void)setTitleLabelString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSearchResultsHeaderView titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setSeeAllButtonTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PXSearchResultsHeaderView_setSeeAllButtonTitle___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWithoutAnimation:", v7);

}

- (void)setSeeAllButtonHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PXSearchResultsHeaderView seeAllButton](self, "seeAllButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setSectionIdentifier:(id)a3 seeAllButtonHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[PXSearchResultsHeaderView setSectionIdentifier:](self, "setSectionIdentifier:", a3);
  -[PXSearchResultsHeaderView setSeeAllButtonHandler:](self, "setSeeAllButtonHandler:", v6);

  if (v6)
  {
    -[PXSearchResultsHeaderView seeAllButton](self, "seeAllButton");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__didSelectSeeAllButton_, 64);

  }
}

- (void)_didSelectSeeAllButton:(id)a3
{
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  uint64_t v9;

  -[PXSearchResultsHeaderView sectionIdentifier](self, "sectionIdentifier", a3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsHeaderView.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

  }
  -[PXSearchResultsHeaderView seeAllButtonHandler](self, "seeAllButtonHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)v9;
  if (v5)
  {
    -[PXSearchResultsHeaderView seeAllButtonHandler](self, "seeAllButtonHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, PXSearchResultsHeaderView *))v7)[2](v7, v9, self);

    v6 = (void *)v9;
  }

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSearchResultsHeaderView;
  -[PXSearchResultsHeaderView prepareForReuse](&v6, sel_prepareForReuse);
  -[PXSearchResultsHeaderView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[PXSearchResultsHeaderView seeAllButton](self, "seeAllButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:forState:", 0, 0);

  -[PXSearchResultsHeaderView seeAllButton](self, "seeAllButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSearchResultsHeaderView;
  v4 = a3;
  -[PXSearchResultsHeaderView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSearchResultsHeaderView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    -[PXSearchResultsHeaderView updateStackViewMarginsForTextSize](self, "updateStackViewMarginsForTextSize");
    -[PXSearchResultsHeaderView updateAlignmentForTextSize](self, "updateAlignmentForTextSize");
  }
}

- (void)setupConstraints
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  -[PXSearchResultsHeaderView stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultsHeaderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v15;
  objc_msgSend(v3, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v5;
  objc_msgSend(v3, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v8;
  objc_msgSend(v3, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v12);
}

- (void)updateAlignmentForTextSize
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[PXSearchResultsHeaderView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  -[PXSearchResultsHeaderView stackView](self, "stackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (IsAccessibilityCategory)
  {
    objc_msgSend(v6, "setAxis:", 1);

    -[PXSearchResultsHeaderView seeAllButton](self, "seeAllButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v9 = 1;
  }
  else
  {
    objc_msgSend(v6, "setAxis:", 0);

    -[PXSearchResultsHeaderView seeAllButton](self, "seeAllButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v9 = 2;
  }
  objc_msgSend(v8, "setContentHorizontalAlignment:", v9);

}

- (void)updateStackViewMarginsForTextSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0DC1350], "px_defaultFontForTextStyle:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], 0x8000);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ascender");
  v4 = v3;
  objc_msgSend(v11, "descender");
  v6 = v4 - v5;
  objc_msgSend(v11, "leading");
  v8 = v6 + v7 + 7.0;
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    v9 = 0.0;
  else
    v9 = 20.0;
  -[PXSearchResultsHeaderView stackView](self, "stackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDirectionalLayoutMargins:", v8, v9, 7.0, v9);

}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIButton)seeAllButton
{
  return self->_seeAllButton;
}

- (void)setSeeAllButton:(id)a3
{
  objc_storeStrong((id *)&self->_seeAllButton, a3);
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIdentifier, a3);
}

- (id)seeAllButtonHandler
{
  return self->_seeAllButtonHandler;
}

- (void)setSeeAllButtonHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_seeAllButtonHandler, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_seeAllButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

void __50__PXSearchResultsHeaderView_setSeeAllButtonTitle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "seeAllButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:forState:", *(_QWORD *)(a1 + 40), 0);

  objc_msgSend(*(id *)(a1 + 32), "seeAllButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

@end
