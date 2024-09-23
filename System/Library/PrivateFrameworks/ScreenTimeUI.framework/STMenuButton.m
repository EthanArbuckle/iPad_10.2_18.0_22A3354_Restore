@implementation STMenuButton

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)STMenuButton;
  if (-[STMenuButton respondsToSelector:](&v13, sel_respondsToSelector_, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_))
  {
    v12.receiver = self;
    v12.super_class = (Class)STMenuButton;
    -[STMenuButton contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v12, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, v8, v9, v10);
  }
  -[STMenuButton delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contextMenuWillDisplayForButton:", self);

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[STMenuButton delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contextMenuWillEndForButton:", self);

  v13.receiver = self;
  v13.super_class = (Class)STMenuButton;
  if (-[STMenuButton respondsToSelector:](&v13, sel_respondsToSelector_, sel_contextMenuInteraction_willEndForConfiguration_animator_))
  {
    v12.receiver = self;
    v12.super_class = (Class)STMenuButton;
    -[STMenuButton contextMenuInteraction:willEndForConfiguration:animator:](&v12, sel_contextMenuInteraction_willEndForConfiguration_animator_, v8, v9, v10);
  }

}

- (STMenuButtonDelegate)delegate
{
  return (STMenuButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
