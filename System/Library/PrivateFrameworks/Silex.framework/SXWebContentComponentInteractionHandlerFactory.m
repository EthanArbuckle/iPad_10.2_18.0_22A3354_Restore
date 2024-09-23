@implementation SXWebContentComponentInteractionHandlerFactory

- (id)componentInteractionHandlerForInteraction:(id)a3
{
  id v3;
  SXWebContentComponentInteractionHandler *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[SXWebContentComponentInteractionHandler initWithInteraction:]([SXWebContentComponentInteractionHandler alloc], "initWithInteraction:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
