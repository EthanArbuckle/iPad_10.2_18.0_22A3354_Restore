@implementation UIView

+ (id)fallback_debugHierarchyChildGroupingID
{
  return CFSTR("com.apple.UIKit.UIView");
}

+ (id)fallback_debugHierarchyAdditionalGroupingIDs
{
  _QWORD v3[4];

  v3[0] = CFSTR("com.apple.UIKit.NSLayoutConstraint");
  v3[1] = CFSTR("com.apple.QuartzCore.CALayer");
  v3[2] = CFSTR("com.apple.UIKit.UIViewController");
  v3[3] = CFSTR("com.apple.UIKit.UILayoutGuide");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 4));
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  void *v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.UIKit.UIView")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.UIKit.NSLayoutConstraint")))
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraints"));
      goto LABEL_5;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.QuartzCore.CALayer")))
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "__dbg_layer"));
      v12 = (void *)v11;
      if (!v11)
      {
        v9 = 0;
        goto LABEL_17;
      }
      v15 = v11;
      v13 = &v15;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.UIKit.UIViewController")))
      {
        if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.UIKit.UILayoutGuide")))
        {
          v9 = 0;
          goto LABEL_6;
        }
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutGuides"));
        goto LABEL_5;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "__dbg_viewController"));

      if (!v9)
        goto LABEL_6;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "__dbg_viewController"));
      v14 = v12;
      v13 = (uint64_t *)&v14;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 1));
LABEL_17:

    goto LABEL_6;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subviews"));
LABEL_5:
  v9 = (void *)v8;
LABEL_6:

  return v9;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *v2;
  CFNumberRef v3;
  __CFDictionary *v4;
  CFNumberRef v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  __CFDictionary *v8;
  __CFDictionary *v9;
  __CFDictionary *v10;
  CFNumberRef v11;
  void *v12;
  __CFDictionary *v13;
  void *v14;
  void *v15;
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
  __CFDictionary *v39;
  __CFDictionary *v40;
  __CFDictionary *v41;
  __CFDictionary *v42;
  __CFDictionary *v43;
  __CFDictionary *v44;
  __CFDictionary *v45;
  __CFDictionary *v46;
  __CFDictionary *v47;
  __CFDictionary *v48;
  __CFDictionary *v49;
  __CFDictionary *v50;
  __CFDictionary *v51;
  __CFDictionary *v52;
  __CFDictionary *v53;
  __CFDictionary *v54;
  __CFDictionary *v55;
  __CFDictionary *v56;
  __CFDictionary *v57;
  __CFDictionary *v58;
  __CFDictionary *v59;
  __CFDictionary *v60;
  __CFDictionary *v61;
  __CFDictionary *v62;
  __CFDictionary *v63;
  __CFDictionary *v64;
  __CFDictionary *v65;
  __CFDictionary *Mutable;
  uint64_t valuePtr;
  __CFDictionary *v68;
  _QWORD v69[55];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("alpha"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("CGf"));
  v69[0] = Mutable;
  v65 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v65, CFSTR("propertyName"), CFSTR("accessibilityCustomActions"));
  CFDictionaryAddValue(v65, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v65, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v65, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v69[1] = v65;
  v64 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v64, CFSTR("propertyName"), CFSTR("accessibilityElements"));
  CFDictionaryAddValue(v64, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v64, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v64, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v69[2] = v64;
  v63 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v63, CFSTR("propertyName"), CFSTR("accessibilityElementIsFocused"));
  CFDictionaryAddValue(v63, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v63, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v63, CFSTR("propertyFormat"), CFSTR("b"));
  v69[3] = v63;
  v62 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v62, CFSTR("propertyName"), CFSTR("accessibilityLabel"));
  CFDictionaryAddValue(v62, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v62, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v62, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v69[4] = v62;
  v61 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v61, CFSTR("propertyName"), CFSTR("accessibilityHint"));
  CFDictionaryAddValue(v61, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v61, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v61, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v69[5] = v61;
  v60 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v60, CFSTR("propertyName"), CFSTR("accessibilityIdentifier"));
  CFDictionaryAddValue(v60, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v60, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v60, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v69[6] = v60;
  v59 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v59, CFSTR("propertyName"), CFSTR("accessibilityValue"));
  CFDictionaryAddValue(v59, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v59, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v59, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v69[7] = v59;
  v58 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v58, CFSTR("propertyName"), CFSTR("autoresizesSubviews"));
  CFDictionaryAddValue(v58, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v58, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v58, CFSTR("propertyFormat"), CFSTR("b"));
  v69[8] = v58;
  v57 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v57, CFSTR("propertyName"), CFSTR("backgroundColor"));
  CFDictionaryAddValue(v57, CFSTR("propertyRuntimeType"), CFSTR("UIColor"));
  CFDictionaryAddValue(v57, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  v69[9] = v57;
  v56 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v56, CFSTR("propertyName"), CFSTR("bounds"));
  CFDictionaryAddValue(v56, CFSTR("propertyRuntimeType"), CFSTR("CGRect"));
  CFDictionaryAddValue(v56, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeRect"));
  CFDictionaryAddValue(v56, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v69[10] = v56;
  v55 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v55, CFSTR("propertyName"), CFSTR("clearsContextBeforeDrawing"));
  CFDictionaryAddValue(v55, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v55, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v55, CFSTR("propertyFormat"), CFSTR("b"));
  v69[11] = v55;
  v54 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v54, CFSTR("propertyName"), CFSTR("clipsToBounds"));
  CFDictionaryAddValue(v54, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v54, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v54, CFSTR("propertyFormat"), CFSTR("b"));
  v69[12] = v54;
  v53 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v53, CFSTR("propertyName"), CFSTR("frame"));
  CFDictionaryAddValue(v53, CFSTR("propertyRuntimeType"), CFSTR("CGRect"));
  CFDictionaryAddValue(v53, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeRect"));
  CFDictionaryAddValue(v53, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v69[13] = v53;
  v52 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v52, CFSTR("propertyName"), CFSTR("hasAmbiguousLayout"));
  CFDictionaryAddValue(v52, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v52, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v52, CFSTR("propertyFormat"), CFSTR("b"));
  v69[14] = v52;
  v51 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v51, CFSTR("propertyName"), CFSTR("hidden"));
  CFDictionaryAddValue(v51, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v51, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v51, CFSTR("propertyFormat"), CFSTR("b"));
  v69[15] = v51;
  v50 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v50, CFSTR("propertyName"), CFSTR("isAccessibilityElement"));
  CFDictionaryAddValue(v50, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v50, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v50, CFSTR("propertyFormat"), CFSTR("b"));
  v69[16] = v50;
  v49 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v49, CFSTR("propertyName"), CFSTR("layer"));
  CFDictionaryAddValue(v49, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v49, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v69[17] = v49;
  v48 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v48, CFSTR("propertyName"), CFSTR("layoutMargins"));
  CFDictionaryAddValue(v48, CFSTR("propertyRuntimeType"), CFSTR("UIEdgeInsets"));
  CFDictionaryAddValue(v48, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeInsets"));
  CFDictionaryAddValue(v48, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v69[18] = v48;
  v47 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v47, CFSTR("propertyName"), CFSTR("multipleTouchEnabled"));
  CFDictionaryAddValue(v47, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v47, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v47, CFSTR("propertyFormat"), CFSTR("b"));
  v69[19] = v47;
  v46 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v46, CFSTR("propertyName"), CFSTR("opaque"));
  CFDictionaryAddValue(v46, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v46, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v46, CFSTR("propertyFormat"), CFSTR("b"));
  v69[20] = v46;
  v45 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v45, CFSTR("propertyName"), CFSTR("userInteractionEnabled"));
  CFDictionaryAddValue(v45, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v45, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v45, CFSTR("propertyFormat"), CFSTR("b"));
  v69[21] = v45;
  v44 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v44, CFSTR("propertyName"), CFSTR("tag"));
  CFDictionaryAddValue(v44, CFSTR("propertyRuntimeType"), CFSTR("NSInteger"));
  CFDictionaryAddValue(v44, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v44, CFSTR("propertyFormat"), CFSTR("integer"));
  v69[22] = v44;
  v43 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v43, CFSTR("propertyName"), CFSTR("tintColor"));
  CFDictionaryAddValue(v43, CFSTR("propertyRuntimeType"), CFSTR("UIColor"));
  CFDictionaryAddValue(v43, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  v69[23] = v43;
  v42 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v42, CFSTR("propertyName"), CFSTR("ambiguityStatusMask"));
  CFDictionaryAddValue(v42, CFSTR("propertyRuntimeType"), CFSTR("NSInteger"));
  CFDictionaryAddValue(v42, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v42, CFSTR("propertyFormat"), CFSTR("integer"));
  v69[24] = v42;
  v41 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v41, CFSTR("propertyName"), CFSTR("autoresizingMask"));
  CFDictionaryAddValue(v41, CFSTR("propertyRuntimeType"), CFSTR("NSInteger"));
  CFDictionaryAddValue(v41, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v41, CFSTR("propertyFormat"), CFSTR("integer"));
  v69[25] = v41;
  v40 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v40, CFSTR("propertyName"), CFSTR("autoresizingMask"));
  CFDictionaryAddValue(v40, CFSTR("propertyRuntimeType"), CFSTR("UIViewAutoresizing"));
  CFDictionaryAddValue(v40, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v40, CFSTR("propertyFormat"), CFSTR("uinteger"));
  v69[26] = v40;
  v39 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v39, CFSTR("propertyName"), CFSTR("contentCompressionResistancePriorityHorizontal"));
  CFDictionaryAddValue(v39, CFSTR("propertyRuntimeType"), CFSTR("float"));
  CFDictionaryAddValue(v39, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v39, CFSTR("propertyFormat"), CFSTR("f"));
  v69[27] = v39;
  v38 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v38, CFSTR("propertyName"), CFSTR("contentCompressionResistancePriorityVertical"));
  CFDictionaryAddValue(v38, CFSTR("propertyRuntimeType"), CFSTR("float"));
  CFDictionaryAddValue(v38, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v38, CFSTR("propertyFormat"), CFSTR("f"));
  v69[28] = v38;
  v37 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v37, CFSTR("propertyName"), CFSTR("contentHuggingPriorityHorizontal"));
  CFDictionaryAddValue(v37, CFSTR("propertyRuntimeType"), CFSTR("float"));
  CFDictionaryAddValue(v37, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v37, CFSTR("propertyFormat"), CFSTR("f"));
  v69[29] = v37;
  v36 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v36, CFSTR("propertyName"), CFSTR("contentHuggingPriorityVertical"));
  CFDictionaryAddValue(v36, CFSTR("propertyRuntimeType"), CFSTR("float"));
  CFDictionaryAddValue(v36, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v36, CFSTR("propertyFormat"), CFSTR("f"));
  v69[30] = v36;
  v35 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v35, CFSTR("propertyName"), CFSTR("contentMode"));
  CFDictionaryAddValue(v35, CFSTR("propertyRuntimeType"), CFSTR("UIViewContentMode"));
  CFDictionaryAddValue(v35, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v35, CFSTR("propertyFormat"), CFSTR("integer"));
  v69[31] = v35;
  v34 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v34, CFSTR("propertyName"), CFSTR("contentStretch"));
  CFDictionaryAddValue(v34, CFSTR("propertyRuntimeType"), CFSTR("CGRect"));
  CFDictionaryAddValue(v34, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeRect"));
  CFDictionaryAddValue(v34, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v69[32] = v34;
  v33 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v33, CFSTR("propertyName"), CFSTR("dbgFormattedDisplayName"));
  CFDictionaryAddValue(v33, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v33, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v33, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v69[33] = v33;
  v32 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v32, CFSTR("propertyName"), CFSTR("dbgInspectedDebugDescription"));
  CFDictionaryAddValue(v32, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v32, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v32, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v69[34] = v32;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, CFSTR("propertyName"), CFSTR("snapshotImage"));
  CFDictionaryAddValue(v2, CFSTR("propertyRuntimeType"), CFSTR("UIImage"));
  CFDictionaryAddValue(v2, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  v31 = v2;
  CFDictionaryAddValue(v2, CFSTR("propertyFormat"), CFSTR("public.png"));
  valuePtr = 1;
  v3 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v2, CFSTR("propertyOptions"), v3);
  CFRelease(v3);
  v69[35] = v2;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("snapshotImageRenderedUsingDrawHierarchyInRect"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("UIImage"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  v30 = v4;
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("public.png"));
  valuePtr = 1;
  v5 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v4, CFSTR("propertyOptions"), v5);
  CFRelease(v5);
  v69[36] = v4;
  v29 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v29, CFSTR("propertyName"), CFSTR("tintAdjustmentMode"));
  CFDictionaryAddValue(v29, CFSTR("propertyRuntimeType"), CFSTR("UIViewTintAdjustmentMode"));
  CFDictionaryAddValue(v29, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v29, CFSTR("propertyFormat"), CFSTR("integer"));
  v69[37] = v29;
  v28 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v28, CFSTR("propertyName"), CFSTR("dbgViewForFirstBaselineLayout"));
  CFDictionaryAddValue(v28, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v28, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v69[38] = v28;
  v27 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v27, CFSTR("propertyName"), CFSTR("dbgViewForLastBaselineLayout"));
  CFDictionaryAddValue(v27, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v27, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v69[39] = v27;
  v26 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v26, CFSTR("propertyName"), CFSTR("layerClass"));
  CFDictionaryAddValue(v26, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v26, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v26, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v69[40] = v26;
  v25 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v25, CFSTR("propertyName"), CFSTR("horizontalAffectingConstraints"));
  CFDictionaryAddValue(v25, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v25, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v25, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v69[41] = v25;
  v24 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v24, CFSTR("propertyName"), CFSTR("verticalAffectingConstraints"));
  CFDictionaryAddValue(v24, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v24, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v24, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v69[42] = v24;
  v23 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v23, CFSTR("propertyName"), CFSTR("firstBaselineOffsetFromTop"));
  CFDictionaryAddValue(v23, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v23, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v23, CFSTR("propertyFormat"), CFSTR("CGf"));
  v69[43] = v23;
  v22 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v22, CFSTR("propertyName"), CFSTR("lastBaselineOffsetFromBottom"));
  CFDictionaryAddValue(v22, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v22, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v22, CFSTR("propertyFormat"), CFSTR("CGf"));
  v69[44] = v22;
  v21 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v21, CFSTR("propertyName"), CFSTR("dbgRenderingModeIsMultiLayer"));
  CFDictionaryAddValue(v21, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v21, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v21, CFSTR("propertyFormat"), CFSTR("b"));
  v69[45] = v21;
  v20 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v20, CFSTR("propertyName"), CFSTR("accessibilityTraits"));
  CFDictionaryAddValue(v20, CFSTR("propertyRuntimeType"), CFSTR("unsigned long long"));
  CFDictionaryAddValue(v20, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v20, CFSTR("propertyFormat"), CFSTR("ull"));
  v69[46] = v20;
  v19 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v19, CFSTR("propertyName"), CFSTR("anchorPoint"));
  CFDictionaryAddValue(v19, CFSTR("propertyRuntimeType"), CFSTR("CGPoint"));
  CFDictionaryAddValue(v19, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypePoint"));
  CFDictionaryAddValue(v19, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v69[47] = v19;
  v18 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, CFSTR("propertyName"), CFSTR("anchorPointZ"));
  CFDictionaryAddValue(v18, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v18, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v18, CFSTR("propertyFormat"), CFSTR("CGf"));
  v69[48] = v18;
  v17 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, CFSTR("propertyName"), CFSTR("position"));
  CFDictionaryAddValue(v17, CFSTR("propertyRuntimeType"), CFSTR("CGPoint"));
  CFDictionaryAddValue(v17, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypePoint"));
  CFDictionaryAddValue(v17, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v69[49] = v17;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("zPosition"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("CGf"));
  v69[50] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("traitCollectionVerticalSizeClass"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("UIUserInterfaceSizeClass"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("integer"));
  v69[51] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("traitCollectionHorizontalSizeClass"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("UIUserInterfaceSizeClass"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("integer"));
  v69[52] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("traitCollectionLayoutDirection"));
  CFDictionaryAddValue(v9, CFSTR("propertyRuntimeType"), CFSTR("UITraitEnvironmentLayoutDirection"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("integer"));
  v69[53] = v9;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("dbgSubviewHierarchy"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeData"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("public.data"));
  valuePtr = 8;
  v11 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v10, CFSTR("visibility"), v11);
  CFRelease(v11);
  v69[54] = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 55));

  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("traitCollectionUserInterfaceStyle"));
  CFDictionaryAddValue(v13, CFSTR("propertyRuntimeType"), CFSTR("UIUserInterfaceStyle"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v13, CFSTR("propertyFormat"), CFSTR("integer"));
  v68 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v68, 1));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v14));
  return v15;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id *v13;
  id *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v22;
  id *v23;
  NSString *v24;
  __CFString *v25;
  uint64_t v26;
  const void **v27;
  id v28;
  id v29;
  SEL v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSString *v36;
  SEL v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[3];
  __CFString *valuePtr;
  _QWORD v47[2];

  v9 = a3;
  v10 = a4;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("accessibilityCustomActions")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("accessibilityElements")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "accessibilityElements"));
      goto LABEL_5;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("snapshotImage")))
    {
      v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__dbg_snapshotImage"));
LABEL_39:
      a6 = v14;
      goto LABEL_40;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("snapshotImageRenderedUsingDrawHierarchyInRect")))
    {
      v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__dbg_snapshotImageRenderedUsingDrawHierarchyInRect"));
      goto LABEL_39;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("dbgViewForFirstBaselineLayout")))
    {
      v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__dbg_viewForFirstBaselineLayout"));
      goto LABEL_39;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("dbgViewForLastBaselineLayout")))
    {
      v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__dbg_viewForLastBaselineLayout"));
      goto LABEL_39;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("ambiguityStatusMask")))
    {
      v14 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "__dbg_ambiguityStatusMask")));
      goto LABEL_39;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("horizontalAffectingConstraints")))
    {
      v15 = v10;
      v16 = 0;
LABEL_22:
      v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "__dbg_constraintsAffectingLayoutForAxis:", v16));
      goto LABEL_39;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("verticalAffectingConstraints")))
    {
      v15 = v10;
      v16 = 1;
      goto LABEL_22;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("firstBaselineOffsetFromTop")))
    {
      objc_msgSend(v10, "__dbg_firstBaselineOffsetFromTop");
LABEL_27:
      v14 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      goto LABEL_39;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("lastBaselineOffsetFromBottom")))
    {
      objc_msgSend(v10, "__dbg_lastBaselineOffsetFromBottom");
      goto LABEL_27;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("contentCompressionResistancePriorityHorizontal")))
    {
      v17 = v10;
      v18 = 0;
LABEL_32:
      objc_msgSend(v17, "contentCompressionResistancePriorityForAxis:", v18);
LABEL_38:
      v14 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      goto LABEL_39;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("contentCompressionResistancePriorityVertical")))
    {
      v17 = v10;
      v18 = 1;
      goto LABEL_32;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("contentHuggingPriorityHorizontal")))
    {
      v19 = v10;
      v20 = 0;
LABEL_37:
      objc_msgSend(v19, "contentHuggingPriorityForAxis:", v20);
      goto LABEL_38;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("contentHuggingPriorityVertical")))
    {
      v19 = v10;
      v20 = 1;
      goto LABEL_37;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("dbgFormattedDisplayName")))
    {
      v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__dbg_formattedDisplayName"));
      goto LABEL_39;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("dbgInspectedDebugDescription")))
    {
      v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "debugDescription"));
      goto LABEL_39;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("hasAmbiguousLayout")))
    {
      v22 = objc_msgSend(v10, "__dbg_hasAmbiguousLayout");
LABEL_47:
      v14 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v22));
      goto LABEL_39;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("layerClass")))
    {
      v23 = (id *)objc_msgSend((id)objc_opt_class(v10), "layerClass");
      a6 = v23;
      if (!v23)
        goto LABEL_40;
      if (object_isClass(v23))
      {
        v24 = NSStringFromClass((Class)a6);
        v14 = (id *)objc_claimAutoreleasedReturnValue(v24);
        goto LABEL_39;
      }
LABEL_57:
      a6 = 0;
      goto LABEL_40;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("layer")))
    {
      v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__dbg_layer"));
      goto LABEL_39;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("dbgSubviewHierarchy")))
    {
      if ((objc_opt_respondsToSelector(v10, "makeViewDebugData") & 1) != 0)
      {
        v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "makeViewDebugData"));
        goto LABEL_39;
      }
      goto LABEL_57;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("dbgRenderingModeIsMultiLayer")))
    {
      v22 = objc_msgSend(v10, "__dbg_renderingModeIsMultiLayer");
      goto LABEL_47;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("anchorPoint")))
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
      objc_msgSend(v12, "anchorPoint");
LABEL_66:
      valuePtr = v25;
      v47[0] = v26;
      v27 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
      *v27 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
      v27[1] = CFNumberCreate(0, kCFNumberCGFloatType, v47);
      a6 = (id *)CFArrayCreate(0, v27, 2, &kCFTypeArrayCallBacks);
      CFRelease(*v27);
      CFRelease(v27[1]);
      free(v27);
      goto LABEL_7;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("anchorPointZ")))
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
      objc_msgSend(v12, "anchorPointZ");
    }
    else
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("position")))
      {
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
        objc_msgSend(v12, "position");
        goto LABEL_66;
      }
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("zPosition")))
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("traitCollectionUserInterfaceStyle")))
        {
          v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traitCollection"));
          v28 = objc_msgSend(v12, "userInterfaceStyle");
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("traitCollectionVerticalSizeClass")))
        {
          v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traitCollection"));
          v28 = objc_msgSend(v12, "verticalSizeClass");
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("traitCollectionHorizontalSizeClass")))
        {
          v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traitCollection"));
          v28 = objc_msgSend(v12, "horizontalSizeClass");
        }
        else
        {
          if (!objc_msgSend(v9, "isEqualToString:", CFSTR("traitCollectionLayoutDirection")))
          {
            v12 = v10;
            v29 = v9;
            if (!objc_msgSend(v29, "length"))
              goto LABEL_91;
            v30 = NSSelectorFromString((NSString *)v29);
            if ((objc_opt_respondsToSelector(v12, v30) & 1) != 0)
            {
              v31 = (NSString *)v29;
            }
            else
            {
              if ((unint64_t)objc_msgSend(v29, "length") < 2)
              {
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "uppercaseString"));
              }
              else
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "substringToIndex:", 1));
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "uppercaseString"));
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "substringFromIndex:", 1));
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stringByAppendingString:", v34));

              }
              v36 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v35));
              v37 = NSSelectorFromString(v36);
              v31 = (objc_opt_respondsToSelector(v12, v37) & 1) != 0 ? v36 : 0;

            }
            if (v31)
            {
              a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKey:", v31));
            }
            else
            {
LABEL_91:
              if (a6)
              {
                v38 = (__CFString *)v29;
                if (v12)
                  v39 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v12));
                else
                  v39 = &stru_38A98;
                if (v38)
                  v40 = v38;
                else
                  v40 = &stru_38A98;
                v45[0] = CFSTR("propertyName");
                v45[1] = CFSTR("objectDescription");
                valuePtr = v40;
                v47[0] = v39;
                v45[2] = CFSTR("errorDescription");
                v47[1] = &stru_38A98;
                v41 = v40;
                v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &valuePtr, v45, 3));
                v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v42));

                v44 = objc_retainAutorelease(v43);
                *a6 = v44;

                v31 = 0;
                a6 = 0;
              }
              else
              {
                v31 = 0;
              }
            }

            goto LABEL_7;
          }
          v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traitCollection"));
          v28 = objc_msgSend(v12, "layoutDirection");
        }
        v13 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v28));
        goto LABEL_6;
      }
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
      objc_msgSend(v12, "zPosition");
    }
    v13 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    goto LABEL_6;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "accessibilityCustomActions"));
LABEL_5:
  v12 = v11;
  v13 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
LABEL_6:
  a6 = v13;
LABEL_7:

LABEL_40:
  return a6;
}

- (BOOL)__dbg_wantsAutoLayout
{
  if ((objc_opt_respondsToSelector(self, "_wantsAutolayout") & 1) != 0)
    return -[UIView _wantsAutolayout](self, "_wantsAutolayout");
  else
    return 0;
}

- (BOOL)__dbg_hasAmbiguousLayout
{
  void *v3;
  BOOL v4;

  if (!-[UIView __dbg_wantsAutoLayout](self, "__dbg_wantsAutoLayout"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _layoutVariablesWithAmbiguousValue](self, "_layoutVariablesWithAmbiguousValue"));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (unint64_t)__dbg_ambiguityStatusMask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _layoutVariablesWithAmbiguousValue](self, "_layoutVariablesWithAmbiguousValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  if (!v5)
    goto LABEL_7;
  while ((objc_msgSend(v5, "_uiib_hostsLayoutEngine") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

    v5 = v6;
    if (!v6)
      goto LABEL_8;
  }
  if (objc_msgSend(v5, "_uiib_hostsLayoutEngine"))
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_uiib_layoutEngineCreatingIfNecessary"));
  else
LABEL_7:
    v6 = 0;
LABEL_8:
  v7 = objc_claimAutoreleasedReturnValue(-[UIView _minXVariable](self, "_minXVariable"));
  if (v7)
  {
    if (objc_msgSend(v4, "containsObject:", v7))
      v8 = 2;
    else
      v8 = 0;
    if (v6 && !objc_msgSend(v6, "hasValue:forVariable:", 0, v7))
      v8 |= 0x400uLL;
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _minYVariable](self, "_minYVariable"));
  if (v9)
  {
    if (objc_msgSend(v4, "containsObject:", v9))
      v8 |= 4uLL;
    if (v6 && !objc_msgSend(v6, "hasValue:forVariable:", 0, v9))
      v8 |= 0x800uLL;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _boundsWidthVariable](self, "_boundsWidthVariable"));
  if (v10)
  {
    if (objc_msgSend(v4, "containsObject:", v10))
      v8 |= 8uLL;
    if (v6 && !objc_msgSend(v6, "hasValue:forVariable:", 0, v10))
      v8 |= 0x1000uLL;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _boundsHeightVariable](self, "_boundsHeightVariable"));
  if (v11)
  {
    if (objc_msgSend(v4, "containsObject:", v11))
      v8 |= 0x10uLL;
    if (v6 && !objc_msgSend(v6, "hasValue:forVariable:", 0, v11))
      v8 |= 0x2000uLL;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _contentWidthVariable](self, "_contentWidthVariable"));
  v15 = (void *)v7;
  if (v12)
  {
    if (!-[UIView __dbg_shouldIgnoreScrollableContentWidthAmbiguity](self, "__dbg_shouldIgnoreScrollableContentWidthAmbiguity")&& objc_msgSend(v4, "containsObject:", v12))
    {
      v8 |= 0x20uLL;
    }
    if (v6
      && !-[UIView __dbg_shouldIgnoreScrollableContentWidthAmbiguity](self, "__dbg_shouldIgnoreScrollableContentWidthAmbiguity")&& !objc_msgSend(v6, "hasValue:forVariable:", 0, v12))
    {
      v8 |= 0x4000uLL;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _contentHeightVariable](self, "_contentHeightVariable"));
  if (v13)
  {
    if (!-[UIView __dbg_shouldIgnoreScrollableContentHeightAmbiguity](self, "__dbg_shouldIgnoreScrollableContentHeightAmbiguity")&& objc_msgSend(v4, "containsObject:", v13))
    {
      v8 |= 0x40uLL;
    }
    if (v6
      && !-[UIView __dbg_shouldIgnoreScrollableContentHeightAmbiguity](self, "__dbg_shouldIgnoreScrollableContentHeightAmbiguity")&& !objc_msgSend(v6, "hasValue:forVariable:", 0, v13))
    {
      v8 |= 0x8000uLL;
    }
  }

  return v8;
}

- (BOOL)__dbg_shouldIgnoreScrollableContentWidthAmbiguity
{
  uint64_t v3;
  void *v4;
  BOOL v5;

  v3 = objc_opt_class(UIScrollView);
  if ((objc_opt_isKindOfClass(self, v3) & 1) == 0)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews"));
  v5 = objc_msgSend(v4, "count") == 0;

  return v5;
}

- (BOOL)__dbg_shouldIgnoreScrollableContentHeightAmbiguity
{
  uint64_t v3;
  void *v4;
  BOOL v5;

  v3 = objc_opt_class(UIScrollView);
  if ((objc_opt_isKindOfClass(self, v3) & 1) == 0)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews"));
  v5 = objc_msgSend(v4, "count") == 0;

  return v5;
}

- (double)__dbg_firstBaselineOffsetFromTop
{
  UIView *v2;
  UIView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v2 = self;
  v3 = v2;
  if (-[UIView __dbg_wantsAutoLayout](v2, "__dbg_wantsAutoLayout"))
  {
    v3 = v2;
    if ((objc_opt_respondsToSelector(v2, "viewForFirstBaselineLayout") & 1) != 0)
    {
      v3 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIView viewForFirstBaselineLayout](v2, "viewForFirstBaselineLayout"));

    }
  }
  v4 = 0.0;
  if (-[UIView __dbg_wantsAutoLayout](v2, "__dbg_wantsAutoLayout")
    && (objc_opt_respondsToSelector(v3, "_firstBaselineOffsetFromTop") & 1) != 0)
  {
    -[UIView _firstBaselineOffsetFromTop](v3, "_firstBaselineOffsetFromTop");
    v4 = v5;
  }
  -[UIView bounds](v3, "bounds");
  -[UIView alignmentRectForFrame:](v3, "alignmentRectForFrame:");
  -[UIView convertRect:toView:](v3, "convertRect:toView:", v2);
  v7 = v6;
  -[UIView bounds](v2, "bounds");
  -[UIView alignmentRectForFrame:](v2, "alignmentRectForFrame:");
  v9 = v4 + v7 + v8;

  return v9;
}

- (double)__dbg_lastBaselineOffsetFromBottom
{
  UIView *v2;
  UIView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v2 = self;
  v3 = v2;
  if (-[UIView __dbg_wantsAutoLayout](v2, "__dbg_wantsAutoLayout"))
  {
    v3 = v2;
    if ((objc_opt_respondsToSelector(v2, "viewForLastBaselineLayout") & 1) != 0)
    {
      v3 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIView viewForLastBaselineLayout](v2, "viewForLastBaselineLayout"));

    }
  }
  v4 = 0.0;
  if (-[UIView __dbg_wantsAutoLayout](v3, "__dbg_wantsAutoLayout")
    && (objc_opt_respondsToSelector(v3, "_baselineOffsetFromBottom") & 1) != 0)
  {
    -[UIView _baselineOffsetFromBottom](v3, "_baselineOffsetFromBottom");
    v4 = v5;
  }
  -[UIView bounds](v3, "bounds");
  -[UIView alignmentRectForFrame:](v3, "alignmentRectForFrame:");
  -[UIView convertRect:toView:](v3, "convertRect:toView:", v2);
  v7 = v6;
  v9 = v8;
  -[UIView bounds](v2, "bounds");
  -[UIView alignmentRectForFrame:](v2, "alignmentRectForFrame:");
  v12 = v4 + v10 + v11 - (v7 + v9);

  return v12;
}

- (id)__dbg_viewForFirstBaselineLayout
{
  void *v3;

  if (-[UIView __dbg_wantsAutoLayout](self, "__dbg_wantsAutoLayout")
    && (objc_opt_respondsToSelector(self, "viewForFirstBaselineLayout") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView viewForFirstBaselineLayout](self, "viewForFirstBaselineLayout"));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)__dbg_viewForLastBaselineLayout
{
  void *v3;

  if (-[UIView __dbg_wantsAutoLayout](self, "__dbg_wantsAutoLayout")
    && (objc_opt_respondsToSelector(self, "viewForLastBaselineLayout") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView viewForLastBaselineLayout](self, "viewForLastBaselineLayout"));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)__dbg_readableContentGuide
{
  void *v3;

  if (-[UIView __dbg_wantsAutoLayout](self, "__dbg_wantsAutoLayout")
    && (objc_opt_respondsToSelector(self, "readableContentGuide") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView readableContentGuide](self, "readableContentGuide"));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)__dbg_constraintsAffectingLayoutForAxis:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (!-[UIView __dbg_wantsAutoLayout](self, "__dbg_wantsAutoLayout"))
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView constraintsAffectingLayoutForAxis:](self, "constraintsAffectingLayoutForAxis:", a3));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          if (*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11))
            v12 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("%p"), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11));
          else
            v12 = 0;
          objc_msgSend(v6, "addObject:", v12);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", ")));
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)__dbg_viewController
{
  void *v3;

  if ((objc_opt_respondsToSelector(self, "_viewDelegate") & 1) != 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _viewDelegate](self, "_viewDelegate"));
  else
    v3 = 0;
  return v3;
}

- (id)__dbg_formattedDisplayName
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView accessibilityLabel](self, "accessibilityLabel"));
  v4 = objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView accessibilityLabel](self, "accessibilityLabel"));
  if ((isKindOfClass & 1) == 0)
  {
    v7 = objc_opt_class(NSAttributedString);
    v8 = objc_opt_isKindOfClass(v6, v7);

    if ((v8 & 1) == 0)
      goto LABEL_5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView accessibilityLabel](self, "accessibilityLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "string"));

  }
  if (!v6)
  {
LABEL_5:
    v10 = objc_opt_class(UIButton);
    if ((objc_opt_isKindOfClass(self, v10) & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView currentTitle](self, "currentTitle"));
      return v6;
    }
    if ((objc_opt_respondsToSelector(self, "text") & 1) != 0)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[UIView text](self, "text"));
    }
    else
    {
      v12 = objc_opt_class(UIDatePicker);
      if ((objc_opt_isKindOfClass(self, v12) & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView date](self, "date"));
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
LABEL_17:
        v6 = v14;

        return v6;
      }
      if ((objc_opt_respondsToSelector(self, "title") & 1) == 0)
      {
        v6 = 0;
        return v6;
      }
      v11 = objc_claimAutoreleasedReturnValue(-[UIView title](self, "title"));
    }
    v13 = (void *)v11;
    v15 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
      v16 = v13;
    else
      v16 = 0;
    v14 = v16;
    goto LABEL_17;
  }
  return v6;
}

- (id)__dbg_snapshotImage
{
  double v3;
  double v4;
  double v5;
  CGContextRef CurrentContext;
  Class v7;
  Class v8;
  Class v9;
  Class v10;
  void *v12;
  id v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  UIImage *ImageFromCurrentImageContext;
  void *i;
  void *v25;
  int v26;
  void *v27;
  double v28;
  uint64_t v29;
  CGSize v30;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  -[UIView bounds](self, "bounds");
  CurrentContext = 0;
  if (v4 > 0.0 && v5 > 0.0 && v4 * v5 < 16000000.0)
  {
    v7 = NSClassFromString(CFSTR("GLKView"));
    if ((objc_opt_isKindOfClass(self, v7) & 1) != 0
      || (v8 = NSClassFromString(CFSTR("SKView")), (objc_opt_isKindOfClass(self, v8) & 1) != 0)
      || (v9 = NSClassFromString(CFSTR("SCNView")), (objc_opt_isKindOfClass(self, v9) & 1) != 0)
      || (v10 = NSClassFromString(CFSTR("RealityKit.ARView")), (objc_opt_isKindOfClass(self, v10) & 1) != 0))
    {
      CurrentContext = (CGContextRef)objc_claimAutoreleasedReturnValue(-[UIView snapshot](self, "snapshot"));
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews"));
      v13 = objc_msgSend(v12, "count");
      v14 = (char *)&v29 - ((4 * (_QWORD)v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v13)
      {
        v15 = 0;
        do
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", v15));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));
          objc_msgSend(v17, "opacity");
          *(_DWORD *)&v14[4 * (_QWORD)v15] = v18;

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));
          objc_msgSend(v19, "setOpacity:", 3.18618444e-58);

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
      }
      -[UIView bounds](self, "bounds");
      v30.width = v20;
      v30.height = v21;
      UIGraphicsBeginImageContextWithOptions(v30, 0, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      if (CurrentContext)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
        objc_msgSend(v22, "renderInContext:", CurrentContext);

        ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
        CurrentContext = (CGContextRef)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
      }
      UIGraphicsEndImageContext();
      if (v13)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", i));
          v26 = *(_DWORD *)&v14[4 * (_QWORD)i];
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layer"));
          LODWORD(v28) = v26;
          objc_msgSend(v27, "setOpacity:", v28);

        }
      }

    }
  }
  return CurrentContext;
}

- (id)__dbg_snapshotImageRenderedUsingDrawHierarchyInRect
{
  UIView *v3;
  UIView *v4;
  void *v5;
  void *v6;
  double v7;
  double x;
  double v9;
  double y;
  double v11;
  double width;
  double v13;
  double height;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  UIView *v20;
  UIView *v21;
  UIView *v22;
  UIView *v23;
  void *v24;
  char *v25;
  void *v26;
  char *v27;
  char *v28;
  void *v29;
  char *v30;
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  UIView *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  void *i;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  UIImage *ImageFromCurrentImageContext;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  UIImage *v66;
  uint64_t v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  void *j;
  void *v73;
  void *v74;
  double v75;
  double v76;
  UIView *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  CGSize v90;
  CGSize v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;

  v3 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  if (!v3)
  {
    v4 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](v4, "superview"));

    if (v5)
    {
      do
      {
        v3 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIView superview](v4, "superview"));

        v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](v3, "superview"));
        v4 = v3;
      }
      while (v6);
    }
    else
    {
      v3 = v4;
    }
  }
  -[UIView bounds](self, "bounds");
  -[UIView convertRect:fromView:](v3, "convertRect:fromView:", self);
  x = v7;
  y = v9;
  width = v11;
  height = v13;
  -[UIView bounds](v3, "bounds");
  v98.origin.x = v15;
  v98.origin.y = v16;
  v98.size.width = v17;
  v98.size.height = v18;
  v92.origin.x = x;
  v92.origin.y = y;
  v92.size.width = width;
  v92.size.height = height;
  if (CGRectIntersectsRect(v92, v98))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v20 = self;
    v21 = v20;
    if (v3 == v20)
    {
      v37 = v20;
    }
    else
    {
      v22 = v20;
      do
      {
        v23 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIView superview](v22, "superview"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](v23, "subviews"));
        v25 = (char *)objc_msgSend(v24, "indexOfObject:", v22);

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](v23, "subviews"));
        v27 = (char *)objc_msgSend(v26, "count");
        v28 = v25 + 1;

        if (v27 > v25 + 1)
        {
          while (1)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](v23, "subviews"));
            v30 = (char *)objc_msgSend(v29, "count");

            if (v28 >= v30)
              break;
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](v23, "subviews"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", v28));

            objc_msgSend(v32, "bounds");
            -[UIView convertRect:fromView:](v3, "convertRect:fromView:", v32);
            v99.origin.x = x;
            v99.origin.y = y;
            v99.size.width = width;
            v99.size.height = height;
            if (CGRectIntersectsRect(v93, v99))
              objc_msgSend(v19, "addObject:", v32);

            ++v28;
          }
        }
        if (-[UIView clipsToBounds](v23, "clipsToBounds"))
        {
          -[UIView bounds](v23, "bounds");
          -[UIView convertRect:fromView:](v3, "convertRect:fromView:", v23);
          v100.origin.x = v33;
          v100.origin.y = v34;
          v100.size.width = v35;
          v100.size.height = v36;
          v94.origin.x = x;
          v94.origin.y = y;
          v94.size.width = width;
          v94.size.height = height;
          v95 = CGRectIntersection(v94, v100);
          x = v95.origin.x;
          y = v95.origin.y;
          width = v95.size.width;
          height = v95.size.height;
        }

        v22 = v23;
      }
      while (v23 != v3);
      v37 = v3;
    }
    v96.origin.x = x;
    v96.origin.y = y;
    v96.size.width = width;
    v96.size.height = height;
    if (CGRectIsNull(v96)
      || (v97.origin.x = x, v97.origin.y = y, v97.size.width = width, v97.size.height = height, CGRectIsEmpty(v97)))
    {
      v39 = 0;
    }
    else
    {
      v78 = v37;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](v21, "subviews"));
      objc_msgSend(v19, "addObjectsFromArray:", v40);

      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 0, 0));
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v79 = v19;
      v42 = v19;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v85;
        do
        {
          for (i = 0; i != v44; i = (char *)i + 1)
          {
            if (*(_QWORD *)v85 != v45)
              objc_enumerationMutation(v42);
            v47 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v47, "alpha");
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            objc_msgSend(v41, "setObject:forKey:", v48, v47);

            objc_msgSend(v47, "setAlpha:", 0.00000011920929);
          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
        }
        while (v44);
      }

      -[UIView bounds](v3, "bounds");
      v50 = v49;
      v52 = v51;
      v90.width = width;
      v90.height = height;
      UIGraphicsBeginImageContextWithOptions(v90, 0, 0.0);
      -[UIView drawViewHierarchyInRect:afterScreenUpdates:](v3, "drawViewHierarchyInRect:afterScreenUpdates:", 1, -x, -y, v50, v52);
      ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
      v39 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
      UIGraphicsEndImageContext();
      -[UIView bounds](v21, "bounds");
      if (v55 != width || v54 != height)
      {
        -[UIView convertRect:fromView:](v21, "convertRect:fromView:", v3, x, y, width, height);
        v57 = v56;
        v59 = v58;
        v61 = v60;
        v63 = v62;
        -[UIView bounds](v21, "bounds");
        v91.width = v64;
        v91.height = v65;
        UIGraphicsBeginImageContextWithOptions(v91, 0, 0.0);
        objc_msgSend(v39, "drawInRect:blendMode:alpha:", 0, v57, v59, v61, v63, 1.0);
        v66 = UIGraphicsGetImageFromCurrentImageContext();
        v67 = objc_claimAutoreleasedReturnValue(v66);

        UIGraphicsEndImageContext();
        v39 = (void *)v67;
      }
      v37 = v78;
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "keyEnumerator"));
      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
      if (v69)
      {
        v70 = v69;
        v71 = *(_QWORD *)v81;
        do
        {
          for (j = 0; j != v70; j = (char *)j + 1)
          {
            if (*(_QWORD *)v81 != v71)
              objc_enumerationMutation(v68);
            v73 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)j);
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", v73));
            objc_msgSend(v74, "doubleValue");
            v76 = v75;

            objc_msgSend(v73, "setAlpha:", v76);
          }
          v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
        }
        while (v70);
      }

      v19 = v79;
    }
    v38 = v39;

  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (id)__dbg_layer
{
  void *v3;

  if ((objc_opt_respondsToSelector(self, "_outermostLayer") & 1) != 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _outermostLayer](self, "_outermostLayer"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  return v3;
}

- (BOOL)__dbg_renderingModeIsMultiLayer
{
  void *v3;
  void *v4;
  BOOL v5;

  if ((objc_opt_respondsToSelector(self, "_outermostLayer") & 1) == 0)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _outermostLayer](self, "_outermostLayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  v5 = v3 != v4;

  return v5;
}

@end
