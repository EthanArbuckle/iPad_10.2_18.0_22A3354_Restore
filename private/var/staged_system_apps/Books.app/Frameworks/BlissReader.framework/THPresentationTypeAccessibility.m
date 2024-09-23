@implementation THPresentationTypeAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THPresentationType");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

+ (id)thaxPaginatedPresentationTypeInContext:(id)a3
{
  uint64_t v3;
  void *v4;
  id result;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_2589A4;
  v11 = sub_2589B4;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2589C0;
  v6[3] = &unk_427D68;
  v6[5] = a3;
  v6[6] = &v7;
  v6[4] = a1;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v3 = v8[5];
  _Block_object_dispose(&v7, 8);
  LOBYTE(v7) = 0;
  v4 = (void *)objc_opt_class(THPresentationTypeAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v4, v3, 1, &v7);
  if ((_BYTE)v7)
    abort();
  return result;
}

@end
