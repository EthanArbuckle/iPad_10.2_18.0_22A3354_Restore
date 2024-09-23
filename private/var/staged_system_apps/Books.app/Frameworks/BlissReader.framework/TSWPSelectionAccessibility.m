@implementation TSWPSelectionAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPSelection");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

+ (id)tsaxSelectionWithRange:(_NSRange)a3
{
  void *v3;
  _QWORD v5[6];
  _NSRange v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_23B9CC;
  v11 = sub_23B9DC;
  v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_23B9E8;
  v5[3] = &unk_43B930;
  v5[4] = a1;
  v5[5] = &v7;
  v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (_NSRange)tsaxRange
{
  id v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[TSWPSelectionAccessibility tsaxRangeValueForKey:](self, "tsaxRangeValueForKey:", CFSTR("range"));
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

@end
