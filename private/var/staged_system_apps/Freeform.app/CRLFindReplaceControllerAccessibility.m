@implementation CRLFindReplaceControllerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLFindReplaceController");
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
  objc_opt_class(CRLFindReplaceControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)crlaxPrimaryFindResultSearchReference
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFindReplaceControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primaryFindResultSearchReference"));

  return v3;
}

- (CGPoint)crlaxActiveTextFindResultPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFindReplaceControllerAccessibility crlaxPrimaryFindResultSearchReference](self, "crlaxPrimaryFindResultSearchReference"));
  objc_msgSend(v2, "searchReferencePoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CRLWPSelectionAccessibility)crlaxActiveTextFindResultSelection
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  *(_QWORD *)&v3 = objc_opt_class(CRLWPSearchReferenceAccessibility, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFindReplaceControllerAccessibility crlaxPrimaryFindResultSearchReference](self, "crlaxPrimaryFindResultSearchReference", v3));
  v7 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v6, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crlaxSelection"));
  return (CRLWPSelectionAccessibility *)v9;
}

- (void)crlaxDidChangePrimaryFindResultInInteractiveCanvasController:(id)a3 window:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  Class v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSRange v24;
  NSUInteger location;
  NSUInteger v26;
  NSRange v27;
  NSUInteger v28;
  NSRange v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _BOOL4 v34;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSUInteger length;
  _QWORD v43[4];
  id v44;
  id v45;
  char v46;
  NSRange v47;
  NSRange v48;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility sharedInstance](CRLAccessibility, "sharedInstance"));
  v9 = objc_msgSend(v8, "needsAccessibilityAnnouncements");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFindReplaceControllerAccessibility crlaxPrimaryFindResultSearchReference](self, "crlaxPrimaryFindResultSearchReference"));
    v11 = NSClassFromString(CFSTR("CRLWPSearchReference"));
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      v46 = 0;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crlaxValueForKey:", CFSTR("selection")));
      objc_opt_class(CRLWPSelectionAccessibility, v13);
      v15 = __CRLAccessibilityCastAsSafeCategory(v14, (uint64_t)v12, 1, &v46);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (v46)
        goto LABEL_22;
      v17 = (void *)v16;

      v46 = 0;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crlaxValueForKey:", CFSTR("storage")));
      objc_opt_class(CRLWPStorageAccessibility, v19);
      v21 = __CRLAccessibilityCastAsSafeCategory(v20, (uint64_t)v18, 1, &v46);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (v46)
        goto LABEL_22;
      v23 = (id)v22;

      v24.location = (NSUInteger)objc_msgSend(v17, "crlaxRange");
      if (!v24.length)
        goto LABEL_19;
      location = v24.location;
      v26 = v24.length--;
      v47.location = v24.location;
      v47.length = v26;
      v27 = NSUnionRange(v24, v47);
      v48.location = (NSUInteger)objc_msgSend(v23, "crlaxRange");
      v48.length = v28;
      v29 = NSIntersectionRange(v27, v48);
      if (v27.location != v29.location || v27.length != v29.length)
      {
LABEL_19:

        goto LABEL_20;
      }
      length = v27.length;
      v30 = v17;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "crlaxSubstringWithRange:", v27.location, v27.length));

      if (v31)
      {
        v32 = v31;
        v33 = v32;
        v34 = location >= v27.location && v26 + location - v27.location <= (unint64_t)objc_msgSend(v32, "length");
        if (!CRLAccessibilityShouldPerformValidationChecks()
          || v34
          || (ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
              !__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Something is wrong with selectionRange or excerptRange."), v36, v37, v38, v39, v40, v27.length)))
        {
          v41 = v33;
          if (v34
            && -[CRLFindReplaceControllerAccessibility crlaxRespondsToSelector:fromExtrasProtocol:](self, "crlaxRespondsToSelector:fromExtrasProtocol:", "crlaxDecoratedStringForAnnouncement:selectionRange:excerptRange:", &OBJC_PROTOCOL___CRLFindReplaceControllerAccessibilityExtras))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFindReplaceControllerAccessibility crlaxDecoratedStringForAnnouncement:selectionRange:excerptRange:](self, "crlaxDecoratedStringForAnnouncement:selectionRange:excerptRange:", v33, location, v26, v27.location, length));

          }
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_100229D90;
          v43[3] = &unk_10122D3D8;
          v44 = v7;
          v45 = v33;
          v23 = v33;
          CRLAccessibilityPerformBlockOnMainThreadAfterDelay(v43, 0.5);

          v17 = v41;
          goto LABEL_19;
        }
LABEL_22:
        abort();
      }
    }
LABEL_20:

  }
}

- (id)crlaxDecoratedStringForAnnouncement:(id)a3 selectionRange:(_NSRange)a4 excerptRange:(_NSRange)a5
{
  NSUInteger location;
  NSUInteger length;
  NSUInteger v7;
  id v8;
  id v9;
  void *v10;

  location = a5.location;
  length = a4.length;
  v7 = a4.location;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  objc_msgSend(v9, "addAttribute:value:range:", CFSTR("UIAccessibilityTokenLowPitch"), v10, v7 - location, length);

  return v9;
}

@end
