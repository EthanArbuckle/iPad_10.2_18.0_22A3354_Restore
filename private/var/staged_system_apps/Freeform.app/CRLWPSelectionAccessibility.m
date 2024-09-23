@implementation CRLWPSelectionAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLWPSelection");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLSubselectionAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLWPSelectionAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

+ (id)crlaxSelectionWithInvalidRange
{
  return objc_msgSend(a1, "crlaxSelectionWithRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
}

+ (id)crlaxSelectionWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  length = a3.length;
  location = a3.location;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_10032E0FC;
  v12 = sub_10032E10C;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10032E114;
  v7[3] = &unk_101252470;
  v7[4] = &v8;
  v7[5] = objc_msgSend(a1, "crlaxTargetClass");
  v7[6] = location;
  v7[7] = length;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (_NSRange)crlaxRange
{
  void *v2;
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSelectionAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = (NSUInteger)v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)crlaxIsInsertionPoint
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSelectionAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isInsertionPoint");

  return v3;
}

- (BOOL)crlaxIsValid
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSelectionAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isValid");

  return v3;
}

- (unint64_t)crlaxStart
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSelectionAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "start");

  return (unint64_t)v3;
}

@end
