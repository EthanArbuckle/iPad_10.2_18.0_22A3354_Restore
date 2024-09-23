@implementation UIDocumentPickerExtensionViewController

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *Mutable;
  __CFDictionary *v3;
  __CFDictionary *v4;
  __CFDictionary *v5;
  void *v6;
  _QWORD v8[4];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("providerIdentifier"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v8[0] = Mutable;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("documentPickerMode"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("UIDocumentPickerMode"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("uinteger"));
  v8[1] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("originalURL"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("NSURL"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeCustom"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v8[2] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("documentStorageURL"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("NSURL"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeCustom"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v8[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 4));

  return v6;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  void *v10;
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
  _QWORD v29[3];
  _QWORD v30[3];

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("originalURL")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("originalURL")))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "documentStorageURL"));
      goto LABEL_5;
    }
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
LABEL_9:
          a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", v14));
LABEL_26:

          goto LABEL_27;
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
          goto LABEL_9;
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
      v29[0] = CFSTR("propertyName");
      v29[1] = CFSTR("objectDescription");
      v30[0] = v23;
      v30[1] = v22;
      v29[2] = CFSTR("errorDescription");
      v30[2] = &stru_38A98;
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 3));
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
    goto LABEL_26;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originalURL"));
LABEL_5:
  v11 = v10;
  a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
LABEL_27:

  return a6;
}

@end
