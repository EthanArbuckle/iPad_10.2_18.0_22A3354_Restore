@implementation CRLConnectionLineRepAccessibility

- (BOOL)isAccessibilityElement
{
  return !-[CRLShapeRepAccessibility crlaxIsIgnored](self, "crlaxIsIgnored");
}

- (id)crlaxCustomNavigationActionWithName:(id)a3 inCategory:(id)a4 handlerBody:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc((Class)UIAccessibilityCustomAction);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008AE08;
  v14[3] = &unk_101232570;
  v15 = v7;
  v11 = v7;
  v12 = objc_msgSend(v10, "initWithName:actionHandler:", v9, v14);

  objc_msgSend(v12, "setLocalizedActionRotorCategory:", v8);
  return v12;
}

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLConnectionLineRep");
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
  objc_opt_class(CRLConnectionLineRepAccessibility, v4);
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
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  char v61;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shapeInfo"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedName"));
  v61 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathSource"));
  objc_opt_class(CRLConnectionLinePathSource, v7);
  v9 = __CRLAccessibilityCastAsClass(v8, (uint64_t)v6, 1, &v61);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (v61
    || (v11 = (void *)v10,
        v6,
        v60 = 0,
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility crlaxTarget](self, "crlaxTarget")),
        objc_opt_class(CRLConnectionLineRep, v13),
        v15 = __CRLAccessibilityCastAsClass(v14, (uint64_t)v12, 1, &v60),
        v16 = objc_claimAutoreleasedReturnValue(v15),
        v60))
  {
    abort();
  }
  v17 = (void *)v16;

  v18 = 0;
  if (v11 && v17)
  {
    v19 = objc_msgSend(v11, "type");
    if (v19 == (id)1)
    {
      v20 = v17;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = v22;
      v24 = CFSTR("angled");
    }
    else
    {
      if (v19)
      {
        v18 = 0;
        goto LABEL_13;
      }
      v20 = v17;
      v21 = objc_msgSend(v17, "crlaxIsStraightLine");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = v22;
      if ((v21 & 1) != 0)
        v24 = CFSTR("straight");
      else
        v24 = CFSTR("curved");
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", v24, 0, 0));

    v17 = v20;
  }
LABEL_13:
  if (objc_msgSend(v4, "isLine"))
  {
    v58 = v17;
    v59 = v5;
    *(_QWORD *)&v26 = objc_opt_class(CRLLineEndAccessibility, v25).n128_u64[0];
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headLineEnd", v26));
    v30 = __CRLAccessibilityCastAsSafeCategory(v28, (uint64_t)v29, 0, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

    *(_QWORD *)&v33 = objc_opt_class(CRLLineEndAccessibility, v32).n128_u64[0];
    v35 = v34;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tailLineEnd", v33));
    v37 = __CRLAccessibilityCastAsSafeCategory(v35, (uint64_t)v36, 0, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

    if (v38 && (objc_msgSend(v38, "crlaxIsTypeNone") & 1) == 0)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("Start: %@"), 0, 0));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "crlaxStyleInfoDescription"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v42, v43));

      if (!v31)
        goto LABEL_21;
    }
    else
    {
      v39 = 0;
      if (!v31)
        goto LABEL_21;
    }
    if ((objc_msgSend(v31, "crlaxIsTypeNone") & 1) == 0)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("End: %@"), 0, 0));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "crlaxStyleInfoDescription"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v44, v45));

      goto LABEL_23;
    }
LABEL_21:
    v40 = 0;
LABEL_23:

    v17 = v58;
    v5 = v59;
    goto LABEL_24;
  }
  v39 = 0;
  v40 = 0;
LABEL_24:
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessibilityDescription"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility crlaxConnectionDescription](self, "crlaxConnectionDescription"));
  v54 = __CRLAccessibilityStringForVariables(1, v5, v48, v49, v50, v51, v52, v53, (uint64_t)v47);
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);

  return v55;
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shapeInfo"));

  if (objc_msgSend(v3, "isLine"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxLocalizedName"));
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  }
  else
  {
    v5 = &__NSArray0__struct;
  }

  return v5;
}

- (id)crlaxInboundConnectedReps
{
  return &__NSArray0__struct;
}

- (id)crlaxOutboundConnectedReps
{
  return &__NSArray0__struct;
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  _BYTE v54[128];

  v52.receiver = self;
  v52.super_class = (Class)CRLConnectionLineRepAccessibility;
  v3 = -[CRLCanvasRepAccessibility accessibilityCustomActions](&v52, "accessibilityCustomActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v43 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  if (+[CRLAccessibility isVoiceOverEnabled](CRLAccessibility, "isVoiceOverEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility _crlaxConnectionLineLayout](self, "_crlaxConnectionLineLayout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedTo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedFrom"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Connected Items"), 0, 0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v10, "crl_addNonNilObject:", v6);
    objc_msgSend(v10, "crl_addNonNilObject:", v7);
    v40 = v10;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));
    v11 = objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility crlaxDisambiguatedConnectionDescriptionsForSet:](CRLCanvasRepAccessibility, "crlaxDisambiguatedConnectionDescriptionsForSet:"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility _crlaxCustomActionForNavigatingToRepWithLayout:inRotorCategory:disambiguatedDescriptions:](self, "_crlaxCustomActionForNavigatingToRepWithLayout:inRotorCategory:disambiguatedDescriptions:", v6, v9, v11));
    objc_msgSend(v43, "crl_addNonNilObject:", v12);

    v41 = (void *)v9;
    v38 = (void *)v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility _crlaxCustomActionForNavigatingToRepWithLayout:inRotorCategory:disambiguatedDescriptions:](self, "_crlaxCustomActionForNavigatingToRepWithLayout:inRotorCategory:disambiguatedDescriptions:", v7, v9, v11));
    objc_msgSend(v43, "crl_addNonNilObject:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Parallel Connections"), 0, 0));

    if (v6 && v7)
    {
      v35 = v7;
      v37 = v5;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v36 = v6;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connectedLayouts"));
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v49;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v49 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLayout](self, "crlaxLayout"));
            v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "crlaxTarget"));
            if (v21 == (void *)v23)
            {

            }
            else
            {
              v24 = (void *)v23;
              v25 = -[CRLConnectionLineRepAccessibility crlaxIsAParallelConnectionLineOfLayout:](self, "crlaxIsAParallelConnectionLineOfLayout:", v21);

              if (v25)
                objc_msgSend(v42, "addObject:", v21);
            }
            v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
        }
        while (v18);
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v42));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility crlaxDisambiguatedConnectionDescriptionsForSet:](CRLCanvasRepAccessibility, "crlaxDisambiguatedConnectionDescriptionsForSet:", v26));

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v28 = v42;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v45;
        do
        {
          v32 = 0;
          do
          {
            if (*(_QWORD *)v45 != v31)
              objc_enumerationMutation(v28);
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility _crlaxCustomActionForNavigatingToRepWithLayout:inRotorCategory:disambiguatedDescriptions:](self, "_crlaxCustomActionForNavigatingToRepWithLayout:inRotorCategory:disambiguatedDescriptions:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v32), v15, v27));
            objc_msgSend(v43, "crl_addNonNilObject:", v33);

            v32 = (char *)v32 + 1;
          }
          while (v30 != v32);
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        }
        while (v30);
      }

      v6 = v36;
      v5 = v37;
      v7 = v35;
    }

  }
  return v43;
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLConnectionLineRepAccessibility;
  v3 = -[CRLCanvasRepAccessibility accessibilityCustomContent](&v11, "accessibilityCustomContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility _crlaxStrokeDescription](self, "_crlaxStrokeDescription"));
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Stroke"), 0, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v8, v6));
    objc_msgSend(v5, "addObject:", v9);

  }
  return v5;
}

- (id)crlaxDescriptionForLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactiveCanvasController"));

  v15 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForLayout:", v4));
  objc_opt_class(CRLCanvasRepAccessibility, v8);
  v10 = __CRLAccessibilityCastAsSafeCategory(v9, (uint64_t)v7, 1, &v15);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (v15)
    abort();
  v12 = (void *)v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crlaxDescriptionForConnections"));
  return v13;
}

- (BOOL)crlaxIsAParallelConnectionLineOfLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility _crlaxConnectionLineLayout](self, "_crlaxConnectionLineLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedTo"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedFrom"));
  v8 = (void *)v7;
  v9 = 0;
  if (v6 && v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedTo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedTo"));
    if (v10 == v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedFrom"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedFrom"));
      v12 = v13 == v14;

    }
    else
    {
      v12 = 0;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedFrom"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedTo"));
    if (v15 == v16)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedTo"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedFrom"));
      v17 = v18 == v19;

    }
    else
    {
      v17 = 0;
    }

    v9 = v12 || v17;
  }

  return v9;
}

- (id)crlaxConnectionDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility _crlaxConnectionDescriptionForHead:](self, "_crlaxConnectionDescriptionForHead:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility _crlaxConnectionDescriptionForHead:](self, "_crlaxConnectionDescriptionForHead:", 1));
  if (objc_msgSend(v3, "length") && objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Connected from %1$@ to %2$@"), 0, 0));

    v12 = v4;
LABEL_6:
    v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v3, v12);
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Connected from %@"), 0, 0));

    goto LABEL_6;
  }
  if (!objc_msgSend(v4, "length"))
  {
    v9 = 0;
    goto LABEL_8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Connected to %@"), 0, 0));

  v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v4, v12);
LABEL_7:
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

LABEL_8:
  return v9;
}

- (id)_crlaxConnectionLineLayout
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLayout](self, "crlaxLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxTarget"));

  objc_opt_class(CRLConnectionLineAbstractLayout, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return v8;
}

- (id)_crlaxStrokeDescription
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

  objc_opt_class(CRLConnectionLineLayout, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v19);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v19)
    goto LABEL_4;
  v8 = (void *)v7;

  v18 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "styledInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stroke"));

  objc_opt_class(CRLStrokeAccessibility, v11);
  v13 = __CRLAccessibilityCastAsSafeCategory(v12, (uint64_t)v10, 1, &v18);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (v18)
LABEL_4:
    abort();
  v15 = (void *)v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "crlaxStrokeFullDescription"));
  return v16;
}

- (id)_crlaxConnectionDescriptionForHead:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility _crlaxConnectionLineLayout](self, "_crlaxConnectionLineLayout"));
  v6 = v5;
  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedTo"));
    v8 = objc_msgSend(v6, "headMagnetType");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedFrom"));
    v8 = objc_msgSend(v6, "tailMagnetType");
  }
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility crlaxDescriptionForLayout:](self, "crlaxDescriptionForLayout:", v7));
  if (objc_msgSend(v10, "length"))
  {
    switch((unint64_t)v9)
    {
      case 0uLL:
      case 7uLL:
        v11 = v10;
        goto LABEL_15;
      case 1uLL:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = v12;
        v14 = CFSTR("center of %@");
        goto LABEL_13;
      case 2uLL:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = v12;
        v14 = CFSTR("top of %@");
        goto LABEL_13;
      case 3uLL:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = v12;
        v14 = CFSTR("right of %@");
        goto LABEL_13;
      case 4uLL:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = v12;
        v14 = CFSTR("bottom of %@");
        goto LABEL_13;
      case 5uLL:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = v12;
        v14 = CFSTR("left of %@");
LABEL_13:
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, 0, 0));
        v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v10));

        break;
      case 6uLL:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility _crlaxCustomEdgeConnectionFormatStringForHead:](self, "_crlaxCustomEdgeConnectionFormatStringForHead:", v3));
        v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v10));
        break;
      default:
        goto LABEL_7;
    }

  }
  else
  {
LABEL_7:
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (id)_crlaxCustomEdgeConnectionFormatStringForHead:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility _crlaxConnectionLineLayout](self, "_crlaxConnectionLineLayout"));
  v5 = v4;
  if (v4)
  {
    if (v3)
      objc_msgSend(v4, "headMagnetNormalizedPosition");
    else
      objc_msgSend(v4, "tailMagnetNormalizedPosition");
    switch(+[CRLCanvasKnobAccessibility crlaxEdgePositionTypeFromNormalizedPosition:](CRLCanvasKnobAccessibility, "crlaxEdgePositionTypeFromNormalizedPosition:"))
    {
      case 0:
        v6 = CFSTR("edge of %@");
        break;
      case 1:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("top-left corner of %@");
        goto LABEL_16;
      case 2:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("top-right corner of %@");
        goto LABEL_16;
      case 3:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("bottom-left corner of %@");
        goto LABEL_16;
      case 4:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("bottom-right corner of %@");
        goto LABEL_16;
      case 5:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("top edge of %@");
        goto LABEL_16;
      case 6:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("bottom edge of %@");
        goto LABEL_16;
      case 7:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("left edge of %@");
        goto LABEL_16;
      case 8:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("right edge of %@");
LABEL_16:
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, 0, 0));

        break;
      default:
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v6 = 0;
  }

  return v6;
}

- (id)_crlaxCustomActionForNavigatingToRepWithLayout:(id)a3 inRotorCategory:(id)a4 disambiguatedDescriptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  CRLConnectionLineRepAccessibility *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && (objc_opt_respondsToSelector(self, "crlaxCustomNavigationActionWithName:inCategory:handlerBody:") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Go to %@"), 0, 0));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility crlaxBoardItemIDForLayout:](CRLCanvasRepAccessibility, "crlaxBoardItemIDForLayout:", v8));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v14));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1004B0270;
      v19[3] = &unk_10124BBB8;
      v20 = v8;
      v21 = self;
      v16 = objc_retainBlock(v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRepAccessibility crlaxCustomNavigationActionWithName:inCategory:handlerBody:](self, "crlaxCustomNavigationActionWithName:inCategory:handlerBody:", v15, v9, v16));

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
