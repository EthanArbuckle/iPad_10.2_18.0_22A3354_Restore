@implementation UISlider

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *v2;
  __CFDictionary *v3;
  __CFDictionary *v4;
  CFNumberRef v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  CFNumberRef v8;
  __CFDictionary *v9;
  __CFDictionary *v10;
  void *v11;
  __CFDictionary *v13;
  __CFDictionary *Mutable;
  uint64_t valuePtr;
  _QWORD v16[9];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("continuous"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("b"));
  v16[0] = Mutable;
  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("maximumValue"));
  CFDictionaryAddValue(v13, CFSTR("propertyRuntimeType"), CFSTR("float"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v13, CFSTR("propertyFormat"), CFSTR("f"));
  v16[1] = v13;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, CFSTR("propertyName"), CFSTR("minimumValue"));
  CFDictionaryAddValue(v2, CFSTR("propertyRuntimeType"), CFSTR("float"));
  CFDictionaryAddValue(v2, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v2, CFSTR("propertyFormat"), CFSTR("f"));
  v16[2] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("maximumTrackTintColor"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("UIColor"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  v16[3] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("maximumValueImage"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("UIImage"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("public.png"));
  valuePtr = 1;
  v5 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v4, CFSTR("propertyOptions"), v5);
  CFRelease(v5);
  v16[4] = v4;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("minimumTrackTintColor"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("UIColor"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  v16[5] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("minimumValueImage"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("UIImage"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("public.png"));
  valuePtr = 1;
  v8 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("propertyOptions"), v8);
  CFRelease(v8);
  v16[6] = v7;
  v9 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("thumbTintColor"));
  CFDictionaryAddValue(v9, CFSTR("propertyRuntimeType"), CFSTR("UIColor"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  v16[7] = v9;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("value"));
  CFDictionaryAddValue(v10, CFSTR("propertyRuntimeType"), CFSTR("float"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("f"));
  v16[8] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 9));

  return v11;
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
