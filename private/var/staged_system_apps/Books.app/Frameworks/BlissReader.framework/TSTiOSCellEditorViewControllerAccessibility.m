@implementation TSTiOSCellEditorViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTiOSCellEditorViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)viewDidLoad
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  unsigned __int8 v13;
  const __CFString *v14;
  unsigned int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];

  v20.receiver = self;
  v20.super_class = (Class)TSTiOSCellEditorViewControllerAccessibility;
  -[TSTiOSCellEditorViewControllerAccessibility viewDidLoad](&v20, "viewDidLoad");
  objc_msgSend(-[TSTiOSCellEditorViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mBackSegment")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("expand.input.types")));
  objc_msgSend(-[TSTiOSCellEditorViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mNumberSegment")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("numbers.input")));
  objc_msgSend(-[TSTiOSCellEditorViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mDateDurationSegment")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("date.and.duration.input")));
  objc_msgSend(-[TSTiOSCellEditorViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mTextSegment")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("text.input")));
  objc_msgSend(-[TSTiOSCellEditorViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mFormulaSegment")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("equation.input")));
  v3 = -[TSTiOSCellEditorViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mDoneCancelSubView"));
  v4 = objc_opt_class(UIView);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = objc_msgSend(v3, "subviews");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
          v11 = objc_opt_class(UIButton);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            v12 = objc_msgSend(v10, "actionsForTarget:forControlEvent:", self, 64);
            v13 = objc_msgSend(v12, "containsObject:", CFSTR("done:"));
            v14 = CFSTR("done.button");
            if ((v13 & 1) != 0
              || (v15 = objc_msgSend(v12, "containsObject:", CFSTR("cancel:")),
                  v14 = CFSTR("cancel.button"),
                  v15))
            {
              objc_msgSend(v10, "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)v14));
            }
          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v7);
    }
  }
}

@end
