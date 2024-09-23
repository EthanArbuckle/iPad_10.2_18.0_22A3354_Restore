@implementation _TUIElementMenuItemBuilder

- (id)finalizeMenuItem
{
  _TUIMenuItemContainer *v3;
  void *v4;
  _TUIMenuItemContainer *v5;

  if (self->_title)
  {
    v3 = [_TUIMenuItemContainer alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUIMenuItemModel menuItemWithTitle:imageModel:isEnabled:isOn:action:](TUIMenuItemModel, "menuItemWithTitle:imageModel:isEnabled:isOn:action:", self->_title, self->_imageModel, self->_isEnabled, self->_isOn, self->_action));
    v5 = -[_TUIMenuItemContainer initWithModel:](v3, "initWithModel:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)addTrigger:(id)a3 withBehavior:(id)a4
{
  id v7;

  v7 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("press")))
    objc_storeStrong((id *)&self->_action, a4);

}

- (id)finalizeTriggers
{
  return 0;
}

- (void)addText:(id)a3 forRole:(id)a4
{
  id v6;
  void *v7;
  NSString *v8;
  NSString *title;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "isEqualToString:", CFSTR("title")))
  {
    v8 = (NSString *)objc_msgSend(v10, "copy");
    title = self->_title;
    self->_title = v8;

  }
}

- (void)addImageModel:(id)a3 forRole:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7 || objc_msgSend(v7, "isEqualToString:", CFSTR("image")))
    objc_storeStrong((id *)&self->_imageModel, a3);

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TUIImageModel)imageModel
{
  return self->_imageModel;
}

- (void)setImageModel:(id)a3
{
  objc_storeStrong((id *)&self->_imageModel, a3);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isOn
{
  return self->_isOn;
}

- (void)setIsOn:(BOOL)a3
{
  self->_isOn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageModel, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
