@implementation RAPNavigationItemValues

- (void)takeValuesFromNavigationItem:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *title;
  UIBarButtonItem *v8;
  UIBarButtonItem *backBarButtonItem;
  UIView *v10;
  UIView *titleView;
  void *v12;
  NSString *v13;
  NSString *prompt;
  void *v15;
  NSArray *v16;
  NSArray *leftBarButtonItems;
  NSArray *v18;
  NSArray *rightBarButtonItems;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v6 = (NSString *)objc_msgSend(v5, "copy");
  title = self->_title;
  self->_title = v6;

  v8 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backBarButtonItem"));
  backBarButtonItem = self->_backBarButtonItem;
  self->_backBarButtonItem = v8;

  v10 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleView"));
  titleView = self->_titleView;
  self->_titleView = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "prompt"));
  v13 = (NSString *)objc_msgSend(v12, "copy");
  prompt = self->_prompt;
  self->_prompt = v13;

  self->_leftItemsSupplementBackButton = objc_msgSend(v4, "leftItemsSupplementBackButton");
  self->_hidesBackButton = objc_msgSend(v4, "hidesBackButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leftBarButtonItems"));
  v16 = (NSArray *)objc_msgSend(v15, "copy");
  leftBarButtonItems = self->_leftBarButtonItems;
  self->_leftBarButtonItems = v16;

  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rightBarButtonItems"));
  v18 = (NSArray *)objc_msgSend(v20, "copy");
  rightBarButtonItems = self->_rightBarButtonItems;
  self->_rightBarButtonItems = v18;

}

- (void)setValuesOnNavigationItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSString *title;
  id v7;

  v4 = a4;
  title = self->_title;
  v7 = a3;
  objc_msgSend(v7, "setTitle:", title);
  objc_msgSend(v7, "setBackBarButtonItem:", self->_backBarButtonItem);
  objc_msgSend(v7, "setTitleView:", self->_titleView);
  objc_msgSend(v7, "setPrompt:", self->_prompt);
  objc_msgSend(v7, "setLeftItemsSupplementBackButton:", self->_leftItemsSupplementBackButton);
  objc_msgSend(v7, "setHidesBackButton:animated:", self->_hidesBackButton, v4);
  objc_msgSend(v7, "setLeftBarButtonItems:animated:", self->_leftBarButtonItems, v4);
  objc_msgSend(v7, "setRightBarButtonItems:animated:", self->_rightBarButtonItems, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
