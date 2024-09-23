@implementation UINavigationDeferredTransitionContext

- (_UINavigationControllerPalette)incomingTopPalette
{
  return self->_incomingTopPalette;
}

- (_UINavigationControllerPalette)outgoingTopPalette
{
  return self->_outgoingTopPalette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingTopPalette, 0);
  objc_storeStrong((id *)&self->_incomingTopPalette, 0);
}

- (void)setIncomingTopPalette:(id)a3
{
  objc_storeStrong((id *)&self->_incomingTopPalette, a3);
}

- (void)setOutgoingTopPalette:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingTopPalette, a3);
}

@end
