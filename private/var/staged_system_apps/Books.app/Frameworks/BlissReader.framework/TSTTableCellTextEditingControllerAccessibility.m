@implementation TSTTableCellTextEditingControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTTableCellTextEditingController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSWPEditingControllerAccessibility, a2);
}

- (BOOL)_tsaxIsPerformingBlockEndingEditing
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5439B1);
}

- (void)_tsaxSetPerformingBlockEndingEditing:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_5439B1, a3);
}

- (TSTTableRepAccessibility)tsaxTableRep
{
  uint64_t v2;
  void *v3;
  Class v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_245664;
  v11 = sub_245674;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_245680;
  v6[3] = &unk_42BF18;
  v6[4] = objc_msgSend(-[TSTTableCellTextEditingControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("interactiveCanvasController")), "tsaxValueForKey:", CFSTR("editorController"));
  v6[5] = &v7;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v2 = v8[5];
  _Block_object_dispose(&v7, 8);
  LOBYTE(v7) = 0;
  v3 = (void *)objc_opt_class(TSTTableEditorAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, v2, 1, &v7);
  if ((_BYTE)v7)
    abort();
  return (TSTTableRepAccessibility *)-[objc_class tsaxTableRep](v4, "tsaxTableRep");
}

- (void)tsaxPerformBlockEndingEditing:(id)a3
{
  TSTTableCellTextEditingControllerAccessibility *v4;

  if (-[TSTTableCellTextEditingControllerAccessibility _tsaxIsPerformingBlockEndingEditing](self, "_tsaxIsPerformingBlockEndingEditing"))
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    v4 = self;
    -[TSTTableCellTextEditingControllerAccessibility _tsaxSetPerformingBlockEndingEditing:](self, "_tsaxSetPerformingBlockEndingEditing:", 1);
    (*((void (**)(id))a3 + 2))(a3);
    -[TSTTableCellTextEditingControllerAccessibility _tsaxSetPerformingBlockEndingEditing:](self, "_tsaxSetPerformingBlockEndingEditing:", 0);

  }
}

- (void)endEditing
{
  unsigned __int8 v3;
  TSTTableRepAccessibility *v4;
  TSTTableCellTextEditingControllerAccessibility *v5;
  objc_super v6;

  v3 = -[TSTTableCellTextEditingControllerAccessibility _tsaxIsPerformingBlockEndingEditing](self, "_tsaxIsPerformingBlockEndingEditing");
  if ((v3 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = self;
    v4 = -[TSTTableCellTextEditingControllerAccessibility tsaxTableRep](self, "tsaxTableRep");
  }
  v6.receiver = self;
  v6.super_class = (Class)TSTTableCellTextEditingControllerAccessibility;
  -[TSTTableCellTextEditingControllerAccessibility endEditing](&v6, "endEditing");
  if ((v3 & 1) == 0)
  {
    if (-[TSTTableCellTextEditingControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxDidEndEditingWithTableRep:", &OBJC_PROTOCOL___TSTTableCellTextEditingControllerAccessibilityExtras))-[TSTTableCellTextEditingControllerAccessibility tsaxDidEndEditingWithTableRep:](self, "tsaxDidEndEditingWithTableRep:", v4);

  }
}

@end
