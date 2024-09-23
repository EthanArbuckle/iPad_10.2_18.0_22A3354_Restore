@implementation ICDebuggingItemCell

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
  -[ICDebuggingItemCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  unsigned int v17;
  id v18;
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ICDebuggingItemCell;
  -[ICDebuggingItemCell updateConfigurationUsingState:](&v20, "updateConfigurationUsingState:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration accompaniedSidebarSubtitleCellConfiguration](UIListContentConfiguration, "accompaniedSidebarSubtitleCellConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingItemCell item](self, "item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  objc_msgSend(v4, "setText:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingItemCell item](self, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subtitle"));
  objc_msgSend(v4, "setSecondaryText:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingItemCell item](self, "item"));
  LODWORD(v8) = objc_msgSend(v9, "isDestructive");

  if ((_DWORD)v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textProperties"));
    objc_msgSend(v11, "setColor:", v10);

  }
  -[ICDebuggingItemCell setContentConfiguration:](self, "setContentConfiguration:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingItemCell item](self, "item"));
  v14 = objc_msgSend(v13, "isSelected");

  if (v14)
  {
    v15 = objc_alloc_init((Class)UICellAccessoryCheckmark);
    objc_msgSend(v12, "addObject:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingItemCell item](self, "item"));
  v17 = objc_msgSend(v16, "isPresenter");

  if (v17)
  {
    v18 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
    objc_msgSend(v12, "addObject:", v18);

  }
  v19 = objc_msgSend(v12, "copy");
  -[ICDebuggingItemCell setAccessories:](self, "setAccessories:", v19);

}

- (ICDebuggingItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
