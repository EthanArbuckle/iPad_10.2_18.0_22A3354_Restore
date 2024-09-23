@implementation TLKButtonView

+ (UIEdgeInsets)defaultLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  UIEdgeInsets result;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TLKButtonView;
  objc_msgSendSuper2(&v6, sel_defaultLayoutMargins);
  v4 = 15.79;
  v5 = 15.9;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (id)setupContentView
{
  void *v3;
  void *v4;
  TLKStackView *v5;
  void *v6;
  TLKStackView *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  +[TLKFontUtilities cachedFontForTextStyle:isShort:isBold:](TLKFontUtilities, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4AD0], TLKSnippetModernizationEnabled() ^ 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(v3, "setTextAlignment:", 1);
  -[TLKButtonView setTitleLabel:](self, "setTitleLabel:", v3);
  v5 = [TLKStackView alloc];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NUIContainerStackView initWithArrangedSubviews:](v5, "initWithArrangedSubviews:", v6);

  -[TLKStackView setAxis:](v7, "setAxis:", 1);
  -[TLKStackView setAlignment:](v7, "setAlignment:", 3);
  -[TLKButtonView setStackView:](self, "setStackView:", v7);

  return v7;
}

- (void)setTitle:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (self->_title != v10)
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)observedPropertiesChanged
{
  void *v3;
  id v4;

  -[TLKButtonView title](self, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TLKButtonView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

}

- (NSString)title
{
  return self->_title;
}

- (TLKStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (TLKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
