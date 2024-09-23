@implementation SUSearchDisplayController

- (void)_noEventSetSearchFieldText:(id)a3
{
  UISearchBar *v5;
  uint64_t v6;

  v5 = -[UISearchDisplayController searchBar](self, "searchBar");
  v6 = -[UISearchBar delegate](v5, "delegate");
  -[UISearchBar setDelegate:](v5, "setDelegate:", 0);
  -[UISearchBar setController:](v5, "setController:", 0);
  -[UISearchBar setText:](v5, "setText:", a3);
  -[UISearchBar setController:](v5, "setController:", self);
  -[UISearchBar setDelegate:](v5, "setDelegate:", v6);
  if (!objc_msgSend(a3, "length"))
    -[UISearchBar setShowsSearchResultsButton:](v5, "setShowsSearchResultsButton:", 0);
}

- (id)_createPopoverController
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUSearchDisplayController;
  v2 = -[UISearchDisplayController _createPopoverController](&v4, sel__createPopoverController);
  objc_msgSend(v2, "_setPopoverBackgroundStyle:", 3);
  return v2;
}

- (BOOL)isNavigationBarHidingEnabled
{
  return self->_store_navigationBarHidingEnabled;
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v4;
  _BOOL8 v5;
  NSString *v7;
  int64_t v8;
  dispatch_time_t v9;
  _QWORD v10[6];
  objc_super v11;

  v4 = a4;
  v5 = a3;
  if (!-[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar"))
    v4 = _UIApplicationUsesLegacyUI() & v4;
  v7 = -[UISearchBar text](-[UISearchDisplayController searchBar](self, "searchBar"), "text");
  v11.receiver = self;
  v11.super_class = (Class)SUSearchDisplayController;
  -[UISearchDisplayController setActive:animated:](&v11, sel_setActive_animated_, v5, v4);
  -[SUSearchDisplayController _noEventSetSearchFieldText:](self, "_noEventSetSearchFieldText:", v7);
  if (v5)
  {
    if ((_DWORD)v4)
      v8 = 300000000;
    else
      v8 = 0;
    v9 = dispatch_time(0, v8);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__SUSearchDisplayController_setActive_animated___block_invoke;
    v10[3] = &unk_24DE7AFB8;
    v10[4] = self;
    v10[5] = v7;
    dispatch_after(v9, MEMORY[0x24BDAC9B8], v10);
  }

}

uint64_t __48__SUSearchDisplayController_setActive_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "searchBar"), "setText:", *(_QWORD *)(a1 + 40));
}

- (void)setNavigationBarHidingEnabled:(BOOL)a3
{
  objc_super v3;

  self->_store_navigationBarHidingEnabled = a3;
  v3.receiver = self;
  v3.super_class = (Class)SUSearchDisplayController;
  -[UISearchDisplayController setNavigationBarHidingEnabled:](&v3, sel_setNavigationBarHidingEnabled_);
}

@end
