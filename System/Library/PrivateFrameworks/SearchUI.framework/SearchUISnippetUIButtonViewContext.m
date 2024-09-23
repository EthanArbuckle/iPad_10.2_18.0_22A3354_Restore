@implementation SearchUISnippetUIButtonViewContext

- (BOOL)deviceIsAuthenticated
{
  void *v2;
  BOOL v3;

  -[SearchUISnippetUIButtonViewContext sourceView](self, "sourceView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SearchUIUtilities deviceIsAuthenticatedForView:](SearchUIUtilities, "deviceIsAuthenticatedForView:", v2);

  return v3;
}

- (id)viewForButtonItem:(id)a3
{
  return 0;
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (void)setSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_sourceView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceView);
}

@end
