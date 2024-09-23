@implementation SASProximitySessionTransport

- (id)receivedDataBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setReceivedDataBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receivedDataBlock, 0);
}

@end
