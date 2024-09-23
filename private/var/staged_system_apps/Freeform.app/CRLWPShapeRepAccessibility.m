@implementation CRLWPShapeRepAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLWPShapeRep");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLShapeRepAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_class(CRLWPShapeRepAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)crlaxIsTextboxRep
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "info"));
  v4 = objc_msgSend(v3, "isAutogrowingTextBox");

  return v4;
}

- (NSString)crlaxLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "info"));

  if (-[CRLWPShapeRepAccessibility crlaxIsTextboxRep](self, "crlaxIsTextboxRep"))
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedName"));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxLocalizedName"));
  v6 = (void *)v5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessibilityDescription"));
  v13 = __CRLAccessibilityStringForVariables(1, 0, v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  return (NSString *)v14;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxLabel](self, "crlaxLabel"));
  v11 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));

  if (objc_msgSend(v6, "isLine"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crlaxLocalizedName"));
    v10 = v7;
    v8 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

    v4 = (void *)v8;
  }

  return v4;
}

- (id)accessibilityCustomContent
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)CRLWPShapeRepAccessibility;
  v3 = -[CRLCanvasRepAccessibility accessibilityCustomContent](&v41, "accessibilityCustomContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxFillColorDescription](self, "crlaxFillColorDescription"));
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Fill color"), 0, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v8, v6));
    objc_msgSend(v5, "addObject:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxStrokeDescription](self, "crlaxStrokeDescription"));
  if (objc_msgSend(v10, "length"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Stroke"), 0, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v12, v10));
    objc_msgSend(v5, "addObject:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "info"));

  if (objc_msgSend(v15, "isLine"))
  {
    v17 = (void *)objc_opt_class(CRLLineEndAccessibility, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tailLineEnd"));
    v19 = __CRLAccessibilityCastAsSafeCategory(v17, (uint64_t)v18, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    if (v20)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "crlaxStyleInfoDescription"));
      if (objc_msgSend(v22, "length"))
      {
        v23 = v6;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Tail line end"), 0, 0));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v25, v22));
        objc_msgSend(v5, "addObject:", v26);

        v6 = v23;
      }

    }
    v27 = (void *)objc_opt_class(CRLLineEndAccessibility, v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "headLineEnd"));
    v29 = __CRLAccessibilityCastAsSafeCategory(v27, (uint64_t)v28, 0, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "crlaxStyleInfoDescription"));
      if (objc_msgSend(v31, "length"))
      {
        v40 = v6;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Head line end"), 0, 0));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v33, v31));
        objc_msgSend(v5, "addObject:", v34);

        v6 = v40;
      }

    }
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility _crlaxDescriptionForVerticalAlignment](self, "_crlaxDescriptionForVerticalAlignment"));
  if (objc_msgSend(v35, "length"))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Vertical text alignment"), 0, 0));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v37, v35));
    objc_msgSend(v5, "addObject:", v38);

  }
  return v5;
}

- (CRLWPShapeItemAccessibility)crlaxInfo
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "info"));

  v5 = (void *)objc_opt_class(CRLWPShapeItemAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLWPShapeItemAccessibility *)v8;
}

- (CRLTextRepAccessibility)crlaxContainedRep
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textRep"));

  v5 = (void *)objc_opt_class(CRLTextRepAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLTextRepAccessibility *)v8;
}

- (BOOL)crlaxIsEditingChildRep
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxContainedRep](self, "crlaxContainedRep"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v5 = objc_msgSend(v4, "isEditingChildRep");

  return v5;
}

- (NSString)crlaxFillColorDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v17;
  char v18;

  v18 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLayout](self, "crlaxLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxTarget"));

  v5 = (objc_class *)objc_opt_class(CRLWPShapeLayout, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v18);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v18
    || (v8 = (void *)v7,
        v3,
        v17 = 0,
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fill")),
        v11 = (void *)objc_opt_class(CRLColorFillAccessibility, v10),
        v12 = __CRLAccessibilityCastAsSafeCategory(v11, (uint64_t)v9, 1, &v17),
        v13 = objc_claimAutoreleasedReturnValue(v12),
        v17))
  {
    abort();
  }
  v14 = (void *)v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "crlaxColorFillNameWithOpacity"));
  return (NSString *)v15;
}

- (NSString)crlaxStrokeDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v18;
  char v19;

  v19 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLayout](self, "crlaxLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxTarget"));

  v5 = (objc_class *)objc_opt_class(CRLWPShapeLayout, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v19);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v19)
    goto LABEL_4;
  v8 = (void *)v7;

  v18 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "styledInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stroke"));

  v12 = (void *)objc_opt_class(CRLStrokeAccessibility, v11);
  v13 = __CRLAccessibilityCastAsSafeCategory(v12, (uint64_t)v10, 1, &v18);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (v18)
LABEL_4:
    abort();
  v15 = (void *)v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "crlaxStrokeFullDescription"));
  return (NSString *)v16;
}

- (NSString)crlaxContainedRepText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containedRep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxString"));

  return (NSString *)v5;
}

- (BOOL)crlaxCanBeginEditingChildRepOnDoubleTap:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005B4EC;
  v6[3] = &unk_101230370;
  v8 = &v9;
  v6[4] = self;
  v3 = a3;
  v7 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();

  v4 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v4;
}

- (void)willBeginEditingContainedInfo:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLWPShapeRepAccessibility;
  -[CRLWPShapeRepAccessibility willBeginEditingContainedInfo:](&v4, "willBeginEditingContainedInfo:", a3);
  if (-[CRLWPShapeRepAccessibility crlaxRespondsToSelector:fromOptionalExtrasProtocol:](self, "crlaxRespondsToSelector:fromOptionalExtrasProtocol:", "crlaxShapeRepWillBeginEditingContainedRep:", &OBJC_PROTOCOL___CRLWPShapeRepAccessibilityExtras))-[CRLWPShapeRepAccessibility crlaxShapeRepWillBeginEditingContainedRep:](self, "crlaxShapeRepWillBeginEditingContainedRep:", self);
}

- (void)crlaxBeginEditingAtEnd
{
  void *v3;
  void *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxContainedRep](self, "crlaxContainedRep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxStorage"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxTarget"));

  v5 = (char *)objc_msgSend(v15, "range");
  v7 = &v5[v6];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crlaxTarget"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionModelTranslator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPathForRange:onStorage:", v7, 0, v15));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crlaxEditorController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxTarget"));
  objc_msgSend(v14, "setSelectionPath:withFlags:", v11, 6);

}

- (id)crlaxSummaryDescription
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = -[CRLWPShapeRepAccessibility crlaxIsTextboxRep](self, "crlaxIsTextboxRep");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Text box: %1$@"), 0, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxContainedRep](self, "crlaxContainedRep"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxSummaryDescription"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%1$@ shape"), 0, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRepAccessibility crlaxShapeInfo](self, "crlaxShapeInfo"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxShapeTypeLabel"));
  }
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8));

  return v10;
}

- (id)crlaxCollaboratorDescription
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLWPShapeRepAccessibility;
  v3 = -[CRLCanvasRepAccessibility crlaxCollaboratorDescription](&v9, "crlaxCollaboratorDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxContainedRep](self, "crlaxContainedRep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxCollaboratorDescriptionDirect"));

  if (objc_msgSend(v6, "length"))
  {
    v7 = v6;

    v4 = v7;
  }

  return v4;
}

- (id)_crlaxDescriptionForVerticalAlignment
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layoutsForChildReps"));

  if (objc_msgSend(v3, "count") == (id)1)
  {
    v12 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v6 = (objc_class *)objc_opt_class(_TtC8Freeform11CRLWPLayout, v5);
    v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v4, 1, &v12);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (v12)
      abort();
    v9 = (void *)v8;

    if (v9)
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString crlwpax_descriptionForVerticalAlignment:](NSString, "crlwpax_descriptionForVerticalAlignment:", objc_msgSend(v9, "verticalAlignment")));
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shapeLayout"));
  v7 = objc_msgSend(v6, "pathIsOpen");
  if (v7)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containedRep"));
    if (!v8)
    {

      return 1;
    }
    v3 = (void *)v8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shapeLayout"));
  v11 = objc_msgSend(v10, "pathIsLineSegment");

  if (v7)
  {

  }
  if ((v11 & 1) != 0)
    return 1;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "containedRep"));

  if (v13)
    return 0;
  v15.receiver = self;
  v15.super_class = (Class)CRLWPShapeRepAccessibility;
  return -[CRLShapeRepAccessibility isAccessibilityElement](&v15, "isAccessibilityElement");
}

- (void)crlaxLoadChildrenIntoCollection:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CRLWPShapeRepAccessibility;
  -[CRLCanvasRepAccessibility crlaxLoadChildrenIntoCollection:](&v6, "crlaxLoadChildrenIntoCollection:", v4);
  v5 = -1;
  do
    ++v5;
  while (v5 < (unint64_t)objc_msgSend(v4, "count"));

}

- (BOOL)crlaxIsIgnored
{
  return 1;
}

- (id)crlaxFocusedElement
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  objc_super v13;
  char v14;

  v14 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("containedRep")));
  v5 = (void *)objc_opt_class(CRLTextRepAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v14);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v14)
    abort();
  v8 = (void *)v7;

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLWPShapeRepAccessibility;
    v10 = -[CRLCanvasRepAccessibility crlaxFocusedElement](&v13, "crlaxFocusedElement");
    v9 = (id)objc_claimAutoreleasedReturnValue(v10);
  }
  v11 = v9;

  return v11;
}

- (BOOL)crlaxShouldCreateKnobs
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textRep"));

  return v3 == 0;
}

- (BOOL)crlaxNeedsFormatEditOperation
{
  void *v3;
  unsigned int v4;

  if (-[CRLCanvasRepAccessibility crlaxIsSelected](self, "crlaxIsSelected")
    || -[CRLCanvasRepAccessibility crlaxIsSelectedIgnoringLocking](self, "crlaxIsSelectedIgnoringLocking"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
    if ((objc_msgSend(v3, "isEditingChildRep") & 1) != 0)
      LOBYTE(v4) = 0;
    else
      v4 = !-[CRLCanvasRepAccessibility crlaxIsInDrawingMode](self, "crlaxIsInDrawingMode");

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)crlaxDescriptionForConnections
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility accessibilityLabel](self, "accessibilityLabel"));
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRepAccessibility crlaxContainedRepText](self, "crlaxContainedRepText"));
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v3, "addObject:", v5);
  if (objc_msgSend(v3, "count"))
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  else
    v6 = 0;

  return v6;
}

- (void)crlaxShapeRepWillBeginEditingContainedRep:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxCanvasViewController"));
  objc_msgSend(v3, "crlaxCancelEyeDropperMode");

}

- (id)accessibilityCustomActions
{
  id v2;
  void *v3;
  id v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLWPShapeRepAccessibility;
  v2 = -[CRLCanvasRepAccessibility accessibilityCustomActions](&v7, "accessibilityCustomActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "mutableCopy");

  v5 = objc_msgSend(v4, "copy");
  return v5;
}

@end
