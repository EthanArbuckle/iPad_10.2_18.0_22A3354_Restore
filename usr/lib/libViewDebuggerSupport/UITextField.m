@implementation UITextField

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *v2;
  CFNumberRef v3;
  __CFDictionary *v4;
  CFNumberRef v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  __CFDictionary *v8;
  __CFDictionary *v9;
  __CFDictionary *v10;
  __CFDictionary *v11;
  void *v12;
  __CFDictionary *v14;
  __CFDictionary *v15;
  __CFDictionary *v16;
  __CFDictionary *v17;
  __CFDictionary *v18;
  __CFDictionary *v19;
  __CFDictionary *v20;
  __CFDictionary *v21;
  __CFDictionary *v22;
  __CFDictionary *v23;
  __CFDictionary *v24;
  __CFDictionary *v25;
  __CFDictionary *v26;
  __CFDictionary *v27;
  __CFDictionary *v28;
  __CFDictionary *Mutable;
  uint64_t valuePtr;
  _QWORD v31[22];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("adjustsFontSizeToFitWidth"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("b"));
  v31[0] = Mutable;
  v28 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v28, CFSTR("propertyName"), CFSTR("allowsEditingTextAttributes"));
  CFDictionaryAddValue(v28, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v28, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v28, CFSTR("propertyFormat"), CFSTR("b"));
  v31[1] = v28;
  v27 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v27, CFSTR("propertyName"), CFSTR("attributedText"));
  CFDictionaryAddValue(v27, CFSTR("propertyRuntimeType"), CFSTR("NSAttributedString"));
  CFDictionaryAddValue(v27, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeAttributedString"));
  CFDictionaryAddValue(v27, CFSTR("propertyFormat"), CFSTR("attrStr"));
  v31[2] = v27;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, CFSTR("propertyName"), CFSTR("background"));
  CFDictionaryAddValue(v2, CFSTR("propertyRuntimeType"), CFSTR("UIImage"));
  CFDictionaryAddValue(v2, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  v26 = v2;
  CFDictionaryAddValue(v2, CFSTR("propertyFormat"), CFSTR("public.png"));
  valuePtr = 1;
  v3 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v2, CFSTR("propertyOptions"), v3);
  CFRelease(v3);
  v31[3] = v2;
  v25 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v25, CFSTR("propertyName"), CFSTR("clearsOnBeginEditing"));
  CFDictionaryAddValue(v25, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v25, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v25, CFSTR("propertyFormat"), CFSTR("b"));
  v31[4] = v25;
  v24 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v24, CFSTR("propertyName"), CFSTR("delegate"));
  CFDictionaryAddValue(v24, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v24, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v31[5] = v24;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("disabledBackground"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("UIImage"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  v23 = v4;
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("public.png"));
  valuePtr = 1;
  v5 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v4, CFSTR("propertyOptions"), v5);
  CFRelease(v5);
  v31[6] = v4;
  v22 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v22, CFSTR("propertyName"), CFSTR("enablesReturnKeyAutomatically"));
  CFDictionaryAddValue(v22, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v22, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v22, CFSTR("propertyFormat"), CFSTR("b"));
  v31[7] = v22;
  v21 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v21, CFSTR("propertyName"), CFSTR("minimumFontSize"));
  CFDictionaryAddValue(v21, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v21, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v21, CFSTR("propertyFormat"), CFSTR("CGf"));
  v31[8] = v21;
  v20 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v20, CFSTR("propertyName"), CFSTR("placeholder"));
  CFDictionaryAddValue(v20, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v20, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v20, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v31[9] = v20;
  v19 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v19, CFSTR("propertyName"), CFSTR("secureTextEntry"));
  CFDictionaryAddValue(v19, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v19, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v19, CFSTR("propertyFormat"), CFSTR("b"));
  v31[10] = v19;
  v18 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, CFSTR("propertyName"), CFSTR("text"));
  CFDictionaryAddValue(v18, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v18, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v18, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v31[11] = v18;
  v17 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, CFSTR("propertyName"), CFSTR("textColor"));
  CFDictionaryAddValue(v17, CFSTR("propertyRuntimeType"), CFSTR("UIColor"));
  CFDictionaryAddValue(v17, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  v31[12] = v17;
  v16 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, CFSTR("propertyName"), CFSTR("autocapitalizationType"));
  CFDictionaryAddValue(v16, CFSTR("propertyRuntimeType"), CFSTR("UITextAutocapitalizationType"));
  CFDictionaryAddValue(v16, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v16, CFSTR("propertyFormat"), CFSTR("integer"));
  v31[13] = v16;
  v15 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, CFSTR("propertyName"), CFSTR("autocorrectionType"));
  CFDictionaryAddValue(v15, CFSTR("propertyRuntimeType"), CFSTR("UITextAutocorrectionType"));
  CFDictionaryAddValue(v15, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v15, CFSTR("propertyFormat"), CFSTR("integer"));
  v31[14] = v15;
  v14 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, CFSTR("propertyName"), CFSTR("borderStyle"));
  CFDictionaryAddValue(v14, CFSTR("propertyRuntimeType"), CFSTR("UITextBorderStyle"));
  CFDictionaryAddValue(v14, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v14, CFSTR("propertyFormat"), CFSTR("integer"));
  v31[15] = v14;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("clearButtonMode"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("UITextFieldViewMode"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("integer"));
  v31[16] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("font"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("UIFont"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeFont"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("font"));
  v31[17] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("keyboardAppearance"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("UIKeyboardAppearance"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("integer"));
  v31[18] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("keyboardType"));
  CFDictionaryAddValue(v9, CFSTR("propertyRuntimeType"), CFSTR("UIKeyboardType"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("integer"));
  v31[19] = v9;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("returnKeyType"));
  CFDictionaryAddValue(v10, CFSTR("propertyRuntimeType"), CFSTR("UIReturnKeyType"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("integer"));
  v31[20] = v10;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("textAlignment"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("NSHashTableCallBacks"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("uinteger"));
  v31[21] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 22));

  return v12;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  id v10;
  id *v11;
  id v13;
  id v14;
  id v15;
  SEL v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  SEL v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[3];
  _QWORD v32[3];

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("autocapitalizationType")))
  {
    v10 = objc_msgSend(v9, "autocapitalizationType");
LABEL_11:
    v11 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
LABEL_12:
    a6 = v11;
    goto LABEL_13;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("autocorrectionType")))
  {
    v10 = objc_msgSend(v9, "autocorrectionType");
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("keyboardAppearance")))
  {
    v10 = objc_msgSend(v9, "keyboardAppearance");
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("keyboardType")))
  {
    v10 = objc_msgSend(v9, "keyboardType");
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("returnKeyType")))
  {
    v10 = objc_msgSend(v9, "returnKeyType");
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("enablesReturnKeyAutomatically")))
  {
    v13 = objc_msgSend(v9, "enablesReturnKeyAutomatically");
LABEL_18:
    v11 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v13));
    goto LABEL_12;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("secureTextEntry")))
  {
    v13 = objc_msgSend(v9, "isSecureTextEntry");
    goto LABEL_18;
  }
  v14 = v9;
  v15 = v8;
  if (!objc_msgSend(v15, "length"))
    goto LABEL_31;
  v16 = NSSelectorFromString((NSString *)v15);
  if ((objc_opt_respondsToSelector(v14, v16) & 1) != 0)
  {
    v17 = (NSString *)v15;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v15, "length") < 2)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uppercaseString"));
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringToIndex:", 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uppercaseString"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringFromIndex:", 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingString:", v20));

    }
    v22 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v21));
    v23 = NSSelectorFromString(v22);
    v17 = (objc_opt_respondsToSelector(v14, v23) & 1) != 0 ? v22 : 0;

  }
  if (v17)
  {
    a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", v17));
  }
  else
  {
LABEL_31:
    if (a6)
    {
      v24 = (__CFString *)v15;
      if (v14)
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v14));
      else
        v25 = &stru_38A98;
      if (v24)
        v26 = v24;
      else
        v26 = &stru_38A98;
      v31[0] = CFSTR("propertyName");
      v31[1] = CFSTR("objectDescription");
      v32[0] = v26;
      v32[1] = v25;
      v31[2] = CFSTR("errorDescription");
      v32[2] = &stru_38A98;
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v28));

      v30 = objc_retainAutorelease(v29);
      *a6 = v30;

      v17 = 0;
      a6 = 0;
    }
    else
    {
      v17 = 0;
    }
  }

LABEL_13:
  return a6;
}

@end
