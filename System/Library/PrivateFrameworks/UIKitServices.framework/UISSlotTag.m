@implementation UISSlotTag

+ (unint64_t)cacheLimit
{
  return 10;
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3
{
  return 0;
}

- ($BEA516A46C1BA1F84587E5D243A711F7)backgroundStatisticsRegionForStyle:(id)a3
{
  return ($BEA516A46C1BA1F84587E5D243A711F7)0;
}

- (float)backgroundStatisticsForegroundForStyle:(id)a3
{
  return NAN;
}

- (float)backgroundStatisticsPassingContrastForStyle:(id)a3
{
  return NAN;
}

- (float)backgroundStatisticsFailingContrastForStyle:(id)a3
{
  return NAN;
}

- (unint64_t)failGradeForStyle:(id)a3
{
  return 0;
}

- (unint64_t)hash
{
  return +[UISSlotTag hash](UISSlotTag, "hash");
}

- (unint64_t)hitTestInformationMaskForStyle:(id)a3
{
  return 0;
}

- (int64_t)initialSampleEventForStyle:(id)a3
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isValid
{
  return 1;
}

- (id)resolvedStyleForStyle:(id)a3
{
  return a3;
}

- (unsigned)secureNameForStyle:(id)a3
{
  return 0;
}

@end
