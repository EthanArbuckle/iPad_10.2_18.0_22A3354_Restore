@implementation CRLConnectionLineAbstractLayoutAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLConnectionLineAbstractLayout");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLConnectionLineAbstractLayoutAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)crlaxIsVisuallyPointingAt:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  id v9;
  BOOL v10;

  v4 = a3;
  if (-[CRLConnectionLineAbstractLayoutAccessibility _crlaxVisuallyPointsAtHead](self, "_crlaxVisuallyPointsAtHead"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedTo"));
    v7 = v6 == v4;

  }
  else
  {
    v7 = 0;
  }
  if (-[CRLConnectionLineAbstractLayoutAccessibility _crlaxVisuallyPointsAtTail](self, "_crlaxVisuallyPointsAtTail"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectedFrom"));
    v10 = v9 == v4;

  }
  else
  {
    v10 = 0;
  }

  return v7 || v10;
}

- (id)crlaxOppositeConnectedLayoutFrom:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedTo"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
  v8 = v7;
  if (v6 == v4)
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedFrom"));
  else
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedTo"));
  v10 = (void *)v9;

  return v10;
}

- (BOOL)_crlaxVisuallyPointsAtHead
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned __int8 v8;
  char v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "strokeHeadLineEnd"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "strokeTailLineEnd"));

  if (!v4)
  {
    LOBYTE(v7) = 0;
    if (v6)
      goto LABEL_3;
LABEL_5:
    v8 = 1;
    goto LABEL_6;
  }
  v7 = objc_msgSend(v4, "isNone") ^ 1;
  if (!v6)
    goto LABEL_5;
LABEL_3:
  v8 = objc_msgSend(v6, "isNone");
LABEL_6:
  v9 = v7 | v8;

  return v9;
}

- (BOOL)_crlaxVisuallyPointsAtTail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "strokeHeadLineEnd"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "strokeTailLineEnd"));

  if (!v4)
  {
    v7 = 1;
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = objc_msgSend(v4, "isNone");
  if (v6)
LABEL_3:
    v7 |= objc_msgSend(v6, "isNone") ^ 1;
LABEL_4:

  return v7;
}

@end
