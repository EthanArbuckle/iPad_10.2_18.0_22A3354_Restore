@implementation PPFeatureRedactorGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedFeatures, 0);
}

@end
