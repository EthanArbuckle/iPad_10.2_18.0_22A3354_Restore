@implementation ShortcutFooterToolBarView

- (void)_updateContent
{
  unint64_t v3;
  id v4;

  v3 = -[FooterToolBarView state](self, "state");
  if (v3)
  {
    if (v3 == 8)
    {
      -[ShortcutFooterToolBarView loadListShortcutEditActions](self, "loadListShortcutEditActions");
    }
    else if (v3 == 7)
    {
      -[ShortcutFooterToolBarView loadListShortcutActions](self, "loadListShortcutActions");
    }
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView toolBar](self, "toolBar"));
    objc_msgSend(v4, "setItems:", &__NSArray0__struct);

  }
}

- (void)loadListShortcutActions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v3 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 4, self, "newShortcutAction:");
  v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 2, self, "editListShortcutAction:");
  v8[0] = v5;
  v8[1] = v4;
  v8[2] = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView toolBar](self, "toolBar"));
  objc_msgSend(v7, "setItems:", v6);

}

- (void)loadListShortcutEditActions
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v3 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "cancelListShortcutAction:");
  v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v7[0] = v3;
  v7[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView toolBar](self, "toolBar"));
  objc_msgSend(v6, "setItems:", v5);

}

- (void)newShortcutAction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView delegate](self, "delegate", a3));
  objc_msgSend(v4, "view:requestsShortcutAction:", self, 2);

}

- (void)cancelListShortcutAction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView delegate](self, "delegate", a3));
  objc_msgSend(v4, "view:requestsShortcutAction:", self, 1);

}

- (void)editListShortcutAction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView delegate](self, "delegate", a3));
  objc_msgSend(v4, "view:requestsShortcutAction:", self, 0);

}

@end
