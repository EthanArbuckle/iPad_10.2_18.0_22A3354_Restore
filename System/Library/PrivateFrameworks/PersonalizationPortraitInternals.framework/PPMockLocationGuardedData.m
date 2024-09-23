@implementation PPMockLocationGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
}

@end
