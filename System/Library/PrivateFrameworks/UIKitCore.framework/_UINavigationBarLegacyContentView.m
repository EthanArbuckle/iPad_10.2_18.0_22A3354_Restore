@implementation _UINavigationBarLegacyContentView

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  -[_UINavigationBarVisualProviderLegacyIOS intrinsicContentSizeInvalidatedForChildView:](self->_visualProvider, "intrinsicContentSizeInvalidatedForChildView:", a3);
}

- (void)layoutSubviews
{
  -[_UINavigationBarVisualProviderLegacyIOS _layoutSubviewsFromContentView](self->_visualProvider, "_layoutSubviewsFromContentView");
}

- (_UINavigationBarVisualProviderLegacyIOS)visualProvider
{
  return self->_visualProvider;
}

- (void)setVisualProvider:(id)a3
{
  self->_visualProvider = (_UINavigationBarVisualProviderLegacyIOS *)a3;
}

@end
