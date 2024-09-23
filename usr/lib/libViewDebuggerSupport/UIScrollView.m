@implementation UIScrollView

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *v2;
  __CFDictionary *v3;
  __CFDictionary *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  void *v8;
  __CFDictionary *v10;
  __CFDictionary *v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  __CFDictionary *v14;
  __CFDictionary *v15;
  __CFDictionary *v16;
  __CFDictionary *v17;
  __CFDictionary *v18;
  __CFDictionary *Mutable;
  _QWORD v20[16];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("alwaysBounceHorizontal"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("b"));
  v20[0] = Mutable;
  v18 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, CFSTR("propertyName"), CFSTR("alwaysBounceVertical"));
  CFDictionaryAddValue(v18, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v18, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v18, CFSTR("propertyFormat"), CFSTR("b"));
  v20[1] = v18;
  v17 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, CFSTR("propertyName"), CFSTR("bounces"));
  CFDictionaryAddValue(v17, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v17, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v17, CFSTR("propertyFormat"), CFSTR("b"));
  v20[2] = v17;
  v16 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, CFSTR("propertyName"), CFSTR("bouncesZoom"));
  CFDictionaryAddValue(v16, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v16, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v16, CFSTR("propertyFormat"), CFSTR("b"));
  v20[3] = v16;
  v15 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, CFSTR("propertyName"), CFSTR("canCancelContentTouches"));
  CFDictionaryAddValue(v15, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v15, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v15, CFSTR("propertyFormat"), CFSTR("b"));
  v20[4] = v15;
  v14 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, CFSTR("propertyName"), CFSTR("delegate"));
  CFDictionaryAddValue(v14, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v14, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v20[5] = v14;
  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("delaysContentTouches"));
  CFDictionaryAddValue(v13, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v13, CFSTR("propertyFormat"), CFSTR("b"));
  v20[6] = v13;
  v12 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, CFSTR("propertyName"), CFSTR("directionalLockEnabled"));
  CFDictionaryAddValue(v12, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v12, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v12, CFSTR("propertyFormat"), CFSTR("b"));
  v20[7] = v12;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("pagingEnabled"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("b"));
  v20[8] = v11;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("indicatorStyle"));
  CFDictionaryAddValue(v10, CFSTR("propertyRuntimeType"), CFSTR("NSInteger"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("integer"));
  v20[9] = v10;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, CFSTR("propertyName"), CFSTR("maximumZoomScale"));
  CFDictionaryAddValue(v2, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v2, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v2, CFSTR("propertyFormat"), CFSTR("CGf"));
  v20[10] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("minimumZoomScale"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("CGf"));
  v20[11] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("scrollEnabled"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("b"));
  v20[12] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("showsHorizontalScrollIndicator"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("b"));
  v20[13] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("showsVerticalScrollIndicator"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("b"));
  v20[14] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("keyboardDismissMode"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("UIScrollViewKeyboardDismissMode"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("integer"));
  v20[15] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 16));

  return v8;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  NSString *v10;
  SEL v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  SEL v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v27[3];
  _QWORD v28[3];

  v8 = a3;
  v9 = a4;
  v10 = (NSString *)v8;
  if (-[NSString length](v10, "length"))
  {
    v11 = NSSelectorFromString(v10);
    if ((objc_opt_respondsToSelector(v9, v11) & 1) != 0)
    {
      v12 = v10;
      if (v12)
      {
LABEL_4:
        a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", v12));
        goto LABEL_21;
      }
    }
    else
    {
      if (-[NSString length](v10, "length") < 2)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseString](v10, "uppercaseString"));
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v10, "substringToIndex:", 1));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uppercaseString"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v10, "substringFromIndex:", 1));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", v15));

      }
      v17 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v16));
      v18 = NSSelectorFromString(v17);
      if ((objc_opt_respondsToSelector(v9, v18) & 1) != 0)
        v12 = v17;
      else
        v12 = 0;

      if (v12)
        goto LABEL_4;
    }
  }
  if (a6)
  {
    v19 = v10;
    if (v9)
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v9));
    else
      v20 = &stru_38A98;
    if (v19)
      v21 = v19;
    else
      v21 = &stru_38A98;
    v27[0] = CFSTR("propertyName");
    v27[1] = CFSTR("objectDescription");
    v28[0] = v21;
    v28[1] = v20;
    v27[2] = CFSTR("errorDescription");
    v28[2] = &stru_38A98;
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 3));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v23));

    v25 = objc_retainAutorelease(v24);
    *a6 = v25;

    v12 = 0;
    a6 = 0;
  }
  else
  {
    v12 = 0;
  }
LABEL_21:

  return a6;
}

@end
