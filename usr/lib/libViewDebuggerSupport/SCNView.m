@implementation SCNView

+ (id)fallback_debugHierarchyAdditionalGroupingIDs
{
  const __CFString *v3;

  v3 = CFSTR("com.apple.SceneKit.SCNScene");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v10;

  v6 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.SceneKit.SCNScene")))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scene"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scene"));
      v10 = v8;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *Mutable;
  __CFDictionary *v3;
  __CFDictionary *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  __CFDictionary *v10;
  void *v11;
  _QWORD v13[6];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("allowsCameraControl"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("b"));
  v13[0] = Mutable;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("autoenablesDefaultLighting"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("b"));
  v13[1] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("jitteringEnabled"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("b"));
  v13[2] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("loops"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("b"));
  v13[3] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("playing"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("b"));
  v13[4] = v6;
  v7 = (objc_class *)objc_opt_class(NSIndexPath);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("pointOfViewIndexPath"));
  if (v9)
    CFDictionaryAddValue(v10, CFSTR("propertyRuntimeType"), v9);
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeCustom"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("public.plain-text"));

  v13[5] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 6));

  return v11;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  id v10;
  NSString *v11;
  SEL v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  SEL v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v28[3];
  _QWORD v29[3];

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("pointOfViewIndexPath")))
  {
    v10 = v9;
    v11 = (NSString *)v8;
    if (-[NSString length](v11, "length"))
    {
      v12 = NSSelectorFromString(v11);
      if ((objc_opt_respondsToSelector(v10, v12) & 1) != 0)
      {
        v13 = v11;
        if (v13)
        {
LABEL_6:
          a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", v13));
LABEL_23:

          goto LABEL_24;
        }
      }
      else
      {
        if (-[NSString length](v11, "length") < 2)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseString](v11, "uppercaseString"));
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v11, "substringToIndex:", 1));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uppercaseString"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v11, "substringFromIndex:", 1));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", v16));

        }
        v18 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v17));
        v19 = NSSelectorFromString(v18);
        if ((objc_opt_respondsToSelector(v10, v19) & 1) != 0)
          v13 = v18;
        else
          v13 = 0;

        if (v13)
          goto LABEL_6;
      }
    }
    if (a6)
    {
      v20 = v11;
      if (v10)
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v10));
      else
        v21 = &stru_38A98;
      if (v20)
        v22 = v20;
      else
        v22 = &stru_38A98;
      v28[0] = CFSTR("propertyName");
      v28[1] = CFSTR("objectDescription");
      v29[0] = v22;
      v29[1] = v21;
      v28[2] = CFSTR("errorDescription");
      v29[2] = &stru_38A98;
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 3));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v24));

      v26 = objc_retainAutorelease(v25);
      *a6 = v26;

      v13 = 0;
      a6 = 0;
    }
    else
    {
      v13 = 0;
    }
    goto LABEL_23;
  }
  a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "__dbg_pointOfViewIndexPath"));
LABEL_24:

  return a6;
}

- (id)__dbg_pointOfViewIndexPath
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCNView pointOfView](self, "pointOfView"));
  if (!v3)
    goto LABEL_5;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCNView scene](self, "scene"));

  if (v4)
  {
    if ((objc_opt_respondsToSelector(SCNScene, "_indexPathForNode:") & 1) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[SCNScene _indexPathForNode:](SCNScene, "_indexPathForNode:", v3));
      goto LABEL_6;
    }
LABEL_5:
    v4 = 0;
  }
LABEL_6:

  return v4;
}

@end
