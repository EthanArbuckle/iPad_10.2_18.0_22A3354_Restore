@implementation VSCredentialEntryTableView

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSCredentialEntryTableView;
  -[VSCredentialEntryTableView layoutSubviews](&v4, sel_layoutSubviews);
  -[VSCredentialEntryTableView viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateLinkButtonLayout");

}

- (VSCredentialEntryViewController_iOS)viewController
{
  return (VSCredentialEntryViewController_iOS *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
}

@end
