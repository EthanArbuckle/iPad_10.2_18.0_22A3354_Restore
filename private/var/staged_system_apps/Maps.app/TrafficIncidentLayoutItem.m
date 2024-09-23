@implementation TrafficIncidentLayoutItem

- (NSString)secondaryString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Report [Nav Tray, Incident Report now]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (NSString)acceptString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Ok [Nav Tray, Incident Report]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (NSString)cancelString
{
  return 0;
}

+ (int)geoTrafficIncidentTypeForRouteIncidentType:(int)a3
{
  if (a3 > 0xD)
    return 0;
  else
    return dword_100E39860[a3];
}

+ (int)geoTrafficIncidentTypeForVKType:(int64_t)a3
{
  if (a3 > 4)
  {
    if (a3 != 13)
    {
      if (a3 == 5)
        return 6;
      return 0;
    }
    return 16;
  }
  else
  {
    if (a3 != 1)
    {
      if (a3 == 2)
        return 7;
      return 0;
    }
    return 5;
  }
}

+ (int64_t)vkTrafficIncidentTypeForGEOType:(int)a3
{
  if (a3 > 6)
  {
    if (a3 != 7)
    {
      if (a3 == 16)
        return 13;
      return 0;
    }
    return 2;
  }
  else
  {
    if (a3 != 5)
    {
      if (a3 == 6)
        return 5;
      return 0;
    }
    return 1;
  }
}

+ (id)styleAttributesForType:(int)a3
{
  return +[GEOFeatureStyleAttributes styleAttributesForTrafficIncidentType:](GEOFeatureStyleAttributes, "styleAttributesForTrafficIncidentType:", objc_msgSend(a1, "vkTrafficIncidentTypeForGEOType:", *(_QWORD *)&a3));
}

- (id)displayImage
{
  return sub_1005E0F68(+[TrafficIncidentLayoutItem vkTrafficIncidentTypeForGEOType:](TrafficIncidentLayoutItem, "vkTrafficIncidentTypeForGEOType:", -[TrafficIncidentLayoutItem incidentType](self, "incidentType")), 4);
}

- (id)displayText
{
  return +[TrafficIncidentLayoutItem defaultDisplayTextForType:](TrafficIncidentLayoutItem, "defaultDisplayTextForType:", -[TrafficIncidentLayoutItem incidentType](self, "incidentType"));
}

+ (id)defaultDisplayTextForType:(int)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKTrafficSupport sharedTrafficSupport](MKTrafficSupport, "sharedTrafficSupport"));
  v5 = v4;
  if (a3 > 6)
  {
    if (a3 == 7)
    {
      v6 = 1;
      goto LABEL_11;
    }
    if (a3 == 16)
    {
      v6 = 13;
      goto LABEL_11;
    }
  }
  else
  {
    if (a3 == 5)
    {
      v6 = 0;
      goto LABEL_11;
    }
    if (a3 == 6)
    {
      v6 = 4;
LABEL_11:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedTitleForGEOIncidentType:laneType:laneCount:", v6, 0, 0));
      goto LABEL_12;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Incident [Nav Tray, Report Incident]"), CFSTR("localized string not found"), 0));

LABEL_12:
  return v8;
}

+ (id)defaultDescriptionTextForType:(int)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKTrafficSupport sharedTrafficSupport](MKTrafficSupport, "sharedTrafficSupport"));
  v5 = v4;
  if (a3 > 6)
  {
    if (a3 == 7)
    {
      v6 = 1;
      goto LABEL_11;
    }
    if (a3 == 16)
    {
      v6 = 13;
      goto LABEL_11;
    }
  }
  else
  {
    if (a3 == 5)
    {
      v6 = 0;
      goto LABEL_11;
    }
    if (a3 == 6)
    {
      v6 = 4;
LABEL_11:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedRAPDescriptionForGEOIncidentType:", v6));
      goto LABEL_12;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Incident [Nav Tray, Report Incident]"), CFSTR("localized string not found"), 0));

LABEL_12:
  return v8;
}

- (id)descriptionText
{
  return +[TrafficIncidentLayoutItem defaultDescriptionTextForType:](TrafficIncidentLayoutItem, "defaultDescriptionTextForType:", -[TrafficIncidentLayoutItem incidentType](self, "incidentType"));
}

- (id)preferredButtonTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Report [Nav Tray, Incident Report]"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutItem displayText](self, "displayText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" %@"), v5));

  return v6;
}

- (id)preferredConfirmationTitle
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKTrafficSupport sharedTrafficSupport](MKTrafficSupport, "sharedTrafficSupport"));
  v4 = -[TrafficIncidentLayoutItem incidentType](self, "incidentType");
  if (v4 > 6)
  {
    if (v4 == 7)
    {
      v5 = v3;
      v6 = 1;
      goto LABEL_11;
    }
    if (v4 == 16)
    {
      v5 = v3;
      v6 = 13;
      goto LABEL_11;
    }
  }
  else
  {
    if (v4 == 5)
    {
      v5 = v3;
      v6 = 0;
      goto LABEL_11;
    }
    if (v4 == 6)
    {
      v5 = v3;
      v6 = 4;
LABEL_11:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedReportConfirmationForIncidentType:", v6));
      goto LABEL_12;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Incident Reported [Nav Tray, Report Incident]"), CFSTR("localized string not found"), 0));

LABEL_12:
  return v8;
}

- (TrafficIncidentLayoutItem)initWithTrafficIncidentType:(int)a3 displayOnMap:(BOOL)a4
{
  TrafficIncidentLayoutItem *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TrafficIncidentLayoutItem;
  result = -[TrafficIncidentLayoutItem init](&v7, "init");
  if (result)
  {
    result->_incidentType = a3;
    result->_displayIncidentOnMap = a4;
  }
  return result;
}

- (TrafficIncidentLayoutItem)initWithCoder:(id)a3
{
  id v4;
  TrafficIncidentLayoutItem *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TrafficIncidentLayoutItem;
  v5 = -[TrafficIncidentLayoutItem init](&v7, "init");
  if (v5)
  {
    -[TrafficIncidentLayoutItem setIncidentType:](v5, "setIncidentType:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("incidentType")));
    -[TrafficIncidentLayoutItem setDisplayIncidentOnMap:](v5, "setDisplayIncidentOnMap:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("displayIncidentOnMap")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[TrafficIncidentLayoutItem incidentType](self, "incidentType"), CFSTR("incidentType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TrafficIncidentLayoutItem displayIncidentOnMap](self, "displayIncidentOnMap"), CFSTR("displayIncidentOnMap"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("incidentType:%d displayIncidentOnMap: %d"), -[TrafficIncidentLayoutItem incidentType](self, "incidentType"), -[TrafficIncidentLayoutItem displayIncidentOnMap](self, "displayIncidentOnMap"));
}

- (id)incidentTypeAsString
{
  uint64_t v2;

  v2 = -[TrafficIncidentLayoutItem incidentType](self, "incidentType");
  if (v2 >= 0x12)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v2));
  else
    return off_1011E3458[(int)v2];
}

- (int)incidentType
{
  return self->_incidentType;
}

- (void)setIncidentType:(int)a3
{
  self->_incidentType = a3;
}

- (BOOL)displayIncidentOnMap
{
  return self->_displayIncidentOnMap;
}

- (void)setDisplayIncidentOnMap:(BOOL)a3
{
  self->_displayIncidentOnMap = a3;
}

@end
