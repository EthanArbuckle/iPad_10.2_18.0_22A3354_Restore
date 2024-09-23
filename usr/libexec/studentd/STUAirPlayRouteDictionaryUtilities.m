@implementation STUAirPlayRouteDictionaryUtilities

+ (id)routeDictionaryWithUID:(id)a3 name:(id)a4 requiresPIN:(id)a5
{
  id v5;
  id v7;
  id v8;
  id v9;
  NSMutableDictionary *v10;

  v5 = a3;
  if (a3)
  {
    v7 = a5;
    v8 = a4;
    v9 = v5;
    v10 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, CFSTR("RouteUID"));

    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v8, CFSTR("RouteName"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v7, CFSTR("RouteRequiresAirPlayPIN"));

    v5 = -[NSMutableDictionary copy](v10, "copy");
  }
  return v5;
}

+ (id)filteredRouteDescriptionForRelevantKeys:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  if (!a3)
    return &__NSDictionary0__struct;
  v7 = CFSTR("RouteUID");
  v8 = CFSTR("RouteName");
  v9 = CFSTR("RouteRequiresAirPlayPIN");
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crk_dictionaryByFilteringToKeys:", v4, v7, v8, v9));

  return v5;
}

+ (id)mirroringRouteUIDForRouteUID:(id)a3
{
  return _objc_msgSend(a3, "stringByAppendingString:", CFSTR("-screen"));
}

@end
