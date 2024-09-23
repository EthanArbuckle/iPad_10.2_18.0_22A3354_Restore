@implementation NSValue

- (id)debugHierarchyValueForObjCType_CGVector
{
  uint64_t v2;
  uint64_t v3;
  const void **v4;
  CFArrayRef v5;
  uint64_t valuePtr;
  uint64_t v8;

  -[NSValue CGVectorValue](self, "CGVectorValue");
  valuePtr = v2;
  v8 = v3;
  v4 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
  *v4 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  v4[1] = CFNumberCreate(0, kCFNumberCGFloatType, &v8);
  v5 = CFArrayCreate(0, v4, 2, &kCFTypeArrayCallBacks);
  CFRelease(*v4);
  CFRelease(v4[1]);
  free(v4);
  return v5;
}

- (id)debugHierarchyValueForObjCType_CGAffineTransform
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  double v12[3];
  _QWORD v13[6];

  v11 = 0u;
  *(_OWORD *)v12 = 0u;
  v10 = 0u;
  -[NSValue CGAffineTransformValue](self, "CGAffineTransformValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&v10));
  v13[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *((double *)&v10 + 1)));
  v13[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&v11));
  v13[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *((double *)&v11 + 1)));
  v13[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12[0]));
  v13[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12[1]));
  v13[5] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 6));

  return v8;
}

- (id)debugHierarchyValueForObjCType_UIEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  -[NSValue UIEdgeInsetsValue](self, "UIEdgeInsetsValue");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v14[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v3));
  v14[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5));
  v14[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
  v14[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 4));

  return v12;
}

- (id)debugHierarchyValueForObjCType_NSDirectionalEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  -[NSValue directionalEdgeInsetsValue](self, "directionalEdgeInsetsValue");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v14[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v3));
  v14[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5));
  v14[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
  v14[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 4));

  return v12;
}

- (id)debugHierarchyValueForObjCType_UIOffset
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  -[NSValue UIOffsetValue](self, "UIOffsetValue");
  v3 = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v8[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v3));
  v8[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));

  return v6;
}

- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4
{
  uint64_t v6;
  NSValue *v8;
  void *v9;
  char *v10;
  BOOL v11;
  uint64_t v12;
  NSString *v13;
  SEL v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[3];
  _QWORD v23[3];

  v6 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(self, v6) & 1) != 0)
    return self;
  v8 = objc_retainAutorelease(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", -[NSValue objCType](v8, "objCType"), 4));
  v10 = (char *)objc_msgSend(v9, "rangeOfString:", CFSTR("="));
  if (objc_msgSend(v9, "hasPrefix:", CFSTR("{")))
    v11 = v10 == (char *)0x7FFFFFFFFFFFFFFFLL;
  else
    v11 = 1;
  if (!v11)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringWithRange:", 1, v10 - 1));

    v9 = (void *)v12;
  }
  v13 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("debugHierarchyValueForObjCType_"), "stringByAppendingString:", v9));
  v14 = NSSelectorFromString(v13);
  if ((objc_opt_respondsToSelector(v8, v14) & 1) != 0)
  {
    a4 = (id *)objc_claimAutoreleasedReturnValue(-[NSValue performSelector:](v8, "performSelector:", v14));
  }
  else if (a4)
  {
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to provide DebugHierarchy value for NSValue (%@). Dynamic method look up failed for: -%@."), v9, v13));
    if (v8)
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v8));
    else
      v16 = &stru_38A98;
    if (v15)
      v17 = v15;
    else
      v17 = &stru_38A98;
    v22[0] = CFSTR("propertyName");
    v22[1] = CFSTR("objectDescription");
    v23[0] = &stru_38A98;
    v23[1] = v16;
    v22[2] = CFSTR("errorDescription");
    v23[2] = v17;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 3));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 101, v19));

    v21 = objc_retainAutorelease(v20);
    *a4 = v21;

    a4 = 0;
  }

  return a4;
}

- (id)debugHierarchyValueForObjCType_CGPoint
{
  uint64_t v2;
  uint64_t v3;
  const void **v4;
  CFArrayRef v5;
  uint64_t valuePtr;
  uint64_t v8;

  -[NSValue CGPointValue](self, "CGPointValue");
  valuePtr = v2;
  v8 = v3;
  v4 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
  *v4 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  v4[1] = CFNumberCreate(0, kCFNumberCGFloatType, &v8);
  v5 = CFArrayCreate(0, v4, 2, &kCFTypeArrayCallBacks);
  CFRelease(*v4);
  CFRelease(v4[1]);
  free(v4);
  return v5;
}

- (id)debugHierarchyValueForObjCType_CGSize
{
  uint64_t v2;
  uint64_t v3;
  const void **v4;
  CFArrayRef v5;
  uint64_t valuePtr;
  uint64_t v8;

  -[NSValue CGSizeValue](self, "CGSizeValue");
  valuePtr = v2;
  v8 = v3;
  v4 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
  *v4 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  v4[1] = CFNumberCreate(0, kCFNumberCGFloatType, &v8);
  v5 = CFArrayCreate(0, v4, 2, &kCFTypeArrayCallBacks);
  CFRelease(*v4);
  CFRelease(v4[1]);
  free(v4);
  return v5;
}

- (id)debugHierarchyValueForObjCType_CGRect
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void **v6;
  uint64_t i;
  CFArrayRef v8;
  uint64_t j;
  _QWORD v11[4];

  -[NSValue CGRectValue](self, "CGRectValue");
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v6 = (const void **)malloc_type_malloc(0x20uLL, 0x6004044C4A2DFuLL);
  for (i = 0; i != 4; ++i)
    v6[i] = CFNumberCreate(0, kCFNumberCGFloatType, &v11[i]);
  v8 = CFArrayCreate(0, v6, 4, &kCFTypeArrayCallBacks);
  for (j = 0; j != 4; ++j)
    CFRelease(v6[j]);
  free(v6);
  return v8;
}

- (id)debugHierarchyValueForObjCType_CATransform3D
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _QWORD v36[16];

  -[NSValue CATransform3DValue](self, "CATransform3DValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20));
  v36[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21));
  v36[1] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v22));
  v36[2] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23));
  v36[3] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v24));
  v36[4] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v25));
  v36[5] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v26));
  v36[6] = v13;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v27));
  v36[7] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v28));
  v36[8] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v29));
  v36[9] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v30));
  v36[10] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v31));
  v36[11] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32));
  v36[12] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v33));
  v36[13] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v34));
  v36[14] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v35));
  v36[15] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 16));

  return v11;
}

@end
