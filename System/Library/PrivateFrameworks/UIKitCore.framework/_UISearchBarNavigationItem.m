@implementation _UISearchBarNavigationItem

- (void)setTitleView:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v5 = a3;
  -[UINavigationItem titleView](self, "titleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISearchBar.m"), 2995, CFSTR("Search bar navigation items do not allow setting titleView"));

  }
  v8.receiver = self;
  v8.super_class = (Class)_UISearchBarNavigationItem;
  -[UINavigationItem setTitleView:](&v8, sel_setTitleView_, v5);

}

@end
