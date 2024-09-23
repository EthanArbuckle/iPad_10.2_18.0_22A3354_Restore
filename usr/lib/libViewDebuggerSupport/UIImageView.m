@implementation UIImageView

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *Mutable;
  __CFDictionary *v3;
  CFNumberRef v4;
  __CFDictionary *v5;
  CFNumberRef v6;
  __CFDictionary *v7;
  __CFDictionary *v8;
  __CFDictionary *v9;
  void *v10;
  void *v11;
  void *v13;
  uint64_t valuePtr;
  _QWORD v15[2];
  _QWORD v16[4];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("highlighted"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("b"));
  v16[0] = Mutable;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("highlightedImage"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("UIImage"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("public.png"));
  valuePtr = 1;
  v4 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v3, CFSTR("propertyOptions"), v4);
  CFRelease(v4);
  v16[1] = v3;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("image"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("UIImage"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("public.png"));
  valuePtr = 1;
  v6 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v5, CFSTR("propertyOptions"), v6);
  CFRelease(v6);
  v16[2] = v5;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("dbg_holdsSymbolImage"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("b"));
  v16[3] = v7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 4));

  v8 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("preferredSymbolConfigurationSummary"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v15[0] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("displaySymbolConfigurationSummary"));
  CFDictionaryAddValue(v9, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v15[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v10));
  return v11;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id *v12;
  uint64_t CurrentImage;
  id v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  uint64_t v19;
  void *v20;
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
  _QWORD v36[3];
  _QWORD v37[3];

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("preferredSymbolConfigurationSummary")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("displaySymbolConfigurationSummary")))
    {
      CurrentImage = _UIImageViewGetCurrentImage(v9);
      v10 = (id)objc_claimAutoreleasedReturnValue(CurrentImage);
      a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "symbolConfiguration"));

      if (!a6)
        goto LABEL_12;
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "symbolConfiguration"));
      v15 = _UIImageSymbolConfigurationTextualSummary();
      v16 = (id *)objc_claimAutoreleasedReturnValue(v15);
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("dbg_holdsSymbolImage")))
      {
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("image")))
        {
          v19 = _UIImageViewGetCurrentImage(v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v10 = v20;
          if (v20)
            v12 = v20;
          else
            v12 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "image"));
          goto LABEL_4;
        }
        v10 = v9;
        v14 = v8;
        if (!objc_msgSend(v14, "length"))
          goto LABEL_30;
        v21 = NSSelectorFromString((NSString *)v14);
        if ((objc_opt_respondsToSelector(v10, v21) & 1) != 0)
        {
          v22 = (NSString *)v14;
        }
        else
        {
          if ((unint64_t)objc_msgSend(v14, "length") < 2)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uppercaseString"));
          }
          else
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringToIndex:", 1));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "uppercaseString"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringFromIndex:", 1));
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
LABEL_30:
          if (a6)
          {
            v29 = (__CFString *)v14;
            if (v10)
              v30 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v10));
            else
              v30 = &stru_38A98;
            if (v29)
              v31 = v29;
            else
              v31 = &stru_38A98;
            v36[0] = CFSTR("propertyName");
            v36[1] = CFSTR("objectDescription");
            v37[0] = v31;
            v37[1] = v30;
            v36[2] = CFSTR("errorDescription");
            v37[2] = &stru_38A98;
            v32 = v31;
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 3));
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

LABEL_11:
        goto LABEL_12;
      }
      v17 = _UIImageViewGetCurrentImage(v9);
      v10 = (id)objc_claimAutoreleasedReturnValue(v17);
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "symbolConfiguration"));
      v16 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14 != 0));
    }
    a6 = v16;
    goto LABEL_11;
  }
  a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "preferredSymbolConfiguration"));

  if (a6)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "preferredSymbolConfiguration"));
    v11 = _UIImageSymbolConfigurationTextualSummary();
    v12 = (id *)objc_claimAutoreleasedReturnValue(v11);
LABEL_4:
    a6 = v12;
LABEL_12:

  }
  return a6;
}

@end
