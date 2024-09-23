@implementation TSWPHyperlinkFieldAccessibility

- (BOOL)_axShouldTreatAsCustomItemForTextElement
{
  return 1;
}

- (id)accessibilityLabel
{
  TSWPRepAccessibility *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_23CE6C;
  v13 = sub_23CE7C;
  v14 = 0;
  v3 = -[TSWPSmartFieldAccessibility tsaxParentTextRep](self, "tsaxParentTextRep");
  v4 = -[TSWPSmartFieldAccessibility tsaxFieldRange](self, "tsaxFieldRange");
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_23CE88;
      v8[3] = &unk_43B930;
      v8[4] = v3;
      v8[5] = &v9;
      v8[6] = v4;
      v8[7] = v5;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v8))
        abort();
    }
  }
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)accessibilityValue
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPHyperlinkFieldAccessibility;
  return UIAccessibilityTraitLink | -[TSWPHyperlinkFieldAccessibility accessibilityTraits](&v3, "accessibilityTraits");
}

- (CGRect)accessibilityFrame
{
  void *v3;
  Class v4;
  Class v5;
  id v6;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v14;
  uint64_t v15;
  double v16;
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
  _QWORD v28[8];
  uint64_t v29;
  double *v30;
  uint64_t v31;
  const char *v32;
  __int128 v33;
  __int128 v34;
  CGRect result;

  LOBYTE(v29) = 0;
  v3 = (void *)objc_opt_class(TSWPRepAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSWPSmartFieldAccessibility tsaxParentTextRep](self, "tsaxParentTextRep"), 1, &v29);
  if ((_BYTE)v29
    || (v5 = v4,
        v6 = -[objc_class tsaxInteractiveCanvasController](v4, "tsaxInteractiveCanvasController"),
        LOBYTE(v29) = 0,
        v7 = (objc_class *)objc_opt_class(UIView),
        v8 = __TSAccessibilityCastAsClass(v7, (uint64_t)objc_msgSend(v6, "tsaxCanvasView"), 1, &v29),
        (_BYTE)v29))
  {
    abort();
  }
  v9 = (void *)v8;
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v14 = -[TSWPHyperlinkFieldAccessibility tsaxRangeValueForKey:](self, "tsaxRangeValueForKey:", CFSTR("range"));
  if (v14 != (id)0x7FFFFFFFFFFFFFFFLL && v15)
  {
    v29 = 0;
    v30 = (double *)&v29;
    v31 = 0x4010000000;
    v32 = "";
    v33 = 0u;
    v34 = 0u;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_23D0E8;
    v28[3] = &unk_43B930;
    v28[4] = v5;
    v28[5] = &v29;
    v28[6] = v14;
    v28[7] = v15;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v28))
      abort();
    v16 = v30[4];
    v17 = v30[5];
    v18 = v30[6];
    v19 = v30[7];
    _Block_object_dispose(&v29, 8);
    -[objc_class tsaxConvertNaturalRectToUnscaledCanvas:](v5, "tsaxConvertNaturalRectToUnscaledCanvas:", v16, v17, v18, v19);
    objc_msgSend(v6, "tsaxConvertUnscaledToBoundsRect:");
    objc_msgSend(v9, "tsaxFrameFromBounds:");
    x = v20;
    y = v21;
    width = v22;
    height = v23;
  }
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPHyperlinkField");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSWPSmartFieldAccessibility, a2);
}

- (NSString)tsaxLinkTitle
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSWPHyperlinkFieldAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("displayText")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (NSURL)tsaxLinkURL
{
  objc_class *v3;
  NSURL *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSURL);
  result = (NSURL *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSWPHyperlinkFieldAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("url")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
