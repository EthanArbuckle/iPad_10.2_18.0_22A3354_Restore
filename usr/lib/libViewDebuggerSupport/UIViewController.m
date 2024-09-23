@implementation UIViewController

+ (id)fallback_debugHierarchyChildGroupingID
{
  return CFSTR("com.apple.UIKit.UIViewController");
}

+ (id)fallback_debugHierarchyAdditionalGroupingIDs
{
  const __CFString *v3;

  v3 = CFSTR("com.apple.UIKit.UIView");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.UIKit.UIViewController")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "childViewControllers"));
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.UIKit.UIView")))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewIfLoaded"));
    v10 = (void *)v9;
    if (v9)
    {
      v12 = v9;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *v2;
  __CFDictionary *v3;
  __CFDictionary *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  void *v8;
  __CFDictionary *v9;
  void *v10;
  void *v11;
  __CFDictionary *v13;
  __CFDictionary *v14;
  __CFDictionary *v15;
  __CFDictionary *v16;
  __CFDictionary *v17;
  __CFDictionary *v18;
  __CFDictionary *v19;
  __CFDictionary *v20;
  __CFDictionary *v21;
  __CFDictionary *v22;
  __CFDictionary *v23;
  __CFDictionary *v24;
  __CFDictionary *v25;
  __CFDictionary *v26;
  __CFDictionary *v27;
  __CFDictionary *v28;
  __CFDictionary *v29;
  __CFDictionary *v30;
  __CFDictionary *v31;
  __CFDictionary *v32;
  __CFDictionary *v33;
  __CFDictionary *v34;
  __CFDictionary *v35;
  __CFDictionary *v36;
  __CFDictionary *v37;
  __CFDictionary *v38;
  __CFDictionary *Mutable;
  __CFDictionary *v40;
  _QWORD v41[33];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("automaticallyAdjustsScrollViewInsets"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("b"));
  v41[0] = Mutable;
  v38 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v38, CFSTR("propertyName"), CFSTR("definesPresentationContext"));
  CFDictionaryAddValue(v38, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v38, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v38, CFSTR("propertyFormat"), CFSTR("b"));
  v41[1] = v38;
  v37 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v37, CFSTR("propertyName"), CFSTR("disablesAutomaticKeyboardDismissal"));
  CFDictionaryAddValue(v37, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v37, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v37, CFSTR("propertyFormat"), CFSTR("b"));
  v41[2] = v37;
  v36 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v36, CFSTR("propertyName"), CFSTR("editing"));
  CFDictionaryAddValue(v36, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v36, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v36, CFSTR("propertyFormat"), CFSTR("b"));
  v41[3] = v36;
  v35 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v35, CFSTR("propertyName"), CFSTR("extendedLayoutIncludesOpaqueBars"));
  CFDictionaryAddValue(v35, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v35, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v35, CFSTR("propertyFormat"), CFSTR("b"));
  v41[4] = v35;
  v34 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v34, CFSTR("propertyName"), CFSTR("hidesBottomBarWhenPushed"));
  CFDictionaryAddValue(v34, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v34, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v34, CFSTR("propertyFormat"), CFSTR("b"));
  v41[5] = v34;
  v33 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v33, CFSTR("propertyName"), CFSTR("isBeingDismissed"));
  CFDictionaryAddValue(v33, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v33, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v33, CFSTR("propertyFormat"), CFSTR("b"));
  v41[6] = v33;
  v32 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v32, CFSTR("propertyName"), CFSTR("isBeingPresented"));
  CFDictionaryAddValue(v32, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v32, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v32, CFSTR("propertyFormat"), CFSTR("b"));
  v41[7] = v32;
  v31 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v31, CFSTR("propertyName"), CFSTR("isMovingFromParentViewController"));
  CFDictionaryAddValue(v31, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v31, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v31, CFSTR("propertyFormat"), CFSTR("b"));
  v41[8] = v31;
  v30 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v30, CFSTR("propertyName"), CFSTR("isMovingToParentViewController"));
  CFDictionaryAddValue(v30, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v30, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v30, CFSTR("propertyFormat"), CFSTR("b"));
  v41[9] = v30;
  v29 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v29, CFSTR("propertyName"), CFSTR("modalPresentationCapturesStatusBarAppearance"));
  CFDictionaryAddValue(v29, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v29, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v29, CFSTR("propertyFormat"), CFSTR("b"));
  v41[10] = v29;
  v28 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v28, CFSTR("propertyName"), CFSTR("modalInPopover"));
  CFDictionaryAddValue(v28, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v28, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v28, CFSTR("propertyFormat"), CFSTR("b"));
  v41[11] = v28;
  v27 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v27, CFSTR("propertyName"), CFSTR("nibName"));
  CFDictionaryAddValue(v27, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v27, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v27, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v41[12] = v27;
  v26 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v26, CFSTR("propertyName"), CFSTR("preferredContentSize"));
  CFDictionaryAddValue(v26, CFSTR("propertyRuntimeType"), CFSTR("CGSize"));
  CFDictionaryAddValue(v26, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeSize"));
  CFDictionaryAddValue(v26, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v41[13] = v26;
  v25 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v25, CFSTR("propertyName"), CFSTR("prefersStatusBarHidden"));
  CFDictionaryAddValue(v25, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v25, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v25, CFSTR("propertyFormat"), CFSTR("b"));
  v41[14] = v25;
  v24 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v24, CFSTR("propertyName"), CFSTR("providesPresentationContextTransitionStyle"));
  CFDictionaryAddValue(v24, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v24, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v24, CFSTR("propertyFormat"), CFSTR("b"));
  v41[15] = v24;
  v23 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v23, CFSTR("propertyName"), CFSTR("restorationIdentifier"));
  CFDictionaryAddValue(v23, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v23, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v23, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v41[16] = v23;
  v22 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v22, CFSTR("propertyName"), CFSTR("restoresFocusAfterTransition"));
  CFDictionaryAddValue(v22, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v22, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v22, CFSTR("propertyFormat"), CFSTR("b"));
  v41[17] = v22;
  v21 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v21, CFSTR("propertyName"), CFSTR("shouldAutorotate"));
  CFDictionaryAddValue(v21, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v21, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v21, CFSTR("propertyFormat"), CFSTR("b"));
  v41[18] = v21;
  v20 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v20, CFSTR("propertyName"), CFSTR("shouldAutomaticallyForwardAppearanceMethods"));
  CFDictionaryAddValue(v20, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v20, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v20, CFSTR("propertyFormat"), CFSTR("b"));
  v41[19] = v20;
  v19 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v19, CFSTR("propertyName"), CFSTR("title"));
  CFDictionaryAddValue(v19, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v19, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v19, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v41[20] = v19;
  v18 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, CFSTR("propertyName"), CFSTR("view"));
  CFDictionaryAddValue(v18, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v18, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v41[21] = v18;
  v17 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, CFSTR("propertyName"), CFSTR("viewLoaded"));
  CFDictionaryAddValue(v17, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v17, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v17, CFSTR("propertyFormat"), CFSTR("b"));
  v41[22] = v17;
  v16 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, CFSTR("propertyName"), CFSTR("modalPresentationStyle"));
  CFDictionaryAddValue(v16, CFSTR("propertyRuntimeType"), CFSTR("UIModalPresentationStyle"));
  CFDictionaryAddValue(v16, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v16, CFSTR("propertyFormat"), CFSTR("integer"));
  v41[23] = v16;
  v15 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, CFSTR("propertyName"), CFSTR("modalTransitionStyle"));
  CFDictionaryAddValue(v15, CFSTR("propertyRuntimeType"), CFSTR("UIModalTransitionStyle"));
  CFDictionaryAddValue(v15, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v15, CFSTR("propertyFormat"), CFSTR("integer"));
  v41[24] = v15;
  v14 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, CFSTR("propertyName"), CFSTR("nibBundlePath"));
  CFDictionaryAddValue(v14, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v14, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v14, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v41[25] = v14;
  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("preferredStatusBarStyle"));
  CFDictionaryAddValue(v13, CFSTR("propertyRuntimeType"), CFSTR("UIStatusBarStyle"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v13, CFSTR("propertyFormat"), CFSTR("integer"));
  v41[26] = v13;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, CFSTR("propertyName"), CFSTR("preferredStatusBarUpdateAnimation"));
  CFDictionaryAddValue(v2, CFSTR("propertyRuntimeType"), CFSTR("UIStatusBarAnimation"));
  CFDictionaryAddValue(v2, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v2, CFSTR("propertyFormat"), CFSTR("integer"));
  v41[27] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("preferredInterfaceOrientationForPresentation"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("UIInterfaceOrientation"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("integer"));
  v41[28] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("supportedInterfaceOrientations"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("UIInterfaceOrientationMask"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("integer"));
  v41[29] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("traitCollectionVerticalSizeClass"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("UIUserInterfaceSizeClass"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("integer"));
  v41[30] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("traitCollectionHorizontalSizeClass"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("UIUserInterfaceSizeClass"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("integer"));
  v41[31] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("traitCollectionLayoutDirection"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("UITraitEnvironmentLayoutDirection"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("integer"));
  v41[32] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 33));

  v9 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("traitCollectionUserInterfaceStyle"));
  CFDictionaryAddValue(v9, CFSTR("propertyRuntimeType"), CFSTR("UIUserInterfaceStyle"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("integer"));
  v40 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v10));
  return v11;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  id v10;
  id *v11;
  id v12;
  id v14;
  SEL v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  SEL v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[3];
  _QWORD v31[3];

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("nibBundlePath")))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nibBundle"));
    v11 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundlePath"));
    goto LABEL_14;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("view")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("traitCollectionUserInterfaceStyle")))
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traitCollection"));
      v12 = objc_msgSend(v10, "userInterfaceStyle");
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("traitCollectionVerticalSizeClass")))
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traitCollection"));
      v12 = objc_msgSend(v10, "verticalSizeClass");
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("traitCollectionHorizontalSizeClass")))
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traitCollection"));
      v12 = objc_msgSend(v10, "horizontalSizeClass");
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("traitCollectionLayoutDirection")))
      {
        v10 = v9;
        v14 = v8;
        if (!objc_msgSend(v14, "length"))
          goto LABEL_29;
        v15 = NSSelectorFromString((NSString *)v14);
        if ((objc_opt_respondsToSelector(v10, v15) & 1) != 0)
        {
          v16 = (NSString *)v14;
        }
        else
        {
          if ((unint64_t)objc_msgSend(v14, "length") < 2)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uppercaseString"));
          }
          else
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringToIndex:", 1));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uppercaseString"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringFromIndex:", 1));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingString:", v19));

          }
          v21 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v20));
          v22 = NSSelectorFromString(v21);
          v16 = (objc_opt_respondsToSelector(v10, v22) & 1) != 0 ? v21 : 0;

        }
        if (v16)
        {
          a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", v16));
        }
        else
        {
LABEL_29:
          if (a6)
          {
            v23 = (__CFString *)v14;
            if (v10)
              v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v10));
            else
              v24 = &stru_38A98;
            if (v23)
              v25 = v23;
            else
              v25 = &stru_38A98;
            v30[0] = CFSTR("propertyName");
            v30[1] = CFSTR("objectDescription");
            v31[0] = v25;
            v31[1] = v24;
            v30[2] = CFSTR("errorDescription");
            v31[2] = &stru_38A98;
            v26 = v25;
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 3));
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v27));

            v29 = objc_retainAutorelease(v28);
            *a6 = v29;

            v16 = 0;
            a6 = 0;
          }
          else
          {
            v16 = 0;
          }
        }

        goto LABEL_15;
      }
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traitCollection"));
      v12 = objc_msgSend(v10, "layoutDirection");
    }
    v11 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
LABEL_14:
    a6 = v11;
LABEL_15:

    goto LABEL_16;
  }
  a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewIfLoaded"));
LABEL_16:

  return a6;
}

@end
