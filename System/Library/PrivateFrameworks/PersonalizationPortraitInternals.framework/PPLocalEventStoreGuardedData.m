@implementation PPLocalEventStoreGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBufferedOperation, 0);
}

@end
