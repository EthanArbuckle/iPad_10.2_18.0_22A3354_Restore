@implementation _UIToolbarNavigationButton

- (void)updateImageIfNeeded
{
  -[_UIToolbarNavigationButton updateImageIfNeededWithTintColor:](self, "updateImageIfNeededWithTintColor:", 0);
}

- (void)updateImageIfNeededWithTintColor:(id)a3
{
  -[UINavigationButton _setTintColor:](self, "_setTintColor:", a3);
  -[UINavigationButton _updateStyle](self, "_updateStyle");
}

@end
