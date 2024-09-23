@implementation UIDevice

+ (id)fallback_debugHierarchyGroupingIDs
{
  const __CFString *v3;

  v3 = CFSTR("com.apple.UIKit.UIDevice");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 outOptions:(id *)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;

  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.UIKit.UIDevice"), a4))
    return 0;
  v4 = objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = (void *)v4;
  if (v4)
  {
    v8 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *v2;
  __CFDictionary *v3;
  __CFDictionary *v4;
  __CFDictionary *v5;
  CFNumberRef v6;
  __CFDictionary *v7;
  void *v8;
  __CFDictionary *v10;
  __CFDictionary *v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  __CFDictionary *Mutable;
  uint64_t valuePtr;
  _QWORD v16[10];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("batteryLevel"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("float"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("f"));
  v16[0] = Mutable;
  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("generatesDeviceOrientationNotifications"));
  CFDictionaryAddValue(v13, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v13, CFSTR("propertyFormat"), CFSTR("b"));
  v16[1] = v13;
  v12 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, CFSTR("propertyName"), CFSTR("localizedModel"));
  CFDictionaryAddValue(v12, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v12, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v12, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v16[2] = v12;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("model"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v16[3] = v11;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("multitaskingSupported"));
  CFDictionaryAddValue(v10, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("b"));
  v16[4] = v10;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, CFSTR("propertyName"), CFSTR("name"));
  CFDictionaryAddValue(v2, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v2, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v2, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v16[5] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("systemName"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v16[6] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("systemVersion"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v16[7] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("hardwareType"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  valuePtr = 4;
  v6 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v5, CFSTR("visibility"), v6);
  CFRelease(v6);
  v16[8] = v5;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("orientation"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("UIDeviceOrientation"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("integer"));
  v16[9] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 10));

  return v8;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  id *v10;
  id v11;
  NSString *v12;
  SEL v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  SEL v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  id v27;
  utsname v29;
  _QWORD v30[3];

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("hardwareType")))
  {
    v11 = v9;
    v12 = (NSString *)v8;
    if (-[NSString length](v12, "length"))
    {
      v13 = NSSelectorFromString(v12);
      if ((objc_opt_respondsToSelector(v11, v13) & 1) != 0)
      {
        v14 = v12;
        if (v14)
        {
LABEL_8:
          a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", v14));
LABEL_25:

          goto LABEL_26;
        }
      }
      else
      {
        if (-[NSString length](v12, "length") < 2)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseString](v12, "uppercaseString"));
        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v12, "substringToIndex:", 1));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uppercaseString"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v12, "substringFromIndex:", 1));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingString:", v17));

        }
        v19 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v18));
        v20 = NSSelectorFromString(v19);
        if ((objc_opt_respondsToSelector(v11, v20) & 1) != 0)
          v14 = v19;
        else
          v14 = 0;

        if (v14)
          goto LABEL_8;
      }
    }
    if (a6)
    {
      v21 = v12;
      if (v11)
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v11));
      else
        v22 = &stru_38A98;
      if (v21)
        v23 = v21;
      else
        v23 = &stru_38A98;
      v30[0] = CFSTR("propertyName");
      v30[1] = CFSTR("objectDescription");
      *(_QWORD *)v29.sysname = v23;
      *(_QWORD *)&v29.sysname[8] = v22;
      v30[2] = CFSTR("errorDescription");
      *(_QWORD *)&v29.sysname[16] = &stru_38A98;
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, v30, 3));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v25));

      v27 = objc_retainAutorelease(v26);
      *a6 = v27;

      v14 = 0;
      a6 = 0;
    }
    else
    {
      v14 = 0;
    }
    goto LABEL_25;
  }
  memset(&v29, 0, 512);
  uname(&v29);
  v10 = (id *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29.machine, 4));
  if (v10)
    a6 = v10;
  else
    a6 = (id *)CFSTR("(Unknown)");
LABEL_26:

  return a6;
}

@end
