@implementation PNDetailsViewAssetFetcherOptions

- (PHFetchOptions)fetchOptions
{
  return (PHFetchOptions *)sub_243E25754();
}

- (void)setFetchOptions:(id)a3
{
  id v4;
  PNDetailsViewAssetFetcherOptions *v5;

  v4 = a3;
  v5 = self;
  sub_243E257AC((uint64_t)v4);

}

- (int64_t)curationLength
{
  return sub_243E257E0();
}

- (void)setCurationLength:(int64_t)a3
{
  sub_243E25814(a3);
}

- (BOOL)includeOthersInSocialGroupAssets
{
  return sub_243E25848() & 1;
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3
{
  sub_243E2587C(a3);
}

- (PNDetailsViewAssetFetcherOptions)initWithFetchOptions:(id)a3
{
  return (PNDetailsViewAssetFetcherOptions *)sub_243E2588C((uint64_t)a3);
}

- (PNDetailsViewAssetFetcherOptions)init
{
  PNDetailsViewAssetFetcherOptions.init()();
}

- (void).cxx_destruct
{

}

@end
