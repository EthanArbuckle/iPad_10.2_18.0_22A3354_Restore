@implementation UITextLinkInteraction

+ (id)interactionWithShouldProxyContextMenuDelegate:(BOOL)a3
{
  return -[_UITextMenuLinkInteraction initWithShouldProxyContextMenuDelegate:]([_UITextMenuLinkInteraction alloc], "initWithShouldProxyContextMenuDelegate:", a3);
}

- (UIContextMenuInteractionDelegate)contextMenuDelegateProxy
{
  return 0;
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return 0;
}

@end
