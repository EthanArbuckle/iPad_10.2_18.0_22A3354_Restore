@implementation PUSlideshowViewControllerSpecChange

- (BOOL)changed
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowViewControllerSpecChange;
  return -[PUViewControllerSpecChange changed](&v4, sel_changed)
      || -[PUSlideshowViewControllerSpecChange shouldShowPlaceholderChanged](self, "shouldShowPlaceholderChanged")
      || -[PUSlideshowViewControllerSpecChange shouldShowChromeBarsChanged](self, "shouldShowChromeBarsChanged")
      || -[PUSlideshowViewControllerSpecChange shouldObserveAirplayRouteChanged](self, "shouldObserveAirplayRouteChanged")|| -[PUSlideshowViewControllerSpecChange shouldShowAirplayButtonChanged](self, "shouldShowAirplayButtonChanged");
}

- (BOOL)chromeVisibilityChanged
{
  return *(&self->super._prefersCompactLayoutForSplitScreenChanged + 1);
}

- (BOOL)shouldShowPlaceholderChanged
{
  return *(&self->super._prefersCompactLayoutForSplitScreenChanged + 2);
}

- (void)_setShouldShowPlaceholderChanged:(BOOL)a3
{
  *(&self->super._prefersCompactLayoutForSplitScreenChanged + 2) = a3;
}

- (BOOL)shouldShowChromeBarsChanged
{
  return self->_chromeVisibilityChanged;
}

- (void)_setShouldShowChromeBarsChanged:(BOOL)a3
{
  self->_chromeVisibilityChanged = a3;
}

- (BOOL)shouldObserveAirplayRouteChanged
{
  return self->_shouldShowPlaceholderChanged;
}

- (void)_setShouldObserveAirplayRouteChanged:(BOOL)a3
{
  self->_shouldShowPlaceholderChanged = a3;
}

- (BOOL)shouldShowAirplayButtonChanged
{
  return self->_shouldShowChromeBarsChanged;
}

- (void)_setShouldShowAirplayButtonChanged:(BOOL)a3
{
  self->_shouldShowChromeBarsChanged = a3;
}

@end
