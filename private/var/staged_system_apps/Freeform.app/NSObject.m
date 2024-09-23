@implementation NSObject

- (void)crl_runBlock
{
  NSObject *v2;

  v2 = objc_retainBlock(self);
  ((void (*)(void))v2[2].isa)();

}

- (id)_crlaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 expectedTypeEncoding:(const char *)a5
{
  return -[NSObject _crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, a4, a5, 0);
}

- (id)_crlaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 possibleExpectedTypeEncodings:(const char *)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  char v13;
  const char **v14;
  const char *v15;
  int v16;
  objc_class *v17;
  uint64_t v18;
  objc_class *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  uint64_t i;
  uint64_t *v28;
  int v29;
  objc_class *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char **v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v9 = -[NSObject crlaxValueForKey:](self, "crlaxValueForKey:");
  v10 = v9;
  if (v9)
  {
    if ((objc_opt_isKindOfClass(v9, a4) & 1) == 0)
    {
      if (qword_101414E18 != -1)
        dispatch_once(&qword_101414E18, &stru_101238640);
      if (!byte_101414E10)
        return 0;
      if (qword_101414E38 != -1)
        dispatch_once(&qword_101414E38, &stru_101238680);
      v16 = byte_101414E30;
      v17 = (objc_class *)objc_opt_class(self, v11);
      NSStringFromClass(v17);
      NSStringFromClass(a4);
      v19 = (objc_class *)objc_opt_class(v10, v18);
      NSStringFromClass(v19);
      if (!__CRLAccessibilityHandleValidationErrorWithDescription(v16, 0, (uint64_t)CFSTR("Value for key %@ on object <%@: %p> is not an %@; class: %@; value: %@"),
                            v20,
                            v21,
                            v22,
                            v23,
                            v24,
                            (uint64_t)a3))
        return 0;
      goto LABEL_33;
    }
    if (a5)
    {
      v12 = (const char *)objc_msgSend(v10, "objCType");
      if (strcmp(v12, a5))
      {
        v13 = 0;
        v36 = (const char **)&v38;
        while (1)
        {
          v14 = v36++;
          v15 = *v14;
          if (!*v14)
            break;
          if ((v13 & 1) == 0)
            v13 = 1;
          if (!strcmp(v12, v15))
            return v10;
        }
        if (qword_101414E18 != -1)
          dispatch_once(&qword_101414E18, &stru_101238640);
        if (!byte_101414E10)
          return 0;
        if ((v13 & 1) != 0)
        {
          v26 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:", CFSTR("%s"), a5);
          v37 = &v39;
          for (i = v38; i; i = *v28)
          {
            objc_msgSend(v26, "appendFormat:", CFSTR("\", \"%s"), i);
            v28 = v37++;
          }
          objc_msgSend(v26, "UTF8String");
          if (qword_101414E18 != -1)
            dispatch_once(&qword_101414E18, &stru_101238640);
        }
        else
        {
          v26 = 0;
        }
        if (!byte_101414E10)
          goto LABEL_32;
        if (qword_101414E38 != -1)
          dispatch_once(&qword_101414E38, &stru_101238680);
        v29 = byte_101414E30;
        v30 = (objc_class *)objc_opt_class(self, v15);
        NSStringFromClass(v30);
        if (!__CRLAccessibilityHandleValidationErrorWithDescription(v29, 0, (uint64_t)CFSTR("Value for key %@ on object <%@: %p> doesn't encapsulate the right type; value: %@; actual type encoding: \"%s\"; %s: \"%s\"."),
                              v31,
                              v32,
                              v33,
                              v34,
                              v35,
                              (uint64_t)a3))
        {
LABEL_32:

          return 0;
        }
LABEL_33:
        abort();
      }
    }
  }
  return v10;
}

- (id)crlaxValueForKey:(id)a3
{
  return -[NSObject valueForKey:](self, "valueForKey:");
}

- (BOOL)crlaxBoolValueForKey:(id)a3
{
  return objc_msgSend(-[NSObject _crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, objc_opt_class(NSNumber, a2), "i", "c", "B", 0), "BOOLValue");
}

- (int)crlaxIntValueForKey:(id)a3
{
  return objc_msgSend(-[NSObject _crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a3, objc_opt_class(NSNumber, a2), "i"), "intValue");
}

- (unsigned)crlaxUnsignedIntValueForKey:(id)a3
{
  return objc_msgSend(-[NSObject _crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, objc_opt_class(NSNumber, a2), "i", "I", 0), "unsignedIntValue");
}

- (int64_t)crlaxIntegerValueForKey:(id)a3
{
  return (int64_t)objc_msgSend(-[NSObject _crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, objc_opt_class(NSNumber, a2), "q", 0), "integerValue");
}

- (unint64_t)crlaxUnsignedIntegerValueForKey:(id)a3
{
  return (unint64_t)objc_msgSend(-[NSObject _crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, objc_opt_class(NSNumber, a2), "Q", "q", "Q", 0), "unsignedIntegerValue");
}

- (float)crlaxFloatValueForKey:(id)a3
{
  float result;

  objc_msgSend(-[NSObject _crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a3, objc_opt_class(NSNumber, a2), "f"), "floatValue");
  return result;
}

- (double)crlaxDoubleValueForKey:(id)a3
{
  double result;

  objc_msgSend(-[NSObject _crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a3, objc_opt_class(NSNumber, a2), "d"), "doubleValue");
  return result;
}

- (double)crlaxTimeIntervalValueForKey:(id)a3
{
  double result;

  -[NSObject crlaxDoubleValueForKey:](self, "crlaxDoubleValueForKey:", a3);
  return result;
}

- (_NSRange)crlaxRangeValueForKey:(id)a3
{
  id v3;
  NSUInteger v4;
  _NSRange result;

  v3 = objc_msgSend(-[NSObject _crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a3, objc_opt_class(NSValue, a2), "{_NSRange=QQ}"), "rangeValue");
  result.length = v4;
  result.location = (NSUInteger)v3;
  return result;
}

- (double)crlaxCGFloatValueForKey:(id)a3
{
  double result;

  -[NSObject crlaxDoubleValueForKey:](self, "crlaxDoubleValueForKey:", a3);
  return result;
}

- (CGPoint)crlaxCGPointValueForKey:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  objc_msgSend(-[NSObject _crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a3, objc_opt_class(NSValue, a2), "{CGPoint=dd}"), "CGPointValue");
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGSize)crlaxCGSizeValueForKey:(id)a3
{
  id v3;
  double v4;
  double v5;
  CGSize result;

  v3 = -[NSObject _crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a3, objc_opt_class(NSValue, a2), "{CGSize=dd}");
  _objc_msgSend(v3, "CGSizeValue");
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGRect)crlaxCGRectValueForKey:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(-[NSObject _crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a3, objc_opt_class(NSValue, a2), "{CGRect={CGPoint=dd}{CGSize=dd}}"), "CGRectValue");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGAffineTransform)crlaxCGAffineTransformValueForKey:(SEL)a3
{
  CGAffineTransform *result;

  result = -[NSObject _crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a4, objc_opt_class(NSValue, a3), "{CGAffineTransform=dddddd}");
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform CGAffineTransformValue](result, "CGAffineTransformValue");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)crlaxStructValue:(void *)a3 forKey:(id)a4 ofExpectedType:(const char *)a5 fallbackValue:(const void *)a6
{
  id v9;
  NSUInteger sizep;

  v9 = -[NSObject _crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_crlaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a4, objc_opt_class(NSValue, a2), a5);
  if (v9)
  {
    objc_msgSend(v9, "getValue:", a3);
  }
  else
  {
    sizep = 0;
    NSGetSizeAndAlignment(a5, &sizep, 0);
    memmove(a3, a6, sizep);
  }
}

- (void)crlaxIvarForKey:(id)a3
{
  return (void *)__CRLAccessibilitySafeIvarForKey(self, a3, 0);
}

- (NSMutableArray)_crlaxChildrenCache
{
  return (NSMutableArray *)__CRLAccessibilityGetAssociatedObject(self, &unk_101415048);
}

- (void)_crlaxSetChildrenCache:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_101415048, a3);
}

- (BOOL)_crlaxIsBuildingChildrenCache
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415049);
}

- (void)_crlaxSetBuildingChildrenCache:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415049, a3);
}

- (void)crlaxAccessibilityUnregister
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001E1A5C;
  v2[3] = &unk_10122D110;
  v2[4] = self;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (UIView)crlaxAncestorView
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  double v6;
  uint64_t v7;

  objc_opt_class(UIView, a2);
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0)
  {
    v5 = self;
  }
  else
  {
    *(_QWORD *)&v6 = objc_opt_class(UIView, v4).n128_u64[0];
    v5 = objc_claimAutoreleasedReturnValue(-[NSObject crlaxAncestorOfType:](self, "crlaxAncestorOfType:", v7, v6));
  }
  return (UIView *)v5;
}

- (id)crlaxAncestorOfType:(Class)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = objc_claimAutoreleasedReturnValue(-[NSObject crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("accessibilityContainer")));
  if (v4)
  {
    v5 = (void *)v4;
    while ((objc_opt_isKindOfClass(v5, a3) & 1) == 0)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxValueForKey:", CFSTR("accessibilityContainer")));

      v5 = (void *)v6;
      if (!v6)
        goto LABEL_5;
    }
    v7 = v5;
  }
  else
  {
LABEL_5:
    v7 = 0;
  }

  return v7;
}

- (id)crlaxViewAncestorOfType:(Class)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;

  objc_opt_class(UIView, a2);
  if ((objc_opt_isKindOfClass(self, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject superview](self, "superview"));
    if (v6)
    {
      do
      {
        if ((objc_opt_isKindOfClass(v6, a3) & 1) != 0)
          break;
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));

        v6 = (void *)v7;
      }
      while (v7);
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)crlaxIsDescendantOfElement:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    v6 = v5;
    v7 = v5 != 0;
    if (v5 != v4 && v5)
    {
      do
      {
        v8 = v6;
        v6 = objc_claimAutoreleasedReturnValue(-[NSObject crlaxValueForKey:](v6, "crlaxValueForKey:", CFSTR("accessibilityContainer")));

        v7 = v6 != 0;
      }
      while (v6 != v4 && v6 != 0);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)crlaxFindDescendantPassingTest:(id)a3
{
  unsigned int (**v4)(id, void *);
  NSMutableArray *v5;
  void *v6;
  id v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];
  NSMutableArray *v16;

  v4 = (unsigned int (**)(id, void *))a3;
  v5 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObject:](v5, "addObject:", self);
  while (-[NSMutableArray count](v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v5, "lastObject"));
    -[NSMutableArray removeLastObject](v5, "removeLastObject");
    if (v4[2](v4, v6))
    {
      v7 = v6;
    }
    else
    {
      v8 = (char *)objc_msgSend(v6, "accessibilityElementCount");
      if ((unint64_t)(v8 - 1) > 0x7FFFFFFFFFFFFFFDLL)
      {
        objc_opt_class(UIView, v9);
        if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subviews"));
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_1001E1E14;
          v15[3] = &unk_101243358;
          v16 = v5;
          objc_msgSend(v13, "enumerateObjectsWithOptions:usingBlock:", 2, v15);

        }
      }
      else
      {
        v10 = (unint64_t)(v8 + 1);
        do
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessibilityElementAtIndex:", v10 - 2));
          if (v11)
            -[NSMutableArray addObject:](v5, "addObject:", v11);

          --v10;
        }
        while (v10 > 1);
      }
      v7 = 0;
    }

    if (v7)
      goto LABEL_17;
  }
  v7 = 0;
LABEL_17:

  return v7;
}

- (id)crlaxChildren
{
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (-[NSObject _crlaxIsBuildingChildrenCache](self, "_crlaxIsBuildingChildrenCache"))
    return 0;
  -[NSObject _crlaxSetBuildingChildrenCache:](self, "_crlaxSetBuildingChildrenCache:", 1);
  if (-[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___CRLAccessibilityContainer))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject _crlaxChildrenCache](self, "_crlaxChildrenCache"));
    v5 = (NSMutableArray *)objc_msgSend(v4, "copy");

    if (!v5)
    {
      if ((objc_opt_respondsToSelector(self, "crlaxIsReadyToLoadChildren") & 1) != 0
        && !-[NSObject crlaxIsReadyToLoadChildren](self, "crlaxIsReadyToLoadChildren"))
      {
        v5 = 0;
      }
      else
      {
        v5 = objc_opt_new(NSMutableArray);
        if ((objc_opt_respondsToSelector(self, "crlaxShouldCacheChildren") & 1) != 0)
          v11 = -[NSObject crlaxShouldCacheChildren](self, "crlaxShouldCacheChildren");
        else
          v11 = 1;
        v12 = objc_autoreleasePoolPush();
        -[NSObject crlaxLoadChildrenIntoCollection:](self, "crlaxLoadChildrenIntoCollection:", v5);
        if ((objc_opt_respondsToSelector(self, "crlaxShouldSortChildrenUsingStandardAlgorithm") & 1) != 0
          && -[NSObject crlaxShouldSortChildrenUsingStandardAlgorithm](self, "crlaxShouldSortChildrenUsingStandardAlgorithm"))
        {
          -[NSMutableArray sortUsingSelector:](v5, "sortUsingSelector:", NSSelectorFromString(CFSTR("accessibilityCompareGeometry:")));
        }
        objc_autoreleasePoolPop(v12);
        if (v11)
          -[NSObject _crlaxSetChildrenCache:](self, "_crlaxSetChildrenCache:", v5);
      }
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "setAccessibilityContainer:", self, (_QWORD)v13);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v6 = 0;
  }
  -[NSObject _crlaxSetBuildingChildrenCache:](self, "_crlaxSetBuildingChildrenCache:", 0, (_QWORD)v13);
  return v6;
}

- (void)crlaxEnsureChildrenAreLoaded
{
  id v2;

  v2 = -[NSObject crlaxChildren](self, "crlaxChildren");
}

- (void)crlaxInvalidateChildren
{
  unsigned int v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  int v16;
  void *i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[128];

  v3 = -[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___CRLAccessibilityContainer);
  if (v3)
  {
    if ((objc_opt_respondsToSelector(self, "crlaxShouldCacheChildren") & 1) != 0
      && (-[NSObject crlaxShouldCacheChildren](self, "crlaxShouldCacheChildren") & 1) == 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject crlaxChildren](self, "crlaxChildren"));
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject _crlaxChildrenCache](self, "_crlaxChildrenCache"));
    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject _crlaxElementAccessibilityChildren](self, "_crlaxElementAccessibilityChildren"));
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "copy");

  if (v6)
  {
    v7 = objc_opt_respondsToSelector(self, "crlaxChildWillBeRemoved:");
    v23 = 0;
    v8 = self;
    v9 = __CRLAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___CRLAccessibilityContainer, v8, 1, &v23);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (v23)
      abort();
    v11 = (void *)v10;

    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      v16 = v3 & v7;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          if (v16)
            objc_msgSend(v11, "crlaxChildWillBeRemoved:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), (_QWORD)v19);
          objc_msgSend(v18, "crlaxInvalidateChildren", (_QWORD)v19);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v14);
    }

    if (v3)
    {
      -[NSObject _crlaxSetChildrenCache:](v8, "_crlaxSetChildrenCache:", 0);
      if ((objc_opt_respondsToSelector(v8, "crlaxDidInvalidateChildren") & 1) != 0)
        objc_msgSend(v11, "crlaxDidInvalidateChildren");
    }

  }
}

- (id)_crlaxElementAccessibilityChildren
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t v14;
  char v15;
  char v16;

  if (-[NSObject isAccessibilityElement](self, "isAccessibilityElement"))
    return 0;
  if (-[NSObject crlaxBoolValueForKey:](self, "crlaxBoolValueForKey:", CFSTR("_accessibilityHasOrderedChildren")))
  {
    v16 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("accessibilityElements")));
    objc_opt_class(NSArray, v6);
    v8 = __CRLAccessibilityCastAsClass(v7, (uint64_t)v5, 1, &v16);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (!v16)
      goto LABEL_5;
LABEL_9:
    abort();
  }
  objc_opt_class(UIView, v4);
  if ((objc_opt_isKindOfClass(self, v11) & 1) == 0)
    return 0;
  v15 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("_accessibilitySubviews")));
  objc_opt_class(NSArray, v12);
  v14 = __CRLAccessibilityCastAsClass(v13, (uint64_t)v5, 1, &v15);
  v9 = objc_claimAutoreleasedReturnValue(v14);
  if (v15)
    goto LABEL_9;
LABEL_5:
  v10 = (void *)v9;

  return v10;
}

- (void)crlaxHandleTextOperationAction:(id)a3 usingBlock:(id)a4
{
  void (**v6)(_QWORD);
  double v7;
  void *v8;
  void *v9;
  id v10;
  NSString *UIKitLocalizedString;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v6)
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    if (v7 <= *(double *)&qword_101415050 + 0.2)
    {
      v6[2](v6);
    }
    else
    {
      qword_101415050 = *(_QWORD *)&v7;
      v6[2](v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "string"));

      if (objc_msgSend(v9, "length"))
      {
        v10 = v9;
        if (objc_msgSend(v21, "length"))
        {
          UIKitLocalizedString = CRLAccessibilityGetUIKitLocalizedString((uint64_t)v21);
          v12 = (void *)objc_claimAutoreleasedReturnValue(UIKitLocalizedString);
          v19 = __CRLAccessibilityStringForVariables(1, v10, v13, v14, v15, v16, v17, v18, (uint64_t)v12);
          v20 = objc_claimAutoreleasedReturnValue(v19);

          v10 = (id)v20;
        }
        CRLAccessibilityPostHighPriorityAnnouncementNotification(self, v10);

      }
    }
  }

}

- (void)crlaxSetIsSpeakThisElement:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001E24E8;
  v3[3] = &unk_10122E8D8;
  v3[4] = self;
  v4 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

+ (BOOL)crl_overridesSelector:(SEL)a3 ofBaseClass:(Class)a4
{
  Method InstanceMethod;

  InstanceMethod = class_getInstanceMethod((Class)a1, a3);
  return InstanceMethod != class_getInstanceMethod(a4, a3);
}

+ (BOOL)crl_overridesClassSelector:(SEL)a3 ofBaseClass:(Class)a4
{
  Method ClassMethod;

  ClassMethod = class_getClassMethod((Class)a1, a3);
  return ClassMethod != class_getClassMethod(a4, a3);
}

- (void)crl_performSelector:(SEL)a3 withValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  void *v17;
  id v18;
  NSExceptionName v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  void *v23;
  NSString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSString *v29;
  uint64_t v30;
  NSUInteger sizep;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject methodSignatureForSelector:](self, "methodSignatureForSelector:", a3));
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "numberOfArguments") == (id)3)
    {
      v10 = objc_retainAutorelease(v8);
      v11 = (const char *)objc_msgSend(v10, "getArgumentTypeAtIndex:", 2);
      while (2)
      {
        switch(*v11)
        {
          case '@':
            goto LABEL_8;
          case 'A':
          case 'D':
          case 'E':
          case 'F':
          case 'G':
          case 'H':
          case 'J':
          case 'K':
          case 'M':
          case 'P':
          case 'T':
          case 'U':
          case 'W':
          case 'X':
          case 'Y':
          case 'Z':
          case '[':
          case '\\':
          case ']':
          case '_':
          case 'a':
          case 'b':
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'p':
            goto LABEL_9;
          case 'B':
            v18 = objc_msgSend(v6, "BOOLValue");
            goto LABEL_27;
          case 'C':
            v18 = objc_msgSend(v6, "unsignedCharValue");
            goto LABEL_27;
          case 'I':
            v18 = objc_msgSend(v6, "unsignedIntValue");
            goto LABEL_27;
          case 'L':
            v18 = objc_msgSend(v6, "unsignedLongValue");
            goto LABEL_27;
          case 'N':
          case 'O':
          case 'R':
          case 'V':
          case 'n':
          case 'o':
          case 'r':
            ++v11;
            continue;
          case 'Q':
            v18 = objc_msgSend(v6, "unsignedLongLongValue");
            goto LABEL_27;
          case 'S':
            v18 = objc_msgSend(v6, "unsignedShortValue");
            goto LABEL_27;
          case '^':
            v18 = objc_msgSend(v6, "pointerValue");
            goto LABEL_27;
          case 'c':
            v18 = objc_msgSend(v6, "charValue");
            goto LABEL_27;
          case 'd':
            objc_msgSend(v6, "doubleValue");
            objc_msgSend(self, a3);
            goto LABEL_28;
          case 'f':
            objc_msgSend(v6, "floatValue");
            objc_msgSend(self, a3);
            goto LABEL_28;
          case 'i':
            v18 = objc_msgSend(v6, "intValue");
            goto LABEL_27;
          case 'l':
            v18 = objc_msgSend(v6, "longValue");
            goto LABEL_27;
          case 'q':
            v18 = objc_msgSend(v6, "longLongValue");
            goto LABEL_27;
          case 's':
            v18 = objc_msgSend(v6, "shortValue");
LABEL_27:
            objc_msgSend(self, a3, v18);
            goto LABEL_28;
          default:
            if (*v11 == 35)
            {
LABEL_8:
              objc_msgSend(self, a3, v6);
              goto LABEL_28;
            }
LABEL_9:
            v12 = objc_retainAutorelease(v6);
            v13 = (const char *)objc_msgSend(v12, "objCType");
            if (v13)
            {
              v15 = v13;
              if (!strcmp(v11, v13))
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", v10));
                objc_msgSend(v16, "setTarget:", self);
                objc_msgSend(v16, "setSelector:", a3);
                sizep = 0;
                NSGetSizeAndAlignment(v15, &sizep, 0);
                v17 = malloc_type_malloc(sizep, 0xE0D26B8FuLL);
                objc_msgSend(v12, "getValue:", v17);
                objc_msgSend(v16, "setArgument:atIndex:", v17, 2);
                objc_msgSend(v16, "invoke");
                free(v17);

                goto LABEL_28;
              }
            }
            v19 = NSInvalidArgumentException;
            objc_opt_class(self, v14);
            v28 = v27;
            v29 = NSStringFromSelector(a3);
            v23 = (void *)objc_claimAutoreleasedReturnValue(v29);
            v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** -[%@ %@] first argument type does not match type of %@."), v28, v23, v12);
            break;
        }
        break;
      }
    }
    else
    {
      v19 = NSInvalidArgumentException;
      objc_opt_class(self, v9);
      v21 = v20;
      v22 = NSStringFromSelector(a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** -[%@ %@] does not take one argument."), v21, v23, v30);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", v19, v25, 0));

    objc_exception_throw(v26);
  }
  -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a3);
LABEL_28:

}

+ (BOOL)crl_object:(id)a3 isEqualToObject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    if (v5)
    {
      v6 = v5;
      v8 = v7;
    }
    else
    {
      if (!v6)
      {
        v9 = 0;
        goto LABEL_8;
      }
      v8 = 0;
    }
    v9 = objc_msgSend(v6, "isEqual:", v8);
  }
LABEL_8:

  return v9;
}

- (id)crl_addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  id v10;
  id v11;
  CRLKVOToken *v12;
  id AssociatedObject;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  NSObject *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;

  v10 = a3;
  v11 = a4;
  v12 = -[CRLKVOToken initWithObserver:target:keyPath:context:]([CRLKVOToken alloc], "initWithObserver:target:keyPath:context:", v10, self, v11, a6);
  AssociatedObject = objc_getAssociatedObject(self, off_1013DA9B8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", v12, 0));
    objc_setAssociatedObject(self, off_1013DA9B8, v15, (void *)1);
LABEL_9:
    -[NSObject addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v10, v11, a5, a6);
    goto LABEL_10;
  }
  v15 = v14;
  if ((objc_msgSend(v14, "containsObject:", v12) & 1) == 0)
  {
    objc_msgSend(v15, "addObject:", v12);
    goto LABEL_9;
  }
  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_101244560);
  v16 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413058;
    v19 = v10;
    v20 = 2112;
    v21 = self;
    v22 = 2112;
    v23 = v11;
    v24 = 2048;
    v25 = a6;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@ is already observing %@ for key path %@ using context %p", buf, 0x2Au);
  }
LABEL_10:

  return v12;
}

- (void)crl_removeObserverForToken:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id AssociatedObject;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_opt_class(CRLKVOToken, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "target"));

    if (v9 != self)
    {
      v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101244580);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0C234((uint64_t)self, v10, v11);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012445A0);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v12, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSObject(CRLAdditions) crl_removeObserverForToken:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSObject_CRLAdditions.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 203, 0, "Attempted to stop key-value observing on %@ using a token that it was not associated with", self);

    }
    AssociatedObject = objc_getAssociatedObject(self, off_1013DA9B8);
    v16 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
    if (objc_msgSend(v16, "containsObject:", v8))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "target"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "observer"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyPath"));
      objc_msgSend(v17, "removeObserver:forKeyPath:context:", v18, v19, objc_msgSend(v8, "context"));

      objc_msgSend(v16, "removeObject:", v8);
    }

  }
}

- (BOOL)crlaxRespondsToSelector:(SEL)a3 fromOptionalExtrasProtocol:(id)a4
{
  return -[NSObject _crlaxRespondsToSelector:fromExtrasProtocol:skipAssertions:](self, "_crlaxRespondsToSelector:fromExtrasProtocol:skipAssertions:", a3, a4, 1);
}

- (BOOL)crlaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4
{
  return -[NSObject _crlaxRespondsToSelector:fromExtrasProtocol:skipAssertions:](self, "_crlaxRespondsToSelector:fromExtrasProtocol:skipAssertions:", a3, a4, 0);
}

- (double)crlaxScreenScale
{
  return 1.0;
}

- (BOOL)_crlaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4 skipAssertions:(BOOL)a5
{
  Protocol *v8;
  unsigned int v9;
  SEL name;
  unsigned int v11;
  int ShouldPerformValidationChecks;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  Class v29;
  NSString *v30;
  void *v31;
  NSString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  Class v41;
  NSString *v42;
  void *v43;
  NSString *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v52;
  void *v53;
  void *v54;

  v8 = (Protocol *)a4;
  if (!a5)
  {
    ShouldPerformValidationChecks = CRLAccessibilityShouldPerformValidationChecks();
    if (!a3)
    {
      if (ShouldPerformValidationChecks)
      {
        ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Selector can't be null."), v14, v15, v16, v17, v18, v52))goto LABEL_23;
      }
    }
    v19 = CRLAccessibilityShouldPerformValidationChecks();
    if (!v8)
    {
      if (v19)
      {
        v20 = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        LOBYTE(v9) = 0;
        if (!__CRLAccessibilityHandleValidationErrorWithDescription(v20, 0, (uint64_t)CFSTR("Protocol can't be null."), v21, v22, v23, v24, v25, v52))goto LABEL_25;
        goto LABEL_23;
      }
    }
  }
  LOBYTE(v9) = 0;
  if (!a3 || !v8)
    goto LABEL_25;
  name = protocol_getMethodDescription(v8, a3, 1, 1).name;
  v11 = -[NSObject conformsToProtocol:](self, "conformsToProtocol:", v8);
  v9 = v11;
  if (a5)
  {
    if (v11)
      LOBYTE(v9) = objc_opt_respondsToSelector(self, a3);
    goto LABEL_25;
  }
  v26 = CRLAccessibilityShouldPerformValidationChecks() ^ 1;
  if (!name)
    v26 = 1;
  if (((v26 | v9) & 1) == 0)
  {
    v27 = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    objc_opt_class(self, v28);
    v30 = NSStringFromClass(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = NSStringFromProtocol(v8);
    v53 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v38 = __CRLAccessibilityHandleValidationErrorWithDescription(v27, 0, (uint64_t)CFSTR("<%@: %p> doesn't conform to the protocol: %@"), v33, v34, v35, v36, v37, (uint64_t)v31);

    if (v38)
      goto LABEL_23;
  }
  if ((v9 & 1) == 0)
  {
    LOBYTE(v9) = 0;
    goto LABEL_25;
  }
  LOBYTE(v9) = objc_opt_respondsToSelector(self, a3);
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    if (name)
    {
      if ((v9 & 1) == 0)
      {
        v39 = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        objc_opt_class(self, v40);
        v42 = NSStringFromClass(v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
        v44 = NSStringFromSelector(a3);
        v54 = (void *)objc_claimAutoreleasedReturnValue(v44);
        v50 = __CRLAccessibilityHandleValidationErrorWithDescription(v39, 0, (uint64_t)CFSTR("<%@: %p> doesn't respond to the following abstract method: %@"), v45, v46, v47, v48, v49, (uint64_t)v43);

        LOBYTE(v9) = 0;
        if (v50)
LABEL_23:
          abort();
      }
    }
  }
LABEL_25:

  return v9 & 1;
}

@end
