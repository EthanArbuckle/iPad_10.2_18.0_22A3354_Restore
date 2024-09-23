@implementation TrafficAlertBannerItem

- (TrafficAlertBannerItem)initWithGuidanceState:(id)a3
{
  id v4;
  TrafficAlertBannerItem *v5;
  uint64_t v6;
  NSString *uniqueId;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TrafficAlertBannerItem;
  v5 = -[BannerItem initWithGuidanceState:](&v9, "initWithGuidanceState:", v4);
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdForBannerType:", 1));
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BannerItem guidanceState](self, "guidanceState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "trafficIncidentAlert"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));

  return (NSString *)v4;
}

- (NSString)subtitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BannerItem guidanceState](self, "guidanceState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "trafficIncidentAlert"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subtitle"));

  return (NSString *)v4;
}

- (UIImage)icon
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  UIImage *v7;
  void *v8;
  double v9;
  id v10;
  UIImage *v11;
  UIImage *incidentIcon;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BannerItem guidanceState](self, "guidanceState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trafficIncidentAlert"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incident"));

  if (objc_msgSend(v5, "hasType")
    && (v6 = +[VKTrafficIncidentFeature incidentTypeForGeoRouteIncident:](VKTrafficIncidentFeature, "incidentTypeForGeoRouteIncident:", v5), -[TrafficAlertBannerItem _hasIconForIncidentType:](self, "_hasIconForIncidentType:", v6)))
  {
    if ((id)self->_incidentType != v6)
    {
      self->_incidentType = (int64_t)v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
      objc_msgSend(v8, "screenScale");
      v10 = sub_1005E0FCC(v5, 4, v9);
      v11 = (UIImage *)objc_claimAutoreleasedReturnValue(v10);
      incidentIcon = self->_incidentIcon;
      self->_incidentIcon = v11;

    }
    v7 = self->_incidentIcon;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateFromGuidanceState:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trafficIncidentAlert"));

  if (v5)
  {
    v6.receiver = self;
    v6.super_class = (Class)TrafficAlertBannerItem;
    -[BannerItem updateFromGuidanceState:](&v6, "updateFromGuidanceState:", v4);
  }

}

- (BOOL)_hasIconForIncidentType:(int64_t)a3
{
  return ((unint64_t)a3 < 0xE) & (0x2022u >> a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentIcon, 0);
}

@end
