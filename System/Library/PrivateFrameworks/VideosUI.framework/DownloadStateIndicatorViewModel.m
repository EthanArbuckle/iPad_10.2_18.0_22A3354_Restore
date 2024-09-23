@implementation DownloadStateIndicatorViewModel

- (void)assetControllerStateDidChange:(id)a3
{
  sub_1DA086CC4((uint64_t)self, (uint64_t)a2, a3, sub_1DA0867A8);
}

- (void)downloadStarted:(id)a3
{
  sub_1DA086CC4((uint64_t)self, (uint64_t)a2, a3, sub_1DA086AF8);
}

@end
