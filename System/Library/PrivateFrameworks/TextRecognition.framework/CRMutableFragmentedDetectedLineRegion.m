@implementation CRMutableFragmentedDetectedLineRegion

- (NSArray)regionFragments
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRegionFragments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionFragments, 0);
}

@end
