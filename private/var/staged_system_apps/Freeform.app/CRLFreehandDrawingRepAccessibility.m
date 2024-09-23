@implementation CRLFreehandDrawingRepAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLFreehandDrawingRep");
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
  v5 = (void *)objc_opt_class(CRLFreehandDrawingRepAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)crlaxLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTitleLabel](self, "crlaxTitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepAccessibility _crlaxFreehandDrawingInfo](self, "_crlaxFreehandDrawingInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessibilityDescription"));

  if (-[CRLFreehandDrawingRepAccessibility _crlaxContainsMath](self, "_crlaxContainsMath"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Handwritten math"), 0, 0));

    v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepAccessibility _containedMathematicalText](self, "_containedMathematicalText"));
    if (!v7)
    {
LABEL_8:
      v11 = objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepAccessibility _crlaxFreehandDrawingSummary](self, "_crlaxFreehandDrawingSummary"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Freehand drawing"), 0, 0));

      v8 = (id)v11;
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepAccessibility _containedHandwrittenText](self, "_containedHandwrittenText"));
    if (objc_msgSend(v9, "length"))
    {
      v8 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Handwritten text"), 0, 0));

    }
    else
    {
      v8 = 0;
      v7 = 0;
    }

    if (!v7)
      goto LABEL_8;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCaptionLabel](self, "crlaxCaptionLabel"));
  v19 = __CRLAccessibilityStringForVariables(1, v3, v13, v14, v15, v16, v17, v18, (uint64_t)v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  return v20;
}

- (BOOL)crlaxUsesAccessibilityPath
{
  unsigned __int8 v3;
  void *v4;
  BOOL v5;

  v3 = -[CRLFreehandDrawingRepAccessibility _crlaxContainsMath](self, "_crlaxContainsMath");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepAccessibility _containedHandwrittenText](self, "_containedHandwrittenText"));
  v5 = objc_msgSend(v4, "length") == 0;

  return v5 & ~v3;
}

- (CGRect)accessibilityFrame
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect result;
  CGRect v24;

  v20.receiver = self;
  v20.super_class = (Class)CRLFreehandDrawingRepAccessibility;
  -[CRLCanvasRepAccessibility accessibilityFrame](&v20, "accessibilityFrame");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (-[CRLFreehandDrawingRepAccessibility _crlaxContainsMath](self, "_crlaxContainsMath"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepAccessibility crlaxTarget](self, "crlaxTarget"));
    objc_msgSend(v11, "crlaxAttachedMathResultViewFrame");
    v24.origin.x = v12;
    v24.origin.y = v13;
    v24.size.width = v14;
    v24.size.height = v15;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v22 = CGRectUnion(v21, v24);
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;

  }
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  BOOL v3;
  void *v4;

  if (-[CRLFreehandDrawingRepAccessibility _crlaxContainsMath](self, "_crlaxContainsMath"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepAccessibility _containedHandwrittenText](self, "_containedHandwrittenText"));
  v3 = objc_msgSend(v4, "length") != 0;

  return v3;
}

- (id)_accessibilitySpeakThisString
{
  id v3;
  void *v4;

  if (-[CRLFreehandDrawingRepAccessibility _crlaxContainsMath](self, "_crlaxContainsMath"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepAccessibility _containedMathematicalText](self, "_containedMathematicalText"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepAccessibility _containedHandwrittenText](self, "_containedHandwrittenText"));
    if (objc_msgSend(v4, "length"))
      v3 = v4;
    else
      v3 = 0;

  }
  return v3;
}

- (_TtC8Freeform22CRLFreehandDrawingItem)_crlaxFreehandDrawingInfo
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
  v6 = sub_100221D0C(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (_TtC8Freeform22CRLFreehandDrawingItem *)v7;
}

- (BOOL)_crlaxContainsMath
{
  _BOOL4 v3;
  void *v4;
  unsigned __int8 v5;

  v3 = +[CRLFeatureFlagGroup isMathPaperEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isMathPaperEnabled");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepAccessibility crlaxTarget](self, "crlaxTarget"));
    v5 = objc_msgSend(v4, "crlaxHasAttachedMathResultView");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)_containedMathematicalText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxRecognizedMathDescription"));

  return v3;
}

- (id)_containedHandwrittenText
{
  return &stru_1012A72B0;
}

- (id)_crlaxFreehandDrawingSummary
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v3 = objc_alloc_init((Class)NSMutableSet);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allRepsContainedInGroup"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v9);
        v25 = 0;
        v11 = v10;
        v13 = (objc_class *)objc_opt_class(CRLShapeRep, v12);
        v14 = __CRLAccessibilityCastAsClass(v13, (uint64_t)v11, 1, &v25);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (v25
          || (v16 = (void *)v15,
              v11,
              v25 = 0,
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "shapeInfo")),
              v19 = (objc_class *)objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v18),
              v20 = __CRLAccessibilityCastAsClass(v19, (uint64_t)v17, 1, &v25),
              v21 = objc_claimAutoreleasedReturnValue(v20),
              v25))
        {
          abort();
        }
        v22 = (void *)v21;

        if (v22)
          objc_msgSend(v3, "addObject:", v22);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLFreehandDrawingShapeItem crlaxDescriptionFor:](_TtC8Freeform27CRLFreehandDrawingShapeItem, "crlaxDescriptionFor:", v3));
  return v23;
}

@end
