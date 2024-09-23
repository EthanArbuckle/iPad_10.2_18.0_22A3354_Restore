@implementation TSTTableControlCellEditorAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTTableControlCellEditor");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)_tsaxIsInsertingText
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A10);
}

- (void)_tsaxSetInsertingText:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A10, a3);
}

- (void)insertText:(id)a3
{
  _BOOL8 v5;
  objc_super v6;

  v5 = -[TSTTableControlCellEditorAccessibility _tsaxIsInsertingText](self, "_tsaxIsInsertingText");
  -[TSTTableControlCellEditorAccessibility _tsaxSetInsertingText:](self, "_tsaxSetInsertingText:", 1);
  v6.receiver = self;
  v6.super_class = (Class)TSTTableControlCellEditorAccessibility;
  -[TSTTableControlCellEditorAccessibility insertText:](&v6, "insertText:", a3);
  -[TSTTableControlCellEditorAccessibility _tsaxSetInsertingText:](self, "_tsaxSetInsertingText:", v5);
}

- (void)p_alterRating:(id)a3 withValue:(unint64_t)a4
{
  NSString *v6;
  NSString *v7;
  uint64_t v8;
  void *v9;
  Class v10;
  char v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSTTableControlCellEditorAccessibility;
  -[TSTTableControlCellEditorAccessibility p_alterRating:withValue:](&v12, "p_alterRating:withValue:", a3);
  if (-[TSTTableControlCellEditorAccessibility _tsaxIsInsertingText](self, "_tsaxIsInsertingText"))
  {
    if (a4 == 1)
    {
      v6 = TSAccessibilityLocalizedString((uint64_t)CFSTR("stars.rating.singular"));
    }
    else
    {
      v7 = TSAccessibilityLocalizedString((uint64_t)CFSTR("stars.rating.plural %@"));
      v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, TSAccessibilityLocalizedUnsignedInteger(a4));
    }
    v8 = (uint64_t)v6;
    v11 = 0;
    v9 = (void *)objc_opt_class(TSTTableRepAccessibility);
    v10 = __TSAccessibilityCastAsSafeCategory(v9, (uint64_t)-[TSTTableControlCellEditorAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mTableRep")), 1, &v11);
    if (v11)
      abort();
    TSAccessibilityPostAnnouncementNotification((uint64_t)v10, v8);
  }
}

@end
