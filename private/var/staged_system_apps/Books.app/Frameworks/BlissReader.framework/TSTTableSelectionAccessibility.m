@implementation TSTTableSelectionAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTTableSelection");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxAnchorCellID
{
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  const char *v8;
  int v9;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2810000000;
  v8 = "";
  v9 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_23CB38;
  v4[3] = &unk_42BF18;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
  v2 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)*((_DWORD *)v6 + 8);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (TSTCellRegionAccessibility)tsaxCellRegion
{
  void *v3;
  TSTCellRegionAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSTCellRegionAccessibility);
  result = (TSTCellRegionAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSTTableSelectionAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("cellRegion")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (int)tsaxSelectionType
{
  return -[TSTTableSelectionAccessibility tsaxUnsignedIntValueForKey:](self, "tsaxUnsignedIntValueForKey:", CFSTR("selectionType"));
}

- (void)tsaxEnumerateSelectedCellsInTableModel:(id)a3 includeEmptyCells:(BOOL)a4 includeHiddenCells:(BOOL)a5 usingBlock:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  unsigned int v11;
  $0E7DCC040F5CEAF2787150A9C1D66156 v12;
  uint64_t v13;
  _QWORD v14[8];

  v7 = a5;
  v8 = a4;
  v11 = -[TSTTableSelectionAccessibility tsaxSelectionType](self, "tsaxSelectionType");
  if (a3)
  {
    if (v11 != 4 && v11 != 5)
    {
      v12 = -[TSTCellRegionAccessibility tsaxBoundingCellRange](-[TSTTableSelectionAccessibility tsaxCellRegion](self, "tsaxCellRegion"), "tsaxBoundingCellRange");
      if (v12.var0.var0 != 0xFFFF && (*(_QWORD *)&v12 & 0xFF0000) != 0xFF0000)
      {
        v13 = 128;
        if (!v8)
          v13 = 0;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_23CCB8;
        v14[3] = &unk_43BE60;
        if (v7)
          v13 |= 0x20uLL;
        v14[4] = self;
        v14[5] = a3;
        v14[6] = a6;
        v14[7] = v13;
        if (__TSAccessibilityPerformSafeBlock((uint64_t)v14))
          abort();
      }
    }
  }
}

@end
