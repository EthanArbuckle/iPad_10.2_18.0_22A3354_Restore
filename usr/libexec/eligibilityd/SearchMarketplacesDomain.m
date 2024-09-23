@implementation SearchMarketplacesDomain

- (unint64_t)domain
{
  return 124;
}

- (id)domainChangeNotificationName
{
  return CFSTR("com.apple.os-eligibility-domain.change.search-marketplaces");
}

- (void)_internal_doInit
{
  id v3;

  -[SearchMarketplacesDomain updateParameters](self, "updateParameters");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("iPhone"), CFSTR("iPad"), 0));
  -[EligibilityDomain setDeviceClassesOfInterest:](self, "setDeviceClassesOfInterest:", v3);

}

- (SearchMarketplacesDomain)init
{
  SearchMarketplacesDomain *v2;
  SearchMarketplacesDomain *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchMarketplacesDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2)
    -[SearchMarketplacesDomain _internal_doInit](v2, "_internal_doInit");
  return v3;
}

- (SearchMarketplacesDomain)initWithCoder:(id)a3
{
  SearchMarketplacesDomain *v3;
  SearchMarketplacesDomain *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchMarketplacesDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[SearchMarketplacesDomain _internal_doInit](v3, "_internal_doInit");
  return v4;
}

- (void)updateParameters
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](MobileAssetManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchMarketplacesAsset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "countryCodes"));
  -[EligibilityDomain setLocatedCountriesOfInterest:](self, "setLocatedCountriesOfInterest:", v4);
  -[EligibilityDomain setBillingCountriesOfInterest:](self, "setBillingCountriesOfInterest:", v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
