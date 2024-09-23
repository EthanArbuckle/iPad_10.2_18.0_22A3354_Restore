@implementation VSSearchBarDelegate

- (VSSearchBarDelegate)init
{
  VSSearchBarDelegate *v2;
  VSSearchBarDelegate *v3;
  NSString *text;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSSearchBarDelegate;
  v2 = -[VSSearchBarDelegate init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    text = v2->_text;
    v2->_text = (NSString *)&stru_24FE1B848;

  }
  return v3;
}

- (void)clearText
{
  void *v3;

  -[VSSearchBarDelegate searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_24FE1B848);

  -[VSSearchBarDelegate setText:](self, "setText:", &stru_24FE1B848);
}

- (void)setSearchBar:(id)a3
{
  UISearchBar *v5;
  UISearchBar *searchBar;
  void *v7;
  void *v8;
  __CFString *v9;
  UISearchBar *v10;

  v5 = (UISearchBar *)a3;
  searchBar = self->_searchBar;
  if (searchBar != v5)
  {
    v10 = v5;
    -[UISearchBar setDelegate:](searchBar, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_searchBar, a3);
    -[UISearchBar setDelegate:](v10, "setDelegate:", self);
    -[UISearchBar text](v10, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = &stru_24FE1B848;
    -[VSSearchBarDelegate setText:](self, "setText:", v9);

    v5 = v10;
  }

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[VSSearchBarDelegate setText:](self, "setText:", a4);
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
}

@end
