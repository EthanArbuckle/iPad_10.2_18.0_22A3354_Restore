@implementation _UIStatusBarMultilineStringView

- (_UIStatusBarMultilineStringView)initWithFrame:(CGRect)a3
{
  _UIStatusBarMultilineStringView *v3;
  UIStackView *v4;
  uint64_t v5;
  UIStackView *stackView;
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
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_UIStatusBarMultilineStringView;
  v3 = -[UIView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [UIStackView alloc];
  -[UIView bounds](v3, "bounds");
  v5 = -[UIStackView initWithFrame:](v4, "initWithFrame:");
  stackView = v3->_stackView;
  v3->_stackView = (UIStackView *)v5;

  -[UIStackView setAxis:](v3->_stackView, "setAxis:", 1);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v3, "addSubview:", v3->_stackView);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](v3, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](v3->_stackView, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

  -[UIView trailingAnchor](v3, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](v3->_stackView, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v13);

  -[UIView topAnchor](v3, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](v3->_stackView, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v16);

  -[UIView bottomAnchor](v3, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](v3->_stackView, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v19);

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v7);
  return v3;
}

- (void)setNumberOfLines:(int64_t)a3
{
  int64_t v3;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _UIStatusBarStringView *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_numberOfLines != a3)
  {
    v3 = a3;
    self->_numberOfLines = a3;
    -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          -[UIStackView removeArrangedSubview:](self->_stackView, "removeArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), (_QWORD)v13);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    if (v3 >= 1)
    {
      do
      {
        v12 = objc_alloc_init(_UIStatusBarStringView);
        -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v12);

        --v3;
      }
      while (v3);
    }

  }
}

- (NSArray)stringViews
{
  return -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
}

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_UIStatusBarMultilineStringView stringViews](self, "stringViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "applyStyleAttributes:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)viewForFirstBaselineLayout
{
  void *v2;
  void *v3;

  -[_UIStatusBarMultilineStringView stringViews](self, "stringViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)viewForLastBaselineLayout
{
  void *v2;
  void *v3;

  -[_UIStatusBarMultilineStringView stringViews](self, "stringViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
