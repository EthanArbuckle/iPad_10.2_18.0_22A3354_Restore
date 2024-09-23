@implementation UITabSidebarItemRequest

- (id)_initWithTab:(id)a3 cell:(id)a4 isHeader:(BOOL)a5
{
  id v9;
  id v10;
  UITabSidebarItemRequest *v11;
  UITabSidebarItemRequest *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UITabSidebarItemRequest;
  v11 = -[UITabSidebarItemRequest init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_tab, a3);
    objc_storeWeak((id *)&v12->_cell, v10);
    v12->_header = a5;
  }

  return v12;
}

- (id)_initWithAction:(id)a3 cell:(id)a4
{
  id v7;
  id v8;
  UITabSidebarItemRequest *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UITabSidebarItemRequest;
  v9 = -[UITabSidebarItemRequest init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_action, a3);
    objc_storeWeak(p_isa + 2, v8);
  }

  return p_isa;
}

- (UICollectionViewListCell)_cell
{
  return (UICollectionViewListCell *)objc_loadWeakRetained((id *)&self->_cell);
}

- (void)set_cell:(id)a3
{
  objc_storeWeak((id *)&self->_cell, a3);
}

- (BOOL)_isHeader
{
  return self->_header;
}

- (void)set_header:(BOOL)a3
{
  self->_header = a3;
}

- (UITab)tab
{
  return self->_tab;
}

- (UIAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_tab, 0);
  objc_destroyWeak((id *)&self->_cell);
}

@end
