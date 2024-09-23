@implementation TSCHChartStylePresetAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSCHChartStylePreset");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSArray)tsaxSeriesFillStyles
{
  NSArray *v2;
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  Class v10;
  id v11;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v2 = -[TSCHChartStylePresetAccessibility _tsaxSeriesAllStyles](self, "_tsaxSeriesAllStyles");
  v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](v2, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v20 = 0;
        v9 = (void *)objc_opt_class(TSCHChartSeriesStyleAccessibility);
        v10 = __TSAccessibilityCastAsSafeCategory(v9, v8, 1, &v20);
        if (v20)
LABEL_14:
          abort();
        v11 = -[objc_class tsax2DColumnFillProperty](v10, "tsax2DColumnFillProperty");
        if (v11)
        {
          -[NSMutableArray addObject:](v3, "addObject:", v11);
        }
        else if (TSAccessibilityShouldPerformValidationChecks())
        {
          ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
          if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Column fill should not be nil."), v13, v14, v15, v16, v17, v19))goto LABEL_14;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }
  return &v3->super;
}

- (NSArray)_tsaxSeriesAllStyles
{
  objc_class *v3;
  NSArray *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSArray);
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSCHChartStylePresetAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("seriesStyles")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
