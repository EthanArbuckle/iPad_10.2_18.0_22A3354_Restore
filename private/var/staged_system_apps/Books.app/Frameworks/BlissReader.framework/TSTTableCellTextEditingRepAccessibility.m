@implementation TSTTableCellTextEditingRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTTableCellTextEditingRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSWPRepAccessibility, a2);
}

- (TSTTableCellAccessibilityElement)tsaxParentTableCellElement
{
  uint64_t v3;
  TSTTableCellAccessibilityElement *result;
  void *v5;
  Class v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  const char *v11;
  int v12;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2810000000;
  v11 = "";
  v12 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_240F88;
  v7[3] = &unk_42BF18;
  v7[4] = self;
  v7[5] = &v8;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v3 = *((unsigned int *)v9 + 8);
  _Block_object_dispose(&v8, 8);
  result = 0;
  if ((_WORD)v3 != 0xFFFF && (v3 & 0xFF0000) != 0xFF0000)
  {
    LOBYTE(v8) = 0;
    v5 = (void *)objc_opt_class(TSTTableRepAccessibility);
    v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)-[TSDRepAccessibility tsaxParentRep](self, "tsaxParentRep"), 1, &v8);
    if ((_BYTE)v8)
      abort();
    return (TSTTableCellAccessibilityElement *)-[objc_class tsaxChildCellForCellID:](v6, "tsaxChildCellForCellID:", v3);
  }
  return result;
}

- (id)accessibilityContainer
{
  return -[TSTTableCellTextEditingRepAccessibility tsaxParentTableCellElement](self, "tsaxParentTableCellElement");
}

- (BOOL)tsaxNeedsTextEntryTrait
{
  return 1;
}

@end
