@implementation NIUtils

+ (const)NIRelationshipSpecifierToString:(unint64_t)a3
{
  if (a3 > 0xF)
    return "N/A";
  else
    return off_10080AB18[a3];
}

+ (BOOL)isIntValidRelationshipSpecifier:(int64_t)a3
{
  return (unint64_t)a3 < 0x10;
}

+ (const)AntennaDiversityOverrideToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return "N/A";
  else
    return off_10080AB98[a3];
}

+ (BOOL)isIntValidAntennaDiversityOverride:(int64_t)a3
{
  return (unint64_t)a3 < 3;
}

+ (BOOL)isIntValidNearbyObjectUpdateRate:(int64_t)a3
{
  return (unint64_t)a3 < 4;
}

+ (BOOL)nearbyObjectUpdateRate:(int64_t)a3 isGreaterThan:(int64_t)a4
{
  unsigned int v4;
  BOOL v5;
  BOOL v6;

  v4 = (9u >> (a4 & 0xF)) & 1;
  if ((unint64_t)a4 >= 4)
    LOBYTE(v4) = 0;
  v5 = (a4 & 0xF) == 3;
  if ((unint64_t)a4 >= 4)
    v5 = 0;
  if (a3)
    v5 = 0;
  if (a3 == 1)
    v5 = v4;
  v6 = a3 == 2 || v5;
  return a3 != a4 && v6;
}

+ (const)NISessionBackgroundModeToString:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
    sub_1003D3EF4();
  return off_10080ABB0[a3];
}

+ (const)NINearbyObjectUpdateRateToString:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
    sub_1003D3F1C();
  return off_10080ABC8[a3];
}

+ (const)NINearbyObjectUpdateRateToShortString:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
    sub_1003D3F44();
  return off_10080ABE8[a3];
}

+ (id)NISystemResourceAvailabilityToString:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v4 = objc_autoreleasePoolPush();
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("Unavailable:")));
    v6 = v5;
    if ((a3 & 1) != 0)
      objc_msgSend(v5, "appendString:", CFSTR("AirplaneMode|"));
    if ((a3 & 2) != 0)
      objc_msgSend(v6, "appendString:", CFSTR("GeographicalRegion|"));
    if ((a3 & 4) != 0)
      objc_msgSend(v6, "appendString:", CFSTR("RecoveringFromError|"));
    if ((a3 & 8) != 0)
      objc_msgSend(v6, "appendString:", CFSTR("NotReady|"));
    if ((a3 & 0x10) != 0)
      objc_msgSend(v6, "appendString:", CFSTR("Unsupported|"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringToIndex:", (char *)objc_msgSend(v6, "length") - 1));

  }
  else
  {
    v7 = CFSTR("Available");
  }
  objc_autoreleasePoolPop(v4);
  return v7;
}

+ (id)NISystemPassiveAccessIntentToString:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v4 = objc_autoreleasePoolPush();
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("Intent:")));
    v6 = v5;
    if ((a3 & 1) != 0)
      objc_msgSend(v5, "appendString:", CFSTR("WristRaise|"));
    if ((a3 & 2) != 0)
      objc_msgSend(v6, "appendString:", CFSTR("GeofenceEntry|"));
    if ((a3 & 4) != 0)
      objc_msgSend(v6, "appendString:", CFSTR("WalletInteraction|"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringToIndex:", (char *)objc_msgSend(v6, "length") - 1));

  }
  else
  {
    v7 = CFSTR("NoIntent");
  }
  objc_autoreleasePoolPop(v4);
  return v7;
}

@end
