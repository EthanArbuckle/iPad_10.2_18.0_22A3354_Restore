@implementation VSUIPerformActionCardProvider

- (NSString)providerIdentifier
{
  return (NSString *)CFSTR("com.apple.cards.VoiceShortcutsUICardKitProvider.VSUIPerformActionCardProvider");
}

- (id)cardViewControllerForCard:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = -[VSUIProgressCardViewController _initWithCard:delegate:loadProvidersImmediately:]([VSUIProgressCardViewController alloc], "_initWithCard:delegate:loadProvidersImmediately:", v3, 0, 0);
  else
    v4 = 0;

  return v4;
}

- (unint64_t)displayPriorityForCard:(id)a3
{
  return 2;
}

@end
