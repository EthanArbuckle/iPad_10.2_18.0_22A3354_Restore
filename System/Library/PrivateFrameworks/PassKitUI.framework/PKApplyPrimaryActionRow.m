@implementation PKApplyPrimaryActionRow

- (PKApplyPrimaryActionRow)initWithTitle:(id)a3
{
  id v5;
  PKApplyPrimaryActionRow *v6;
  PKApplyPrimaryActionRow *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplyPrimaryActionRow;
  v6 = -[PKApplyPrimaryActionRow init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_title, a3);

  return v7;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_title;
}

- (void)configureCell:(id)a3
{
  _BOOL8 loading;
  id v5;
  id v6;

  v6 = a3;
  -[PKApplyPrimaryActionRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    loading = self->_loading;
    v5 = v6;
    objc_msgSend(v5, "setLoading:", loading);
    objc_msgSend(v5, "setTitle:", self->_title);
    objc_msgSend(v5, "setAction:", self->_action);
    objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67EE8]);

  }
}

- (BOOL)loading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
