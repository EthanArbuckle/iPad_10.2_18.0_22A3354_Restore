@implementation TSTTableEditorAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTTableEditor");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)_tsaxIsPerformingBlockAffectingTableSelection
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_54399A);
}

- (void)_tsaxSetPerformingBlockAffectingTableSelection:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_54399A, a3);
}

- (TSTTableRepAccessibility)tsaxTableRep
{
  void *v3;
  Class v4;
  Class v5;
  void *v6;
  TSTTableRepAccessibility *result;
  char v8;
  char v9;

  v9 = 0;
  v3 = (void *)objc_opt_class(TSDInteractiveCanvasControllerAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSTTableEditorAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("interactiveCanvasController")), 1, &v9);
  if (v9
    || (v5 = v4,
        v8 = 0,
        v6 = (void *)objc_opt_class(TSTTableRepAccessibility),
        result = (TSTTableRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v6, (uint64_t)-[objc_class tsaxRepForInfo:](v5, "tsaxRepForInfo:", -[TSTTableEditorAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("tableInfo"))), 1, &v8), v8))
  {
    abort();
  }
  return result;
}

- (int)tsaxEditingMode
{
  if (-[TSTTableEditorAccessibility tsaxHasMultipleTableInfos](self, "tsaxHasMultipleTableInfos"))
    return 0;
  else
    return objc_msgSend(-[TSTTableEditorAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("editingState")), "tsaxUnsignedIntValueForKey:", CFSTR("editingMode"));
}

- (BOOL)tsaxHasMultipleTableInfos
{
  return -[TSTTableEditorAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("multipleTableInfos"));
}

- (void)tsaxPerformBlockAffectingTableSelection:(id)a3
{
  TSTTableEditorAccessibility *v4;

  if (-[TSTTableEditorAccessibility _tsaxIsPerformingBlockAffectingTableSelection](self, "_tsaxIsPerformingBlockAffectingTableSelection"))
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    v4 = self;
    -[TSTTableEditorAccessibility _tsaxSetPerformingBlockAffectingTableSelection:](self, "_tsaxSetPerformingBlockAffectingTableSelection:", 1);
    (*((void (**)(id))a3 + 2))(a3);
    -[TSTTableEditorAccessibility _tsaxSetPerformingBlockAffectingTableSelection:](self, "_tsaxSetPerformingBlockAffectingTableSelection:", 0);

  }
}

- (void)setSelection:(id)a3 withFlags:(unint64_t)a4
{
  id v7;
  void *v8;
  Class v9;
  char v10;
  objc_super v11;

  v7 = -[TSTTableEditorAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("selection"));
  v11.receiver = self;
  v11.super_class = (Class)TSTTableEditorAccessibility;
  -[TSTTableEditorAccessibility setSelection:withFlags:](&v11, "setSelection:withFlags:", a3, a4);
  if ((objc_msgSend(-[TSTTableEditorAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("selection")), "isEqual:", v7) & 1) == 0&& !-[TSTTableEditorAccessibility _tsaxIsPerformingBlockAffectingTableSelection](self, "_tsaxIsPerformingBlockAffectingTableSelection")&& -[TSTTableEditorAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxTableSelectionWasUpdated:", &OBJC_PROTOCOL___TSTTableEditorAccessibilityExtras))
  {
    v10 = 0;
    v8 = (void *)objc_opt_class(TSTTableSelectionAccessibility);
    v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)a3, 1, &v10);
    if (v10)
      abort();
    -[TSTTableEditorAccessibility tsaxTableSelectionWasUpdated:](self, "tsaxTableSelectionWasUpdated:", v9);
  }

}

@end
