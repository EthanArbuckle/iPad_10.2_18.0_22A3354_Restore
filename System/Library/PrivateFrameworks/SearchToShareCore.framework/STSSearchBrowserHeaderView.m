@implementation STSSearchBrowserHeaderView

- (STSSearchBrowserHeaderView)init
{
  STSSearchBrowserHeaderView *v2;
  void *v3;
  STSSearchBar *v4;
  UISearchBar *searchBar;
  void *v6;
  void *v7;
  void *v8;
  UISearchBar *v9;
  void *v10;
  void *v11;
  id v12;
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
  objc_super v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)STSSearchBrowserHeaderView;
  v2 = -[STSSearchBrowserHeaderView init](&v29, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "sts_defaultBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSSearchBrowserHeaderView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    v4 = objc_alloc_init(STSSearchBar);
    searchBar = v2->_searchBar;
    v2->_searchBar = &v4->super;

    -[UISearchBar searchField](v2->_searchBar, "searchField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchBar setSearchBarStyle:](v2->_searchBar, "setSearchBarStyle:", 2);
    -[UISearchBar searchTextField](v2->_searchBar, "searchTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "sts_headerZKWSearchButtonAndSearchTextFieldBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

    v9 = v2->_searchBar;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemPinkColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchBar setTintColor:](v9, "setTintColor:", v10);

    -[UISearchBar setTranslatesAutoresizingMaskIntoConstraints:](v2->_searchBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    STSLocalizedString(CFSTR("SEARCHBAR_PLACEHOLDER"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x24BDD1688]);
    v30 = *MEMORY[0x24BEBB368];
    objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithString:attributes:", v11, v14);

    objc_msgSend(v6, "setAttributedPlaceholder:", v15);
    -[UISearchBar setShowsCancelButton:](v2->_searchBar, "setShowsCancelButton:", 1);
    -[UISearchBar cancelButton](v2->_searchBar, "cancelButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEnabled:", 1);

    -[UISearchBar _setAutoDisableCancelButton:](v2->_searchBar, "_setAutoDisableCancelButton:", 0);
    -[STSSearchBrowserHeaderView addSubview:](v2, "addSubview:", v2->_searchBar);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[UISearchBar leadingAnchor](v2->_searchBar, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSSearchBrowserHeaderView leadingAnchor](v2, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v21);

    -[UISearchBar trailingAnchor](v2->_searchBar, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSSearchBrowserHeaderView trailingAnchor](v2, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v24);

    -[UISearchBar topAnchor](v2->_searchBar, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSSearchBrowserHeaderView topAnchor](v2, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v27);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v18);
  }
  return v2;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *searchBarHeight;
  void *v6;
  double v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *v9;
  void *v10;
  void *v11;
  objc_super v12;
  NSLayoutConstraint *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)STSSearchBrowserHeaderView;
  -[STSSearchBrowserHeaderView updateConstraints](&v12, sel_updateConstraints);
  if (self->_searchBarHeight)
  {
    v3 = (void *)MEMORY[0x24BDD1628];
    v14[0] = self->_searchBarHeight;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deactivateConstraints:", v4);

    searchBarHeight = self->_searchBarHeight;
    self->_searchBarHeight = 0;

  }
  -[UISearchBar sizeToFit](self->_searchBar, "sizeToFit");
  -[UISearchBar heightAnchor](self->_searchBar, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchBar bounds](self->_searchBar, "bounds");
  objc_msgSend(v6, "constraintEqualToConstant:", v7);
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v9 = self->_searchBarHeight;
  self->_searchBarHeight = v8;

  v10 = (void *)MEMORY[0x24BDD1628];
  v13 = self->_searchBarHeight;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateConstraints:", v11);

}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[STSSearchBrowserHeaderView frame](self, "frame");
  -[STSSearchBrowserHeaderView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UISearchBar sizeThatFits:](self->_searchBar, "sizeThatFits:", a3.width, a3.height);
  v5 = v4 + 7.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_searchBarHeight, 0);
}

@end
