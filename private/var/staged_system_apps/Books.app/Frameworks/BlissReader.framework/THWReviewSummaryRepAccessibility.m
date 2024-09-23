@implementation THWReviewSummaryRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWReviewSummaryRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDContainerRepAccessibility, a2);
}

- (void)tsaxLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewSummaryRepAccessibility;
  -[THWReviewSummaryRepAccessibility tsaxLoadAccessibilityInformation](&v3, "tsaxLoadAccessibilityInformation");
  -[THWReviewSummaryRepAccessibility _thaxConfigureRepIgnorance](self, "_thaxConfigureRepIgnorance");
}

- (void)didUpdateLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWReviewSummaryRepAccessibility;
  -[THWReviewSummaryRepAccessibility didUpdateLayer:](&v4, "didUpdateLayer:", a3);
  -[THWReviewSummaryRepAccessibility _thaxConfigureRepIgnorance](self, "_thaxConfigureRepIgnorance");
}

- (void)_thaxConfigureRepIgnorance
{
  TSDLayoutAccessibility *v3;
  TSDCanvasAccessibility *v4;
  void *v5;
  uint64_t v6;
  Class v7;
  Class v8;
  void *v9;
  uint64_t v10;
  Class v11;
  Class v12;
  id v13;
  _QWORD v14[7];
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  _BYTE v22[9];

  v3 = -[TSDRepAccessibility tsaxLayout](self, "tsaxLayout");
  v4 = -[TSDRepAccessibility tsaxCanvas](self, "tsaxCanvas");
  v22[0] = 0;
  v5 = (void *)objc_opt_class(TSDContainerRepAccessibility);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = sub_256CE4;
  v20 = sub_256CF4;
  v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_256D00;
  v15[3] = &unk_427D68;
  v15[5] = v3;
  v15[6] = &v16;
  v15[4] = v4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v15))
    abort();
  v6 = v17[5];
  _Block_object_dispose(&v16, 8);
  v7 = __TSAccessibilityCastAsSafeCategory(v5, v6, 1, v22);
  if (v22[0])
    goto LABEL_10;
  v8 = v7;
  v22[0] = 0;
  v9 = (void *)objc_opt_class(TSDContainerRepAccessibility);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = sub_256CE4;
  v20 = sub_256CF4;
  v21 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_256D44;
  v14[3] = &unk_427D68;
  v14[5] = v3;
  v14[6] = &v16;
  v14[4] = v4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v14))
    abort();
  v10 = v17[5];
  _Block_object_dispose(&v16, 8);
  v11 = __TSAccessibilityCastAsSafeCategory(v9, v10, 1, v22);
  if (v22[0])
LABEL_10:
    abort();
  v12 = v11;
  v13 = objc_msgSend(-[TSDLayoutAccessibility tsaxValueForKey:](v3, "tsaxValueForKey:", CFSTR("delegate")), "tsaxBoolValueForKey:", CFSTR("reviewSummaryShouldShowResults"));
  if (-[THWReviewSummaryRepAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "thaxShouldIgnore:resultsRep:", &OBJC_PROTOCOL___THWReviewSummaryRepAccessibilityExtras))-[THWReviewSummaryRepAccessibility thaxShouldIgnore:resultsRep:](self, "thaxShouldIgnore:resultsRep:", v13 ^ 1, v8);
  if (-[THWReviewSummaryRepAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "thaxShouldIgnore:checkingRep:", &OBJC_PROTOCOL___THWReviewSummaryRepAccessibilityExtras))-[THWReviewSummaryRepAccessibility thaxShouldIgnore:resultsRep:](self, "thaxShouldIgnore:resultsRep:", v13, v12);
}

- (void)thaxShouldIgnore:(BOOL)a3 resultsRep:(id)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a4, "tsaxChildReps", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "thaxSetShouldHideElement:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)thaxShouldIgnore:(BOOL)a3 checkingRep:(id)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a4, "tsaxChildReps", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "thaxSetShouldHideElement:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

@end
