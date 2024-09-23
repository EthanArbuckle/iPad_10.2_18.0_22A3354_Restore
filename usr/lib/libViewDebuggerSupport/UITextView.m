@implementation UITextView

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
  __CFDictionary *v14;
  __CFDictionary *v15;
  __CFDictionary *v16;
  __CFDictionary *v17;
  __CFDictionary *v18;
  __CFDictionary *v19;
  __CFDictionary *Mutable;
  _QWORD v21[17];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("allowsEditingTextAttributes"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("b"));
  v21[0] = Mutable;
  v19 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v19, CFSTR("propertyName"), CFSTR("attributedText"));
  CFDictionaryAddValue(v19, CFSTR("propertyRuntimeType"), CFSTR("NSAttributedString"));
  CFDictionaryAddValue(v19, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeAttributedString"));
  CFDictionaryAddValue(v19, CFSTR("propertyFormat"), CFSTR("attrStr"));
  v21[1] = v19;
  v18 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, CFSTR("propertyName"), CFSTR("delegate"));
  CFDictionaryAddValue(v18, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v18, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v21[2] = v18;
  v17 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, CFSTR("propertyName"), CFSTR("editable"));
  CFDictionaryAddValue(v17, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v17, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v17, CFSTR("propertyFormat"), CFSTR("b"));
  v21[3] = v17;
  v16 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, CFSTR("propertyName"), CFSTR("enablesReturnKeyAutomatically"));
  CFDictionaryAddValue(v16, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v16, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v16, CFSTR("propertyFormat"), CFSTR("b"));
  v21[4] = v16;
  v15 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, CFSTR("propertyName"), CFSTR("secureTextEntry"));
  CFDictionaryAddValue(v15, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v15, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v15, CFSTR("propertyFormat"), CFSTR("b"));
  v21[5] = v15;
  v14 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, CFSTR("propertyName"), CFSTR("selectable"));
  CFDictionaryAddValue(v14, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v14, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v14, CFSTR("propertyFormat"), CFSTR("b"));
  v21[6] = v14;
  v12 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, CFSTR("propertyName"), CFSTR("text"));
  CFDictionaryAddValue(v12, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v12, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v12, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v21[7] = v12;
  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("textColor"));
  CFDictionaryAddValue(v13, CFSTR("propertyRuntimeType"), CFSTR("UIColor"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  v21[8] = v13;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("autocapitalizationType"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("UITextAutocapitalizationType"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("integer"));
  v21[9] = v11;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("autocorrectionType"));
  CFDictionaryAddValue(v10, CFSTR("propertyRuntimeType"), CFSTR("UITextAutocorrectionType"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("integer"));
  v21[10] = v10;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, CFSTR("propertyName"), CFSTR("dataDetectorTypes"));
  CFDictionaryAddValue(v2, CFSTR("propertyRuntimeType"), CFSTR("UIDataDetectorTypes"));
  CFDictionaryAddValue(v2, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v2, CFSTR("propertyFormat"), CFSTR("uinteger"));
  v21[11] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("font"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("UIFont"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeFont"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("font"));
  v21[12] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("keyboardAppearance"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("UIKeyboardAppearance"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("uinteger"));
  v21[13] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("keyboardType"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("UIKeyboardType"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("integer"));
  v21[14] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("returnKeyType"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("UIReturnKeyType"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("integer"));
  v21[15] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("textAlignment"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("NSTextAlignment"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("integer"));
  v21[16] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 17));

  return v8;
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
