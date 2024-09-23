@implementation CAShapeLayer

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
  __CFDictionary *Mutable;
  _QWORD v15[11];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("fillColor"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("color"));
  v15[0] = Mutable;
  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("fillRule"));
  CFDictionaryAddValue(v13, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v13, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v15[1] = v13;
  v12 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, CFSTR("propertyName"), CFSTR("lineCap"));
  CFDictionaryAddValue(v12, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v12, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v12, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v15[2] = v12;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("lineDashPhase"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("CGf"));
  v15[3] = v11;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("lineJoin"));
  CFDictionaryAddValue(v10, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v15[4] = v10;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, CFSTR("propertyName"), CFSTR("lineWidth"));
  CFDictionaryAddValue(v2, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v2, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v2, CFSTR("propertyFormat"), CFSTR("CGf"));
  v15[5] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("miterLimit"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("CGf"));
  v15[6] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("path"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v15[7] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("strokeColor"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("color"));
  v15[8] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("strokeEnd"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("CGf"));
  v15[9] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("strokeStart"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("CGf"));
  v15[10] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 11));

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
