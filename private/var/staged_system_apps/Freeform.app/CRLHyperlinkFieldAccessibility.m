@implementation CRLHyperlinkFieldAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLWPHyperlinkField");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLWPSmartFieldAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_class(CRLHyperlinkFieldAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (NSString)crlaxLinkTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLHyperlinkFieldAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayText"));

  return (NSString *)v3;
}

- (NSURL)crlaxLinkURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLHyperlinkFieldAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "url"));

  return (NSURL *)v3;
}

- (BOOL)_axShouldTreatAsCustomItemForTextElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100455170;
  v18 = sub_100455180;
  v19 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSmartFieldAccessibility crlaxParentTextRep](self, "crlaxParentTextRep"));
  v5 = -[CRLWPSmartFieldAccessibility crlaxFieldRange](self, "crlaxFieldRange");
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    if (v4)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100455188;
      v9[3] = &unk_1012348A0;
      v11 = &v14;
      v10 = v3;
      v12 = v5;
      v13 = v6;
      if (__CRLAccessibilityPerformSafeBlock((uint64_t)v9))
        abort();

    }
  }
  v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v7;
}

- (id)accessibilityValue
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLHyperlinkFieldAccessibility;
  return UIAccessibilityTraitLink | -[CRLHyperlinkFieldAccessibility accessibilityTraits](&v3, "accessibilityTraits");
}

- (CGRect)accessibilityFrame
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void **v37;
  uint64_t v38;
  id (*v39)(uint64_t);
  void *v40;
  id v41;
  uint64_t *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  double *v46;
  uint64_t v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  CGRect result;

  LOBYTE(v45) = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSmartFieldAccessibility crlaxParentTextRep](self, "crlaxParentTextRep"));
  objc_opt_class(CRLTextRepAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v45);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if ((_BYTE)v45)
    goto LABEL_8;
  v8 = (void *)v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crlaxInteractiveCanvasController"));
  LOBYTE(v45) = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crlaxCanvasView"));
  objc_opt_class(UIView, v11);
  v13 = __CRLAccessibilityCastAsClass(v12, (uint64_t)v10, 1, &v45);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if ((_BYTE)v45)
LABEL_8:
    abort();
  v15 = (void *)v14;
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;

  v20 = -[CRLHyperlinkFieldAccessibility crlaxRangeValueForKey:](self, "crlaxRangeValueForKey:", CFSTR("range"));
  if (v20 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = v21;
    if (v21)
    {
      v23 = v20;
      v45 = 0;
      v46 = (double *)&v45;
      v47 = 0x4010000000;
      v48 = &unk_1010E66AB;
      v49 = 0u;
      v50 = 0u;
      v37 = _NSConcreteStackBlock;
      v38 = 3221225472;
      v39 = sub_100455428;
      v40 = &unk_1012348A0;
      v42 = &v45;
      v24 = v8;
      v41 = v24;
      v43 = v23;
      v44 = v22;
      if (__CRLAccessibilityPerformSafeBlock((uint64_t)&v37))
        abort();

      v25 = v46[4];
      v26 = v46[5];
      v27 = v46[6];
      v28 = v46[7];
      _Block_object_dispose(&v45, 8);
      objc_msgSend(v24, "crlaxConvertNaturalRectToUnscaledCanvas:", v25, v26, v27, v28, v37, v38, v39, v40);
      objc_msgSend(v9, "crlaxConvertUnscaledToBoundsRect:");
      objc_msgSend(v15, "crlaxFrameFromBounds:");
      x = v29;
      y = v30;
      width = v31;
      height = v32;
    }
  }

  v33 = x;
  v34 = y;
  v35 = width;
  v36 = height;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

@end
