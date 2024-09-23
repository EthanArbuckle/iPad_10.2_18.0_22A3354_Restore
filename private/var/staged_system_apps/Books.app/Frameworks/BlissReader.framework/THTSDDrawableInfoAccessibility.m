@implementation THTSDDrawableInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDDrawableInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDDrawableInfoAccessibility, a2);
}

- (id)tsaxUserProvidedDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  char v8;
  objc_super v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  NSString *v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = sub_25A7C4;
  v14 = sub_25A7D4;
  v15 = 0;
  v9.receiver = self;
  v9.super_class = (Class)THTSDDrawableInfoAccessibility;
  v15 = -[TSDDrawableInfoAccessibility tsaxUserProvidedDescription](&v9, "tsaxUserProvidedDescription");
  if (!objc_msgSend((id)v11[5], "length"))
  {
    v8 = 0;
    v3 = (objc_class *)objc_opt_class(NSDictionary);
    v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THTSDDrawableInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("accessibilityDescriptions")), 1, &v8);
    if (v8)
      abort();
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_25A7E0;
    v7[3] = &unk_43C418;
    v7[4] = &v10;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
  }
  v5 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v5;
}

@end
