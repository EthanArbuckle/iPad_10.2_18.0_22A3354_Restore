@implementation _UIStatusBarSystemNavigationAction

+ (id)_navigationActionForDestination:(unint64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70___UIStatusBarSystemNavigationAction__navigationActionForDestination___block_invoke;
  v4[3] = &__block_descriptor_40_e22_B16__0___UIStatusBar_8l;
  v4[4] = a3;
  objc_msgSend(a1, "actionWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)backNavigationAction
{
  return (id)objc_msgSend(a1, "_navigationActionForDestination:", 0);
}

+ (id)forwardNavigationAction
{
  return (id)objc_msgSend(a1, "_navigationActionForDestination:", 1);
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

@end
