@implementation OBTextSectionView

- (OBTextSectionView)initWithHeader:(id)a3 content:(id)a4
{
  id v6;
  id v7;
  OBTextSectionView *v8;
  OBTextSectionView *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
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
  objc_super v33;

  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)OBTextSectionView;
  v8 = -[OBTextSectionView initWithFrame:](&v33, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    -[OBTextSectionView setAxis:](v8, "setAxis:", 1);
    -[OBTextSectionView setAlignment:](v9, "setAlignment:", 1);
    if (objc_msgSend(v6, "length"))
    {
      v10 = objc_alloc_init(MEMORY[0x1E0DC3990]);
      -[OBTextSectionView setHeaderLabel:](v9, "setHeaderLabel:", v10);

      -[OBTextSectionView headerLabel](v9, "headerLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[OBTextSectionView headerLabel](v9, "headerLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", v6);

      -[OBTextSectionView headerLabel](v9, "headerLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTextAlignment:", 4);

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBTextSectionView headerLabel](v9, "headerLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTextColor:", v14);

      -[OBTextSectionView _headerFont](v9, "_headerFont");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBTextSectionView headerLabel](v9, "headerLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFont:", v16);

      -[OBTextSectionView headerLabel](v9, "headerLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setNumberOfLines:", 0);

      -[OBTextSectionView headerLabel](v9, "headerLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBTextSectionView addArrangedSubview:](v9, "addArrangedSubview:", v19);

    }
    if (objc_msgSend(v7, "length"))
    {
      v20 = objc_alloc_init(MEMORY[0x1E0DC3990]);
      -[OBTextSectionView setContentLabel:](v9, "setContentLabel:", v20);

      -[OBTextSectionView contentLabel](v9, "contentLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[OBTextSectionView contentLabel](v9, "contentLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setText:", v7);

      -[OBTextSectionView contentLabel](v9, "contentLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTextAlignment:", 4);

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBTextSectionView contentLabel](v9, "contentLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setTextColor:", v24);

      -[OBTextSectionView _contentFont](v9, "_contentFont");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBTextSectionView contentLabel](v9, "contentLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setFont:", v26);

      -[OBTextSectionView contentLabel](v9, "contentLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setNumberOfLines:", 0);

      -[OBTextSectionView contentLabel](v9, "contentLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBTextSectionView addArrangedSubview:](v9, "addArrangedSubview:", v29);

      -[OBTextSectionView headerLabel](v9, "headerLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        -[OBTextSectionView headerLabel](v9, "headerLabel");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBTextSectionView setCustomSpacing:afterView:](v9, "setCustomSpacing:afterView:", v31, 6.0);

      }
    }
  }

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OBTextSectionView;
  -[OBTextSectionView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, a3);
  -[OBTextSectionView _headerFont](self, "_headerFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextSectionView headerLabel](self, "headerLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[OBTextSectionView _contentFont](self, "_contentFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextSectionView contentLabel](self, "contentLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

}

- (id)_headerFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_contentFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabel, a3);
}

- (UILabel)contentLabel
{
  return self->_contentLabel;
}

- (void)setContentLabel:(id)a3
{
  objc_storeStrong((id *)&self->_contentLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end
