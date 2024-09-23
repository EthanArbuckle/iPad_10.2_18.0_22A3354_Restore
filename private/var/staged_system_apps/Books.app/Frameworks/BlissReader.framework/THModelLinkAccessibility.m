@implementation THModelLinkAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THModelLink");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

+ (id)thaxModelLinkForHyperlinkField:(id)a3
{
  uint64_t v3;
  void *v4;
  Class v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_252DC0;
  v12 = sub_252DD0;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_252DDC;
  v7[3] = &unk_427D68;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = a1;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v3 = v9[5];
  _Block_object_dispose(&v8, 8);
  LOBYTE(v8) = 0;
  v4 = (void *)objc_opt_class(THModelLinkAccessibility);
  v5 = __TSAccessibilityCastAsSafeCategory(v4, v3, 1, &v8);
  if ((_BYTE)v8)
    abort();
  return v5;
}

@end
