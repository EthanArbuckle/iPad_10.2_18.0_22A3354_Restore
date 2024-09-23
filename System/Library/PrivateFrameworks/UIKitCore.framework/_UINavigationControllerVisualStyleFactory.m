@implementation _UINavigationControllerVisualStyleFactory

- (id)styleForNavigationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_UINavigationControllerVisualStyleFactory visualStyleProvider](self, "visualStyleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleForNavigationController:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_UINavigationControllerVisualStyleProviding)visualStyleProvider
{
  return self->_visualStyleProvider;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_1082 != -1)
    dispatch_once(&_MergedGlobals_1082, &__block_literal_global_271);
  return (id)qword_1ECD7E178;
}

- (_UINavigationControllerVisualStyleFactory)init
{
  _UINavigationControllerVisualStyleFactory *v2;
  uint64_t v3;
  _UINavigationControllerVisualStyleProviding *visualStyleProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UINavigationControllerVisualStyleFactory;
  v2 = -[_UINavigationControllerVisualStyleFactory init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    visualStyleProvider = v2->_visualStyleProvider;
    v2->_visualStyleProvider = (_UINavigationControllerVisualStyleProviding *)v3;

  }
  return v2;
}

- (void)setVisualStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_visualStyleProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyleProvider, 0);
}

@end
