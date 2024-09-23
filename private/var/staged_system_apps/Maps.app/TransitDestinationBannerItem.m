@implementation TransitDestinationBannerItem

- (TransitDestinationBannerItem)initWithGuidanceState:(id)a3
{
  id v4;
  TransitDestinationBannerItem *v5;
  uint64_t v6;
  NSString *uniqueId;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransitDestinationBannerItem;
  v5 = -[BannerItem initWithGuidanceState:](&v9, "initWithGuidanceState:", v4);
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdForBannerType:", 3));
    uniqueId = v5->super._uniqueId;
    v5->super._uniqueId = (NSString *)v6;

  }
  return v5;
}

- (NSString)title
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "destinationName"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("To %@"), CFSTR("localized string not found"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3));

  return (NSString *)v6;
}

@end
