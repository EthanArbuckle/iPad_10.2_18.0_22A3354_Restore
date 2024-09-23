@implementation GEOComposedRouteEVChargingStationInfo

+ (id)chargeToStringForChargePercentage:(double)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (a3 >= 100.0)
    v6 = CFSTR("Charge to %ld%%");
  else
    v6 = CFSTR("Charge to at least %ld%%");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, (uint64_t)a3));

  return v8;
}

@end
