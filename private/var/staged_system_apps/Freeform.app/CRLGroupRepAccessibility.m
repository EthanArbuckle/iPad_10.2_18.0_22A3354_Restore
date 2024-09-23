@implementation CRLGroupRepAccessibility

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)crlaxSupportsPublicCustomRotors
{
  return 1;
}

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLGroupRep");
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
  objc_opt_class(CRLGroupRepAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)accessibilityIsIgnored
{
  return 0;
}

- (NSArray)crlaxChildReps
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "childReps"));

  return (NSArray *)v3;
}

- (id)crlaxLabel
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v16;

  v16 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "info"));

  objc_opt_class(_TtC8Freeform12CRLBoardItem, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v16);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v16)
    abort();
  v8 = (void *)v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessibilityDescription"));
  v10 = objc_msgSend(v9, "length");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = v11;
  if (v10)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("%@, group"), 0, 0));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v9));
    v12 = (void *)v13;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Group"), 0, 0));
  }

  return v14;
}

- (BOOL)crlaxAllowedToEditChildren
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100268C68;
  v4[3] = &unk_10122C5F0;
  v4[4] = self;
  v4[5] = &v5;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (CRLGroupItemAccessibility)crlaxInfoAccessibility
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "info"));

  objc_opt_class(CRLGroupItemAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLGroupItemAccessibility *)v8;
}

- (id)childRepsForHitTesting
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLGroupRepAccessibility;
  v3 = -[CRLGroupRepAccessibility childRepsForHitTesting](&v8, "childRepsForHitTesting");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility sharedInstance](CRLAccessibility, "sharedInstance"));
  if (!objc_msgSend(v5, "needsAccessibilityElements"))
    goto LABEL_4;
  v6 = -[CRLGroupRepAccessibility crlaxAllowedToEditChildren](self, "crlaxAllowedToEditChildren");

  if ((v6 & 1) == 0)
  {
    v5 = v4;
    v4 = 0;
LABEL_4:

  }
  return v4;
}

@end
