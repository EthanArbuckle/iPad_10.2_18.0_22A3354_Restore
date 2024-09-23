@implementation STSPeerPaymentResponse

- (id)initFromNFPeerPaymentResponse:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STSPeerPaymentResponse;
  return -[STSPaymentResponseBase initFromNFPeerPaymentResponse:](&v4, sel_initFromNFPeerPaymentResponse_, a3);
}

@end
