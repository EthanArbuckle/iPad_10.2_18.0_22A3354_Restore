@implementation TSAFindReplaceControllerAccessibility

- (id)tsaxDecoratedStringForAnnouncement:(id)a3 selectionRange:(_NSRange)a4 excerptRange:(_NSRange)a5
{
  NSUInteger location;
  NSUInteger length;
  NSUInteger v7;
  id v8;

  location = a5.location;
  length = a4.length;
  v7 = a4.location;
  v8 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", a3);
  objc_msgSend(v8, "addAttribute:value:range:", CFSTR("UIAccessibilityTokenLowPitch"), +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), v7 - location, length);
  return v8;
}

+ (id)tsaxTargetClassName
{
  return CFSTR("TSAFindReplaceController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)tsaxActiveFindResult
{
  return -[TSAFindReplaceControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("activeFindResult"));
}

- (TSWPSelectionAccessibility)tsaxActiveTextFindResultSelection
{
  id v2;
  Class v3;
  void *v4;
  TSWPSelectionAccessibility *result;
  char v6;

  v2 = -[TSAFindReplaceControllerAccessibility tsaxActiveFindResult](self, "tsaxActiveFindResult");
  v3 = NSClassFromString(CFSTR("TSWPSearchReference"));
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
    v2 = 0;
  v6 = 0;
  v4 = (void *)objc_opt_class(TSWPSelectionAccessibility);
  result = (TSWPSelectionAccessibility *)__TSAccessibilityCastAsSafeCategory(v4, (uint64_t)objc_msgSend(v2, "tsaxValueForKey:", CFSTR("selection")), 1, &v6);
  if (v6)
    abort();
  return result;
}

- (void)tsaxDidChangeActiveFindResultInInteractiveCanvasController:(id)a3 window:(id)a4
{
  id v7;
  Class v8;
  void *v9;
  Class v10;
  Class v11;
  void *v12;
  Class v13;
  Class v14;
  char *v15;
  NSUInteger v16;
  char *v17;
  NSUInteger v18;
  uint64_t *v19;
  NSRange v20;
  uint64_t v21;
  NSRange v22;
  NSUInteger v23;
  NSRange v24;
  NSUInteger length;
  unint64_t location;
  id v27;
  _BOOL4 v28;
  Class v29;
  NSUInteger v30;
  objc_class *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  unint64_t v36;
  unint64_t v37;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  Class v44;
  _QWORD *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[6];
  _QWORD v54[5];
  _QWORD v55[11];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  NSRange v70;
  NSRange v71;

  if (-[TSAccessibility needsAccessibilityAnnouncements](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "needsAccessibilityAnnouncements"))
  {
    v7 = -[TSAFindReplaceControllerAccessibility tsaxActiveFindResult](self, "tsaxActiveFindResult");
    v8 = NSClassFromString(CFSTR("TSWPSearchReference"));
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      LOBYTE(v56) = 0;
      v9 = (void *)objc_opt_class(TSWPSelectionAccessibility);
      v10 = __TSAccessibilityCastAsSafeCategory(v9, (uint64_t)objc_msgSend(v7, "tsaxValueForKey:", CFSTR("selection")), 1, &v56);
      if ((_BYTE)v56)
        goto LABEL_50;
      v11 = v10;
      LOBYTE(v56) = 0;
      v12 = (void *)objc_opt_class(TSWPStorageAccessibility);
      v13 = __TSAccessibilityCastAsSafeCategory(v12, (uint64_t)objc_msgSend(v7, "tsaxValueForKey:", CFSTR("storage")), 1, &v56);
      if ((_BYTE)v56)
        goto LABEL_50;
      v14 = v13;
      v15 = (char *)-[objc_class tsaxRange](v11, "tsaxRange");
      if (v16)
      {
        v17 = v15;
        v18 = v16;
        v66 = 0;
        v67 = &v66;
        v68 = 0x2020000000;
        v69 = 0x7FFFFFFFFFFFFFFFLL;
        v62 = 0;
        v63 = &v62;
        v64 = 0x2020000000;
        v65 = 0x7FFFFFFFFFFFFFFFLL;
        v56 = 0;
        v57 = &v56;
        v58 = 0x3052000000;
        v59 = sub_243874;
        v60 = sub_243884;
        v61 = 0;
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_243890;
        v55[3] = &unk_43BF40;
        v55[4] = v14;
        v55[5] = a3;
        v55[6] = &v56;
        v55[7] = &v66;
        v55[9] = v15;
        v55[10] = v16;
        v55[8] = &v62;
        if (__TSAccessibilityPerformSafeBlock((uint64_t)v55))
          abort();

        v19 = v67;
        v20.location = v67[3];
        if (v20.location == 0x7FFFFFFFFFFFFFFFLL)
        {
          v67[3] = (uint64_t)v17;
          v20.location = (NSUInteger)v17;
        }
        v21 = v63[3];
        if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v21 = (uint64_t)&v17[v18 - 1];
          v63[3] = v21;
          v20.location = v19[3];
        }
        v20.length = v21 - v20.location;
        v70.location = (NSUInteger)v17;
        v70.length = v18;
        v22 = NSUnionRange(v20, v70);
        v71.location = (NSUInteger)-[objc_class tsaxRange](v14, "tsaxRange");
        v71.length = v23;
        v24 = NSIntersectionRange(v22, v71);
        length = 0;
        location = 0x7FFFFFFFFFFFFFFFLL;
        v27 = 0;
        if (v22.location == v24.location && v22.length == v24.length)
        {
          v27 = -[objc_class tsaxSubstringWithRange:](v14, "tsaxSubstringWithRange:", v22.location, v22.length);
          length = v22.length;
          location = v22.location;
        }
        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v62, 8);
        _Block_object_dispose(&v66, 8);
        if (v27)
          goto LABEL_15;
      }
    }
    else
    {
      v29 = NSClassFromString(CFSTR("TSTSearchReference"));
      if ((objc_opt_isKindOfClass(v7, v29) & 1) == 0)
      {
        v44 = NSClassFromString(CFSTR("TSCHSearchReference"));
        if ((objc_opt_isKindOfClass(v7, v44) & 1) == 0)
          return;
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472;
        v54[2] = sub_243958;
        v54[3] = &unk_426DD0;
        v54[4] = a4;
        v45 = v54;
        goto LABEL_48;
      }
      v17 = (char *)objc_msgSend(v7, "tsaxRangeValueForKey:", CFSTR("range"));
      v18 = v30;
      LOBYTE(v56) = 0;
      v31 = (objc_class *)objc_opt_class(NSString);
      v32 = TSTTableStringForCellAtCellID(objc_msgSend(objc_msgSend(v7, "tsaxValueForKey:", CFSTR("tableInfo")), "tsaxValueForKey:", CFSTR("tableModel")), 0, objc_msgSend(v7, "cellID"));
      v33 = (void *)__TSAccessibilityCastAsClass(v31, v32, 1, &v56);
      if ((_BYTE)v56)
LABEL_50:
        abort();
      v34 = v33;
      v35 = objc_msgSend(v33, "length");
      if (v17 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        if (v18)
        {
          if (v34)
          {
            v36 = (unint64_t)v35;
            if (v35 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              location = (unint64_t)(v17 - 60) & ~((uint64_t)(v17 - 60) >> 63);
              if ((uint64_t)(v17 - 60) >= 0)
                v37 = (unint64_t)&v17[v18 + 60];
              else
                v37 = v18 + 120;
              if (v37 > (unint64_t)v35)
              {
                if ((uint64_t)(v17 - 60) >= 1)
                {
                  if (location - 1 >= v18 + location - (unint64_t)v35 + 119)
                    location = -120 - (v18 - (_QWORD)v35);
                  else
                    location = 0;
                }
                v37 = (unint64_t)v35;
              }
              if (TSAccessibilityShouldPerformValidationChecks())
              {
                if (v37 > v36)
                {
                  ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
                  if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("The excerpt range is invalid!"), v39, v40, v41, v42, v43, v52))goto LABEL_50;
                }
              }
              if (v37 <= v36)
              {
                length = v37 - location;
                v27 = objc_msgSend(v34, "substringWithRange:", location, length);
                if (v27)
                {
LABEL_15:
                  v28 = (unint64_t)v17 >= location && &v17[v18 - location] <= objc_msgSend(v27, "length");
                  if (!TSAccessibilityShouldPerformValidationChecks()
                    || v28
                    || (v46 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
                        !__TSAccessibilityHandleValidationErrorWithDescription(v46, 0, (uint64_t)CFSTR("Something is wrong with selectionRange or excerptRange."), v47, v48, v49, v50, v51, v52)))
                  {
                    if (v28)
                    {
                      if (-[TSAFindReplaceControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxDecoratedStringForAnnouncement:selectionRange:excerptRange:", &OBJC_PROTOCOL___TSAFindReplaceControllerAccessibilityExtras))v27 = -[TSAFindReplaceControllerAccessibility tsaxDecoratedStringForAnnouncement:selectionRange:excerptRange:](self, "tsaxDecoratedStringForAnnouncement:selectionRange:excerptRange:", v27, v17, v18, location, length);
                    }
                    v53[0] = _NSConcreteStackBlock;
                    v53[1] = 3221225472;
                    v53[2] = sub_243988;
                    v53[3] = &unk_426E28;
                    v53[4] = a4;
                    v53[5] = v27;
                    v45 = v53;
LABEL_48:
                    TSAccessibilityPerformBlockOnMainThreadAfterDelay(v45, 0.5);
                    return;
                  }
                  goto LABEL_50;
                }
              }
            }
          }
        }
      }
    }
  }
}

@end
