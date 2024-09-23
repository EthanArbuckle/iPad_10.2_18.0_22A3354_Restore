@implementation CRLGradientFillAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLGradientFill");
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
  v5 = (void *)objc_opt_class(CRLGradientFillAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (NSString)crlaxGradientTypeDescription
{
  unint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[CRLGradientFillAccessibility _crlaxGradientType](self, "_crlaxGradientType");
  if (v2 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Radial gradient");
  }
  else
  {
    if (v2)
    {
      v6 = 0;
      return (NSString *)v6;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Linear gradient");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0));

  return (NSString *)v6;
}

- (NSArray)crlaxApproximateColorStopNames
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillAccessibility _crlaxGradientStops](self, "_crlaxGradientStops"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v8);
        v19 = 0;
        v10 = v9;
        v12 = (void *)objc_opt_class(CRLGradientFillStopAccessibility, v11);
        v13 = __CRLAccessibilityCastAsSafeCategory(v12, (uint64_t)v10, 1, &v19);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (v19)
          abort();
        v15 = (void *)v14;

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "crlaxColor"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "crlaxStyleInfoDescription"));

        if (objc_msgSend(v17, "length"))
          objc_msgSend(v3, "addObject:", v17);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSString)crlaxStyleInfoDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("to"), 0, 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillAccessibility crlaxApproximateColorStopNames](self, "crlaxApproximateColorStopNames"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ "), v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillAccessibility crlaxGradientTypeDescription](self, "crlaxGradientTypeDescription"));
  v15 = __CRLAccessibilityStringForVariables(1, v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return (NSString *)v16;
}

- (NSArray)_crlaxGradientStops
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "gradientStops"));

  return (NSArray *)v3;
}

- (unint64_t)_crlaxGradientType
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "gradientType");

  return (unint64_t)v3;
}

@end
