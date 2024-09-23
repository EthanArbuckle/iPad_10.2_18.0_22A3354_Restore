@implementation PUIAttributedStringFooter

+ (id)string:(id)a3 replacingSubstring:(id)a4 withImage:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rangeOfString:", v9);
  v13 = v12;

  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setImage:", v8);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replaceCharactersInRange:withAttributedString:", v11, v13, v15);

  return v7;
}

- (PUIAttributedStringFooter)initWithSpecifier:(id)a3
{
  id v4;
  PUIAttributedStringFooter *v5;
  PUIAttributedStringFooter *v6;

  v4 = a3;
  v5 = -[PUIAttributedStringFooter initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[PUIAttributedStringFooter setupSubviewsAndContstraints](v5, "setupSubviewsAndContstraints");
    -[PUIAttributedStringFooter refreshContentsWithSpecifier:](v6, "refreshContentsWithSpecifier:", v4);
  }

  return v6;
}

- (void)refreshContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  _BOOL4 IsAccessibilityCategory;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUIAttributedStringFooter setSpecifier:](self, "setSpecifier:", v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUIAttributedStringTextViewDelegateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nonretainedObjectValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAttributedStringFooter textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUIAttributedStringFooterStringKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = objc_msgSend(v9, "length");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredContentSizeCategory");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

  if (IsAccessibilityCategory)
  {
    v14 = (void *)objc_opt_new();
    LODWORD(v15) = 1055286886;
    objc_msgSend(v14, "setHyphenationFactor:", v15);
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v14, 0, v10);

  }
  objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "altTextColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "altTextColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PreferencesTableViewFooterColor();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "footerHyperlinkColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "footerHyperlinkColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v24 = *MEMORY[0x1E0DC1138];
  PreferencesTableViewFooterFont();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttribute:value:range:", v24, v25, 0, v10);

  v26 = *MEMORY[0x1E0DC1140];
  -[PUIAttributedStringFooter _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v19);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttribute:value:range:", v26, v27, 0, v10);

  v33[0] = v26;
  -[PUIAttributedStringFooter _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = *MEMORY[0x1E0DC1248];
  v34[0] = v28;
  v34[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAttributedStringFooter textView](self, "textView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setLinkTextAttributes:", v29);

  v31 = (void *)objc_msgSend(v9, "copy");
  -[PUIAttributedStringFooter textView](self, "textView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAttributedText:", v31);

}

- (void)setupSubviewsAndContstraints
{
  id v3;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3E50]);
  -[PUIAttributedStringFooter setTextView:](self, "setTextView:", v3);

  -[PUIAttributedStringFooter textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAttributedStringFooter textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[PUIAttributedStringFooter textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowsVerticalScrollIndicator:", 0);

  -[PUIAttributedStringFooter textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEditable:", 0);

  -[PUIAttributedStringFooter textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectable:", 1);

  -[PUIAttributedStringFooter textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setScrollEnabled:", 0);

  -[PUIAttributedStringFooter textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLineFragmentPadding:", 0.0);

  -[PUIAttributedStringFooter textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setInteractiveTextSelectionDisabled:", 1);

  -[PUIAttributedStringFooter contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAttributedStringFooter textView](self, "textView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  -[PUIAttributedStringFooter textView](self, "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAttributedStringFooter contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeAreaLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAttributedStringFooter tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_marginWidth");
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAttributedStringFooter setTextViewLeadingConstraint:](self, "setTextViewLeadingConstraint:", v22);

  -[PUIAttributedStringFooter textViewLeadingConstraint](self, "textViewLeadingConstraint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v23);

  -[PUIAttributedStringFooter contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "safeAreaLayoutGuide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAttributedStringFooter textView](self, "textView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAttributedStringFooter tableView](self, "tableView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_marginWidth");
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAttributedStringFooter setTextViewTrailingConstraint:](self, "setTextViewTrailingConstraint:", v30);

  -[PUIAttributedStringFooter textViewTrailingConstraint](self, "textViewTrailingConstraint");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v31);

  -[PUIAttributedStringFooter textView](self, "textView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAttributedStringFooter contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v36);

  -[PUIAttributedStringFooter textView](self, "textView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAttributedStringFooter contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v41);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v42);
}

- (void)setTableView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIAttributedStringFooter;
  -[PUIAttributedStringFooter setTableView:](&v4, sel_setTableView_, a3);
  -[PUIAttributedStringFooter setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  objc_super v23;

  -[PUIAttributedStringFooter textViewTrailingConstraint](self, "textViewTrailingConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constant");
  v5 = v4;
  -[PUIAttributedStringFooter tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_marginWidth");
  v8 = v7;

  if (v5 != v8)
  {
    -[PUIAttributedStringFooter tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_marginWidth");
    v11 = v10;
    -[PUIAttributedStringFooter textViewTrailingConstraint](self, "textViewTrailingConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setConstant:", v11);

  }
  -[PUIAttributedStringFooter textViewLeadingConstraint](self, "textViewLeadingConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constant");
  v15 = v14;
  -[PUIAttributedStringFooter tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_marginWidth");
  v18 = v17;

  if (v15 != v18)
  {
    -[PUIAttributedStringFooter tableView](self, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_marginWidth");
    v21 = v20;
    -[PUIAttributedStringFooter textViewLeadingConstraint](self, "textViewLeadingConstraint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setConstant:", v21);

  }
  v23.receiver = self;
  v23.super_class = (Class)PUIAttributedStringFooter;
  -[PUIAttributedStringFooter updateConstraints](&v23, sel_updateConstraints);
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  double v4;
  double v5;
  double v6;

  LODWORD(v4) = 1148846080;
  LODWORD(v5) = 1112014848;
  -[PUIAttributedStringFooter systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a4, a3, *(double *)(MEMORY[0x1E0DC4FF8] + 8), v4, v5);
  return v6;
}

- (void)_accessibilitySetInterfaceStyleIntent:(unint64_t)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUIAttributedStringFooter;
  -[PUIAttributedStringFooter _accessibilitySetInterfaceStyleIntent:](&v5, sel__accessibilitySetInterfaceStyleIntent_, a3);
  -[PUIAttributedStringFooter specifier](self, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAttributedStringFooter refreshContentsWithSpecifier:](self, "refreshContentsWithSpecifier:", v4);

}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (PSSpecifier)specifier
{
  return self->_specifier;
}

- (void)setSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_specifier, a3);
}

- (NSLayoutConstraint)textViewLeadingConstraint
{
  return self->_textViewLeadingConstraint;
}

- (void)setTextViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)textViewTrailingConstraint
{
  return self->_textViewTrailingConstraint;
}

- (void)setTextViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textViewTrailingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_textViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
