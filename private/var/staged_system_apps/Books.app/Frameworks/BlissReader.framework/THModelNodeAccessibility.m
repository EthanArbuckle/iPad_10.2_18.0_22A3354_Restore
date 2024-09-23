@implementation THModelNodeAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THModelNode");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (THModelContainerNodeAccessibility)thaxParent
{
  void *v3;
  THModelContainerNodeAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THModelContainerNodeAccessibility);
  result = (THModelContainerNodeAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THModelNodeAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("parent")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)thaxContentNodeForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  uint64_t v4;
  void *v5;
  id result;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_2584B4;
  v12 = sub_2584C4;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2584D0;
  v7[3] = &unk_43BE10;
  v7[6] = &v8;
  v7[7] = a3;
  v7[4] = self;
  v7[5] = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  LOBYTE(v8) = 0;
  v5 = (void *)objc_opt_class(THModelContentNodeAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v5, v4, 1, &v8);
  if ((_BYTE)v8)
    abort();
  return result;
}

- (_NSRange)thaxAbsolutePageRangeForPresentationType:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _NSRange result;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = "";
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2585C8;
  v7[3] = &unk_427D68;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.length = v6;
  result.location = v5;
  return result;
}

@end
