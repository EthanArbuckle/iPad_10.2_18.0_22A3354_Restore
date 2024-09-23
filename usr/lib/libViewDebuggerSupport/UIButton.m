@implementation UIButton

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
  __CFDictionary *v11;
  void *v12;
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
  __CFDictionary *Mutable;
  uint64_t valuePtr;
  _QWORD v29[20];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("adjustsImageWhenDisabled"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("b"));
  v29[0] = Mutable;
  v26 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v26, CFSTR("propertyName"), CFSTR("adjustsImageWhenHighlighted"));
  CFDictionaryAddValue(v26, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v26, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v26, CFSTR("propertyFormat"), CFSTR("b"));
  v29[1] = v26;
  v25 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v25, CFSTR("propertyName"), CFSTR("contentEdgeInsets"));
  CFDictionaryAddValue(v25, CFSTR("propertyRuntimeType"), CFSTR("UIEdgeInsets"));
  CFDictionaryAddValue(v25, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeInsets"));
  CFDictionaryAddValue(v25, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v29[2] = v25;
  v24 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v24, CFSTR("propertyName"), CFSTR("currentAttributedTitle"));
  CFDictionaryAddValue(v24, CFSTR("propertyRuntimeType"), CFSTR("NSAttributedString"));
  CFDictionaryAddValue(v24, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeAttributedString"));
  CFDictionaryAddValue(v24, CFSTR("propertyFormat"), CFSTR("attrStr"));
  v29[3] = v24;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, CFSTR("propertyName"), CFSTR("currentBackgroundImage"));
  CFDictionaryAddValue(v2, CFSTR("propertyRuntimeType"), CFSTR("UIImage"));
  CFDictionaryAddValue(v2, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  v23 = v2;
  CFDictionaryAddValue(v2, CFSTR("propertyFormat"), CFSTR("public.png"));
  valuePtr = 1;
  v3 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v2, CFSTR("propertyOptions"), v3);
  CFRelease(v3);
  v29[4] = v2;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("currentImage"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("UIImage"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  v22 = v4;
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("public.png"));
  valuePtr = 1;
  v5 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v4, CFSTR("propertyOptions"), v5);
  CFRelease(v5);
  v29[5] = v4;
  v21 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v21, CFSTR("propertyName"), CFSTR("currentTitle"));
  CFDictionaryAddValue(v21, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v21, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v21, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v29[6] = v21;
  v20 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v20, CFSTR("propertyName"), CFSTR("currentTitleColor"));
  CFDictionaryAddValue(v20, CFSTR("propertyRuntimeType"), CFSTR("UIColor"));
  CFDictionaryAddValue(v20, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  v29[7] = v20;
  v19 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v19, CFSTR("propertyName"), CFSTR("currentTitleShadowColor"));
  CFDictionaryAddValue(v19, CFSTR("propertyRuntimeType"), CFSTR("UIColor"));
  CFDictionaryAddValue(v19, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  v29[8] = v19;
  v18 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, CFSTR("propertyName"), CFSTR("imageEdgeInsets"));
  CFDictionaryAddValue(v18, CFSTR("propertyRuntimeType"), CFSTR("UIEdgeInsets"));
  CFDictionaryAddValue(v18, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeInsets"));
  CFDictionaryAddValue(v18, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v29[9] = v18;
  v17 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, CFSTR("propertyName"), CFSTR("reversesTitleShadowWhenHighlighted"));
  CFDictionaryAddValue(v17, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v17, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v17, CFSTR("propertyFormat"), CFSTR("b"));
  v29[10] = v17;
  v16 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, CFSTR("propertyName"), CFSTR("showsTouchWhenHighlighted"));
  CFDictionaryAddValue(v16, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v16, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v16, CFSTR("propertyFormat"), CFSTR("b"));
  v29[11] = v16;
  v15 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, CFSTR("propertyName"), CFSTR("titleEdgeInsets"));
  CFDictionaryAddValue(v15, CFSTR("propertyRuntimeType"), CFSTR("UIEdgeInsets"));
  CFDictionaryAddValue(v15, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeInsets"));
  CFDictionaryAddValue(v15, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v29[12] = v15;
  v14 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, CFSTR("propertyName"), CFSTR("_titleShadowOffset"));
  CFDictionaryAddValue(v14, CFSTR("propertyRuntimeType"), CFSTR("CGSize"));
  CFDictionaryAddValue(v14, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeSize"));
  CFDictionaryAddValue(v14, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v29[13] = v14;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("buttonType"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("UIButtonType"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("integer"));
  v29[14] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("dbgInspectedHasSingleTarget"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("b"));
  v29[15] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("hasAttributedTitle"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("b"));
  v29[16] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("_lineBreakMode"));
  CFDictionaryAddValue(v9, CFSTR("propertyRuntimeType"), CFSTR("NSLineBreakMode"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("integer"));
  v29[17] = v9;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("target"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v29[18] = v10;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("touchUpAction"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v29[19] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 20));

  return v12;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  id *v12;
  id v14;
  void *v15;
  SEL v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  SEL v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[3];
  _QWORD v32[3];

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("dbgInspectedHasSingleTarget")))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allTargets"));
    v11 = objc_msgSend(v10, "count") == (char *)&dword_0 + 1;
LABEL_5:
    v12 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11));
LABEL_6:
    a6 = v12;
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("hasAttributedTitle")))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentAttributedTitle"));
    v11 = v10 != 0;
    goto LABEL_5;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("target")))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allTargets"));
    v12 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "anyObject"));
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("touchUpAction")))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allTargets"));
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "anyObject"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionsForTarget:forControlEvent:", v14, 64));
    a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));

  }
  else
  {
    v10 = v9;
    v14 = v8;
    if (!objc_msgSend(v14, "length"))
      goto LABEL_24;
    v16 = NSSelectorFromString((NSString *)v14);
    if ((objc_opt_respondsToSelector(v10, v16) & 1) != 0)
    {
      v17 = (NSString *)v14;
    }
    else
    {
      if ((unint64_t)objc_msgSend(v14, "length") < 2)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uppercaseString"));
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringToIndex:", 1));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uppercaseString"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringFromIndex:", 1));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingString:", v20));

      }
      v22 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v21));
      v23 = NSSelectorFromString(v22);
      v17 = (objc_opt_respondsToSelector(v10, v23) & 1) != 0 ? v22 : 0;

    }
    if (v17)
    {
      a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", v17));
    }
    else
    {
LABEL_24:
      if (a6)
      {
        v24 = (__CFString *)v14;
        if (v10)
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v10));
        else
          v25 = &stru_38A98;
        if (v24)
          v26 = v24;
        else
          v26 = &stru_38A98;
        v31[0] = CFSTR("propertyName");
        v31[1] = CFSTR("objectDescription");
        v32[0] = v26;
        v32[1] = v25;
        v31[2] = CFSTR("errorDescription");
        v32[2] = &stru_38A98;
        v27 = v26;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v28));

        v30 = objc_retainAutorelease(v29);
        *a6 = v30;

        v17 = 0;
        a6 = 0;
      }
      else
      {
        v17 = 0;
      }
    }

  }
LABEL_7:

  return a6;
}

@end
