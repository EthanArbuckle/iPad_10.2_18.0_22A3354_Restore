@implementation CRLShapeItemAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("Freeform.CRLShapeItem");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLBoardItemAccessibility, a2);
}

- (CRLPathSourceAccessibility)crlaxPathSource
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeItemAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pathSource"));

  objc_opt_class(CRLPathSourceAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLPathSourceAccessibility *)v8;
}

- (NSString)crlaxShapeTypeLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeItemAccessibility crlaxPathSource](self, "crlaxPathSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxLabel"));

  return (NSString *)v3;
}

- (NSString)crlaxShapeTypeHint
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeItemAccessibility crlaxPathSource](self, "crlaxPathSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxHint"));

  return (NSString *)v3;
}

- (NSString)crlaxShapeStyleName
{
  return self->_crlaxShapeStyleName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crlaxShapeStyleName, 0);
}

@end
