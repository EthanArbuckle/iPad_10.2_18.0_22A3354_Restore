@implementation CRLUIApplicationAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("UIApplication");
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
  v5 = (void *)objc_opt_class(CRLUIApplicationAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v6;
  objc_super v7;

  if ((objc_opt_respondsToSelector(self, "_localizedApplicationName") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIApplicationAccessibility crlaxTarget](self, "crlaxTarget"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_localizedApplicationName"));

    return v4;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLUIApplicationAccessibility;
    v6 = -[CRLUIApplicationAccessibility accessibilityLabel](&v7, "accessibilityLabel");
    return (id)objc_claimAutoreleasedReturnValue(v6);
  }
}

- (id)_crlaxAccessibilityElementFirstForFocus:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility sharedInstance](CRLAccessibility, "sharedInstance"));
  v6 = v5;
  if (!a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_firstElementForUpcomingPageTurn"));

    if (v7)
      goto LABEL_5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility sharedInstance](CRLAccessibility, "sharedInstance"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_firstElementForUpcomingScreenChange"));

  if (!v7)
  {
    v14 = 0;
    goto LABEL_11;
  }
LABEL_5:
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxAncestorView"));
  if (v9
    && (v10 = objc_msgSend(v9, "crlaxViewAncestorOfType:", objc_opt_class(UIWindow, v8)),
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10),
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIApplicationAccessibility crlaxTarget](self, "crlaxTarget")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_accessibilityMainWindow")),
        v13,
        v12,
        v11,
        v11 == v13))
  {
    v14 = v7;
  }
  else
  {
    v14 = 0;
  }

LABEL_11:
  return v14;
}

- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5 parameters:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  id v12;
  objc_super v14;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v10 = a6;
  if (!v8
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIApplicationAccessibility _crlaxAccessibilityElementFirstForFocus:](self, "_crlaxAccessibilityElementFirstForFocus:", v6))) == 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)CRLUIApplicationAccessibility;
    v12 = -[CRLUIApplicationAccessibility _accessibilityElementFirst:last:forFocus:parameters:](&v14, "_accessibilityElementFirst:last:forFocus:parameters:", v8, v7, v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v12);
  }

  return v11;
}

- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5 allowScrolling:(BOOL)a6 traversalOptions:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  void *v13;
  id v14;
  objc_super v16;

  v7 = a6;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = a7;
  if (!v10
    || (v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIApplicationAccessibility _crlaxAccessibilityElementFirstForFocus:](self, "_crlaxAccessibilityElementFirstForFocus:", v8))) == 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)CRLUIApplicationAccessibility;
    v14 = -[CRLUIApplicationAccessibility _accessibilityElementFirst:last:forFocus:allowScrolling:traversalOptions:](&v16, "_accessibilityElementFirst:last:forFocus:allowScrolling:traversalOptions:", v10, v9, v8, v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }

  return v13;
}

- (id)_unswizzledTargetInChainForAction:(SEL)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  char v19;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CRLUIApplicationAccessibility;
  v7 = -[CRLUIApplicationAccessibility _unswizzledTargetInChainForAction:sender:](&v20, "_unswizzledTargetInChainForAction:sender:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v19 = 0;
  v9 = v6;
  v11 = (objc_class *)objc_opt_class(UIButton, v10);
  v12 = __CRLAccessibilityCastAsClass(v11, (uint64_t)v9, 1, &v19);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (v19)
    abort();
  v14 = (void *)v13;

  if (v8)
    v15 = 1;
  else
    v15 = v14 == 0;
  if (!v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstResponder"));

    if (v8)
    {
      do
      {
        if ((objc_msgSend(v8, "canPerformAction:withSender:", a3, v9) & 1) != 0)
          break;
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextResponder"));

        v8 = (void *)v17;
      }
      while (v17);
    }
  }

  return v8;
}

@end
