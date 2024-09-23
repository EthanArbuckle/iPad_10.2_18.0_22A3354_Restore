@implementation CAMetalLayer

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
  __CFDictionary *Mutable;
  _QWORD v13[9];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("deviceName"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v13[0] = Mutable;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("preferredDeviceName"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v13[1] = v11;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("pixelFormatName"));
  CFDictionaryAddValue(v10, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v13[2] = v10;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, CFSTR("propertyName"), CFSTR("colorSpaceName"));
  CFDictionaryAddValue(v2, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v2, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v2, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v13[3] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("drawableSize"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("CGSize"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeSize"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v13[4] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("framebufferOnly"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("b"));
  v13[5] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("maximumDrawableCount"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("NSUInteger"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("uinteger"));
  v13[6] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("presentsWithTransaction"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("b"));
  v13[7] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("allowsNextDrawableTimeout"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("b"));
  v13[8] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 9));

  return v8;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t Name;
  const char *v14;
  id *v15;
  id v16;
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
  _QWORD v32[3];
  _QWORD v33[3];

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("deviceName")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "device"));
LABEL_5:
    v11 = v10;
    a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
LABEL_6:

    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("preferredDeviceName")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "preferredDevice"));
    goto LABEL_5;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("pixelFormatName")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("colorSpaceName")))
    {
      a6 = (id *)CGColorSpaceCopyName((CGColorSpaceRef)objc_msgSend(v9, "colorspace"));
      goto LABEL_7;
    }
    v11 = v9;
    v16 = v8;
    if (!objc_msgSend(v16, "length"))
      goto LABEL_28;
    v17 = NSSelectorFromString((NSString *)v16);
    if ((objc_opt_respondsToSelector(v11, v17) & 1) != 0)
    {
      v18 = (NSString *)v16;
    }
    else
    {
      if ((unint64_t)objc_msgSend(v16, "length") < 2)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uppercaseString"));
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringToIndex:", 1));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uppercaseString"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringFromIndex:", 1));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingString:", v21));

      }
      v23 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v22));
      v24 = NSSelectorFromString(v23);
      v18 = (objc_opt_respondsToSelector(v11, v24) & 1) != 0 ? v23 : 0;

    }
    if (v18)
    {
      a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", v18));
    }
    else
    {
LABEL_28:
      if (a6)
      {
        v25 = (__CFString *)v16;
        if (v11)
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v11));
        else
          v26 = &stru_38A98;
        if (v25)
          v27 = v25;
        else
          v27 = &stru_38A98;
        v32[0] = CFSTR("propertyName");
        v32[1] = CFSTR("objectDescription");
        v33[0] = v27;
        v33[1] = v26;
        v32[2] = CFSTR("errorDescription");
        v33[2] = &stru_38A98;
        v28 = v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 3));
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
    }

    goto LABEL_6;
  }
  Name = MTLPixelFormatGetName(objc_msgSend(v9, "pixelFormat"));
  if (Name)
    v14 = (const char *)Name;
  else
    v14 = "Invalid";
  a6 = (id *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v14));
  if (objc_msgSend(a6, "hasPrefix:", CFSTR("MTLPixelFormat")))
  {
    v15 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(a6, "substringFromIndex:", objc_msgSend(CFSTR("MTLPixelFormat"), "length")));

    a6 = v15;
  }
LABEL_7:

  return a6;
}

@end
