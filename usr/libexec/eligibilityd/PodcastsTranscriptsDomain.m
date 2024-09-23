@implementation PodcastsTranscriptsDomain

- (unint64_t)domain
{
  return 121;
}

- (id)domainChangeNotificationName
{
  return CFSTR("com.apple.os-eligibility-domain.change.podcasts-transcripts");
}

- (PodcastsTranscriptsDomain)init
{
  PodcastsTranscriptsDomain *v2;
  PodcastsTranscriptsDomain *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PodcastsTranscriptsDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2)
    -[PodcastsTranscriptsDomain _internal_doInit](v2, "_internal_doInit");
  return v3;
}

- (PodcastsTranscriptsDomain)initWithCoder:(id)a3
{
  PodcastsTranscriptsDomain *v3;
  PodcastsTranscriptsDomain *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PodcastsTranscriptsDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[PodcastsTranscriptsDomain _internal_doInit](v3, "_internal_doInit");
  return v4;
}

- (id)status
{
  NSMutableDictionary *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  _UNKNOWN **v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v28;
  void *v29;

  v2 = objc_opt_new(NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[InputManager sharedInstance](InputManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](MobileAssetManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastsTranscriptsAsset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "billingCountryCodes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "regionSKUs"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "countryCodes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForInputValue:", 2));
  v9 = v8;
  if (v8 && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "countryCode")), v10, v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "countryCode"));
    v12 = objc_msgSend(v6, "containsObject:", v11);

    if (v12)
      v13 = &off_100033B48;
    else
      v13 = &off_100033B60;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v13, CFSTR("OS_ELIGIBILITY_INPUT_COUNTRY_BILLING"));
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForInputValue:", 6, v7));
    v15 = v14;
    if (v14
      && (v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "deviceRegionCode"))) != 0
      && (v17 = (void *)v16,
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "deviceRegionCode")),
          v19 = objc_msgSend(v28, "containsObject:", v18),
          v18,
          v17,
          v19))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_100033B48, CFSTR("OS_ELIGIBILITY_INPUT_DEVICE_REGION_CODE"));
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForInputValue:", 1));
      v21 = v20;
      if (v20
        && (v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "countryCodes")), v22, v22))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "countryCodes"));
        if (objc_msgSend(v29, "intersectsSet:", v23))
          v24 = 2;
        else
          v24 = 3;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v24));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v25, CFSTR("OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION"));

      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v21, "status")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v23, CFSTR("OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION"));
      }

    }
    v7 = v28;
  }
  v26 = -[NSMutableDictionary copy](v2, "copy");

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
