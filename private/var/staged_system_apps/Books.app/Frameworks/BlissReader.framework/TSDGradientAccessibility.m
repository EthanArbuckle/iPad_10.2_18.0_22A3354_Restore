@implementation TSDGradientAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDGradient");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)tsaxGradientTypeDescription
{
  unint64_t v2;

  v2 = -[TSDGradientAccessibility _tsaxGradientType](self, "_tsaxGradientType");
  if (!v2)
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("gradient.linear"));
  if (v2 == 1)
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("gradient.radial"));
  return 0;
}

- (NSArray)tsaxGradientColorDescriptions
{
  NSArray *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  Class v11;
  id v12;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (NSArray *)+[NSMutableArray array](NSMutableArray, "array");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = -[TSDGradientAccessibility _tsaxGradientStops](self, "_tsaxGradientStops");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v14 = 0;
        v10 = (void *)objc_opt_class(TSDGradientStopAccessibility);
        v11 = __TSAccessibilityCastAsSafeCategory(v10, v9, 1, &v14);
        if (v14)
          abort();
        v12 = -[objc_class tsaxColorDescription](v11, "tsaxColorDescription");
        if (objc_msgSend(v12, "length"))
          -[NSArray addObject:](v3, "addObject:", v12);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)_tsaxGradientStops
{
  objc_class *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSArray);
  result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSDGradientAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("gradientStops")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (unint64_t)_tsaxGradientType
{
  return (unint64_t)-[TSDGradientAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("gradientType"));
}

@end
