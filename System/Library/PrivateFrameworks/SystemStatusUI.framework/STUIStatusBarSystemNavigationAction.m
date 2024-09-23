@implementation STUIStatusBarSystemNavigationAction

+ (id)backNavigationAction
{
  return (id)objc_msgSend(a1, "_navigationActionForDestination:", 0);
}

+ (id)_navigationActionForDestination:(unint64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__STUIStatusBarSystemNavigationAction__navigationActionForDestination___block_invoke;
  v4[3] = &__block_descriptor_40_e23_B16__0__STUIStatusBar_8l;
  v4[4] = a3;
  objc_msgSend(a1, "actionWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __71__STUIStatusBarSystemNavigationAction__navigationActionForDestination___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "_systemNavigationAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canSendResponse");
  if ((_DWORD)v3)
    objc_msgSend(v2, "sendResponseForDestination:", *(_QWORD *)(a1 + 32));

  return v3;
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
