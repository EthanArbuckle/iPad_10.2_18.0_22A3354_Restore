@implementation ICQUpgradePhotosCloudEnableFlowManager

- (void)_performPageButtonActionWithParameters:(id)a3 completion:(id)a4
{
  +[ICQUIPhotosHelper enableCloudPhotosLibraryWithCompletion:](ICQUIPhotosHelper, "enableCloudPhotosLibraryWithCompletion:", a4);
}

@end
