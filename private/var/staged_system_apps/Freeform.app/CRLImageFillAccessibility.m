@implementation CRLImageFillAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLImageFill");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLFillAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_class(CRLImageFillAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (NSString)crlaxFillTechniqueDescription
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  switch(-[CRLImageFillAccessibility crlaxFillTechnique](self, "crlaxFillTechnique"))
  {
    case 0uLL:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("Natural size");
      goto LABEL_8;
    case 1uLL:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("Stretch");
      goto LABEL_8;
    case 2uLL:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("Tile");
      goto LABEL_8;
    case 3uLL:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("Scale to fill");
      goto LABEL_8;
    case 4uLL:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("Scale to fit");
LABEL_8:
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", v4, 0, 0));

      break;
    default:
      v5 = 0;
      break;
  }
  return (NSString *)v5;
}

- (unint64_t)crlaxFillTechnique
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFillAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "technique");

  return (unint64_t)v3;
}

- (CRLDataAccessibility)crlaxImageData
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFillAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageData"));

  v5 = (void *)objc_opt_class(CRLDataAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLDataAccessibility *)v8;
}

- (CRLColorAccessibility)crlaxTintColor
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFillAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tintColor"));

  v5 = (void *)objc_opt_class(CRLColorAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLColorAccessibility *)v8;
}

- (NSString)crlaxStyleInfoDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFillAccessibility crlaxImageData](self, "crlaxImageData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxLabel"));

  if (v5 && objc_msgSend(v5, "length"))
    objc_msgSend(v3, "addObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFillAccessibility crlaxFillTechniqueDescription](self, "crlaxFillTechniqueDescription"));
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length"))
    objc_msgSend(v3, "addObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFillAccessibility crlaxTintColor](self, "crlaxTintColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crlaxStyleInfoDescription"));

  if (v9 && objc_msgSend(v9, "length"))
    objc_msgSend(v3, "addObject:", v9);
  v17 = __CRLAccessibilityStringForArraysAndVariables(v3, v10, v11, v12, v13, v14, v15, v16, (uint64_t)CFSTR("__CRLAccessibilityStringForArraysAndVariablesSentinel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  return (NSString *)v18;
}

@end
