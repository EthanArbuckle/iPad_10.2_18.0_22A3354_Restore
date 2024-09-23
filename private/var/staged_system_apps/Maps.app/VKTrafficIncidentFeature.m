@implementation VKTrafficIncidentFeature

- (BOOL)isRestrictionIncident
{
  return -[VKTrafficIncidentFeature type](self, "type") == (id)10
      || -[VKTrafficIncidentFeature type](self, "type") == (id)11;
}

- (NSString)restrictionTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VKTrafficIncidentFeature formattedTitle](self, "formattedTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringForServerFormattedString:](NSString, "_navigation_stringForServerFormattedString:", v2));

  return (NSString *)v3;
}

- (NSString)restrictionCombinedDetails
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  if (!-[VKTrafficIncidentFeature isRestrictionIncident](self, "isRestrictionIncident"))
    return (NSString *)0;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VKTrafficIncidentFeature restrictionDetails](self, "restrictionDetails"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009E1A30;
  v8[3] = &unk_1011DECE0;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n")));
  return (NSString *)v6;
}

- (NSString)restrictionEffectiveTimeRange
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VKTrafficIncidentFeature effectiveTimeRange](self, "effectiveTimeRange"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringForServerFormattedString:](NSString, "_navigation_stringForServerFormattedString:", v2));

  return (NSString *)v3;
}

@end
