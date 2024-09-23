@implementation CRLImageRepAccessibility

- (CRLImageRepAccessibility)initWithLayout:(id)a3 canvas:(id)a4
{
  CRLImageRepAccessibility *v4;
  CRLImageRepAccessibility *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLImageRepAccessibility;
  v4 = -[CRLImageRepAccessibility initWithLayout:canvas:](&v8, "initWithLayout:canvas:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = -[CRLCanvasRepAccessibility accessibilityTraits](v4, "accessibilityTraits");
    -[CRLImageRepAccessibility setAccessibilityTraits:](v5, "setAccessibilityTraits:", UIAccessibilityTraitImage | v6);
  }
  return v5;
}

- (void)editMaskWithHUD:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CRLImageRepAccessibility;
  -[CRLImageRepAccessibility editMaskWithHUD:](&v6, "editMaskWithHUD:");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Image mask slider visible below image"), 0, 0));
    CRLAccessibilityPostHighPriorityAnnouncementNotification(0, v5);

  }
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  double y;
  double x;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  if (UIAccessibilityIsVoiceOverRunning())
    return 0;
  v9.receiver = self;
  v9.super_class = (Class)CRLImageRepAccessibility;
  return -[CRLImageRepAccessibility handleDoubleTapAtPoint:inputType:](&v9, "handleDoubleTapAtPoint:inputType:", a4, x, y);
}

- (BOOL)supportsAlternatePressureDrag
{
  objc_super v4;

  if (UIAccessibilityIsVoiceOverRunning())
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CRLImageRepAccessibility;
  return -[CRLImageRepAccessibility supportsAlternatePressureDrag](&v4, "supportsAlternatePressureDrag");
}

- (BOOL)crlaxSupportsPublicCustomRotors
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  objc_super v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  if ((objc_msgSend(v3, "crlaxDocumentIsSharedReadOnly") & 1) != 0
    || !-[CRLCanvasRepAccessibility crlaxIsSelected](self, "crlaxIsSelected"))
  {

    goto LABEL_7;
  }
  v4 = -[CRLImageRepAccessibility _crlaxAllowedToEditMask](self, "_crlaxAllowedToEditMask");

  if (!v4)
  {
LABEL_7:
    v13.receiver = self;
    v13.super_class = (Class)CRLImageRepAccessibility;
    v10 = -[CRLCanvasRepAccessibility accessibilityHint](&v13, "accessibilityHint");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    return v11;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepAccessibility crlaxImageLayout](self, "crlaxImageLayout"));
  v6 = objc_msgSend(v5, "crlaxIsInMaskEditMode");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = v7;
  if (v6)
    v9 = CFSTR("Image mask slider visible below image");
  else
    v9 = CFSTR("Double tap to view image");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, 0, 0));

  return v11;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  BOOL v3;
  objc_super v5;
  objc_super v6;

  if (-[CRLCanvasRepAccessibility crlaxIsSelected](self, "crlaxIsSelected"))
  {
    -[CRLCanvasRepAccessibility accessibilityActivationPoint](self, "accessibilityActivationPoint");
    v6.receiver = self;
    v6.super_class = (Class)CRLImageRepAccessibility;
    v3 = 1;
    -[CRLImageRepAccessibility handleDoubleTapAtPoint:inputType:](&v6, "handleDoubleTapAtPoint:inputType:", 1);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLImageRepAccessibility;
    return -[CRLCanvasRepAccessibility accessibilityActivate](&v5, "accessibilityActivate");
  }
  return v3;
}

- (BOOL)_crlaxAllowedToEditMask
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "i_allowedToEditMask");

  return v3;
}

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLImageRep");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLCanvasRepAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLImageRepAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (CRLImageLayoutAccessibility)crlaxImageLayout
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageLayout"));

  objc_opt_class(CRLImageLayoutAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLImageLayoutAccessibility *)v8;
}

- (NSString)crlaxLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageInfo"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityDescription"));
  if (!objc_msgSend(v5, "length"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageAssetPayload"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filename"));

    v5 = (void *)v13;
  }
  v14 = __CRLAccessibilityStringForVariables(1, v4, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return (NSString *)v15;
}

- (id)crlaxKnobLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Image"), 0, 0));

  return v3;
}

- (CRLImageItemAccessibility)_crlaxImageInfo
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageInfo"));

  objc_opt_class(CRLImageItemAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLImageItemAccessibility *)v8;
}

@end
