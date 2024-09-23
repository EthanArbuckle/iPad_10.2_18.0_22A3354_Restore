@implementation CRLCanvasKnobAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLCanvasKnob");
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
  v5 = (void *)objc_opt_class(CRLCanvasKnobAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (NSString)crlaxLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v39;
  __CFString *v40;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  char v54;

  v3 = 0;
  switch(-[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag"))
  {
    case 0uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
      goto LABEL_29;
    case 1uLL:
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = v21;
      v23 = CFSTR("Upper left %@ handle");
      goto LABEL_27;
    case 2uLL:
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = v21;
      v23 = CFSTR("Upper middle %@ handle");
      goto LABEL_27;
    case 3uLL:
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = v21;
      v23 = CFSTR("Upper right %@ handle");
      goto LABEL_27;
    case 4uLL:
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = v21;
      v23 = CFSTR("Middle left %@ handle");
      goto LABEL_27;
    case 5uLL:
      if (-[CRLCanvasKnobAccessibility crlaxIs3DReorientationKnob](self, "crlaxIs3DReorientationKnob"))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v25 = v24;
        v26 = CFSTR("3D rotation");
LABEL_23:
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", v26, 0, 0));

        return (NSString *)v37;
      }
      if (-[CRLCanvasKnobAccessibility crlaxIs3DObjectPlayPauseKnob](self, "crlaxIs3DObjectPlayPauseKnob"))
        return (NSString *)(id)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxNameFor3DObjectPlayPauseKnobState](self, "crlaxNameFor3DObjectPlayPauseKnobState"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = v21;
      v23 = CFSTR("Middle middle %@ handle");
LABEL_27:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", v23, 0, 0));
LABEL_28:

LABEL_29:
      if (-[CRLCanvasKnobAccessibility crlaxIsConnectionLineCreationKnob](self, "crlaxIsConnectionLineCreationKnob"))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Connection"), 0, 0));
      }
      else
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "crlaxKnobLabel"));
        if (CRLAccessibilityShouldPerformValidationChecks())
        {
          if (!-[__CFString length](v40, "length"))
          {
            ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
            if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("No handle label for: %@"), v42, v43, v44, v45, v46, (uint64_t)v39))LABEL_40:abort();
          }
        }
      }

      if (v40)
        v11 = v40;
      else
        v11 = &stru_1012A72B0;
      if (CRLAccessibilityShouldPerformValidationChecks() && !v3)
      {
        v47 = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__CRLAccessibilityHandleValidationErrorWithDescription(v47, 0, (uint64_t)CFSTR("No label format string for: %@"), v48, v49, v50, v51, v52, (uint64_t)self))goto LABEL_40;
        goto LABEL_44;
      }
      if (!v3)
      {
LABEL_44:
        v4 = 0;
        goto LABEL_45;
      }
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v11));
LABEL_43:

LABEL_45:
      return (NSString *)v4;
    case 6uLL:
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = v21;
      v23 = CFSTR("Middle right %@ handle");
      goto LABEL_27;
    case 7uLL:
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = v21;
      v23 = CFSTR("Lower left %@ handle");
      goto LABEL_27;
    case 8uLL:
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = v21;
      v23 = CFSTR("Lower middle %@ handle");
      goto LABEL_27;
    case 9uLL:
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = v21;
      v23 = CFSTR("Lower right %@ handle");
      goto LABEL_27;
    case 0xAuLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Tail handle"), 0, 0));
      v28 = objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility _getTailKnobArrowDescriptionForLine](self, "_getTailKnobArrowDescriptionForLine"));
      goto LABEL_21;
    case 0xBuLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Head handle"), 0, 0));
      v28 = objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility _getHeadKnobArrowDescriptionForLine](self, "_getHeadKnobArrowDescriptionForLine"));
LABEL_21:
      v29 = (void *)v28;
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility _connectionLineConnectionDescription](self, "_connectionLineConnectionDescription"));
      v36 = __CRLAccessibilityStringForVariables(1, v27, v30, v31, v32, v33, v34, v35, (uint64_t)v29);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v36);

      goto LABEL_28;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility getLabelForShapeControlKnob](self, "getLabelForShapeControlKnob"));
      if (v4)
        return (NSString *)v4;
      v54 = 0;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxInfo"));

      v8 = (void *)objc_opt_class(CRLBoardItemAccessibility, v7);
      v9 = __CRLAccessibilityCastAsSafeCategory(v8, (uint64_t)v6, 1, &v54);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (v54)
        goto LABEL_40;
      v11 = (__CFString *)v10;

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
      v14 = objc_opt_class(CRLShapeRep, v13);
      isKindOfClass = objc_opt_isKindOfClass(v12, v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = v16;
      if ((isKindOfClass & 1) != 0)
        v18 = CFSTR("Change %@ handle");
      else
        v18 = CFSTR("Change %@ mask handle");
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v18, 0, 0));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString crlaxTypeDescription](v11, "crlaxTypeDescription"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedLowercaseString"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v3, v20));

      goto LABEL_43;
    case 0x1CuLL:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v24;
      v26 = CFSTR("Link");
      goto LABEL_23;
    default:
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = v21;
      v23 = CFSTR("Handle control");
      goto LABEL_27;
  }
}

- (NSString)crlaxValue
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag");
  if (v3 <= 0x10)
  {
    if (((1 << v3) & 0x3DE) != 0)
    {
LABEL_3:
      v4 = objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility _getAccessibleAbsolutePositionOfKnob](self, "_getAccessibleAbsolutePositionOfKnob"));
      goto LABEL_6;
    }
    if (((1 << v3) & 0x1F000) != 0)
    {
      v4 = objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility _getValueForShapeControlKnob](self, "_getValueForShapeControlKnob"));
      goto LABEL_6;
    }
    if (((1 << v3) & 0xC00) != 0)
    {
      if (!-[CRLCanvasKnobAccessibility crlaxIsConnectionLineEndpointHandleWithConnection](self, "crlaxIsConnectionLineEndpointHandleWithConnection"))goto LABEL_3;
      v4 = objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxConnectionLineMagnetDescription](self, "crlaxConnectionLineMagnetDescription"));
LABEL_6:
      v5 = (void *)v4;
      if (v4)
        return (NSString *)v5;
    }
  }
  if (-[CRLCanvasKnobAccessibility crlaxIs3DReorientationKnob](self, "crlaxIs3DReorientationKnob")
    || -[CRLCanvasKnobAccessibility crlaxIs3DObjectPlayPauseKnob](self, "crlaxIs3DObjectPlayPauseKnob"))
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxSmartPathSourceForShapeControlKnob](self, "crlaxSmartPathSourceForShapeControlKnob"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxTarget](self, "crlaxTarget"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getFeedbackStringForKnob:", objc_msgSend(v7, "tag")));

  }
  return (NSString *)v5;
}

- (NSString)crlaxHint
{
  void *v3;

  if (-[CRLCanvasKnobAccessibility crlaxRespondsToSelector:fromExtrasProtocol:](self, "crlaxRespondsToSelector:fromExtrasProtocol:", "crlaxPlatformSpecificHint", &OBJC_PROTOCOL___CRLCanvasKnobAccessibilityExtras))v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxPlatformSpecificHint](self, "crlaxPlatformSpecificHint"));
  else
    v3 = 0;
  return (NSString *)v3;
}

- (NSArray)crlaxUserInputLabels
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[2];

  switch(-[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag"))
  {
    case 1uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Upper left");
      goto LABEL_17;
    case 2uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Upper middle");
      goto LABEL_17;
    case 3uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Upper right");
      goto LABEL_17;
    case 4uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Middle left");
      goto LABEL_17;
    case 5uLL:
      if (-[CRLCanvasKnobAccessibility crlaxIs3DReorientationKnob](self, "crlaxIs3DReorientationKnob"))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Reorient");
LABEL_17:
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, 0, 0));

        goto LABEL_18;
      }
      if (!-[CRLCanvasKnobAccessibility crlaxIs3DObjectPlayPauseKnob](self, "crlaxIs3DObjectPlayPauseKnob"))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Middle middle");
        goto LABEL_17;
      }
      v3 = objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxNameFor3DObjectPlayPauseKnobState](self, "crlaxNameFor3DObjectPlayPauseKnobState"));
LABEL_3:
      v4 = (void *)v3;
LABEL_18:
      if (!v4)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxLabel](self, "crlaxLabel"));
        v13 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
        goto LABEL_22;
      }
      if (-[CRLCanvasKnobAccessibility crlaxIsConnectionLineCreationKnob](self, "crlaxIsConnectionLineCreationKnob"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%@ connection"), 0, 0));

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v4));
        v15[0] = v10;
        v15[1] = v4;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));

LABEL_22:
        goto LABEL_24;
      }
      v14 = v4;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
LABEL_24:

      return (NSArray *)v11;
    case 6uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Middle right");
      goto LABEL_17;
    case 7uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Lower left");
      goto LABEL_17;
    case 8uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Lower middle");
      goto LABEL_17;
    case 9uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Lower right");
      goto LABEL_17;
    case 0xAuLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Tail");
      goto LABEL_17;
    case 0xBuLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Head");
      goto LABEL_17;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
      v3 = objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility _getUserInputLabelForShapeControlKnob](self, "_getUserInputLabelForShapeControlKnob"));
      goto LABEL_3;
    default:
      v3 = objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxLabel](self, "crlaxLabel"));
      goto LABEL_3;
  }
}

- (NSString)crlaxIdentifier
{
  const __CFString *v3;

  if ((id)-[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag") == (id)5)
  {
    if (-[CRLCanvasKnobAccessibility crlaxIs3DReorientationKnob](self, "crlaxIs3DReorientationKnob"))
    {
      v3 = CFSTR("USDZ reorient");
    }
    else if (-[CRLCanvasKnobAccessibility crlaxIs3DObjectPlayPauseKnob](self, "crlaxIs3DObjectPlayPauseKnob"))
    {
      v3 = CFSTR("USDZ play/pause");
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  if (-[CRLCanvasKnobAccessibility crlaxIsConnectionLineCreationKnob](self, "crlaxIsConnectionLineCreationKnob"))
    return (NSString *)CFSTR("Connection");
  else
    return &v3->isa;
}

- (CALayer)crlaxLayer
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "renderable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));

  return (CALayer *)v4;
}

- (unint64_t)crlaxKnobTag
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "tag");

  return (unint64_t)v3;
}

- (CRLCanvasRepAccessibility)crlaxParentRepForKnob
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rep"));

  v5 = (void *)objc_opt_class(CRLCanvasRepAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLCanvasRepAccessibility *)v8;
}

- (CGPoint)crlaxPosition
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v2, "position");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)crlaxPositionInUnscaledCanvas
{
  CRLCanvasKnobAccessibility *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char v16;
  CGPoint result;

  v16 = 0;
  v2 = self;
  v4 = (objc_class *)objc_opt_class(CRLCanvasKnob, v3);
  v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v2, 1, &v16);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v16)
    abort();
  v7 = (void *)v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](v2, "crlaxParentRepForKnob"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crlaxTarget"));
  objc_msgSend(v7, "position");
  objc_msgSend(v9, "convertKnobPositionToUnscaledCanvas:");
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGSize)crlaxSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "knobImage"));
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)crlaxUseFallbackFrameCalculation
{
  return 0;
}

- (CGRect)crlaxFrame
{
  CGFloat y;
  CGFloat x;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double width;
  double height;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxCanvasView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxLayer](self, "crlaxLayer"));
    if (-[CRLCanvasKnobAccessibility crlaxUseFallbackFrameCalculation](self, "crlaxUseFallbackFrameCalculation") || !v8)
    {
      -[CRLCanvasKnobAccessibility crlaxSize](self, "crlaxSize");
      v17 = v16;
      v19 = v18;
      -[CRLCanvasKnobAccessibility crlaxPosition](self, "crlaxPosition");
      v21 = v20;
      v23 = v22;
      v41.origin.x = CGRectZero.origin.x;
      v41.origin.y = y;
      v41.size.width = v17;
      v41.size.height = v19;
      v24 = v21 - CGRectGetWidth(v41) * 0.5;
      v42.origin.x = CGRectZero.origin.x;
      v42.origin.y = y;
      v42.size.width = v17;
      v42.size.height = v19;
      objc_msgSend(v6, "crlaxConvertNaturalPointToUnscaledCanvas:", v24, v23 - CGRectGetHeight(v42) * 0.5);
      v43.size.width = v17;
      v43.size.height = v19;
      v44 = CGRectInset(v43, -5.0, -5.0);
      v25 = v44.origin.x;
      v26 = v44.origin.y;
      width = v44.size.width;
      height = v44.size.height;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crlaxInteractiveCanvasController"));
      objc_msgSend(v9, "crlaxConvertUnscaledToBoundsRect:", v25, v26, width, height);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxCanvasLayer"));
      objc_msgSend(v8, "bounds");
      objc_msgSend(v8, "convertRect:toLayer:", v9);
    }
    v29 = v10;
    v30 = v11;
    v31 = v12;
    v32 = v13;

    objc_msgSend(v7, "crlaxFrameFromBounds:", v29, v30, v31, v32);
    x = v33;
    y = v34;
    v14 = v35;
    v15 = v36;

  }
  else
  {
    v14 = CGRectZero.size.width;
    v15 = CGRectZero.size.height;
  }

  v37 = x;
  v38 = y;
  v39 = v14;
  v40 = v15;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (unint64_t)crlaxNodeIndex
{
  objc_class *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = (objc_class *)objc_opt_class(CRLPathKnob, a2);
  v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)self, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v5)
    v7 = (unint64_t)objc_msgSend(v5, "nodeIndex");
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (BOOL)crlaxIsConnectionLineEndpointHandleWithConnection
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility _connectionLineConnection](self, "_connectionLineConnection"));
  v3 = v2 != 0;

  return v3;
}

- (id)crlaxCreateKnobTracker
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = -[CRLCanvasKnobAccessibility _crlaxKnobTrackerClass](self, "_crlaxKnobTrackerClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class crlaxKnobTrackerWithRep:knob:](v3, "crlaxKnobTrackerWithRep:knob:", v4, self));

  return v5;
}

- (void)crlaxMoveKnobToRepPositionInNaturalSpace:(CGPoint)a3 shouldSnapToMagnets:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  void *v8;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  objc_class *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  objc_class *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CRLAccessibilityKnobManipulator *v37;
  CRLAccessibilityKnobManipulator *v38;
  id v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  CRLAccessibilityKnobManipulator *v44;
  CRLCanvasKnobAccessibility *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  char v50;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    if (!v8)
    {
      ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Couldn't find parent rep for knob: %@"), v10, v11, v12, v13, v14, (uint64_t)self))goto LABEL_20;
    }
  }
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    if (objc_msgSend(v8, "crlaxInReadOnlyMode"))
    {
      v15 = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(v15, 0, (uint64_t)CFSTR("Should not attempt to move a knob in read-only mode."), v16, v17, v18, v19, v20, v41))goto LABEL_20;
    }
  }
  if (!v8 || (objc_msgSend(v8, "crlaxIsLocked") & 1) != 0)
    goto LABEL_19;
  v50 = 0;
  v21 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxCreateKnobTracker](self, "crlaxCreateKnobTracker"));
  v23 = (objc_class *)objc_opt_class(CRLResizeKnobTracker, v22);
  v24 = __CRLAccessibilityCastAsClass(v23, (uint64_t)v21, 1, &v50);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (v50)
    goto LABEL_20;
  v26 = (void *)v25;

  if (v26)
  {
    objc_msgSend(v26, "setSnapEnabled:", objc_msgSend(v26, "isEnqueueingCommandsInRealTime") ^ 1);
    goto LABEL_14;
  }
  v50 = 0;
  v27 = v21;
  v29 = (objc_class *)objc_opt_class(CRLConnectionLineKnobTracker, v28);
  v30 = __CRLAccessibilityCastAsClass(v29, (uint64_t)v27, 1, &v50);
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (v50)
LABEL_20:
    abort();
  v32 = (void *)v31;

  objc_msgSend(v32, "setSnapEnabled:", 0);
  objc_msgSend(v32, "setShouldSnapToMagnets:", v4);

LABEL_14:
  objc_msgSend(v8, "crlaxConvertNaturalPointToUnscaledCanvas:", x, y);
  -[CRLCanvasKnobAccessibility _crlaxSnappedValueIfApplicableFromUnscaledCanvasPosition:](self, "_crlaxSnappedValueIfApplicableFromUnscaledCanvasPosition:");
  v34 = v33;
  v36 = v35;
  v37 = objc_alloc_init(CRLAccessibilityKnobManipulator);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100095260;
  v42[3] = &unk_101232998;
  v43 = v8;
  v49 = v26 != 0;
  v38 = v37;
  v44 = v38;
  v45 = self;
  v47 = v34;
  v48 = v36;
  v39 = v21;
  v46 = v39;
  v40 = objc_retainBlock(v42);
  if (-[CRLCanvasKnobAccessibility crlaxRespondsToSelector:fromExtrasProtocol:](self, "crlaxRespondsToSelector:fromExtrasProtocol:", "crlaxAllowsHUDWhileResizing", &OBJC_PROTOCOL___CRLCanvasKnobAccessibilityExtras)&& -[CRLCanvasKnobAccessibility crlaxAllowsHUDWhileResizing](self, "crlaxAllowsHUDWhileResizing"))
  {
    ((void (*)(_QWORD *))v40[2])(v40);
  }
  else
  {
    objc_msgSend(v39, "crlaxPerformBlockWhilePreventingDisplayOfCurrentValueHUD:", v40);
  }

LABEL_19:
}

- (void)crlaxMoveKnobToRepPositionInNaturalSpace:(CGPoint)a3
{
  -[CRLCanvasKnobAccessibility crlaxMoveKnobToRepPositionInNaturalSpace:shouldSnapToMagnets:](self, "crlaxMoveKnobToRepPositionInNaturalSpace:shouldSnapToMagnets:", 0, a3.x, a3.y);
}

- (id)crlaxSmartPathSourceForShapeControlKnob
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxInfo"));

  if ((objc_opt_respondsToSelector(v3, "pathSource") & 1) != 0)
  {
    v11 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathSource"));
    v6 = (objc_class *)objc_opt_class(CRLPathSource, v5);
    v7 = __CRLAccessibilityCastAsClassAndProtocol(v6, (Protocol *)&OBJC_PROTOCOL___CRLSmartPathSource, v4, 1, &v11);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (v11)
      abort();
    v9 = (void *)v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)crlaxEverOffersCustomActionsForMovement
{
  unint64_t v3;
  void *v4;
  unsigned __int8 isKindOfClass;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag");
  if (v3 - 12 >= 5)
  {
    if (v3 - 10 > 1)
    {
      isKindOfClass = 0;
      return isKindOfClass & 1;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxTarget"));
    v8 = objc_opt_class(CRLConnectionLineRep, v7);
    isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxSmartPathSourceForShapeControlKnob](self, "crlaxSmartPathSourceForShapeControlKnob"));
    isKindOfClass = objc_msgSend(v4, "crlaxOffersMoveActionsForKnobTag:", -[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag"));
  }

  return isKindOfClass & 1;
}

- (BOOL)crlaxOffersCustomActionsForMovement
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  if ((objc_msgSend(v3, "crlaxInReadOnlyMode") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
    if ((objc_msgSend(v5, "crlaxIsLocked") & 1) != 0)
      v4 = 0;
    else
      v4 = -[CRLCanvasKnobAccessibility crlaxEverOffersCustomActionsForMovement](self, "crlaxEverOffersCustomActionsForMovement");

  }
  return v4;
}

- (BOOL)crlaxAdjustmentResizesShape
{
  return (char *)-[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag") - 1 < (char *)0xB;
}

- (BOOL)crlaxIsShapeControlKnob
{
  return (char *)-[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag") - 12 < (char *)5;
}

- (BOOL)crlaxIsConnectionLineCreationKnob
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = objc_opt_class(_TtC8Freeform21CRLConnectionLineKnob, v3);
  isKindOfClass = objc_opt_isKindOfClass(v2, v4);

  return isKindOfClass & 1;
}

- (BOOL)crlaxIsConnectionLineEndpointKnob
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  v5 = objc_opt_class(CRLConnectionLineRep, v4);
  v6 = (objc_opt_isKindOfClass(v3, v5) & 1) != 0
    && ((id)-[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag") == (id)10
     || (id)-[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag") == (id)11);

  return v6;
}

- (BOOL)crlaxIs3DReorientationKnob
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = objc_opt_class(_TtC8Freeform19CRLUSDZRotationKnob, v3);
  isKindOfClass = objc_opt_isKindOfClass(v2, v4);

  return isKindOfClass & 1;
}

- (BOOL)crlaxIs3DObjectPlayPauseKnob
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = objc_opt_class(_TtC8Freeform20CRLUSDZPlayPauseKnob, v3);
  isKindOfClass = objc_opt_isKindOfClass(v2, v4);

  return isKindOfClass & 1;
}

- (unint64_t)crlaxConnectionMagnetType
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  id v12;
  unint64_t v13;
  char v15;

  v15 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxLayout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxTarget"));

  v7 = (objc_class *)objc_opt_class(CRLConnectionLineAbstractLayout, v6);
  v8 = __CRLAccessibilityCastAsClass(v7, (uint64_t)v5, 1, &v15);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (v15)
    abort();
  v10 = (void *)v9;

  v11 = -[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag");
  if (v11 == 11)
  {
    v12 = objc_msgSend(v10, "headMagnetType");
  }
  else
  {
    if (v11 != 10)
    {
      v13 = 0;
      goto LABEL_8;
    }
    v12 = objc_msgSend(v10, "tailMagnetType");
  }
  v13 = (unint64_t)v12;
LABEL_8:

  return v13;
}

- (id)crlaxUnscaledCanvasPointForSnappingKnobToConnectionMagnetType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility _connectionLineConnection](self, "_connectionLineConnection"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "getCardinalPositionFromType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)crlaxCanSnapKnobToConnectionMagnetAtUnscaledCanvasPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  objc_class *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  BOOL v33;
  uint64_t v34;
  void *i;
  void *v36;
  uint64_t v37;
  void *v38;
  BOOL v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  BOOL v50;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char v59;
  _BYTE v60[128];
  CGPoint v61;
  CGPoint v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  y = a3.y;
  x = a3.x;
  v59 = 0;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility _connectionLineConnection](self, "_connectionLineConnection"));
  v8 = (objc_class *)objc_opt_class(CRLGroupLayout, v7);
  v9 = __CRLAccessibilityCastAsClass(v8, (uint64_t)v6, 1, &v59);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (v59)
    goto LABEL_31;
  v11 = (void *)v10;

  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "children"));
  if (v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crlaxInteractiveCanvasController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxTarget"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvas"));
    objc_msgSend(v15, "visibleUnscaledRectForClippingReps");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v63.origin.x = v17;
    v63.origin.y = v19;
    v63.size.width = v21;
    v63.size.height = v23;
    v61.x = x;
    v61.y = y;
    if (!CGRectContainsPoint(v63, v61))
    {
      v50 = 0;
LABEL_29:

      goto LABEL_30;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvas"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allRepsOrdered"));

    v59 = 0;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
    v28 = (objc_class *)objc_opt_class(CRLConnectionLineRep, v27);
    v29 = __CRLAccessibilityCastAsClass(v28, (uint64_t)v26, 1, &v59);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if (!v59)
    {

      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v30 = v25;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      if (v31)
      {
        v32 = v31;
        v52 = v14;
        v33 = 0;
        v34 = *(_QWORD *)v56;
        while (2)
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(_QWORD *)v56 != v34)
              objc_enumerationMutation(v30);
            v36 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
            v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "layout", v52));
            v38 = (void *)v37;
            if ((id)v37 == v6)
            {
              v33 = 1;
            }
            else
            {
              v39 = !v33;
              v33 = v37 == (_QWORD)v6;
              if (!v39)
              {
                v59 = 0;
                v40 = v36;
                v42 = (void *)objc_opt_class(CRLCanvasRepAccessibility, v41);
                v43 = __CRLAccessibilityCastAsSafeCategory(v42, (uint64_t)v40, 1, &v59);
                v44 = objc_claimAutoreleasedReturnValue(v43);
                if (v59)
                  goto LABEL_31;
                v45 = (void *)v44;

                v47 = objc_opt_class(CRLGroupRep, v46);
                if ((objc_opt_isKindOfClass(v40, v47) & 1) == 0
                  && (objc_msgSend(v45, "crlaxIsContainedTextRep") & 1) == 0)
                {
                  if (objc_msgSend(v54, "canConnectToRep:", v40))
                  {
                    if ((objc_msgSend(v53, "containsObject:", v38) & 1) == 0)
                    {
                      -[CRLCanvasKnobAccessibility crlaxConnectionLineMagnetSnapRadius](self, "crlaxConnectionLineMagnetSnapRadius");
                      v49 = v48;
                      objc_msgSend(v45, "crlaxFrameInUnscaledCanvas");
                      v65 = CGRectInset(v64, -v49, -v49);
                      v62.x = x;
                      v62.y = y;
                      if (CGRectContainsPoint(v65, v62))
                      {

                        v50 = 0;
                        goto LABEL_27;
                      }
                    }
                  }
                }

                v33 = 1;
              }
            }

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
          if (v32)
            continue;
          break;
        }
        v50 = 1;
LABEL_27:
        v14 = v52;
      }
      else
      {
        v50 = 1;
      }

      goto LABEL_29;
    }
LABEL_31:
    abort();
  }
  v50 = 1;
LABEL_30:

  return v50;
}

- (double)crlaxCurrentGridSnapDistance
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;

  v3 = 0.0;
  if (+[CRLCanvasGuideController shouldSnapToGrid](CRLCanvasGuideController, "shouldSnapToGrid")
    && !-[CRLCanvasKnobAccessibility crlaxIsConnectionLineEndpointHandleWithConnection](self, "crlaxIsConnectionLineEndpointHandleWithConnection"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxCanvas"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxTarget"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "guideController"));

    if (v8)
    {
      objc_msgSend(v8, "snapDistanceToUseForGuides");
      v3 = v9;
    }

  }
  return v3;
}

- (double)crlaxConnectionLineMagnetSnapRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxCanvas"));
  objc_msgSend(v3, "crlaxViewScale");
  +[CRLConnectionLineKnobTracker crlaxConnectionLineMagnetSnapRadiusForCanvasViewScale:](CRLConnectionLineKnobTracker, "crlaxConnectionLineMagnetSnapRadiusForCanvasViewScale:");
  v5 = v4;

  return v5;
}

- (id)crlaxConnectionKnobMagnetPositionDescription
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  switch(-[CRLCanvasKnobAccessibility crlaxConnectionMagnetType](self, "crlaxConnectionMagnetType"))
  {
    case 0uLL:
    case 7uLL:
      v3 = objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility _getAccessibleAbsolutePositionOfKnob](self, "_getAccessibleAbsolutePositionOfKnob"));
      goto LABEL_11;
    case 1uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("center");
      goto LABEL_9;
    case 2uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("top");
      goto LABEL_9;
    case 3uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("right");
      goto LABEL_9;
    case 4uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("bottom");
      goto LABEL_9;
    case 5uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("left");
LABEL_9:
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, 0, 0));

      break;
    case 6uLL:
      v3 = objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxConnectionLineConnectionCustomEdgeDescription](self, "crlaxConnectionLineConnectionCustomEdgeDescription"));
LABEL_11:
      v4 = (void *)v3;
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

+ (int)crlaxEdgePositionTypeFromNormalizedPosition:(CGPoint)a3
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  int result;
  BOOL v8;
  int v9;
  int v10;

  v3 = a3.y == 0.0;
  if (fabs(a3.y) < 0.05)
    v3 = 1;
  v4 = fabs(a3.y + -1.0) < 0.05 || a3.y == 1.0;
  v5 = a3.x != 0.0;
  if (fabs(a3.x) < 0.05)
    v5 = 0;
  v6 = a3.x != 1.0;
  if (fabs(a3.x + -1.0) < 0.05)
    v6 = 0;
  if (v3 && !v5)
    return 1;
  if (v3 && !v6)
    return 2;
  if (v4 && !v5)
    return 3;
  v8 = v3 || v4;
  if (v3)
    v9 = 5;
  else
    v9 = 6;
  if (v4 && !v6)
    result = 4;
  else
    result = v9;
  if (!v8)
  {
    if (v6)
      v10 = 0;
    else
      v10 = 8;
    if (v5)
      return v10;
    else
      return 7;
  }
  return result;
}

- (Class)_crlaxKnobTrackerClass
{
  uint64_t v3;
  __objc2_class **v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;

  if (-[CRLCanvasKnobAccessibility crlaxIsConnectionLineCreationKnob](self, "crlaxIsConnectionLineCreationKnob"))
  {
    v4 = off_1012299B0;
  }
  else
  {
    v5 = -[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag");
    if (v5 - 12 >= 5)
    {
      if (v5 - 10 > 1)
      {
        v4 = off_101229830;
      }
      else
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
        v8 = objc_opt_class(CRLConnectionLineRep, v7);
        isKindOfClass = objc_opt_isKindOfClass(v6, v8);

        v4 = off_1012299D0;
        if ((isKindOfClass & 1) != 0)
          v4 = off_101229860;
      }
    }
    else
    {
      v4 = off_1012299B8;
    }
  }
  return (Class)(id)objc_opt_class(*v4, v3);
}

- (id)getLabelForShapeControlKnob
{
  void *v3;
  CRLCanvasKnobAccessibility *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  char v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxSmartPathSourceForShapeControlKnob](self, "crlaxSmartPathSourceForShapeControlKnob"));
  v22 = 0;
  v4 = self;
  v6 = (objc_class *)objc_opt_class(CRLCanvasKnob, v5);
  v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v4, 1, &v22);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (v22)
    abort();
  v9 = (void *)v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxLabelComponentForKnobTag:", objc_msgSend(v9, "tag")));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Control knob"), 0, 0));
    v19 = __CRLAccessibilityStringForVariables(1, v10, v13, v14, v15, v16, v17, v18, (uint64_t)v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_getValueForShapeControlKnob
{
  void *v3;
  CRLCanvasKnobAccessibility *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxSmartPathSourceForShapeControlKnob](self, "crlaxSmartPathSourceForShapeControlKnob"));
  v13 = 0;
  v4 = self;
  v6 = (objc_class *)objc_opt_class(CRLCanvasKnob, v5);
  v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v4, 1, &v13);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (v13)
    abort();
  v9 = (void *)v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxValueForKnobTag:", objc_msgSend(v9, "tag")));
  if (!objc_msgSend(v10, "length")
    && -[CRLCanvasKnobAccessibility crlaxEverOffersCustomActionsForMovement](v4, "crlaxEverOffersCustomActionsForMovement"))
  {
    v11 = objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility _getAccessibleAbsolutePositionOfKnob](v4, "_getAccessibleAbsolutePositionOfKnob"));

    v10 = (void *)v11;
  }

  return v10;
}

- (id)_getUserInputLabelForShapeControlKnob
{
  void *v3;
  CRLCanvasKnobAccessibility *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxSmartPathSourceForShapeControlKnob](self, "crlaxSmartPathSourceForShapeControlKnob"));
  v12 = 0;
  v4 = self;
  v6 = (objc_class *)objc_opt_class(CRLCanvasKnob, v5);
  v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v4, 1, &v12);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (v12)
    abort();
  v9 = (void *)v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxUserInputLabelForKnobTag:", objc_msgSend(v9, "tag")));
  return v10;
}

- (id)_getTailKnobArrowDescriptionForLine
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxInfo"));

  v12 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxValueForKey:", CFSTR("tailLineEnd")));
  v6 = (void *)objc_opt_class(CRLLineEndAccessibility, v5);
  v7 = __CRLAccessibilityCastAsSafeCategory(v6, (uint64_t)v4, 1, &v12);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (v12)
    abort();
  v9 = (void *)v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crlaxStyleInfoDescription"));
  return v10;
}

- (id)_getHeadKnobArrowDescriptionForLine
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxInfo"));

  v12 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxValueForKey:", CFSTR("headLineEnd")));
  v6 = (void *)objc_opt_class(CRLLineEndAccessibility, v5);
  v7 = __CRLAccessibilityCastAsSafeCategory(v6, (uint64_t)v4, 1, &v12);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (v12)
    abort();
  v9 = (void *)v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crlaxStyleInfoDescription"));
  return v10;
}

- (id)_getAccessibleAbsolutePositionOfKnob
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  CFArrayRef (__cdecl **v8)(CTFontDescriptorRef, CFSetRef);
  float v9;
  float v10;
  uint64_t v11;
  void *v12;

  -[CRLCanvasKnobAccessibility crlaxPositionInUnscaledCanvas](self, "crlaxPositionInUnscaledCanvas");
  v3 = v2;
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("x: %d, y: %d"), 0, 0));

  v8 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
  v9 = v3;
  LODWORD(v8) = llroundf(v9);
  v10 = v5;
  LODWORD(v11) = llroundf(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v8, v11));

  return v12;
}

- (id)_connectionLineConnection
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  char v15;

  v15 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxLayout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxTarget"));

  v7 = (objc_class *)objc_opt_class(CRLConnectionLineAbstractLayout, v6);
  v8 = __CRLAccessibilityCastAsClass(v7, (uint64_t)v5, 1, &v15);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (v15)
    abort();
  v10 = (void *)v9;

  v11 = -[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag");
  if (v11 == 11)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "connectedTo"));
  }
  else
  {
    if (v11 != 10)
    {
      v13 = 0;
      goto LABEL_8;
    }
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "connectedFrom"));
  }
  v13 = (void *)v12;
LABEL_8:

  return v13;
}

- (id)_connectionLineConnectionDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  char v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility _connectionLineConnection](self, "_connectionLineConnection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxInteractiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxTarget"));

  v22 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForInfo:", v7));

  v10 = (void *)objc_opt_class(CRLCanvasRepAccessibility, v9);
  v11 = __CRLAccessibilityCastAsSafeCategory(v10, (uint64_t)v8, 1, &v22);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (v22)
    abort();
  v13 = (void *)v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxDescriptionForConnections"));
  if (objc_msgSend(v14, "length"))
  {
    v15 = -[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag");
    if (v15 == 11)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = v16;
      v18 = CFSTR("Connected to %@");
      goto LABEL_8;
    }
    if (v15 == 10)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = v16;
      v18 = CFSTR("Connected from %@");
LABEL_8:
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v18, 0, 0));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v14));

      goto LABEL_9;
    }
  }
  v19 = 0;
LABEL_9:

  return v19;
}

- (id)crlaxConnectionLineMagnetDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  NSString *v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Connected at %@"), 0, 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Connected on %@"), 0, 0));

  v7 = -[CRLCanvasKnobAccessibility crlaxConnectionMagnetType](self, "crlaxConnectionMagnetType");
  if (v7 - 2 < 5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxConnectionKnobMagnetPositionDescription](self, "crlaxConnectionKnobMagnetPositionDescription"));
    v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8);
LABEL_8:
    v11 = (void *)objc_claimAutoreleasedReturnValue(v9);

    goto LABEL_9;
  }
  if (v7 < 2)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxConnectionKnobMagnetPositionDescription](self, "crlaxConnectionKnobMagnetPositionDescription"));
LABEL_7:
    v8 = (void *)v10;
    v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v10);
    goto LABEL_8;
  }
  v11 = 0;
  if (v7 == 7)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility _getAccessibleAbsolutePositionOfKnob](self, "_getAccessibleAbsolutePositionOfKnob"));
    goto LABEL_7;
  }
LABEL_9:

  return v11;
}

- (id)crlaxConnectionLineConnectionCustomEdgeDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;

  if ((id)-[CRLCanvasKnobAccessibility crlaxConnectionMagnetType](self, "crlaxConnectionMagnetType") != (id)6)
    return 0;
  v19 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxLayout"));

  v6 = (objc_class *)objc_opt_class(CRLConnectionLineAbstractLayout, v5);
  v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v4, 1, &v19);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (v19)
    abort();
  v9 = (void *)v8;

  if (!v9)
    goto LABEL_19;
  if ((id)-[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag") == (id)11)
    objc_msgSend(v9, "headMagnetNormalizedPosition");
  else
    objc_msgSend(v9, "tailMagnetNormalizedPosition");
  switch(+[CRLCanvasKnobAccessibility crlaxEdgePositionTypeFromNormalizedPosition:](CRLCanvasKnobAccessibility, "crlaxEdgePositionTypeFromNormalizedPosition:"))
  {
    case 1:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = v11;
      v13 = CFSTR("top-left corner");
      break;
    case 2:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = v11;
      v13 = CFSTR("top-right corner");
      break;
    case 3:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = v11;
      v13 = CFSTR("bottom-left corner");
      break;
    case 4:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = v11;
      v13 = CFSTR("bottom-right corner");
      break;
    case 5:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = v11;
      v13 = CFSTR("top edge");
      break;
    case 6:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = v11;
      v13 = CFSTR("bottom edge");
      break;
    case 7:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = v11;
      v13 = CFSTR("left edge");
      break;
    case 8:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = v11;
      v13 = CFSTR("right edge");
      break;
    default:
      goto LABEL_19;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, 0, 0));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("%1$@ at %2$@"), 0, 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility _getAccessibleAbsolutePositionOfKnob](self, "_getAccessibleAbsolutePositionOfKnob"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v14, v17));

  }
  else
  {
LABEL_19:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("edge at %@"), 0, 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility _getAccessibleAbsolutePositionOfKnob](self, "_getAccessibleAbsolutePositionOfKnob"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v16));
  }

  return v18;
}

- (id)crlaxNameFor3DObjectPlayPauseKnobState
{
  CRLCanvasKnobAccessibility *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  char v14;

  v14 = 0;
  v2 = self;
  v4 = (objc_class *)objc_opt_class(_TtC8Freeform20CRLUSDZPlayPauseKnob, v3);
  v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v2, 1, &v14);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v14)
    abort();
  v7 = (void *)v6;

  v8 = objc_msgSend(v7, "isPlaying");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = v9;
  if (v8)
    v11 = CFSTR("Pause");
  else
    v11 = CFSTR("Play");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, 0, 0));

  return v12;
}

- (CGPoint)_crlaxSnappedValueIfApplicableFromUnscaledCanvasPosition:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[CRLCanvasKnobAccessibility crlaxCurrentGridSnapDistance](self, "crlaxCurrentGridSnapDistance");
  if (v5 != 0.0)
  {
    v6 = v5;
    x = sub_1003C65B0(x, v5);
    y = sub_1003C65B0(y, v6);
  }
  v7 = x;
  v8 = y;
  result.y = v8;
  result.x = v7;
  return result;
}

- (BOOL)crlaxIsSupported
{
  unint64_t v3;
  BOOL result;

  v3 = -[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag");
  result = 0;
  if (v3 <= 0x1D)
  {
    if (((1 << v3) & 0x2001FFDE) != 0)
      return 1;
    if (v3 == 5)
    {
      if (!-[CRLCanvasKnobAccessibility crlaxIs3DReorientationKnob](self, "crlaxIs3DReorientationKnob"))
        return -[CRLCanvasKnobAccessibility crlaxIs3DObjectPlayPauseKnob](self, "crlaxIs3DObjectPlayPauseKnob");
      return 1;
    }
  }
  return result;
}

- (id)crlaxPlatformSpecificHint
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char isKindOfClass;
  unsigned int v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  if (objc_msgSend(v3, "crlaxInReadOnlyMode"))
  {

LABEL_4:
    v6 = 0;
    return v6;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  v5 = objc_msgSend(v4, "crlaxIsLocked");

  if ((v5 & 1) != 0)
    goto LABEL_4;
  switch(-[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag"))
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      if (-[CRLCanvasKnobAccessibility crlaxIs3DReorientationKnob](self, "crlaxIs3DReorientationKnob"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = v8;
        v10 = CFSTR("Double tap and hold, then drag to reorient");
      }
      else
      {
        if (-[CRLCanvasKnobAccessibility crlaxIs3DObjectPlayPauseKnob](self, "crlaxIs3DObjectPlayPauseKnob"))
          goto LABEL_4;
LABEL_12:
        if (-[CRLCanvasKnobAccessibility crlaxIsConnectionLineCreationKnob](self, "crlaxIsConnectionLineCreationKnob"))
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxConnectionLineKnobHint](self, "crlaxConnectionLineKnobHint"));
          return v6;
        }
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = v8;
        v10 = CFSTR("Double tap and hold, then drag to resize");
      }
LABEL_20:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, 0, 0));

      break;
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      goto LABEL_12;
    case 0xAuLL:
    case 0xBuLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crlaxTarget"));
      objc_opt_class(CRLConnectionLineRep, v13);
      isKindOfClass = objc_opt_isKindOfClass(v12, v14);

      if ((isKindOfClass & 1) != 0)
      {
        v16 = -[CRLCanvasKnobAccessibility crlaxIsConnectionLineEndpointHandleWithConnection](self, "crlaxIsConnectionLineEndpointHandleWithConnection");
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = v8;
        if (v16)
          v10 = CFSTR("Double tap and hold, then drag to reposition and disconnect");
        else
          v10 = CFSTR("Double tap and hold, then drag to reposition and to connect to other items on the board");
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = v8;
        v10 = CFSTR("Double tap and hold, then drag to reposition");
      }
      goto LABEL_20;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
      if (-[CRLCanvasKnobAccessibility crlaxIsAdjustable](self, "crlaxIsAdjustable"))
        goto LABEL_4;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("Double tap and hold, then drag to change shape");
      goto LABEL_20;
    default:
      goto LABEL_4;
  }
  return v6;
}

- (BOOL)crlaxIsButton
{
  return 0;
}

- (BOOL)crlaxActivateButton
{
  return 0;
}

- (BOOL)crlaxIsAdjustable
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  char v6;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  if (objc_msgSend(v3, "crlaxInReadOnlyMode"))
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
    v5 = objc_msgSend(v4, "crlaxIsLocked");

    if ((v5 & 1) == 0)
    {
      switch(-[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag"))
      {
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
          v8 = -[CRLCanvasKnobAccessibility crlaxIsConnectionLineCreationKnob](self, "crlaxIsConnectionLineCreationKnob");
          goto LABEL_9;
        case 5uLL:
          if (-[CRLCanvasKnobAccessibility crlaxIs3DReorientationKnob](self, "crlaxIs3DReorientationKnob"))
            break;
          v8 = -[CRLCanvasKnobAccessibility crlaxIs3DObjectPlayPauseKnob](self, "crlaxIs3DObjectPlayPauseKnob");
LABEL_9:
          v6 = v8 ^ 1;
          return v6 & 1;
        case 0xAuLL:
        case 0xBuLL:
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crlaxTarget"));
          objc_opt_class(CRLConnectionLineRep, v13);
          v6 = objc_opt_isKindOfClass(v12, v14) ^ 1;

          return v6 & 1;
        case 0xCuLL:
        case 0xDuLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x10uLL:
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxSmartPathSourceForShapeControlKnob](self, "crlaxSmartPathSourceForShapeControlKnob"));
          v10 = objc_msgSend(v9, "crlaxIsAdjustableForKnobTag:", -[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag"));

          return v10;
        default:
          break;
      }
    }
  }
  v6 = 0;
  return v6 & 1;
}

- (CGPoint)crlaxCalculatedNextPositionInRepForAdjustable:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  double x;
  double y;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGPoint result;

  v3 = a3;
  -[CRLCanvasKnobAccessibility crlaxPosition](self, "crlaxPosition");
  v6 = v5;
  v8 = v7;
  v9 = -[CRLCanvasKnobAccessibility crlaxKnobTag](self, "crlaxKnobTag");
  v10 = v9;
  v11 = v9 - 1;
  if (v9 - 1 >= 0xA || (v12 = -1.0, ((0x249u >> v11) & 1) == 0))
  {
    x = 1.0;
    if (((0x149u >> (v9 - 3)) & 1) == 0)
      x = CGPointZero.x;
    if (v9 - 3 >= 9)
      v12 = CGPointZero.x;
    else
      v12 = x;
  }
  y = CGPointZero.y;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "crlaxTarget"));
  objc_msgSend(v16, "boundsForStandardKnobs");
  v18 = v17;
  v20 = v19;

  -[CRLCanvasKnobAccessibility crlaxIncrementDecrementMagnitude](self, "crlaxIncrementDecrementMagnitude");
  v22 = v21;
  v23 = v21;
  if (v18 > 0.0)
  {
    v23 = v21 * (v20 / v18);
    -[CRLCanvasKnobAccessibility crlaxCurrentGridSnapDistance](self, "crlaxCurrentGridSnapDistance");
    if (v24 != 0.0)
      v23 = fmax(v23, v24);
  }
  v25 = 1.0;
  if (v10 - 7 >= 3)
    v26 = y;
  else
    v26 = 1.0;
  if (v11 < 3)
    v26 = -1.0;
  if (!v3)
    v25 = -1.0;
  v27 = v25 * v26 * v23;
  v28 = v6 + v25 * v12 * v22;
  v29 = v8 + v27;
  result.y = v29;
  result.x = v28;
  return result;
}

- (double)crlaxIncrementDecrementMagnitude
{
  double result;

  -[CRLCanvasKnobAccessibility crlaxCurrentGridSnapDistance](self, "crlaxCurrentGridSnapDistance");
  if (result == 0.0)
    return 10.0;
  return result;
}

- (BOOL)crlaxAllowsHUDWhileResizing
{
  return 0;
}

- (id)crlaxConnectionLineKnobHint
{
  NSMutableArray *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  v5 = objc_msgSend(v4, "crlaxHasAvailableRepsForConnecting");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Use the Add Connections rotor to make connections to existing board items."), 0, 0));
    -[NSMutableArray addObject:](v3, "addObject:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Double tap and hold, then drag to insert a new connected shape"), 0, 0));
  v15[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Double tap and hold, then drag to another item on the board to connect the two items"), 0, 0));
  v15[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", CFSTR(", ")));
  return v13;
}

@end
