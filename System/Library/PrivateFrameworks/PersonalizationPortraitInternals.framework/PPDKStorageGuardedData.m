@implementation PPDKStorageGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastWriteDate, 0);
}

@end
