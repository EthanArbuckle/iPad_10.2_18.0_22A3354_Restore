@implementation BundleIdResolverGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bundleIdOrProcName, 0);
}

@end
