@implementation CRLPathSourceAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLPathSource");
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
  objc_opt_class(CRLPathSourceAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (NSString)_crlaxStoredLabel
{
  return (NSString *)__CRLAccessibilityGetAssociatedObject(self, &unk_101415070);
}

- (void)_crlaxSetStoredLabel:(id)a3
{
  __CRLAccessibilitySetAssociatedCopiedObject(self, &unk_101415070, a3);
}

+ (id)pathSourceForShapeType:(int64_t)a3 naturalSize:(CGSize)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v13;
  char v14;

  v14 = 0;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___CRLPathSourceAccessibility;
  v5 = objc_msgSendSuper2(&v13, "pathSourceForShapeType:naturalSize:", a4.width, a4.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_opt_class(CRLPathSourceAccessibility, v7);
  v9 = __CRLAccessibilityCastAsSafeCategory(v8, (uint64_t)v6, 1, &v14);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (v14)
    abort();
  v11 = (void *)v10;

  objc_msgSend(v11, "_crlaxUpdatePathSourceLabelForType:", a3);
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  _QWORD v6[4];
  id v7;
  CRLPathSourceAccessibility *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLPathSourceAccessibility;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10020E738;
  v6[3] = &unk_10122D3D8;
  v4 = -[CRLPathSourceAccessibility copyWithZone:](&v9, "copyWithZone:", a3);
  v7 = v4;
  v8 = self;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();

  return v4;
}

- (NSString)crlaxLabel
{
  void *v3;
  void *v4;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSourceAccessibility _crlaxStoredLabel](self, "_crlaxStoredLabel"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSourceAccessibility crlaxTarget](self, "crlaxTarget"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "inferredAccessibilityDescription"));

    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      if (!v3)
      {
        ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("_crlaxInferredLabel did not return an inferred label for object: %@"), v6, v7, v8, v9, v10, (uint64_t)self))abort();
        v3 = 0;
      }
    }
  }
  return (NSString *)v3;
}

- (NSString)crlaxHint
{
  return 0;
}

- (BOOL)crlaxIsCircular
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSourceAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isCircular");

  return v3;
}

- (BOOL)crlaxIsRectangular
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSourceAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isRectangular");

  return v3;
}

- (CGSize)crlaxNaturalSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSourceAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v2, "naturalSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)_crlaxInferredLabel
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v4;
  Class v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    objc_opt_class(self, v4);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v13 = __CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Class should override _crlaxInferredLabel: %@"), v8, v9, v10, v11, v12, (uint64_t)v7);

    if (v13)
      abort();
  }
  return 0;
}

- (void)_crlaxUpdatePathSourceLabelForType:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;

  switch(a3)
  {
    case 1:
    case 20:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Line");
      goto LABEL_22;
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Curved connection line");
      goto LABEL_22;
    case 3:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Square");
      goto LABEL_22;
    case 4:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Rounded rectangle");
      goto LABEL_22;
    case 5:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Circle");
      goto LABEL_22;
    case 6:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Triangle");
      goto LABEL_22;
    case 7:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Right triangle");
      goto LABEL_22;
    case 8:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Arrow");
      goto LABEL_22;
    case 9:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Double arrow");
      goto LABEL_22;
    case 10:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Diamond");
      goto LABEL_22;
    case 11:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Quote bubble");
      goto LABEL_22;
    case 12:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Callout");
      goto LABEL_22;
    case 13:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Pentagon");
      goto LABEL_22;
    case 14:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Star");
      goto LABEL_22;
    case 15:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Line with two arrowheads");
      goto LABEL_22;
    case 16:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Line with arrowhead");
      goto LABEL_22;
    case 17:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Draw with pen");
      goto LABEL_22;
    case 18:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Right angle connection line");
      goto LABEL_22;
    case 19:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Straight connection line");
LABEL_22:
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, 0, 0));

      -[CRLPathSourceAccessibility _crlaxSetStoredLabel:](self, "_crlaxSetStoredLabel:", v7);
      break;
    default:
      v7 = 0;
      -[CRLPathSourceAccessibility _crlaxSetStoredLabel:](self, "_crlaxSetStoredLabel:", 0);
      break;
  }

}

@end
