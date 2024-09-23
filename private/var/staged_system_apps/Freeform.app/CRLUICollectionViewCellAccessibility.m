@implementation CRLUICollectionViewCellAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("UICollectionViewCell");
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
  v5 = (void *)objc_opt_class(CRLUICollectionViewCellAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  Class v12;
  uint64_t v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect result;
  CGRect v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUICollectionViewCellAccessibility accessibilityContainer](self, "accessibilityContainer"));
  v22.receiver = self;
  v22.super_class = (Class)CRLUICollectionViewCellAccessibility;
  -[CRLUICollectionViewCellAccessibility accessibilityFrame](&v22, "accessibilityFrame");
  x = v4;
  y = v6;
  width = v8;
  height = v10;
  v12 = NSClassFromString(CFSTR("UICollectionViewCellAccessibilityElement"));
  if ((objc_opt_isKindOfClass(v3, v12) & 1) != 0)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityContainer"));

    v3 = (void *)v13;
  }
  if (v3)
  {
    objc_msgSend(v3, "accessibilityFrame");
    v26.origin.x = v14;
    v26.origin.y = v15;
    v26.size.width = v16;
    v26.size.height = v17;
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    v24 = CGRectIntersection(v23, v26);
    x = v24.origin.x;
    y = v24.origin.y;
    width = v24.size.width;
    height = v24.size.height;
  }

  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (BOOL)_accessibilityHasTextOperations
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLUICollectionViewCellAccessibility;
  v3 = -[CRLUICollectionViewCellAccessibility _accessibilityTextOperations](&v8, "_accessibilityTextOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUICollectionViewCellAccessibility _crlaxAlternateTextOperationProvider](self, "_crlaxAlternateTextOperationProvider"));
    v5 = v6 != 0;

  }
  return v5;
}

- (id)_accessibilityTextOperations
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLUICollectionViewCellAccessibility;
  v3 = -[CRLUICollectionViewCellAccessibility _accessibilityTextOperations](&v8, "_accessibilityTextOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUICollectionViewCellAccessibility _crlaxAlternateTextOperationProvider](self, "_crlaxAlternateTextOperationProvider"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_accessibilityTextOperations"));

    v4 = (void *)v6;
  }
  return v4;
}

- (BOOL)_accessibilityTextOperationAction:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLUICollectionViewCellAccessibility;
  if (-[CRLUICollectionViewCellAccessibility _accessibilityTextOperationAction:](&v9, "_accessibilityTextOperationAction:", v4))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUICollectionViewCellAccessibility _crlaxAlternateTextOperationProvider](self, "_crlaxAlternateTextOperationProvider"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_accessibilityTextViewTextOperationResponder"));
    v5 = objc_msgSend(v7, "_accessibilityTextOperationAction:", v4);

  }
  return v5;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUICollectionViewCellAccessibility _crlaxAlternateTextOperationProvider](self, "_crlaxAlternateTextOperationProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_accessibilityTextViewTextOperationResponder"));

  return v3;
}

- (id)_crlaxAlternateTextOperationProvider
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLUICollectionViewCellAccessibility nextResponder](self, "nextResponder"));
  if (v2)
  {
    while (1)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_accessibilityTextOperations"));
      v4 = objc_msgSend(v3, "count");

      if (v4)
        break;
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "nextResponder"));

      v2 = (id)v5;
      if (!v5)
        goto LABEL_6;
    }
    v2 = v2;
  }
LABEL_6:

  return v2;
}

- (id)_crlaxBaseCollectionViewCellTextOperations
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLUICollectionViewCellAccessibility;
  v2 = -[CRLUICollectionViewCellAccessibility _accessibilityTextOperations](&v4, "_accessibilityTextOperations");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

@end
