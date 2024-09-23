@implementation VUIDownloadConfig

- (NSArray)blacklistedEarlyRenewalBrands
{
  return self->_blacklistedEarlyRenewalBrands;
}

- (void)setBlacklistedEarlyRenewalBrands:(id)a3
{
  objc_storeStrong((id *)&self->_blacklistedEarlyRenewalBrands, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklistedEarlyRenewalBrands, 0);
}

@end
