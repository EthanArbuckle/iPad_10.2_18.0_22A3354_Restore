@implementation TSTTableInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTTableInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)_tsaxUpdateEditingCellIDOnMasterLayout
{
  uint64_t v3;
  void *v4;
  Class v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  const char *v10;
  int v11;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2810000000;
  v10 = "";
  v11 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2474C0;
  v6[3] = &unk_42BF18;
  v6[4] = self;
  v6[5] = &v7;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v3 = *((unsigned int *)v8 + 8);
  _Block_object_dispose(&v7, 8);
  LOBYTE(v7) = 0;
  v4 = (void *)objc_opt_class(TSTMasterLayoutAccessibility);
  v5 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)-[TSTTableInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mMasterLayout")), 1, &v7);
  if ((_BYTE)v7)
    abort();
  -[objc_class tsaxSetEditingCellID:](v5, "tsaxSetEditingCellID:", v3);
}

- (id)masterLayout
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSTTableInfoAccessibility;
  v3 = -[TSTTableInfoAccessibility masterLayout](&v5, "masterLayout");
  -[TSTTableInfoAccessibility _tsaxUpdateEditingCellIDOnMasterLayout](self, "_tsaxUpdateEditingCellIDOnMasterLayout");
  return v3;
}

- (void)setEditingCellID:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSTTableInfoAccessibility;
  -[TSTTableInfoAccessibility setEditingCellID:](&v4, "setEditingCellID:", *(unsigned int *)&a3);
  -[TSTTableInfoAccessibility _tsaxUpdateEditingCellIDOnMasterLayout](self, "_tsaxUpdateEditingCellIDOnMasterLayout");
}

@end
