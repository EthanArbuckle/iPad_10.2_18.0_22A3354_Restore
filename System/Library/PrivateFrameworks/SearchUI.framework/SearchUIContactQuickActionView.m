@implementation SearchUIContactQuickActionView

- (void)setEnabled:(BOOL)a3
{
  id v3;

  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[SearchUIContactQuickActionView generator](self, "generator");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateButtons");

  }
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->title, a3);
}

- (SearchUIContactButtonItemGenerator)generator
{
  return (SearchUIContactButtonItemGenerator *)objc_loadWeakRetained((id *)&self->_generator);
}

- (void)setGenerator:(id)a3
{
  objc_storeWeak((id *)&self->_generator, a3);
}

- (SearchUIContactButtonItem)buttonItem
{
  return (SearchUIContactButtonItem *)objc_loadWeakRetained((id *)&self->_buttonItem);
}

- (void)setButtonItem:(id)a3
{
  objc_storeWeak((id *)&self->_buttonItem, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_buttonItem);
  objc_destroyWeak((id *)&self->_generator);
  objc_storeStrong((id *)&self->title, 0);
}

@end
