@implementation THNotesDetailTableViewHeaderViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THNotesDetailTableViewHeaderView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  NSArray *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  objc_class *v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableString *v22;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v2 = -[UIView subviews](-[THNotesDetailTableViewHeaderViewAccessibility _thaxCellContentView](self, "_thaxCellContentView"), "subviews");
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "tag") == (char *)&dword_C + 2)
        {
          v31 = 0;
          v10 = (objc_class *)objc_opt_class(UILabel);
          v11 = __TSAccessibilityCastAsClass(v10, (uint64_t)v9, 1, &v31);
          if (v31)
            goto LABEL_20;
          v6 = (void *)v11;
        }
        else if (objc_msgSend(v9, "tag") == &dword_8)
        {
          v31 = 0;
          v12 = (objc_class *)objc_opt_class(UILabel);
          v13 = __TSAccessibilityCastAsClass(v12, (uint64_t)v9, 1, &v31);
          if (v31)
            goto LABEL_20;
          v5 = (void *)v13;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  v14 = objc_msgSend(v6, "text");
  v15 = objc_msgSend(v5, "text");
  v22 = __TSAccessibilityStringForVariables(1, v14, v16, v17, v18, v19, v20, v21, (uint64_t)v15);
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if (!-[NSMutableString length](v22, "length"))
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Label for note header cell is not valid."), v24, v25, v26, v27, v28, v30))LABEL_20:abort();
    }
  }
  return v22;
}

- (id)accessibilityHint
{
  objc_super v4;

  if (-[THNotesDetailTableViewHeaderViewAccessibility _thaxEditing](self, "_thaxEditing"))
  {
    if (-[THNotesDetailTableViewHeaderViewAccessibility _thaxSelected](self, "_thaxSelected"))
      return THAccessibilityLocalizedString((uint64_t)CFSTR("notes.heading.editing.selected.hint.ios"));
    else
      return THAccessibilityLocalizedString((uint64_t)CFSTR("notes.heading.editing.hint.ios"));
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)THNotesDetailTableViewHeaderViewAccessibility;
    return -[THNotesDetailTableViewHeaderViewAccessibility accessibilityHint](&v4, "accessibilityHint");
  }
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THNotesDetailTableViewHeaderViewAccessibility;
  v3 = -[THNotesDetailTableViewHeaderViewAccessibility accessibilityTraits](&v5, "accessibilityTraits");
  if (-[THNotesDetailTableViewHeaderViewAccessibility _thaxSelected](self, "_thaxSelected"))
    return UIAccessibilityTraitSelected | v3;
  else
    return v3 & ~UIAccessibilityTraitSelected;
}

- (BOOL)_thaxSelected
{
  return -[THNotesDetailTableViewHeaderViewAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("selected"));
}

- (BOOL)_thaxEditing
{
  return -[THNotesDetailTableViewHeaderViewAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("editing"));
}

- (UIView)_thaxCellContentView
{
  objc_class *v3;
  UIView *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIView);
  result = (UIView *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THNotesDetailTableViewHeaderViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("cellContentView")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
