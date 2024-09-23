@implementation TSTMasterLayoutAccessibility

- (void)tsaxDynamicSelectionRegionWasUpdatedWithSummary:(id)a3
{
  if (a3)
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, a3);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)tsaxDynamicColumnOrRowCountWasUpdatedWithSummary:(id)a3
{
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, a3);
  UIAccessibilityPostNotification(TSAccessibilityElementMovedNotification, 0);
}

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTMasterLayout");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (_NSRange)_tsaxEditingCellIDAsRange
{
  id AssociatedRange;
  NSUInteger v3;
  _NSRange result;

  AssociatedRange = __TSAccessibilityGetAssociatedRange(self, &unk_543889);
  result.length = v3;
  result.location = (NSUInteger)AssociatedRange;
  return result;
}

- (void)_tsaxSetEditingCellIDAsRange:(_NSRange)a3
{
  __TSAccessibilitySetAssociatedRange(self, &unk_543889, a3.location, a3.length);
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxEditingCellID
{
  unsigned __int8 v2;
  unsigned __int16 v3;

  v2 = -[TSTMasterLayoutAccessibility _tsaxEditingCellIDAsRange](self, "_tsaxEditingCellIDAsRange");
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(v3 | (v2 << 16));
}

- (void)tsaxSetEditingCellID:(id)a3
{
  -[TSTMasterLayoutAccessibility _tsaxSetEditingCellIDAsRange:](self, "_tsaxSetEditingCellIDAsRange:", a3.var1, a3.var0);
}

- (void)updateDynamicSelectionRegion:(id)a3
{
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  Class v9;
  void *v10;
  NSString *v11;
  _QWORD v12[6];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)TSTMasterLayoutAccessibility;
  -[TSTMasterLayoutAccessibility updateDynamicSelectionRegion:](&v26, "updateDynamicSelectionRegion:");
  v5 = -[TSTMasterLayoutAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxDynamicSelectionRegionWasUpdatedWithSummary:", &OBJC_PROTOCOL___TSTMasterLayoutAccessibilityExtras);
  v6 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = sub_23A1BC;
  v24 = sub_23A1CC;
  v25 = 0;
  if (v5)
  {
    v7 = (uint64_t)-[TSTMasterLayoutAccessibility tsaxEditingCellID](self, "tsaxEditingCellID");
    if ((_WORD)v7 == 0xFFFF || (v7 & 0xFF0000) == 0xFF0000)
    {
      v14 = 0;
      v15 = &v14;
      v16 = 0x3052000000;
      v17 = sub_23A1BC;
      v18 = sub_23A1CC;
      v19 = 0;
      v13 = 0;
      v8 = (void *)objc_opt_class(TSTCellRegionAccessibility);
      v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)a3, 1, &v13);
      if (v13)
        abort();
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_23A1D8;
      v12[3] = &unk_43BD50;
      v12[4] = &v20;
      v12[5] = &v14;
      -[objc_class tsaxEnumerateCellRangesUsingBlock:](v9, "tsaxEnumerateCellRangesUsingBlock:", v12);
      if (v15[5])
      {
        objc_msgSend((id)v21[5], "appendString:", CFSTR(", , "));
        v10 = (void *)v21[5];
        v11 = TSAccessibilityLocalizedString((uint64_t)CFSTR("columns.and.rows.selected.ending.format %@"));
        objc_msgSend(v10, "appendFormat:", v11, v15[5]);
      }
      _Block_object_dispose(&v14, 8);
    }
    -[TSTMasterLayoutAccessibility tsaxDynamicSelectionRegionWasUpdatedWithSummary:](self, "tsaxDynamicSelectionRegionWasUpdatedWithSummary:", v21[5]);
    v6 = (void *)v21[5];
  }

  _Block_object_dispose(&v20, 8);
}

- (BOOL)updateDynamicChangeRowOrColumnCount:(int)a3 count:(int)a4 newlyAddedElementSize:(double)a5
{
  BOOL v8;
  uint64_t v9;
  id v10;
  const __CFString *v11;
  BOOL v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  NSString *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TSTMasterLayoutAccessibility;
  v8 = -[TSTMasterLayoutAccessibility updateDynamicChangeRowOrColumnCount:count:newlyAddedElementSize:](&v18, "updateDynamicChangeRowOrColumnCount:count:newlyAddedElementSize:", a5);
  if (-[TSTMasterLayoutAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxDynamicColumnOrRowCountWasUpdatedWithSummary:", &OBJC_PROTOCOL___TSTMasterLayoutAccessibilityExtras))
  {
    if (a4 >= 0)
      v9 = a4;
    else
      v9 = -a4;
    v10 = TSAccessibilityLocalizedUnsignedInteger(v9);
    if (a3 == 1)
    {
      v11 = CFSTR("add.column.singular %@");
      v12 = (_DWORD)v9 == 1;
      v13 = CFSTR("remove.column.plural %@");
      if ((_DWORD)v9 != 1)
        v11 = CFSTR("add.column.plural %@");
      v14 = CFSTR("remove.column.singular %@");
    }
    else
    {
      if (a3)
      {
        v16 = 0;
LABEL_20:
        -[TSTMasterLayoutAccessibility tsaxDynamicColumnOrRowCountWasUpdatedWithSummary:](self, "tsaxDynamicColumnOrRowCountWasUpdatedWithSummary:", v16);
        return v8;
      }
      v11 = CFSTR("add.row.singular %@");
      v12 = (_DWORD)v9 == 1;
      v13 = CFSTR("remove.row.plural %@");
      if ((_DWORD)v9 != 1)
        v11 = CFSTR("add.row.plural %@");
      v14 = CFSTR("remove.row.singular %@");
    }
    if (!v12)
      v14 = v13;
    if (a4 < 0)
      v15 = (uint64_t)v14;
    else
      v15 = (uint64_t)v11;
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString(v15), v10);
    goto LABEL_20;
  }
  return v8;
}

@end
