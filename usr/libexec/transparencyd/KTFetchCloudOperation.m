@implementation KTFetchCloudOperation

- (BOOL)shouldRetry
{
  return self->_shouldRetry;
}

@end
