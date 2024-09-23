@implementation TSTCellRegionAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTCellRegion");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)tsaxIsEmpty
{
  return -[TSTCellRegionAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isEmpty"));
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxUpperLeftCellID
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
  v4[2] = sub_2403B4;
  v4[3] = &unk_42BF18;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
  v2 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)*((_DWORD *)v6 + 8);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxBottomRightCellID
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
  v4[2] = sub_24049C;
  v4[3] = &unk_42BF18;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
  v2 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)*((_DWORD *)v6 + 8);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- ($0E7DCC040F5CEAF2787150A9C1D66156)tsaxBoundingCellRange
{
  $0E7DCC040F5CEAF2787150A9C1D66156 v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2810000000;
  v8 = "";
  v9 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_240580;
  v4[3] = &unk_42BF18;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
  v2 = ($0E7DCC040F5CEAF2787150A9C1D66156)v6[4];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)tsaxEnumerateCellRangesUsingBlock:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_240608;
  v3[3] = &unk_426E78;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

@end
