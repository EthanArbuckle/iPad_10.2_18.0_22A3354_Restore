@implementation CalendarSceneManagerSharedState

- (void)setExtendedLaunchComplete:(BOOL)a3
{
  self->_extendedLaunchComplete = a3;
}

- (void)setApplicationLastActiveTimeProvider:(id)a3
{
  objc_storeWeak((id *)&self->_applicationLastActiveTimeProvider, a3);
}

- (BOOL)extendedLaunchComplete
{
  return self->_extendedLaunchComplete;
}

- (ApplicationLastActiveTimeProvider)applicationLastActiveTimeProvider
{
  return (ApplicationLastActiveTimeProvider *)objc_loadWeakRetained((id *)&self->_applicationLastActiveTimeProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_applicationLastActiveTimeProvider);
}

@end
