@implementation BannerSpecificationSampleForAlmostFullLevel

void ___BannerSpecificationSampleForAlmostFullLevel_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_new();
  _ICQUpgradeNowSampleLink();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setLinksFormat:", CFSTR("Upgrade your storage soon to keep these photos and videos up to date in your iCloud Photo Library. %@\n[ENG: LOCAL SAMPLE UI]"));
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setLinks:", v2);

  v3 = (void *)_BannerSpecificationSampleForAlmostFullLevel_sBannerSpecification;
  _BannerSpecificationSampleForAlmostFullLevel_sBannerSpecification = (uint64_t)v0;

}

@end
