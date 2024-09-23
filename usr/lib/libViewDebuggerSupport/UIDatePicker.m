@implementation UIDatePicker

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *v2;
  __CFDictionary *v3;
  __CFDictionary *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  void *v8;
  __CFDictionary *Mutable;
  _QWORD v11[7];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("countDownDuration"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("CGf"));
  v11[0] = Mutable;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, CFSTR("propertyName"), CFSTR("minuteInterval"));
  CFDictionaryAddValue(v2, CFSTR("propertyRuntimeType"), CFSTR("NSInteger"));
  CFDictionaryAddValue(v2, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v2, CFSTR("propertyFormat"), CFSTR("integer"));
  v11[1] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("date"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v11[2] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("datePickerMode"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("UIDatePickerMode"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("integer"));
  v11[3] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("localeIdentifier"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v11[4] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("maximumDate"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v11[5] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("minimumDate"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v11[6] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 7));

  return v8;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id *v12;
  id v14;
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
  _QWORD v30[3];
  _QWORD v31[3];

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("date")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
LABEL_9:
    v11 = v10;
    v12 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("localeIdentifier")))
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "locale"));
    v12 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localeIdentifier"));
LABEL_10:
    a6 = v12;
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("maximumDate")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "maximumDate"));
    goto LABEL_9;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("minimumDate")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "minimumDate"));
    goto LABEL_9;
  }
  v11 = v9;
  v14 = v8;
  if (!objc_msgSend(v14, "length"))
    goto LABEL_24;
  v15 = NSSelectorFromString((NSString *)v14);
  if ((objc_opt_respondsToSelector(v11, v15) & 1) != 0)
  {
    v16 = (NSString *)v14;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v14, "length") < 2)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uppercaseString"));
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringToIndex:", 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uppercaseString"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringFromIndex:", 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingString:", v19));

    }
    v21 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v20));
    v22 = NSSelectorFromString(v21);
    v16 = (objc_opt_respondsToSelector(v11, v22) & 1) != 0 ? v21 : 0;

  }
  if (v16)
  {
    a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", v16));
  }
  else
  {
LABEL_24:
    if (a6)
    {
      v23 = (__CFString *)v14;
      if (v11)
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v11));
      else
        v24 = &stru_38A98;
      if (v23)
        v25 = v23;
      else
        v25 = &stru_38A98;
      v30[0] = CFSTR("propertyName");
      v30[1] = CFSTR("objectDescription");
      v31[0] = v25;
      v31[1] = v24;
      v30[2] = CFSTR("errorDescription");
      v31[2] = &stru_38A98;
      v26 = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 3));
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
  }

LABEL_11:
  return a6;
}

@end
