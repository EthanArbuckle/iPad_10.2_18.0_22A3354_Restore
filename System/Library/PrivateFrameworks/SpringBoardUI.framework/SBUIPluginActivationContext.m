@implementation SBUIPluginActivationContext

- (int)activationEvent
{
  return self->_activationEvent;
}

- (void)setActivationEvent:(int)a3
{
  self->_activationEvent = a3;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void)setScreen:(id)a3
{
  objc_storeStrong((id *)&self->_screen, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screen, 0);
}

@end
