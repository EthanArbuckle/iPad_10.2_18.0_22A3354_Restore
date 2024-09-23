@implementation TSDColorFillAccessibility

- (id)accessibilityLabel
{
  Class v3;
  Class v4;
  uint64_t i;
  id v6;
  NSString *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  if (!qword_543840)
  {
    qword_543840 = objc_opt_new(NSMutableDictionary, a2);
    v3 = NSClassFromString(CFSTR("TSDColorFill"));
    if (v3)
    {
      v4 = v3;
      for (i = 0; i != 22; i += 2)
      {
        v6 = -[objc_class tsaxValueForKey:](v4, "tsaxValueForKey:", off_43B850[i]);
        if (v6)
          objc_msgSend((id)qword_543840, "setObject:forKey:", v6, TSAccessibilityLocalizedString((uint64_t)off_43B850[i + 1]));
      }
    }
  }
  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = sub_229074;
  v14 = sub_229084;
  v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_229090;
  v9[3] = &unk_43B908;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend((id)qword_543840, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (NSString *)v11[5];
  if (!v7)
  {
    v7 = TSAccessibilityLocalizedString((uint64_t)CFSTR("unlabeled.color"));
    v11[5] = (uint64_t)v7;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDColorFill");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)tsaxColorFillName
{
  return (NSString *)objc_msgSend(-[TSDColorFillAccessibility _tsaxColor](self, "_tsaxColor"), "tsaxStyleInfoDescription");
}

- (id)_tsaxColor
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSUColorAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDColorFillAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("color")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
