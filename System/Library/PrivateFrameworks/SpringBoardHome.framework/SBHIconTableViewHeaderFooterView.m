@implementation SBHIconTableViewHeaderFooterView

- (SBHIconTableViewHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  SBHIconTableViewHeaderFooterView *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHIconTableViewHeaderFooterView;
  v3 = -[SBHIconTableViewHeaderFooterView initWithReuseIdentifier:](&v6, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[SBHIconTableViewHeaderFooterView setBackgroundView:](v3, "setBackgroundView:", v4);

  }
  return v3;
}

- (void)updateConfigurationUsingState:(id)a3
{
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
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  v22 = a3;
  -[SBHIconTableViewHeaderFooterView defaultContentConfiguration](self, "defaultContentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatedConfigurationForState:", v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconTableViewHeaderFooterView tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIndexColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconTableViewHeaderFooterView title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DC53E8]))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("appclip"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v9);

    objc_msgSend(v5, "imageProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v7);
  }
  else
  {
    objc_msgSend(v22, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0DC3E88];
    objc_msgSend(v11, "preferredContentSizeCategory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SBHContentSizeCategoryClip(v13, (void *)*MEMORY[0x1E0DC4930], (void *)*MEMORY[0x1E0DC48C0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "traitCollectionWithPreferredContentSizeCategory:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4AD0], v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v8);
    objc_msgSend(v5, "textProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v15);

    objc_msgSend(v5, "textProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setColor:", v7);

  }
  -[SBHIconTableViewHeaderFooterView titleLayoutMargins](self, "titleLayoutMargins");
  if (v21 != *(double *)(MEMORY[0x1E0DC3298] + 8)
    || v18 != *MEMORY[0x1E0DC3298]
    || v20 != *(double *)(MEMORY[0x1E0DC3298] + 24)
    || v19 != *(double *)(MEMORY[0x1E0DC3298] + 16))
  {
    objc_msgSend(v5, "setDirectionalLayoutMargins:");
  }
  -[SBHIconTableViewHeaderFooterView setContentConfiguration:](self, "setContentConfiguration:", v5);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHIconTableViewHeaderFooterView;
  -[SBHIconTableViewHeaderFooterView prepareForReuse](&v3, sel_prepareForReuse);
  -[SBHIconTableViewHeaderFooterView setTitle:](self, "setTitle:", 0);
  -[SBHIconTableViewHeaderFooterView setTitleLayoutMargins:](self, "setTitleLayoutMargins:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
}

- (void)setTitle:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[SBHIconTableViewHeaderFooterView setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }

}

- (void)setTitleLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  if (self->_titleLayoutMargins.leading != a3.leading
    || self->_titleLayoutMargins.top != a3.top
    || self->_titleLayoutMargins.trailing != a3.trailing
    || self->_titleLayoutMargins.bottom != a3.bottom)
  {
    self->_titleLayoutMargins = a3;
    -[SBHIconTableViewHeaderFooterView setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (NSString)title
{
  return self->_title;
}

- (NSDirectionalEdgeInsets)titleLayoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_titleLayoutMargins.top;
  leading = self->_titleLayoutMargins.leading;
  bottom = self->_titleLayoutMargins.bottom;
  trailing = self->_titleLayoutMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
