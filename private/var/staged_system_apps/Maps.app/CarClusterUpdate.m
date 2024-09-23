@implementation CarClusterUpdate

+ (void)getStringValue:(id *)a3 displayUnits:(unsigned __int16 *)a4 forRemainingDistance:(double)a5
{
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v9 = objc_msgSend(v8, "_navigation_distanceUsesMetricSystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v11 = MNInstructionsCalculateDistanceUnits(v9, objc_msgSend(v10, "_navigation_useYardsForShortDistances"), 3, a5);
  v13 = v12;

  if (a3)
  {
    if ((v13 & (unint64_t)&_mh_execute_header) != 0)
      v14 = CFSTR("%.1f");
    else
      v14 = CFSTR("%.0f");
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, *(float *)&v13));
  }
  if (a4)
  {
    if (v11 <= 5)
      *a4 = word_100E3C700[v11];
  }
}

- (void)resetProperties
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v3 = objc_msgSend((id)objc_opt_class(self), "_integersKeyed");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObjectForKey:", &off_10126FB98);
  objc_msgSend(v5, "removeObjectForKey:", &off_10126FB98);
  objc_msgSend(v5, "removeObjectForKey:", &off_10126FB98);
  objc_msgSend(v5, "removeObjectForKey:", &off_10126FBB0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100917D10;
  v6[3] = &unk_1011BA738;
  v6[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

- (NSDictionary)accNavFormat
{
  NSMutableDictionary *v3;
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSDictionary *v8;
  _QWORD v10[5];
  NSMutableDictionary *v11;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = objc_msgSend((id)objc_opt_class(self), "_integersKeyed");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100917E2C;
  v10[3] = &unk_1011DBEC0;
  v10[4] = self;
  v6 = v3;
  v11 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

- (void)setAccNavFormat:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100918080;
  v3[3] = &unk_1011BA738;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

- (NSString)logFormat
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  CarClusterUpdate *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("{")));
  v4 = objc_msgSend((id)objc_opt_class(self), "_integersKeyed");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1009181D8;
  v13 = &unk_1011DBEC0;
  v14 = self;
  v6 = v3;
  v15 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v10);

  objc_msgSend(v6, "appendFormat:", CFSTR("\n}"), v10, v11, v12, v13, v14);
  v7 = v15;
  v8 = v6;

  return (NSString *)v8;
}

- (NSNumber)navigationRouteGuidanceDisplayComponentID
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterUpdate component](self, "component"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterUpdate component](self, "component"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier")));

  }
  else
  {
    v5 = 0;
  }
  return (NSNumber *)v5;
}

+ (id)_enumProperties
{
  return &__NSDictionary0__struct;
}

+ (id)_integersKeyed
{
  return &__NSDictionary0__struct;
}

- (BOOL)_propertyIsEnum:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "_enumProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  v8 = objc_msgSend(v7, "containsObject:", v4);

  return v8;
}

- (id)_debugDescriptionForProperty:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[CarClusterUpdate _propertyIsEnum:](self, "_propertyIsEnum:", v6))
  {
    v8 = objc_msgSend((id)objc_opt_class(self), "_enumProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v6));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v7));

  }
  else
  {
    v11 = v7;
  }

  return v11;
}

- (id)debugDescription
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterUpdate debugProperties](self, "debugProperties"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterUpdate logFormat](self, "logFormat"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p>: (%@) %@"), v3, self, v4, v5));

  return v6;
}

+ (unsigned)_accNavRouteGuidanceStateForGEONavigationState:(int)a3
{
  if ((a3 - 1) > 7)
    return 0;
  else
    return word_100E3C7C0[a3 - 1];
}

+ (unsigned)_accNavManeuverTypeForGEOManeuverType:(int)a3
{
  if ((a3 - 1) > 0x57)
    return 0;
  else
    return word_100E3C70C[a3 - 1];
}

+ (unsigned)_accNavManeuverStateForGEONavigationAnnouncementStage:(unint64_t)a3
{
  unsigned __int16 v3;

  v3 = a3 - 2;
  if ((((_DWORD)a3 - 2) & 0xFFFC) != 0)
    return -1;
  return v3;
}

- (NSString)debugProperties
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (ACCNavigationAccessoryComponent)component
{
  return self->_component;
}

- (void)setComponent:(id)a3
{
  objc_storeStrong((id *)&self->_component, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_debugProperties, 0);
}

@end
