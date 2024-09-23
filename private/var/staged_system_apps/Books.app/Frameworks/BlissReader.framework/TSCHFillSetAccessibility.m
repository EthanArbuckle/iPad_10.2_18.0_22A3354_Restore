@implementation TSCHFillSetAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSCHFillSet");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSArray)tsaxFillsForDefaultSeriesType
{
  NSArray *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = sub_2445E8;
  v9 = sub_2445F8;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_244604;
  v4[3] = &unk_42BF18;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
  v2 = (NSArray *)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

@end
