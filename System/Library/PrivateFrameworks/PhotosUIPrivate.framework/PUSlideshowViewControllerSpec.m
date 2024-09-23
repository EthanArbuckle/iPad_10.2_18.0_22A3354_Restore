@implementation PUSlideshowViewControllerSpec

- (id)newSpecChange
{
  return objc_alloc_init(PUSlideshowViewControllerSpecChange);
}

- (PUSlideshowViewControllerSpecChange)currentChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowViewControllerSpec;
  -[PUViewControllerSpec currentChange](&v3, sel_currentChange);
  return (PUSlideshowViewControllerSpecChange *)(id)objc_claimAutoreleasedReturnValue();
}

- (PUSlideshowViewControllerSpec)init
{
  return -[PUSlideshowViewControllerSpec initWithMode:](self, "initWithMode:", 0);
}

- (PUSlideshowViewControllerSpec)initWithMode:(unint64_t)a3
{
  PUSlideshowViewControllerSpec *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUSlideshowViewControllerSpec;
  result = -[PUViewControllerSpec init](&v5, sel_init);
  if (result)
    result->_mode = a3;
  return result;
}

- (void)updateIfNeeded
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  unsigned int v6;
  _BOOL8 v7;
  uint64_t v8;
  _BOOL4 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUSlideshowViewControllerSpec;
  -[PUViewControllerSpec updateIfNeeded](&v10, sel_updateIfNeeded);
  v3 = -[PUSlideshowViewControllerSpec isChromeVisible](self, "isChromeVisible");
  v4 = -[PUSlideshowViewControllerSpec isAirplayScreenAvailable](self, "isAirplayScreenAvailable");
  v5 = -[PUSlideshowViewControllerSpec isAirplayRouteAvailable](self, "isAirplayRouteAvailable");
  v6 = v3 || v4;
  if (self->_mode)
    v7 = 0;
  else
    v7 = v4;
  if (self->_mode)
    v8 = 0;
  else
    v8 = v6;
  v9 = -[PUSlideshowViewControllerSpec shouldRegisterToAirplay](self, "shouldRegisterToAirplay");
  -[PUSlideshowViewControllerSpec _setShouldShowPlaceholder:](self, "_setShouldShowPlaceholder:", v7);
  -[PUSlideshowViewControllerSpec _setShouldShowChromeBars:](self, "_setShouldShowChromeBars:", v8);
  -[PUSlideshowViewControllerSpec _setShouldObserveAirplayRoute:](self, "_setShouldObserveAirplayRoute:", v8 & v9);
  -[PUSlideshowViewControllerSpec _setShouldShowAirplayButton:](self, "_setShouldShowAirplayButton:", v8 & v5);
}

- (BOOL)shouldUseChromeBars
{
  return self->_mode == 0;
}

- (BOOL)shouldUseTapGesture
{
  return self->_mode == 0;
}

- (BOOL)shouldRegisterToAirplay
{
  return self->_mode == 0;
}

- (BOOL)shouldPauseWhenAppResignsActive
{
  return self->_mode == 0;
}

- (void)_setShouldShowPlaceholder:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldShowPlaceholder != v3)
  {
    self->_shouldShowPlaceholder = v3;
    -[PUSlideshowViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldShowPlaceholderChanged:", 1);

  }
}

- (void)_setShouldShowChromeBars:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldShowChromeBars != v3)
  {
    self->_shouldShowChromeBars = v3;
    -[PUSlideshowViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldShowChromeBarsChanged:", 1);

  }
}

- (void)_setShouldObserveAirplayRoute:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldObserveAirplayRoute != v3)
  {
    self->_shouldObserveAirplayRoute = v3;
    -[PUSlideshowViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldObserveAirplayRouteChanged:", 1);

  }
}

- (void)_setShouldShowAirplayButton:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldShowAirplayButton != v3)
  {
    self->_shouldShowAirplayButton = v3;
    -[PUSlideshowViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldShowAirplayButtonChanged:", 1);

  }
}

- (BOOL)isChromeVisible
{
  return self->_isChromeVisible;
}

- (void)setChromeVisible:(BOOL)a3
{
  self->_isChromeVisible = a3;
}

- (BOOL)isAirplayScreenAvailable
{
  return self->_isAirplayScreenAvailable;
}

- (void)setAirplayScreenAvailable:(BOOL)a3
{
  self->_isAirplayScreenAvailable = a3;
}

- (BOOL)isAirplayRouteAvailable
{
  return self->_isAirplayRouteAvailable;
}

- (void)setAirplayRouteAvailable:(BOOL)a3
{
  self->_isAirplayRouteAvailable = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)shouldShowChromeBars
{
  return self->_shouldShowChromeBars;
}

- (BOOL)shouldShowPlaceholder
{
  return self->_shouldShowPlaceholder;
}

- (BOOL)shouldObserveAirplayRoute
{
  return self->_shouldObserveAirplayRoute;
}

- (BOOL)shouldShowAirplayButton
{
  return self->_shouldShowAirplayButton;
}

@end
