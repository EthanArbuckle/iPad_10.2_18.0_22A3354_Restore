@implementation VIQueryContextBuilder

- (id)setQueryID:(unint64_t)a3
{
  *((_QWORD *)self + 1) = a3;
  return self;
}

- (id)setApplicationIdentifer:(id)a3
{
  NSString *v4;
  NSString *applicationIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  applicationIdentifier = self->_applicationIdentifier;
  self->_applicationIdentifier = v4;

  return self;
}

- (id)setUIScale:(double)a3
{
  *((double *)self + 3) = a3;
  return self;
}

- (id)setTeamID:(id)a3
{
  NSString *v4;
  NSString *teamID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  teamID = self->_teamID;
  self->_teamID = v4;

  return self;
}

- (id)setCatalogIDs:(id)a3
{
  NSArray *v4;
  NSArray *catalogIDs;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  catalogIDs = self->_catalogIDs;
  self->_catalogIDs = v4;

  return self;
}

- (id)setLocation:(id)a3
{
  CLLocation *v4;
  CLLocation *location;

  v4 = (CLLocation *)objc_msgSend(a3, "copy");
  location = self->_location;
  self->_location = v4;

  return self;
}

- (id)setImageURL:(id)a3
{
  NSURL *v4;
  NSURL *imageURL;

  v4 = (NSURL *)objc_msgSend(a3, "copy");
  imageURL = self->_imageURL;
  self->_imageURL = v4;

  return self;
}

- (id)setReferralURL:(id)a3
{
  NSURL *v4;
  NSURL *referralURL;

  v4 = (NSURL *)objc_msgSend(a3, "copy");
  referralURL = self->_referralURL;
  self->_referralURL = v4;

  return self;
}

- (id)setImageType:(int64_t)a3
{
  *((_QWORD *)self + 9) = a3;
  return self;
}

- (id)setFeatureIdentifier:(id)a3
{
  NSString *v4;
  NSString *featureIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  featureIdentifier = self->_featureIdentifier;
  self->_featureIdentifier = v4;

  return self;
}

- (id)setEngagementSuggestionType:(id)a3
{
  objc_storeStrong((id *)&self->_engagementSuggestionType, a3);
  return self;
}

- (id)setPreferredMetalDevice:(id)a3
{
  objc_storeStrong((id *)&self->_preferredMetalDevice, a3);
  return self;
}

- (id)setIncludeLowConfidenceRegions:(BOOL)a3
{
  *((_BYTE *)self + 104) = a3;
  return self;
}

- (id)setLocale:(id)a3
{
  NSString *v4;
  NSString *locale;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  locale = self->_locale;
  self->_locale = v4;

  return self;
}

- (id)setCountryCode:(id)a3
{
  NSString *v4;
  NSString *countryCode;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  countryCode = self->_countryCode;
  self->_countryCode = v4;

  return self;
}

- (id)setSkipDomainModelInParse:(BOOL)a3
{
  *((_BYTE *)self + 128) = a3;
  return self;
}

- (id)setRunOnDeviceOnlyInSearch:(BOOL)a3
{
  *((_BYTE *)self + 129) = a3;
  return self;
}

- (id)build
{
  VIQueryContext *v3;
  unint64_t queryID;
  NSString *applicationIdentifier;
  double uiScale;
  NSArray *catalogIDs;
  NSString *v8;
  NSString *v9;
  void *v10;
  char v11;
  __CFString *v12;
  VIQueryContext *v13;
  uint64_t v15;

  v3 = [VIQueryContext alloc];
  queryID = self->_queryID;
  applicationIdentifier = self->_applicationIdentifier;
  uiScale = self->_uiScale;
  catalogIDs = self->_catalogIDs;
  v8 = self->_teamID;
  v9 = applicationIdentifier;
  if (-[NSArray count](catalogIDs, "count"))
  {
    if (-[NSString length](v9, "length")
      && (objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E981F380),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "containsObject:", v9),
          v10,
          (v11 & 1) != 0))
    {
      v12 = CFSTR("argosinternal");
    }
    else
    {
      v12 = v8;
    }
  }
  else
  {
    v12 = 0;
  }

  *(_WORD *)((char *)&v15 + 1) = *(_WORD *)&self->_skipDomainModelInParse;
  LOBYTE(v15) = self->_includeLowConfidenceRegions;
  v13 = -[VIQueryContext initWithQueryID:applicationIdentifier:uiScale:teamID:catalogIDs:location:imageURL:referralURL:imageType:featureIdentifier:engagementSuggestionType:locale:countryCode:preferredMetalDevice:includeLowConfidenceRegions:skipDomainModelInParse:runOnDeviceOnlyInSearch:](v3, "initWithQueryID:applicationIdentifier:uiScale:teamID:catalogIDs:location:imageURL:referralURL:imageType:featureIdentifier:engagementSuggestionType:locale:countryCode:preferredMetalDevice:includeLowConfidenceRegions:skipDomainModelInParse:runOnDeviceOnlyInSearch:", queryID, v9, v12, self->_catalogIDs, self->_location, self->_imageURL, uiScale, self->_referralURL, self->_imageType, self->_featureIdentifier, self->_engagementSuggestionType, self->_locale, self->_countryCode, self->_preferredMetalDevice, v15);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_engagementSuggestionType, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_referralURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_catalogIDs, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
