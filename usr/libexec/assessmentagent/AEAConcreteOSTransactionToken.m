@implementation AEAConcreteOSTransactionToken

- (void)releaseTransaction
{
  sub_10000448C((uint64_t)self, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
