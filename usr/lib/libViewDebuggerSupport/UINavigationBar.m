@implementation UINavigationBar

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *Mutable;
  CFNumberRef v3;
  __CFDictionary *v4;
  CFNumberRef v5;
  __CFDictionary *v6;
  CFNumberRef v7;
  __CFDictionary *v8;
  __CFDictionary *v9;
  __CFDictionary *v10;
  __CFDictionary *v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  CFNumberRef v14;
  __CFDictionary *v15;
  __CFDictionary *v16;
  __CFDictionary *v17;
  __CFDictionary *v18;
  void *v19;
  void *v20;
  __CFDictionary *v22;
  __CFDictionary *v23;
  void *v24;
  __CFDictionary *v25;
  __CFDictionary *v26;
  __CFDictionary *v27;
  uint64_t valuePtr;
  _QWORD v29[6];
  _QWORD v30[11];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("backIndicatorImage"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("UIImage"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("public.png"));
  valuePtr = 1;
  v3 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(Mutable, CFSTR("propertyOptions"), v3);
  CFRelease(v3);
  v30[0] = Mutable;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("backIndicatorTransitionMaskImage"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("UIImage"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  v23 = v4;
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("public.png"));
  valuePtr = 1;
  v5 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v4, CFSTR("propertyOptions"), v5);
  CFRelease(v5);
  v30[1] = v4;
  v26 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v26, CFSTR("propertyName"), CFSTR("barTintColor"));
  CFDictionaryAddValue(v26, CFSTR("propertyRuntimeType"), CFSTR("UIColor"));
  CFDictionaryAddValue(v26, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  v30[2] = v26;
  v25 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v25, CFSTR("propertyName"), CFSTR("delegate"));
  CFDictionaryAddValue(v25, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v25, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v30[3] = v25;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("shadowImage"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("UIImage"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("public.png"));
  valuePtr = 1;
  v7 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v6, CFSTR("propertyOptions"), v7);
  CFRelease(v7);
  v30[4] = v6;
  v22 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v22, CFSTR("propertyName"), CFSTR("translucent"));
  CFDictionaryAddValue(v22, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v22, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v22, CFSTR("propertyFormat"), CFSTR("b"));
  v30[5] = v22;
  v8 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("barStyle"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("UIBarStyle"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("integer"));
  v30[6] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("titleFont"));
  CFDictionaryAddValue(v9, CFSTR("propertyRuntimeType"), CFSTR("UIFont"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeFont"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("font"));
  v30[7] = v9;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("titleTextColor"));
  CFDictionaryAddValue(v10, CFSTR("propertyRuntimeType"), CFSTR("UIColor"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  v30[8] = v10;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("titleTextShadowColor"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("UIColor"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  v30[9] = v11;
  v12 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, CFSTR("propertyName"), CFSTR("titleTextShadowOffset"));
  CFDictionaryAddValue(v12, CFSTR("propertyRuntimeType"), CFSTR("CGSize"));
  CFDictionaryAddValue(v12, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeSize"));
  CFDictionaryAddValue(v12, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v30[10] = v12;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 11));

  v27 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v27, CFSTR("propertyName"), CFSTR("prefersLargeTitles"));
  CFDictionaryAddValue(v27, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v27, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v27, CFSTR("propertyFormat"), CFSTR("b"));
  v29[0] = v27;
  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("dbg_hasLargeTitleTextAttributes"));
  CFDictionaryAddValue(v13, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v13, CFSTR("propertyFormat"), CFSTR("b"));
  valuePtr = 8;
  v14 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v13, CFSTR("visibility"), v14);
  CFRelease(v14);
  v29[1] = v13;
  v15 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, CFSTR("propertyName"), CFSTR("largeTitleFont"));
  CFDictionaryAddValue(v15, CFSTR("propertyRuntimeType"), CFSTR("UIFont"));
  CFDictionaryAddValue(v15, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeFont"));
  CFDictionaryAddValue(v15, CFSTR("propertyFormat"), CFSTR("font"));
  v29[2] = v15;
  v16 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, CFSTR("propertyName"), CFSTR("largeTitleTextColor"));
  CFDictionaryAddValue(v16, CFSTR("propertyRuntimeType"), CFSTR("UIColor"));
  CFDictionaryAddValue(v16, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  v29[3] = v16;
  v17 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, CFSTR("propertyName"), CFSTR("largeTitleTextShadowColor"));
  CFDictionaryAddValue(v17, CFSTR("propertyRuntimeType"), CFSTR("UIColor"));
  CFDictionaryAddValue(v17, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  v29[4] = v17;
  v18 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, CFSTR("propertyName"), CFSTR("largeTitleTextShadowOffset"));
  CFDictionaryAddValue(v18, CFSTR("propertyRuntimeType"), CFSTR("CGSize"));
  CFDictionaryAddValue(v18, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeSize"));
  CFDictionaryAddValue(v18, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v29[5] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 6));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v19));
  return v20;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  const NSAttributedStringKey *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  const NSAttributedStringKey *v18;
  void *v19;
  id *v20;
  id v21;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  const void **v26;
  void *v27;
  void *v28;
  __CFString *v29;
  uint64_t v30;
  const void **v31;
  id v32;
  SEL v33;
  NSString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSString *v39;
  SEL v40;
  __CFString *v41;
  const __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  id v47;
  __CFString *v48;
  _QWORD v49[3];
  __CFString *valuePtr;
  _QWORD v51[2];

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("largeTitleFont")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "largeTitleTextAttributes"));
    v11 = v10;
    v12 = &NSFontAttributeName;
LABEL_5:
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", *v12));
LABEL_6:
    v14 = (void *)v13;
LABEL_7:

    v15 = 1;
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("largeTitleTextColor")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "largeTitleTextAttributes"));
    v11 = v10;
    v12 = &NSForegroundColorAttributeName;
    goto LABEL_5;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("largeTitleTextShadowColor")))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "largeTitleTextAttributes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", NSShadowAttributeName));

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shadowColor"));
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("largeTitleTextShadowOffset")))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "largeTitleTextAttributes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", NSShadowAttributeName));

    objc_msgSend(v11, "shadowOffset");
    valuePtr = v24;
    v51[0] = v25;
    v26 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
    *v26 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
    v26[1] = CFNumberCreate(0, kCFNumberCGFloatType, v51);
    v14 = CFArrayCreate(0, v26, 2, &kCFTypeArrayCallBacks);
    CFRelease(*v26);
    CFRelease(v26[1]);
    free(v26);
    goto LABEL_7;
  }
  v15 = 0;
  v14 = 0;
LABEL_8:
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("dbg_hasLargeTitleTextAttributes")) & 1) == 0)
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("titleFont")))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleTextAttributes"));
      v17 = v16;
      v18 = &NSFontAttributeName;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("titleTextColor")))
      {
        if (!objc_msgSend(v8, "isEqualToString:", CFSTR("titleTextShadowColor")))
        {
          if (!objc_msgSend(v8, "isEqualToString:", CFSTR("titleTextShadowOffset")))
          {
            if ((v15 & 1) != 0)
              goto LABEL_21;
            v21 = v9;
            v32 = v8;
            if (!objc_msgSend(v32, "length"))
              goto LABEL_42;
            v33 = NSSelectorFromString((NSString *)v32);
            if ((objc_opt_respondsToSelector(v21, v33) & 1) != 0)
            {
              v34 = (NSString *)v32;
            }
            else
            {
              if ((unint64_t)objc_msgSend(v32, "length") < 2)
              {
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "uppercaseString"));
              }
              else
              {
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "substringToIndex:", 1));
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "uppercaseString"));
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "substringFromIndex:", 1));
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "stringByAppendingString:", v37));

              }
              v39 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v38));
              v40 = NSSelectorFromString(v39);
              v34 = (objc_opt_respondsToSelector(v21, v40) & 1) != 0 ? v39 : 0;

            }
            if (v34)
            {
              a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "valueForKey:", v34));
            }
            else
            {
LABEL_42:
              if (a6)
              {
                v41 = (__CFString *)v32;
                if (v21)
                  v42 = (const __CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v21));
                else
                  v42 = &stru_38A98;
                if (v41)
                  v43 = v41;
                else
                  v43 = &stru_38A98;
                v48 = (__CFString *)v42;
                v49[0] = CFSTR("propertyName");
                valuePtr = v43;
                v51[0] = v42;
                v49[1] = CFSTR("objectDescription");
                v49[2] = CFSTR("errorDescription");
                v51[1] = &stru_38A98;
                v44 = v43;
                v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &valuePtr, v49, 3));
                v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v45));

                v47 = objc_retainAutorelease(v46);
                *a6 = v47;

                v34 = 0;
                a6 = 0;
              }
              else
              {
                v34 = 0;
              }
            }

            goto LABEL_19;
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleTextAttributes"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", NSShadowAttributeName));

          objc_msgSend(v17, "shadowOffset");
          valuePtr = v29;
          v51[0] = v30;
          v31 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
          *v31 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
          v31[1] = CFNumberCreate(0, kCFNumberCGFloatType, v51);
          a6 = (id *)CFArrayCreate(0, v31, 2, &kCFTypeArrayCallBacks);
          CFRelease(*v31);
          CFRelease(v31[1]);
          free(v31);
LABEL_18:
          v21 = v14;
          v14 = v17;
LABEL_19:

          goto LABEL_20;
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleTextAttributes"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", NSShadowAttributeName));

        v20 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "shadowColor"));
LABEL_17:
        a6 = v20;
        goto LABEL_18;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleTextAttributes"));
      v17 = v16;
      v18 = &NSForegroundColorAttributeName;
    }
    v20 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", *v18));
    goto LABEL_17;
  }
  a6 = (id *)&__kCFBooleanTrue;
LABEL_20:

  v14 = a6;
LABEL_21:

  return v14;
}

@end
