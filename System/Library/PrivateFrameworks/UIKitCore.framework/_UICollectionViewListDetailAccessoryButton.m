@implementation _UICollectionViewListDetailAccessoryButton

- (_UICollectionViewListDetailAccessoryButton)initWithConstants:(id)a3
{
  id v5;
  _UICollectionViewListDetailAccessoryButton *v6;
  _UICollectionViewListDetailAccessoryButton *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionViewListDetailAccessoryButton;
  v6 = -[UIButton initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_constants, a3);
    +[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setButtonSize:", 1);
    objc_msgSend(v5, "defaultDetailAccessoryImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v9);

    -[UIButton setConfiguration:](v7, "setConfiguration:", v8);
  }

  return v7;
}

- (void)setActionHandler:(id)a3
{
  id actionHandler;
  void *v6;
  id v7;

  actionHandler = self->_actionHandler;
  v6 = (void *)objc_msgSend(a3, "copy");
  v7 = self->_actionHandler;
  self->_actionHandler = v6;

  if (!a3 || actionHandler)
  {
    if (!a3)
    {
      if (actionHandler)
        -[UIControl removeTarget:action:forControlEvents:](self, "removeTarget:action:forControlEvents:", self, sel__executeActionHandler, 0x2000);
    }
  }
  else
  {
    -[UIControl addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel__executeActionHandler, 0x2000);
  }
}

- (void)_executeActionHandler
{
  void (**actionHandler)(void);

  actionHandler = (void (**)(void))self->_actionHandler;
  if (actionHandler)
    actionHandler[2]();
}

- (void)setAccessoryTintColor:(id)a3
{
  UIColor *v5;
  objc_super v6;

  v5 = (UIColor *)a3;
  if (self->_accessoryTintColor != v5)
  {
    objc_storeStrong((id *)&self->_accessoryTintColor, a3);
    v6.receiver = self;
    v6.super_class = (Class)_UICollectionViewListDetailAccessoryButton;
    -[UIButton setTintColor:](&v6, sel_setTintColor_, v5);
  }

}

- (void)setAccessoryBackgroundColor:(id)a3
{
  UIColor *v5;
  objc_super v6;

  v5 = (UIColor *)a3;
  if (self->_accessoryBackgroundColor != v5)
  {
    objc_storeStrong((id *)&self->_accessoryBackgroundColor, a3);
    v6.receiver = self;
    v6.super_class = (Class)_UICollectionViewListDetailAccessoryButton;
    -[UIView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);
  }

}

- (id)_renderedImage
{
  void *v2;
  void *v3;

  -[UIButton configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setConstants:(id)a3
{
  UITableConstants *v5;
  UITableConstants *v6;

  v5 = (UITableConstants *)a3;
  if (self->_constants != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_constants, a3);
    -[UIButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
    v5 = v6;
  }

}

- (void)updateConfiguration
{
  void *v3;
  id v4;

  -[UIButton configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableConstants defaultDetailAccessoryImage](self->_constants, "defaultDetailAccessoryImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

  -[UIButton setConfiguration:](self, "setConfiguration:", v4);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UITableConstants)constants
{
  return self->_constants;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (UIColor)accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (UIColor)accessoryBackgroundColor
{
  return self->_accessoryBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryBackgroundColor, 0);
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_constants, 0);
}

@end
