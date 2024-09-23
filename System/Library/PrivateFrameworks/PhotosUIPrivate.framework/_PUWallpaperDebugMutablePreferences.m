@implementation _PUWallpaperDebugMutablePreferences

- (UIFont)timeFont
{
  return self->_timeFont;
}

- (void)setTimeFont:(id)a3
{
  objc_storeStrong((id *)&self->_timeFont, a3);
}

- (UIColor)timeColor
{
  return self->_timeColor;
}

- (void)setTimeColor:(id)a3
{
  objc_storeStrong((id *)&self->_timeColor, a3);
}

- (UIColor)statusBarTintColor
{
  return self->_statusBarTintColor;
}

- (void)setStatusBarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarTintColor, a3);
}

- (unint64_t)significantEventTime
{
  return self->_significantEventTime;
}

- (void)setSignificantEventTime:(unint64_t)a3
{
  self->_significantEventTime = a3;
}

- (unint64_t)significantEventOptions
{
  return self->_significantEventOptions;
}

- (void)setSignificantEventOptions:(unint64_t)a3
{
  self->_significantEventOptions = a3;
}

- (BOOL)userTapEventsRequested
{
  return self->_userTapEventsRequested;
}

- (void)setUserTapEventsRequested:(BOOL)a3
{
  self->_userTapEventsRequested = a3;
}

- (BOOL)hideChrome
{
  return self->_hideChrome;
}

- (void)setHideChrome:(BOOL)a3
{
  self->_hideChrome = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarTintColor, 0);
  objc_storeStrong((id *)&self->_timeColor, 0);
  objc_storeStrong((id *)&self->_timeFont, 0);
}

@end
