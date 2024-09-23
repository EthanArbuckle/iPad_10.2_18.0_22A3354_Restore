@implementation TLKContentsView

- (TLKContentsView)init
{
  TLKContentsView *v2;
  TLKContentsView *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TLKContentsView;
  v2 = -[TLKContentsView init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TLKStackView setAxis:](v2, "setAxis:", 1);
    v4 = (void *)objc_opt_new();
    +[TLKFontUtilities shortSubheadBoldFont](TLKFontUtilities, "shortSubheadBoldFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v5);

    -[TLKContentsView setTitleLabel:](v3, "setTitleLabel:", v4);
    -[TLKStackView addArrangedSubview:](v3, "addArrangedSubview:", v4);
    -[NUIContainerStackView setCustomSpacing:afterView:](v3, "setCustomSpacing:afterView:", v4, 4.0);
    v6 = (void *)objc_opt_new();
    -[TLKContentsView setDetailsLabels:](v3, "setDetailsLabels:", v6);

  }
  return v3;
}

+ (id)detailsLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  +[TLKFontUtilities shortFootnoteFont](TLKFontUtilities, "shortFootnoteFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  objc_msgSend(v2, "setLineBreakMode:", 0);
  return v2;
}

- (void)updateWithTitle:(id)a3 contents:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  unint64_t i;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  v6 = a4;
  -[TLKContentsView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMultilineText:", v30);

  objc_msgSend(v30, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKContentsView titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", v8 == 0);

  v10 = objc_msgSend(v6, "count");
  -[TLKContentsView detailsLabels](self, "detailsLabels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v10 != v12)
  {
    v17 = objc_msgSend(v6, "count");
    -[TLKContentsView detailsLabels](self, "detailsLabels");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v17 <= v19)
    {
      for (i = objc_msgSend(v6, "count"); ; ++i)
      {
        -[TLKContentsView detailsLabels](self, "detailsLabels");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");

        if (i >= v27)
          break;
        -[TLKContentsView detailsLabels](self, "detailsLabels");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndexedSubscript:", i);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setHidden:", 1);

      }
    }
    else
    {
      while (1)
      {
        -[TLKContentsView detailsLabels](self, "detailsLabels");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");
        v22 = objc_msgSend(v6, "count");

        if (v21 >= v22)
          break;
        objc_msgSend((id)objc_opt_class(), "detailsLabel");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLKContentsView detailsLabels](self, "detailsLabels");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v23);

        -[TLKStackView addArrangedSubview:](self, "addArrangedSubview:", v23);
      }
    }
  }
  if (objc_msgSend(v6, "count"))
  {
    v13 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKContentsView detailsLabels](self, "detailsLabels");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMultilineText:", v14);

      ++v13;
    }
    while (v13 < objc_msgSend(v6, "count"));
  }

}

- (TLKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSMutableArray)detailsLabels
{
  return self->_detailsLabels;
}

- (void)setDetailsLabels:(id)a3
{
  objc_storeStrong((id *)&self->_detailsLabels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsLabels, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
