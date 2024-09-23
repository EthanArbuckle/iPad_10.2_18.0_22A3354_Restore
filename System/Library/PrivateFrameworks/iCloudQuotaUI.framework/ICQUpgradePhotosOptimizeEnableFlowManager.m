@implementation ICQUpgradePhotosOptimizeEnableFlowManager

- (void)_performPageButtonActionWithParameters:(id)a3 completion:(id)a4
{
  +[ICQUIPhotosHelper enableCloudPhotosOptimizationWithCompletion:](ICQUIPhotosHelper, "enableCloudPhotosOptimizationWithCompletion:", a4);
}

- (BOOL)_shouldPresentRemoteFlow
{
  return 0;
}

- (BOOL)needsNetwork
{
  return 0;
}

@end
