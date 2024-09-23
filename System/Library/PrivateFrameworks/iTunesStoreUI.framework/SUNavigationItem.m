@implementation SUNavigationItem

- (UIBarButtonItem)secondaryLeftBarButtonItem
{
  void *v2;
  UIBarButtonItem *result;

  v2 = (void *)-[SUNavigationItem leftBarButtonItems](self, "leftBarButtonItems");
  result = (UIBarButtonItem *)objc_msgSend(v2, "count");
  if (result)
    return (UIBarButtonItem *)objc_msgSend(v2, "objectAtIndex:", 0);
  return result;
}

- (void)setSecondaryLeftBarButtonItem:(id)a3
{
  -[SUNavigationItem setSecondaryLeftBarButtonItem:animated:](self, "setSecondaryLeftBarButtonItem:animated:", a3, 0);
}

- (void)setSecondaryLeftBarButtonItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[SUNavigationItem setLeftItemsSupplementBackButton:](self, "setLeftItemsSupplementBackButton:", 1);
  -[SUNavigationItem setLeftBarButtonItems:animated:](self, "setLeftBarButtonItems:animated:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a3, 0), v4);
}

- (void)setLeftBarButtonItem:(id)a3
{
  uint64_t v5;
  objc_super *v6;
  SUNavigationItem *v7;
  __objc2_class *v8;
  objc_super v9;
  objc_super v10;

  -[SUNavigationItem delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = -[SUNavigationItemDelegate navigationItem:willChangeLeftItem:toNewItem:](-[SUNavigationItem delegate](self, "delegate"), "navigationItem:willChangeLeftItem:toNewItem:", self, -[SUNavigationItem leftBarButtonItem](self, "leftBarButtonItem"), a3);
    if (v5)
    {
      -[SUNavigationItem setLeftBarButtonItem:](&v10, sel_setLeftBarButtonItem_, v5, v7, v8, v9.receiver, v9.super_class, self, SUNavigationItem);
      return;
    }
    v9.receiver = self;
    v9.super_class = (Class)SUNavigationItem;
    v6 = &v9;
  }
  else
  {
    v7 = self;
    v8 = SUNavigationItem;
    v6 = (objc_super *)&v7;
  }
  -[objc_super setLeftBarButtonItem:](v6, sel_setLeftBarButtonItem_, a3, v7, v8, v9.receiver, v9.super_class, v10.receiver, v10.super_class);
}

- (void)setLeftBarButtonItems:(id)a3
{
  void *v5;
  void *v6;
  objc_super *v7;
  SUNavigationItem *v8;
  __objc2_class *v9;
  objc_super v10;
  objc_super v11;

  -[SUNavigationItem delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (void *)-[SUNavigationItemDelegate navigationItem:willChangeLeftItems:toNewItems:](-[SUNavigationItem delegate](self, "delegate"), "navigationItem:willChangeLeftItems:toNewItems:", self, -[SUNavigationItem leftBarButtonItems](self, "leftBarButtonItems"), a3);
    if (v5)
    {
      v6 = v5;
      if (objc_msgSend(v5, "count"))
      {
        -[SUNavigationItem setLeftBarButtonItems:](&v11, sel_setLeftBarButtonItems_, v6, v8, v9, v10.receiver, v10.super_class, self, SUNavigationItem);
        return;
      }
    }
    v10.receiver = self;
    v10.super_class = (Class)SUNavigationItem;
    v7 = &v10;
  }
  else
  {
    v8 = self;
    v9 = SUNavigationItem;
    v7 = (objc_super *)&v8;
  }
  -[objc_super setLeftBarButtonItems:](v7, sel_setLeftBarButtonItems_, a3, v8, v9, v10.receiver, v10.super_class, v11.receiver, v11.super_class);
}

- (void)setLeftBarButtonItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  objc_super *v9;
  SUNavigationItem *v10;
  __objc2_class *v11;
  objc_super v12;
  objc_super v13;

  v4 = a4;
  -[SUNavigationItem delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)-[SUNavigationItemDelegate navigationItem:willChangeLeftItems:toNewItems:](-[SUNavigationItem delegate](self, "delegate"), "navigationItem:willChangeLeftItems:toNewItems:", self, -[SUNavigationItem leftBarButtonItems](self, "leftBarButtonItems"), a3);
    if (v7)
    {
      v8 = v7;
      if (objc_msgSend(v7, "count"))
      {
        -[SUNavigationItem setLeftBarButtonItems:animated:](&v13, sel_setLeftBarButtonItems_animated_, v8, v4, v10, v11, v12.receiver, v12.super_class, self, SUNavigationItem);
        return;
      }
    }
    v12.receiver = self;
    v12.super_class = (Class)SUNavigationItem;
    v9 = &v12;
  }
  else
  {
    v10 = self;
    v11 = SUNavigationItem;
    v9 = (objc_super *)&v10;
  }
  -[objc_super setLeftBarButtonItems:animated:](v9, sel_setLeftBarButtonItems_animated_, a3, v4, v10, v11, v12.receiver, v12.super_class, v13.receiver, v13.super_class);
}

- (void)setLeftBarButtonItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  objc_super *v8;
  SUNavigationItem *v9;
  __objc2_class *v10;
  objc_super v11;
  objc_super v12;

  v4 = a4;
  -[SUNavigationItem delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = -[SUNavigationItemDelegate navigationItem:willChangeLeftItem:toNewItem:](-[SUNavigationItem delegate](self, "delegate"), "navigationItem:willChangeLeftItem:toNewItem:", self, -[SUNavigationItem leftBarButtonItem](self, "leftBarButtonItem"), a3);
    if (v7)
    {
      -[SUNavigationItem setLeftBarButtonItem:animated:](&v12, sel_setLeftBarButtonItem_animated_, v7, v4, v9, v10, v11.receiver, v11.super_class, self, SUNavigationItem);
      return;
    }
    v11.receiver = self;
    v11.super_class = (Class)SUNavigationItem;
    v8 = &v11;
  }
  else
  {
    v9 = self;
    v10 = SUNavigationItem;
    v8 = (objc_super *)&v9;
  }
  -[objc_super setLeftBarButtonItem:animated:](v8, sel_setLeftBarButtonItem_animated_, a3, v4, v9, v10, v11.receiver, v11.super_class, v12.receiver, v12.super_class);
}

- (SUNavigationItemDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUNavigationItemDelegate *)a3;
}

@end
