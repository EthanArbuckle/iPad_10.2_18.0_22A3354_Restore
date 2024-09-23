@implementation UIScreen

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *v2;
  __CFDictionary *v3;
  __CFDictionary *v4;
  __CFDictionary *v5;
  CFNumberRef v6;
  __CFDictionary *v7;
  CFNumberRef v8;
  void *v9;
  __CFDictionary *v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  __CFDictionary *v14;
  __CFDictionary *v15;
  __CFDictionary *v16;
  __CFDictionary *Mutable;
  uint64_t valuePtr;
  _QWORD v19[12];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("bounds"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("CGRect"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeRect"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v19[0] = Mutable;
  v16 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, CFSTR("propertyName"), CFSTR("maximumFramesPerSecond"));
  CFDictionaryAddValue(v16, CFSTR("propertyRuntimeType"), CFSTR("NSInteger"));
  CFDictionaryAddValue(v16, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v16, CFSTR("propertyFormat"), CFSTR("integer"));
  v19[1] = v16;
  v15 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, CFSTR("propertyName"), CFSTR("nativeBounds"));
  CFDictionaryAddValue(v15, CFSTR("propertyRuntimeType"), CFSTR("CGRect"));
  CFDictionaryAddValue(v15, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeRect"));
  CFDictionaryAddValue(v15, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v19[2] = v15;
  v14 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, CFSTR("propertyName"), CFSTR("nativeScale"));
  CFDictionaryAddValue(v14, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v14, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v14, CFSTR("propertyFormat"), CFSTR("CGf"));
  v19[3] = v14;
  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("scale"));
  CFDictionaryAddValue(v13, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v13, CFSTR("propertyFormat"), CFSTR("CGf"));
  v19[4] = v13;
  v12 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, CFSTR("propertyName"), CFSTR("wantsSoftwareDimming"));
  CFDictionaryAddValue(v12, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v12, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v12, CFSTR("propertyFormat"), CFSTR("b"));
  v19[5] = v12;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("displayCornerRadius"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("CGf"));
  v19[6] = v11;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, CFSTR("propertyName"), CFSTR("isMainScreen"));
  CFDictionaryAddValue(v2, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v2, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v2, CFSTR("propertyFormat"), CFSTR("b"));
  v19[7] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("nativeDisplayBounds"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("CGRect"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeRect"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v19[8] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("pointsPerInch"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("CGf"));
  v19[9] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("dbgScreenShapeIsRectangular"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("b"));
  valuePtr = 4;
  v6 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v5, CFSTR("visibility"), v6);
  CFRelease(v6);
  v19[10] = v5;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("dbgScreenShape"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("DBGScreenShape"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("integer"));
  valuePtr = 4;
  v8 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("visibility"), v8);
  CFRelease(v8);
  v19[11] = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 12));

  return v9;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  id *v10;
  id v12;
  _BOOL8 v13;
  uint64_t IsRectangular;
  uint64_t v15;
  NSNumber *v16;
  id v17;
  id v18;
  SEL v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *v25;
  SEL v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[3];
  _QWORD v35[3];

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("displayCornerRadius")))
  {
    objc_msgSend(v9, "__dbg_traitCollectionDisplayCornerRadius");
LABEL_6:
    v10 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
LABEL_7:
    a6 = v10;
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("pointsPerInch")))
  {
    if ((objc_opt_respondsToSelector(v9, "_pointsPerInch") & 1) == 0)
    {
      a6 = (id *)&off_55158;
      goto LABEL_8;
    }
    objc_msgSend(v9, "_pointsPerInch");
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("nativeDisplayBounds")))
  {
    if ((objc_opt_respondsToSelector(v9, "_nativeDisplayBounds") & 1) != 0)
    {
      objc_msgSend(v9, "_nativeDisplayBounds");
      v10 = (id *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:"));
      goto LABEL_7;
    }
LABEL_19:
    a6 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("isMainScreen")))
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    v13 = v12 == v9;

    IsRectangular = v13;
    goto LABEL_18;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("dbgScreenShapeIsRectangular")))
  {
    if (_UIScreenTypePrivateForScreen(v9) == -1)
      goto LABEL_19;
    v15 = _UIScreenTypePrivateForScreen(v9);
    IsRectangular = _UIScreenTypePrivateIsRectangular(v15);
LABEL_18:
    v10 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", IsRectangular));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("dbgScreenShape")))
  {
    v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", __dbg_ScreenShape());
    v10 = (id *)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_7;
  }
  v17 = v9;
  v18 = v8;
  if (!objc_msgSend(v18, "length"))
    goto LABEL_34;
  v19 = NSSelectorFromString((NSString *)v18);
  if ((objc_opt_respondsToSelector(v17, v19) & 1) != 0)
  {
    v20 = (NSString *)v18;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v18, "length") < 2)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uppercaseString"));
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "substringToIndex:", 1));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uppercaseString"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "substringFromIndex:", 1));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingString:", v23));

    }
    v25 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v24));
    v26 = NSSelectorFromString(v25);
    v20 = (objc_opt_respondsToSelector(v17, v26) & 1) != 0 ? v25 : 0;

  }
  if (v20)
  {
    a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", v20));
  }
  else
  {
LABEL_34:
    if (a6)
    {
      v27 = (__CFString *)v18;
      if (v17)
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v17));
      else
        v28 = &stru_38A98;
      if (v27)
        v29 = v27;
      else
        v29 = &stru_38A98;
      v34[0] = CFSTR("propertyName");
      v34[1] = CFSTR("objectDescription");
      v35[0] = v29;
      v35[1] = v28;
      v34[2] = CFSTR("errorDescription");
      v35[2] = &stru_38A98;
      v30 = v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 3));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v31));

      v33 = objc_retainAutorelease(v32);
      *a6 = v33;

      v20 = 0;
      a6 = 0;
    }
    else
    {
      v20 = 0;
    }
  }

LABEL_8:
  return a6;
}

- (double)__dbg_traitCollectionDisplayCornerRadius
{
  void *v3;
  SEL v4;
  char v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIScreen traitCollection](self, "traitCollection"));
  v4 = NSSelectorFromString(CFSTR("displayCornerRadius"));
  v5 = objc_opt_respondsToSelector(v3, v4);

  if ((v5 & 1) == 0)
    return 0.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIScreen traitCollection](self, "traitCollection"));
  objc_msgSend(v6, "displayCornerRadius");
  v8 = v7;

  return v8;
}

@end
