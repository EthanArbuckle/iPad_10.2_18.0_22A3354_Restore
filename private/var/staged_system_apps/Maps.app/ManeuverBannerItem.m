@implementation ManeuverBannerItem

- (ManeuverBannerItem)initWithGuidanceState:(id)a3
{
  id v4;
  ManeuverBannerItem *v5;
  uint64_t v6;
  NSString *uniqueId;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ManeuverBannerItem;
  v5 = -[BannerItem initWithGuidanceState:](&v9, "initWithGuidanceState:", v4);
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdForBannerType:", 0));
    uniqueId = v5->super._uniqueId;
    v5->super._uniqueId = (NSString *)v6;

  }
  return v5;
}

- (NavSignLaneGuidanceInfo)laneGuidanceInfo
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BannerItem guidanceState](self, "guidanceState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "laneGuidanceInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "laneGuidanceInfo"));

  return (NavSignLaneGuidanceInfo *)v4;
}

- (NavSignManeuverGuidanceInfo)maneuverGuidanceInfo
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BannerItem guidanceState](self, "guidanceState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "maneuverGuidanceInfo"));

  return (NavSignManeuverGuidanceInfo *)v3;
}

@end
