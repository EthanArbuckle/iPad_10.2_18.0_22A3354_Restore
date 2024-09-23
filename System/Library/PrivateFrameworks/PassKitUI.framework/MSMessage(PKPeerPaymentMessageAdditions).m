@implementation MSMessage(PKPeerPaymentMessageAdditions)

- (PKPeerPaymentMessage)peerPaymentMessage
{
  return -[PKPeerPaymentMessage initWithUnderlyingMessage:]([PKPeerPaymentMessage alloc], "initWithUnderlyingMessage:", a1);
}

@end
