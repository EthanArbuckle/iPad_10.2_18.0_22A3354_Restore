@implementation UIWindow

+ (id)fallback_debugHierarchyGroupingIDs
{
  const __CFString *v3;

  v3 = CFSTR("com.apple.UIKit.UIWindow");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 outOptions:(id *)a4
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.UIKit.UIWindow"), a4))
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0));
  else
    v4 = 0;
  return v4;
}

+ (id)fallback_debugHierarchyAdditionalGroupingIDs
{
  _QWORD v3[3];

  v3[0] = CFSTR("com.apple.UIKit.UIViewController");
  v3[1] = CFSTR("com.apple.UIKit.UIScreen");
  v3[2] = CFSTR("com.apple.UIKit.UIScene");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 3));
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void **v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.UIKit.UIViewController")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.UIKit.UIScreen")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screen"));

      if (v11)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screen"));
        v15 = v9;
        v10 = &v15;
        goto LABEL_9;
      }
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.UIKit.UIScene")))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
      v14 = v9;
      v10 = &v14;
      goto LABEL_9;
    }
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootViewController"));

  if (!v8)
    goto LABEL_10;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootViewController"));
  v16 = v9;
  v10 = &v16;
LABEL_9:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 1, v14, v15, v16));

LABEL_11:
  return v12;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *Mutable;
  __CFDictionary *v3;
  __CFDictionary *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  CFNumberRef v7;
  __CFDictionary *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[6];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("keyWindow"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("b"));
  v12[0] = Mutable;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("rootViewController"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v12[1] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("screen"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v12[2] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("windowLevel"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("CGf"));
  v12[3] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("internal"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("b"));
  v11 = 4;
  v7 = CFNumberCreate(0, kCFNumberCFIndexType, &v11);
  CFDictionaryAddValue(v6, CFSTR("visibility"), v7);
  CFRelease(v7);
  v12[4] = v6;
  v8 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("visible"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("b"));
  v12[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 6));

  return v9;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSString *v13;
  SEL v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  SEL v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v30[3];
  _QWORD v31[3];

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("internal")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("visible")))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1));
      v11 = objc_msgSend(v10, "containsObject:", v9);
      goto LABEL_5;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("screenScale")))
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "screen"));
      objc_msgSend(v12, "scale");
      a6 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
LABEL_29:

      goto LABEL_30;
    }
    v12 = v9;
    v13 = (NSString *)v8;
    if (-[NSString length](v13, "length"))
    {
      v14 = NSSelectorFromString(v13);
      if ((objc_opt_respondsToSelector(v12, v14) & 1) != 0)
      {
        v15 = v13;
        if (v15)
        {
LABEL_11:
          a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKey:", v15));
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
        if (-[NSString length](v13, "length") < 2)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseString](v13, "uppercaseString"));
        }
        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v13, "substringToIndex:", 1));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uppercaseString"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v13, "substringFromIndex:", 1));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", v18));

        }
        v20 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v19));
        v21 = NSSelectorFromString(v20);
        if ((objc_opt_respondsToSelector(v12, v21) & 1) != 0)
          v15 = v20;
        else
          v15 = 0;

        if (v15)
          goto LABEL_11;
      }
    }
    if (a6)
    {
      v22 = v13;
      if (v12)
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v12));
      else
        v23 = &stru_38A98;
      if (v22)
        v24 = v22;
      else
        v24 = &stru_38A98;
      v30[0] = CFSTR("propertyName");
      v30[1] = CFSTR("objectDescription");
      v31[0] = v24;
      v31[1] = v23;
      v30[2] = CFSTR("errorDescription");
      v31[2] = &stru_38A98;
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 3));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v26));

      v28 = objc_retainAutorelease(v27);
      *a6 = v28;

      v15 = 0;
      a6 = 0;
    }
    else
    {
      v15 = 0;
    }
    goto LABEL_28;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 0));
  v11 = (id)(objc_msgSend(v10, "containsObject:", v9) ^ 1);
LABEL_5:

  a6 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
LABEL_30:

  return a6;
}

@end
