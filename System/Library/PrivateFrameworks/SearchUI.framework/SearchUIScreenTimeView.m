@implementation SearchUIScreenTimeView

- (SearchUIScreenTimeView)init
{
  SearchUIScreenTimeView *v2;
  SearchUIScreenTimeView *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SearchUIScreenTimeView;
  v2 = -[SearchUIScreenTimeView init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NUIContainerStackView setAlignment:](v2, "setAlignment:", 3);
    +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
    v5 = v4;
    +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
    -[SearchUIScreenTimeView setLayoutMargins:](v3, "setLayoutMargins:", 36.0, v5, 36.0, v6);
    -[SearchUIScreenTimeView setLayoutMarginsRelativeArrangement:](v3, "setLayoutMarginsRelativeArrangement:", 1);
    -[NUIContainerStackView setSpacing:](v3, "setSpacing:", 12.0);
    +[SearchUIUtilities imageForBlockedApp](SearchUIUtilities, "imageForBlockedApp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIImageView imageViewWithImage:](SearchUIImageView, "imageViewWithImage:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[SearchUIAutoLayout requireIntrinsicSizeForView:](SearchUIAutoLayout, "requireIntrinsicSizeForView:", v8);
    -[SearchUIScreenTimeView addArrangedSubview:](v3, "addArrangedSubview:", v8);
    objc_msgSend(MEMORY[0x1E0DBD9A8], "secondaryLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DBD940], "shortSubheadFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v10);

    objc_msgSend(v9, "setNumberOfLines:", 0);
    -[SearchUIScreenTimeView addArrangedSubview:](v3, "addArrangedSubview:", v9);
    -[SearchUIScreenTimeView setLabel:](v3, "setLabel:", v9);

  }
  return v3;
}

- (void)updateWithRowModel:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "title");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUIScreenTimeView label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

}

- (TLKLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
