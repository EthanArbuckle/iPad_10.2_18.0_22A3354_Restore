@implementation UIWindowScene

+ (id)fallback_debugHierarchyAdditionalGroupingIDs
{
  _QWORD v3[2];

  v3[0] = CFSTR("com.apple.UIKit.UIWindow");
  v3[1] = CFSTR("com.apple.UIKit.UIScreen");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2));
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.UIKit.UIWindow")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windows"));
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.UIKit.UIScreen")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screen"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screen"));
      v11 = v9;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

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
  void *v7;
  __CFDictionary *v9;
  __CFDictionary *Mutable;
  _QWORD v11[7];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("coordinateSpace"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v11[0] = Mutable;
  v9 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("screen"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v11[1] = v9;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, CFSTR("propertyName"), CFSTR("bounds"));
  CFDictionaryAddValue(v2, CFSTR("propertyRuntimeType"), CFSTR("CGRect"));
  CFDictionaryAddValue(v2, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeRect"));
  CFDictionaryAddValue(v2, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v11[2] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("interfaceOrientation"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("UIInterfaceOrientation"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("integer"));
  v11[3] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("traitCollectionVerticalSizeClass"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("UIUserInterfaceSizeClass"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("integer"));
  v11[4] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("traitCollectionHorizontalSizeClass"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("UIUserInterfaceSizeClass"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("integer"));
  v11[5] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("traitCollectionLayoutDirection"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("UITraitEnvironmentLayoutDirection"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("integer"));
  v11[6] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 7));

  return v7;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  const void **v15;
  uint64_t i;
  uint64_t j;
  id v18;
  id v20;
  SEL v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  SEL v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  id v35;
  __CFString *v36;
  __CFString *v37;
  const __CFString *v38;
  uint64_t v39;
  _QWORD v40[3];

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("bounds")))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "coordinateSpace"));
    objc_msgSend(v10, "bounds");
    v36 = v11;
    v37 = v12;
    v38 = v13;
    v39 = v14;
    v15 = (const void **)malloc_type_malloc(0x20uLL, 0x6004044C4A2DFuLL);
    for (i = 0; i != 4; ++i)
      v15[i] = CFNumberCreate(0, kCFNumberCGFloatType, (char *)&v36 + i * 8);
    a6 = (id *)CFArrayCreate(0, v15, 4, &kCFTypeArrayCallBacks);
    for (j = 0; j != 4; ++j)
      CFRelease(v15[j]);
    free(v15);
    goto LABEL_16;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("traitCollectionUserInterfaceStyle")))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traitCollection"));
    v18 = objc_msgSend(v10, "userInterfaceStyle");
LABEL_15:
    a6 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18));
    goto LABEL_16;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("traitCollectionVerticalSizeClass")))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traitCollection"));
    v18 = objc_msgSend(v10, "verticalSizeClass");
    goto LABEL_15;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("traitCollectionHorizontalSizeClass")))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traitCollection"));
    v18 = objc_msgSend(v10, "horizontalSizeClass");
    goto LABEL_15;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("traitCollectionLayoutDirection")))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traitCollection"));
    v18 = objc_msgSend(v10, "layoutDirection");
    goto LABEL_15;
  }
  v10 = v9;
  v20 = v8;
  if (!objc_msgSend(v20, "length"))
    goto LABEL_29;
  v21 = NSSelectorFromString((NSString *)v20);
  if ((objc_opt_respondsToSelector(v10, v21) & 1) != 0)
  {
    v22 = (NSString *)v20;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v20, "length") < 2)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uppercaseString"));
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "substringToIndex:", 1));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "uppercaseString"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "substringFromIndex:", 1));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingString:", v25));

    }
    v27 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v26));
    v28 = NSSelectorFromString(v27);
    v22 = (objc_opt_respondsToSelector(v10, v28) & 1) != 0 ? v27 : 0;

  }
  if (v22)
  {
    a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", v22));
  }
  else
  {
LABEL_29:
    if (a6)
    {
      v29 = (__CFString *)v20;
      if (v10)
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v10));
      else
        v30 = &stru_38A98;
      if (v29)
        v31 = v29;
      else
        v31 = &stru_38A98;
      v40[0] = CFSTR("propertyName");
      v40[1] = CFSTR("objectDescription");
      v36 = v31;
      v37 = v30;
      v40[2] = CFSTR("errorDescription");
      v38 = &stru_38A98;
      v32 = v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, v40, 3));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v33));

      v35 = objc_retainAutorelease(v34);
      *a6 = v35;

      v22 = 0;
      a6 = 0;
    }
    else
    {
      v22 = 0;
    }
  }

LABEL_16:
  return a6;
}

@end
