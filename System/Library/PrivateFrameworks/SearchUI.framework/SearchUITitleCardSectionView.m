@implementation SearchUITitleCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DBD940], "boldBodyFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(v3, "setNumberOfLines:", 2);
  -[SearchUITitleCardSectionView setLabel:](self, "setLabel:", v3);
  v5 = objc_alloc(MEMORY[0x1E0CFAA98]);
  v20[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArrangedSubviews:", v6);
  -[SearchUITitleCardSectionView setContainerView:](self, "setContainerView:", v7);

  -[SearchUITitleCardSectionView containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLayoutMarginsRelativeArrangement:", 1);

  objc_msgSend(MEMORY[0x1E0DBDA50], "defaultLayoutMargins");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[SearchUITitleCardSectionView containerView](self, "containerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLayoutMargins:", v10, v12, v14, v16);

  -[SearchUITitleCardSectionView containerView](self, "containerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)SearchUITitleCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v14, sel_updateWithRowModel_, v4);

  v6 = objc_msgSend(v5, "isCentered");
  -[SearchUITitleCardSectionView label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "setTextAlignment:", 1);

    -[SearchUITitleCardSectionView containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 3;
  }
  else
  {
    objc_msgSend(v7, "setTextAlignment:", 4);

    -[SearchUITitleCardSectionView containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 1;
  }
  objc_msgSend(v9, "setHorizontalAlignment:", v11);

  objc_msgSend(v5, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUITitleCardSectionView label](self, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

}

- (TLKLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NUIContainerBoxView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
