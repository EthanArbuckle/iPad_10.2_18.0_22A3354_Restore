@implementation PKPaymentAuthorizationSuccessStateParam

+ (id)paramWithPeerPaymentTransactionMetadata:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "param");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPeerPaymentTransactionMetadata:", v4);

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; setPeerPaymentTransactionMetadata: %@>"),
               objc_opt_class(),
               self,
               self->_peerPaymentTransactionMetadata);
}

- (PKPeerPaymentTransactionMetadata)peerPaymentTransactionMetadata
{
  return self->_peerPaymentTransactionMetadata;
}

- (void)setPeerPaymentTransactionMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentTransactionMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentTransactionMetadata, 0);
}

@end
