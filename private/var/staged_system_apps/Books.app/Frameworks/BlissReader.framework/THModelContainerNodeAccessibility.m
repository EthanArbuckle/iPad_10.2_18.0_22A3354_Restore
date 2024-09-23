@implementation THModelContainerNodeAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THModelContainerNode");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THModelNodeAccessibility, a2);
}

- (unint64_t)thaxIndexOfNode:(id)a3
{
  unint64_t v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_25AA5C;
  v5[3] = &unk_427D68;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end
