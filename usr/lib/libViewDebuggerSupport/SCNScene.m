@implementation SCNScene

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  objc_class *v2;
  NSString *v3;
  id v4;
  __CFDictionary *Mutable;
  CFNumberRef v6;
  CFNumberRef v7;
  NSString *v8;
  void *v9;
  id v10;
  __CFDictionary *v11;
  CFNumberRef v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v2 = (objc_class *)a1;
  if (a1)
  {
    if (object_isClass(a1))
    {
      v3 = NSStringFromClass(v2);
      a1 = (id)objc_claimAutoreleasedReturnValue(v3);
    }
    else
    {
      a1 = 0;
    }
  }
  v4 = a1;
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("encodedPresentationScene"));
  if (v4)
    CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), v4);
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeData"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("public.data"));
  v15 = 8;
  v6 = CFNumberCreate(0, kCFNumberCFIndexType, &v15);
  CFDictionaryAddValue(Mutable, CFSTR("visibility"), v6);
  CFRelease(v6);
  v15 = 1;
  v7 = CFNumberCreate(0, kCFNumberCFIndexType, &v15);
  CFDictionaryAddValue(Mutable, CFSTR("propertyOptions"), v7);
  CFRelease(v7);

  v16[0] = Mutable;
  if (v2 && object_isClass(v2))
  {
    v8 = NSStringFromClass(v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("encodedScene"));
  if (v10)
    CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), v10);
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeData"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("public.data"));
  v15 = 1;
  v12 = CFNumberCreate(0, kCFNumberCFIndexType, &v15);
  CFDictionaryAddValue(v11, CFSTR("propertyOptions"), v12);
  CFRelease(v12);

  v16[1] = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));

  return v13;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  Class v10;
  id v11;
  void *v12;
  id v13;
  NSString *v14;
  SEL v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  SEL v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("encodedScene")) & 1) == 0
    && !objc_msgSend(v8, "isEqualToString:", CFSTR("encodedPresentationScene")))
  {
    v13 = v9;
    v14 = (NSString *)v8;
    if (-[NSString length](v14, "length"))
    {
      v15 = NSSelectorFromString(v14);
      if ((objc_opt_respondsToSelector(v13, v15) & 1) != 0)
      {
        v16 = v14;
        if (v16)
        {
LABEL_9:
          a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", v16));
LABEL_26:

          goto LABEL_27;
        }
      }
      else
      {
        if (-[NSString length](v14, "length") < 2)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseString](v14, "uppercaseString"));
        }
        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v14, "substringToIndex:", 1));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uppercaseString"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v14, "substringFromIndex:", 1));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingString:", v19));

        }
        v21 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v20));
        v22 = NSSelectorFromString(v21);
        if ((objc_opt_respondsToSelector(v13, v22) & 1) != 0)
          v16 = v21;
        else
          v16 = 0;

        if (v16)
          goto LABEL_9;
      }
    }
    if (a6)
    {
      v23 = v14;
      if (v13)
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v13));
      else
        v24 = &stru_38A98;
      if (v23)
        v25 = v23;
      else
        v25 = &stru_38A98;
      v33[0] = CFSTR("propertyName");
      v33[1] = CFSTR("objectDescription");
      v34[0] = v25;
      v34[1] = v24;
      v33[2] = CFSTR("errorDescription");
      v34[2] = &stru_38A98;
      v26 = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 3));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v27));

      v29 = objc_retainAutorelease(v28);
      *a6 = v29;

      v16 = 0;
      a6 = 0;
    }
    else
    {
      v16 = 0;
    }
    goto LABEL_26;
  }
  v10 = NSClassFromString(CFSTR("SCNKeyedArchiver"));
  if ((objc_opt_respondsToSelector(v10, "archivedDataWithRootObject:options:") & 1) != 0)
  {
    v11 = objc_msgSend(v8, "isEqualToString:", CFSTR("encodedPresentationScene"));
    v31[0] = SCNSceneExportEmbedImages;
    v31[1] = SCNSceneExportEmbedReferences;
    v32[0] = &__kCFBooleanTrue;
    v32[1] = &__kCFBooleanTrue;
    v31[2] = SCNSceneExportPresentationTree;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
    v32[2] = v12;
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3));

    a6 = (id *)objc_claimAutoreleasedReturnValue(-[objc_class archivedDataWithRootObject:options:](v10, "archivedDataWithRootObject:options:", v9, v13));
LABEL_27:

    goto LABEL_28;
  }
  a6 = 0;
LABEL_28:

  return a6;
}

@end
