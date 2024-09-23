@implementation _UINavigationBarContents

- (_UINavigationBarContents)init
{
  _UINavigationBarContents *v2;
  _UINavigationBarContents *v3;
  NSArray *viewsRepresentingBackButton;
  NSArray *v5;
  NSArray *cancelBarButtonItems;
  NSArray *otherBarButtonItems;
  NSArray *viewsRepresentingContentBackground;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UINavigationBarContents;
  v2 = -[_UINavigationBarContents init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    viewsRepresentingBackButton = v2->_viewsRepresentingBackButton;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_viewsRepresentingBackButton = (NSArray *)MEMORY[0x1E0C9AA60];

    cancelBarButtonItems = v3->_cancelBarButtonItems;
    v3->_cancelBarButtonItems = v5;

    otherBarButtonItems = v3->_otherBarButtonItems;
    v3->_otherBarButtonItems = v5;

    viewsRepresentingContentBackground = v3->_viewsRepresentingContentBackground;
    v3->_viewsRepresentingContentBackground = v5;

  }
  return v3;
}

- (void)setViewsRepresentingBackButton:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  NSArray *viewsRepresentingBackButton;
  id v8;

  v4 = a3;
  if (v4)
    v5 = v4;
  else
    v5 = (id)MEMORY[0x1E0C9AA60];
  v8 = v5;
  if (!-[NSArray isEqualToArray:](self->_viewsRepresentingBackButton, "isEqualToArray:"))
  {
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    viewsRepresentingBackButton = self->_viewsRepresentingBackButton;
    self->_viewsRepresentingBackButton = v6;

  }
}

- (void)setCancelBarButtonItems:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  NSArray *cancelBarButtonItems;
  id v8;

  v4 = a3;
  if (v4)
    v5 = v4;
  else
    v5 = (id)MEMORY[0x1E0C9AA60];
  v8 = v5;
  if (!-[NSArray isEqualToArray:](self->_cancelBarButtonItems, "isEqualToArray:"))
  {
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    cancelBarButtonItems = self->_cancelBarButtonItems;
    self->_cancelBarButtonItems = v6;

  }
}

- (void)setOtherBarButtonItems:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  NSArray *otherBarButtonItems;
  id v8;

  v4 = a3;
  if (v4)
    v5 = v4;
  else
    v5 = (id)MEMORY[0x1E0C9AA60];
  v8 = v5;
  if (!-[NSArray isEqualToArray:](self->_otherBarButtonItems, "isEqualToArray:"))
  {
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    otherBarButtonItems = self->_otherBarButtonItems;
    self->_otherBarButtonItems = v6;

  }
}

- (void)setViewsRepresentingContentBackground:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  NSArray *viewsRepresentingContentBackground;
  id v8;

  v4 = a3;
  if (v4)
    v5 = v4;
  else
    v5 = (id)MEMORY[0x1E0C9AA60];
  v8 = v5;
  if (!-[NSArray isEqualToArray:](self->_viewsRepresentingContentBackground, "isEqualToArray:"))
  {
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    viewsRepresentingContentBackground = self->_viewsRepresentingContentBackground;
    self->_viewsRepresentingContentBackground = v6;

  }
}

- (UINavigationItem)topItem
{
  return self->_topItem;
}

- (void)setTopItem:(id)a3
{
  objc_storeStrong((id *)&self->_topItem, a3);
}

- (UINavigationItem)backItem
{
  return self->_backItem;
}

- (void)setBackItem:(id)a3
{
  objc_storeStrong((id *)&self->_backItem, a3);
}

- (NSArray)viewsRepresentingBackButton
{
  return self->_viewsRepresentingBackButton;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (_UINavigationBarTitleView)augmentedTitleView
{
  return self->_augmentedTitleView;
}

- (void)setAugmentedTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_augmentedTitleView, a3);
}

- (UIView)largeTitleView
{
  return self->_largeTitleView;
}

- (void)setLargeTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_largeTitleView, a3);
}

- (UIView)promptView
{
  return self->_promptView;
}

- (void)setPromptView:(id)a3
{
  objc_storeStrong((id *)&self->_promptView, a3);
}

- (UIBarButtonItem)backBarButtonItem
{
  return self->_backBarButtonItem;
}

- (void)setBackBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_backBarButtonItem, a3);
}

- (UIBarButtonItem)staticBarButtonItem
{
  return self->_staticBarButtonItem;
}

- (void)setStaticBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_staticBarButtonItem, a3);
}

- (NSArray)cancelBarButtonItems
{
  return self->_cancelBarButtonItems;
}

- (NSArray)otherBarButtonItems
{
  return self->_otherBarButtonItems;
}

- (NSArray)viewsRepresentingContentBackground
{
  return self->_viewsRepresentingContentBackground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsRepresentingContentBackground, 0);
  objc_storeStrong((id *)&self->_otherBarButtonItems, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItems, 0);
  objc_storeStrong((id *)&self->_staticBarButtonItem, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_storeStrong((id *)&self->_promptView, 0);
  objc_storeStrong((id *)&self->_largeTitleView, 0);
  objc_storeStrong((id *)&self->_augmentedTitleView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_viewsRepresentingBackButton, 0);
  objc_storeStrong((id *)&self->_backItem, 0);
  objc_storeStrong((id *)&self->_topItem, 0);
}

@end
