@implementation TSDShapeStyleAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDShapeStyle");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSSStyleAccessibility, a2);
}

- (id)tsaxValueForProperty:(int)a3
{
  void *v3;
  _QWORD v5[6];
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_250654;
  v11 = sub_250664;
  v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_250670;
  v5[3] = &unk_43BA40;
  v5[4] = self;
  v5[5] = &v7;
  v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (NSString)tsaxStyleInfoDescription
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[TSSStyleAccessibility tsaxDescriptionForObjectProperty:](self, "tsaxDescriptionForObjectProperty:", 516);
  v4 = -[TSSStyleAccessibility tsaxDescriptionForObjectProperty:](self, "tsaxDescriptionForObjectProperty:", 517);
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

@end
