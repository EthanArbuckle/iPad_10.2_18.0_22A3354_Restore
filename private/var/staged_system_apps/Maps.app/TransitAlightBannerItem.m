@implementation TransitAlightBannerItem

- (TransitAlightBannerItem)initWithGuidanceState:(id)a3
{
  id v4;
  TransitAlightBannerItem *v5;
  uint64_t v6;
  NSString *uniqueId;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransitAlightBannerItem;
  v5 = -[BannerItem initWithGuidanceState:](&v9, "initWithGuidanceState:", v4);
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdForBannerType:", 2));
    uniqueId = v5->super._uniqueId;
    v5->super._uniqueId = (NSString *)v6;

  }
  return v5;
}

- (TransitAlightMessage)alightMessage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BannerItem guidanceState](self, "guidanceState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "alightMessage"));

  return (TransitAlightMessage *)v3;
}

- (unint64_t)bannerType
{
  return 2;
}

- (id)artwork
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAlightBannerItem alightMessage](self, "alightMessage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "artwork"));

  return v3;
}

- (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAlightBannerItem alightMessage](self, "alightMessage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return v3;
}

- (id)subtitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAlightBannerItem alightMessage](self, "alightMessage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "detail"));

  return v3;
}

@end
