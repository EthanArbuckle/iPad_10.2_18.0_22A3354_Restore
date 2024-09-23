@implementation UISegmentedControl

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *v2;
  __CFDictionary *v3;
  __CFDictionary *v4;
  CFNumberRef v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  __CFDictionary *v8;
  void *v9;
  __CFDictionary *v11;
  __CFDictionary *v12;
  __CFDictionary *Mutable;
  uint64_t valuePtr;
  _QWORD v15[9];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("apportionsSegmentWidthsByContent"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("b"));
  v15[0] = Mutable;
  v12 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, CFSTR("propertyName"), CFSTR("momentary"));
  CFDictionaryAddValue(v12, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v12, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v12, CFSTR("propertyFormat"), CFSTR("b"));
  v15[1] = v12;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("numberOfSegments"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("NSUInteger"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("uinteger"));
  v15[2] = v11;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, CFSTR("propertyName"), CFSTR("selectedSegmentIndex"));
  CFDictionaryAddValue(v2, CFSTR("propertyRuntimeType"), CFSTR("NSInteger"));
  CFDictionaryAddValue(v2, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v2, CFSTR("propertyFormat"), CFSTR("integer"));
  v15[3] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("contentOffsetForInspectedSegment"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("CGSize"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeSize"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v15[4] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("imageForInspectedSegment"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("UIImage"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("public.png"));
  valuePtr = 1;
  v5 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v4, CFSTR("propertyOptions"), v5);
  CFRelease(v5);
  v15[5] = v4;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("isEnabledForInspectedSegment"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("b"));
  v15[6] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("titleForInspectedSegment"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v15[7] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("widthForInspectedSegment"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("CGf"));
  v15[8] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 9));

  return v9;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  __CFString *v10;
  uint64_t v11;
  const void **v12;
  id *v13;
  id v15;
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
  __CFString *valuePtr;
  _QWORD v34[2];

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("contentOffsetForInspectedSegment")))
  {
    objc_msgSend(v9, "__dbg_contentOffsetForSelectedSegment");
    valuePtr = v10;
    v34[0] = v11;
    v12 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
    *v12 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
    v12[1] = CFNumberCreate(0, kCFNumberCGFloatType, v34);
    a6 = (id *)CFArrayCreate(0, v12, 2, &kCFTypeArrayCallBacks);
    CFRelease(*v12);
    CFRelease(v12[1]);
    free(v12);
    goto LABEL_14;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("imageForInspectedSegment")))
  {
    if (objc_msgSend(v9, "selectedSegmentIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      a6 = 0;
      goto LABEL_14;
    }
    v13 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageForSegmentAtIndex:", objc_msgSend(v9, "selectedSegmentIndex")));
LABEL_13:
    a6 = v13;
    goto LABEL_14;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("isEnabledForInspectedSegment")))
  {
    v13 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v9, "__dbg_isEnabledForSelectedSegment")));
    goto LABEL_13;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("titleForInspectedSegment")))
  {
    v13 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "__dbg_titleForSelectedSegment"));
    goto LABEL_13;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("widthForInspectedSegment")))
  {
    objc_msgSend(v9, "__dbg_widthForSelectedSegment");
    v13 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    goto LABEL_13;
  }
  v15 = v9;
  v16 = v8;
  if (!objc_msgSend(v16, "length"))
    goto LABEL_27;
  v17 = NSSelectorFromString((NSString *)v16);
  if ((objc_opt_respondsToSelector(v15, v17) & 1) != 0)
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
    v18 = (objc_opt_respondsToSelector(v15, v24) & 1) != 0 ? v23 : 0;

  }
  if (v18)
  {
    a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForKey:", v18));
  }
  else
  {
LABEL_27:
    if (a6)
    {
      v25 = (__CFString *)v16;
      if (v15)
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v15));
      else
        v26 = &stru_38A98;
      if (v25)
        v27 = v25;
      else
        v27 = &stru_38A98;
      v32[0] = CFSTR("propertyName");
      v32[1] = CFSTR("objectDescription");
      valuePtr = v27;
      v34[0] = v26;
      v32[2] = CFSTR("errorDescription");
      v34[1] = &stru_38A98;
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &valuePtr, v32, 3));
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

LABEL_14:
  return a6;
}

- (BOOL)__dbg_hasValidSelectedSegmentIndex
{
  unint64_t v3;

  if (-[UISegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex") < 0)
    return 0;
  v3 = -[UISegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex");
  return v3 < -[UISegmentedControl numberOfSegments](self, "numberOfSegments");
}

- (CGSize)__dbg_contentOffsetForSelectedSegment
{
  double width;
  double height;
  CGSize result;

  if (-[UISegmentedControl __dbg_hasValidSelectedSegmentIndex](self, "__dbg_hasValidSelectedSegmentIndex"))
  {
    -[UISegmentedControl contentOffsetForSegmentAtIndex:](self, "contentOffsetForSegmentAtIndex:", -[UISegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex"));
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)__dbg_isEnabledForSelectedSegment
{
  _BOOL4 v3;

  v3 = -[UISegmentedControl __dbg_hasValidSelectedSegmentIndex](self, "__dbg_hasValidSelectedSegmentIndex");
  if (v3)
    LOBYTE(v3) = -[UISegmentedControl isEnabledForSegmentAtIndex:](self, "isEnabledForSegmentAtIndex:", -[UISegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex"));
  return v3;
}

- (id)__dbg_titleForSelectedSegment
{
  id v3;

  if (-[UISegmentedControl __dbg_hasValidSelectedSegmentIndex](self, "__dbg_hasValidSelectedSegmentIndex"))
    v3 = -[UISegmentedControl titleForSegmentAtIndex:](self, "titleForSegmentAtIndex:", -[UISegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex"));
  return 0;
}

- (double)__dbg_widthForSelectedSegment
{
  double result;

  if (!-[UISegmentedControl __dbg_hasValidSelectedSegmentIndex](self, "__dbg_hasValidSelectedSegmentIndex"))
    return 0.0;
  -[UISegmentedControl widthForSegmentAtIndex:](self, "widthForSegmentAtIndex:", -[UISegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex"));
  return result;
}

@end
