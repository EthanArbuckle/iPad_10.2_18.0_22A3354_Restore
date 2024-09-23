@implementation CRLWPShapeItemAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("Freeform.CRLWPShapeItem");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLBoardItemAccessibility, a2);
}

- (NSString)crlaxShapeString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeItemAccessibility crlaxContainedStorage](self, "crlaxContainedStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxString"));

  return (NSString *)v3;
}

- (BOOL)crlaxDisplaysInstructionalText
{
  return 0;
}

- (CRLWPStorageAccessibility)crlaxContainedStorage
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeItemAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textStorage"));

  v5 = (void *)objc_opt_class(CRLWPStorageAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLWPStorageAccessibility *)v8;
}

- (id)crlaxTarget
{
  CRLWPShapeItemAccessibility *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v9;

  v9 = 0;
  v2 = self;
  v4 = (objc_class *)objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v3);
  v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v2, 1, &v9);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v9)
    abort();
  v7 = (void *)v6;

  return v7;
}

- (BOOL)crlaxIsTextBox
{
  return self->_crlaxIsTextBox;
}

@end
