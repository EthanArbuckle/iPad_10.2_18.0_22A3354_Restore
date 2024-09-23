@implementation NSLayoutConstraint

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *v2;
  __CFDictionary *v3;
  __CFDictionary *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  void *v7;
  __CFDictionary *v9;
  __CFDictionary *v10;
  __CFDictionary *v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  __CFDictionary *v14;
  __CFDictionary *v15;
  __CFDictionary *v16;
  __CFDictionary *Mutable;
  _QWORD v18[14];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("active"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("b"));
  v18[0] = Mutable;
  v16 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, CFSTR("propertyName"), CFSTR("constant"));
  CFDictionaryAddValue(v16, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v16, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v16, CFSTR("propertyFormat"), CFSTR("CGf"));
  v18[1] = v16;
  v15 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, CFSTR("propertyName"), CFSTR("firstAnchor"));
  CFDictionaryAddValue(v15, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v15, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v18[2] = v15;
  v14 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, CFSTR("propertyName"), CFSTR("firstItem"));
  CFDictionaryAddValue(v14, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v14, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v18[3] = v14;
  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("identifier"));
  CFDictionaryAddValue(v13, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v13, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v18[4] = v13;
  v12 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, CFSTR("propertyName"), CFSTR("multiplier"));
  CFDictionaryAddValue(v12, CFSTR("propertyRuntimeType"), CFSTR("float"));
  CFDictionaryAddValue(v12, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v12, CFSTR("propertyFormat"), CFSTR("f"));
  v18[5] = v12;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("priority"));
  CFDictionaryAddValue(v10, CFSTR("propertyRuntimeType"), CFSTR("float"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("f"));
  v18[6] = v10;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("secondAnchor"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v18[7] = v11;
  v9 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("secondItem"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v18[8] = v9;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, CFSTR("propertyName"), CFSTR("dbgInspectedHasIdentifier"));
  CFDictionaryAddValue(v2, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v2, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v2, CFSTR("propertyFormat"), CFSTR("b"));
  v18[9] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("dbgInspectedHasSecondItem"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("b"));
  v18[10] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("firstAttribute"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("NSLayoutAttribute"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("integer"));
  v18[11] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("relation"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("NSLayoutRelation"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("integer"));
  v18[12] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("secondAttribute"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("NSLayoutAttribute"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("integer"));
  v18[13] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 14));

  return v7;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  _BOOL8 v12;
  void *v13;
  _BOOL8 v14;
  id v15;
  NSString *v16;
  SEL v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *v23;
  SEL v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v33[3];
  _QWORD v34[3];

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("dbgInspectedHasIdentifier")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("dbgInspectedHasSecondItem")))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "secondItem"));
      v14 = v13 != 0;

      v12 = v14;
      goto LABEL_5;
    }
    v15 = v9;
    v16 = (NSString *)v8;
    if (-[NSString length](v16, "length"))
    {
      v17 = NSSelectorFromString(v16);
      if ((objc_opt_respondsToSelector(v15, v17) & 1) != 0)
      {
        v18 = v16;
        if (v18)
        {
LABEL_9:
          a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForKey:", v18));
LABEL_26:

          goto LABEL_27;
        }
      }
      else
      {
        if (-[NSString length](v16, "length") < 2)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseString](v16, "uppercaseString"));
        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v16, "substringToIndex:", 1));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uppercaseString"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v16, "substringFromIndex:", 1));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingString:", v21));

        }
        v23 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v22));
        v24 = NSSelectorFromString(v23);
        if ((objc_opt_respondsToSelector(v15, v24) & 1) != 0)
          v18 = v23;
        else
          v18 = 0;

        if (v18)
          goto LABEL_9;
      }
    }
    if (a6)
    {
      v25 = v16;
      if (v15)
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v15));
      else
        v26 = &stru_38A98;
      if (v25)
        v27 = v25;
      else
        v27 = &stru_38A98;
      v33[0] = CFSTR("propertyName");
      v33[1] = CFSTR("objectDescription");
      v34[0] = v27;
      v34[1] = v26;
      v33[2] = CFSTR("errorDescription");
      v34[2] = &stru_38A98;
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 3));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v29));

      v31 = objc_retainAutorelease(v30);
      *a6 = v31;

      v18 = 0;
      a6 = 0;
    }
    else
    {
      v18 = 0;
    }
    goto LABEL_26;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v11 = objc_msgSend(v10, "length") != 0;

  v12 = v11;
LABEL_5:
  a6 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12));
LABEL_27:

  return a6;
}

@end
