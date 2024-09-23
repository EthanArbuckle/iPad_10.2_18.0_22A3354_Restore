@implementation NSObject

- (void)performSelector:(SEL)a3 withIndexesFromSet:(id)a4
{
  NSInvocation *v7;
  id i;

  for (i = objc_msgSend(a4, "firstIndex"); i != (id)0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(a4, "indexGreaterThanIndex:", i))
  {
    v7 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", -[NSObject methodSignatureForSelector:](self, "methodSignatureForSelector:", a3));
    -[NSInvocation setSelector:](v7, "setSelector:", a3);
    -[NSInvocation setArgument:atIndex:](v7, "setArgument:atIndex:", &i, 2);
    -[NSInvocation invokeWithTarget:](v7, "invokeWithTarget:", self);
  }
}

- (id)_tsaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 expectedTypeEncoding:(const char *)a5
{
  return -[NSObject _tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, a4, a5, 0);
}

- (id)_tsaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 possibleExpectedTypeEncodings:(const char *)a5
{
  id v9;
  void *v10;
  const char *v11;
  char v12;
  const char **v13;
  int v14;
  objc_class *v15;
  objc_class *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  uint64_t i;
  uint64_t *v25;
  int v26;
  objc_class *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char **v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v9 = -[NSObject tsaxValueForKey:](self, "tsaxValueForKey:");
  v10 = v9;
  if (v9)
  {
    if ((objc_opt_isKindOfClass(v9, a4) & 1) == 0)
    {
      if (qword_543800 != -1)
        dispatch_once(&qword_543800, &stru_43B7B0);
      if (!byte_5437F8)
        return 0;
      if (qword_543820 != -1)
        dispatch_once(&qword_543820, &stru_43B7F0);
      v14 = byte_543818;
      v15 = (objc_class *)objc_opt_class(self);
      NSStringFromClass(v15);
      NSStringFromClass(a4);
      v16 = (objc_class *)objc_opt_class(v10);
      NSStringFromClass(v16);
      if (!__TSAccessibilityHandleValidationErrorWithDescription(v14, 0, (uint64_t)CFSTR("Value for key %@ on object <%@: %p> is not an %@; class: %@; value: %@"),
                            v17,
                            v18,
                            v19,
                            v20,
                            v21,
                            (uint64_t)a3))
        return 0;
      goto LABEL_33;
    }
    if (a5)
    {
      v11 = (const char *)objc_msgSend(v10, "objCType");
      if (strcmp(v11, a5))
      {
        v12 = 0;
        v33 = (const char **)&v35;
        while (1)
        {
          v13 = v33++;
          if (!*v13)
            break;
          if ((v12 & 1) == 0)
            v12 = 1;
          if (!strcmp(v11, *v13))
            return v10;
        }
        if (qword_543800 != -1)
          dispatch_once(&qword_543800, &stru_43B7B0);
        if (!byte_5437F8)
          return 0;
        if ((v12 & 1) != 0)
        {
          v23 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:", CFSTR("%s"), a5);
          v34 = &v36;
          for (i = v35; i; i = *v25)
          {
            objc_msgSend(v23, "appendFormat:", CFSTR("\", \"%s"), i);
            v25 = v34++;
          }
          objc_msgSend(v23, "UTF8String");
          if (qword_543800 != -1)
            dispatch_once(&qword_543800, &stru_43B7B0);
        }
        else
        {
          v23 = 0;
        }
        if (!byte_5437F8)
          goto LABEL_32;
        if (qword_543820 != -1)
          dispatch_once(&qword_543820, &stru_43B7F0);
        v26 = byte_543818;
        v27 = (objc_class *)objc_opt_class(self);
        NSStringFromClass(v27);
        if (!__TSAccessibilityHandleValidationErrorWithDescription(v26, 0, (uint64_t)CFSTR("Value for key %@ on object <%@: %p> doesn't encapsulate the right type; value: %@; actual type encoding: \"%s\"; %s: \"%s\"."),
                              v28,
                              v29,
                              v30,
                              v31,
                              v32,
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

- (id)tsaxValueForKey:(id)a3
{
  return -[NSObject valueForKey:](self, "valueForKey:");
}

- (BOOL)tsaxBoolValueForKey:(id)a3
{
  return objc_msgSend(-[NSObject _tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, objc_opt_class(NSNumber), "i", "c", "B", 0), "BOOLValue");
}

- (int)tsaxIntValueForKey:(id)a3
{
  return objc_msgSend(-[NSObject _tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a3, objc_opt_class(NSNumber), "i"), "intValue");
}

- (unsigned)tsaxUnsignedIntValueForKey:(id)a3
{
  return objc_msgSend(-[NSObject _tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, objc_opt_class(NSNumber), "i", "I", 0), "unsignedIntValue");
}

- (int64_t)tsaxIntegerValueForKey:(id)a3
{
  return (int64_t)objc_msgSend(-[NSObject _tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, objc_opt_class(NSNumber), "q", 0), "integerValue");
}

- (unint64_t)tsaxUnsignedIntegerValueForKey:(id)a3
{
  return (unint64_t)objc_msgSend(-[NSObject _tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, objc_opt_class(NSNumber), "Q", "q", "Q", 0), "unsignedIntegerValue");
}

- (float)tsaxFloatValueForKey:(id)a3
{
  float result;

  objc_msgSend(-[NSObject _tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a3, objc_opt_class(NSNumber), "f"), "floatValue");
  return result;
}

- (double)tsaxDoubleValueForKey:(id)a3
{
  double result;

  objc_msgSend(-[NSObject _tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a3, objc_opt_class(NSNumber), "d"), "doubleValue");
  return result;
}

- (_NSRange)tsaxRangeValueForKey:(id)a3
{
  id v3;
  NSUInteger v4;
  _NSRange result;

  v3 = objc_msgSend(-[NSObject _tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a3, objc_opt_class(NSValue), "{_NSRange=QQ}"), "rangeValue");
  result.length = v4;
  result.location = (NSUInteger)v3;
  return result;
}

- (CGPoint)tsaxCGPointValueForKey:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  objc_msgSend(-[NSObject _tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a3, objc_opt_class(NSValue), "{CGPoint=dd}"), "CGPointValue");
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGSize)tsaxCGSizeValueForKey:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(-[NSObject _tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a3, objc_opt_class(NSValue), "{CGSize=dd}"), "CGSizeValue");
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)tsaxCGRectValueForKey:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(-[NSObject _tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a3, objc_opt_class(NSValue), "{CGRect={CGPoint=dd}{CGSize=dd}}"), "CGRectValue");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGAffineTransform)tsaxCGAffineTransformValueForKey:(SEL)a3
{
  CGAffineTransform *result;

  result = -[NSObject _tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a4, objc_opt_class(NSValue), "{CGAffineTransform=dddddd}");
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform CGAffineTransformValue](result, "CGAffineTransformValue");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)tsaxStructValue:(void *)a3 forKey:(id)a4 ofExpectedType:(const char *)a5 fallbackValue:(const void *)a6
{
  id v9;
  NSUInteger sizep;

  v9 = -[NSObject _tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_tsaxValidatedValueForKey:expectedClass:expectedTypeEncoding:", a4, objc_opt_class(NSValue), a5);
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

- (BOOL)tsaxRespondsToSelector:(SEL)a3 fromOptionalExtrasProtocol:(id)a4
{
  return -[NSObject _tsaxRespondsToSelector:fromExtrasProtocol:skipAssertions:](self, "_tsaxRespondsToSelector:fromExtrasProtocol:skipAssertions:", a3, a4, 1);
}

- (BOOL)tsaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4
{
  return -[NSObject _tsaxRespondsToSelector:fromExtrasProtocol:skipAssertions:](self, "_tsaxRespondsToSelector:fromExtrasProtocol:skipAssertions:", a3, a4, 0);
}

- (double)tsaxScreenScale
{
  return 1.0;
}

- (BOOL)_tsaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4 skipAssertions:(BOOL)a5
{
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
  int v28;
  objc_class *v29;
  NSString *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  objc_class *v37;
  NSString *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;

  if (!a5)
  {
    ShouldPerformValidationChecks = TSAccessibilityShouldPerformValidationChecks();
    if (!a3)
    {
      if (ShouldPerformValidationChecks)
      {
        ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Selector can't be null."), v14, v15, v16, v17, v18, v45))goto LABEL_26;
      }
    }
    v19 = TSAccessibilityShouldPerformValidationChecks();
    if (!a4)
    {
      if (v19)
      {
        v20 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        v26 = __TSAccessibilityHandleValidationErrorWithDescription(v20, 0, (uint64_t)CFSTR("Protocol can't be null."), v21, v22, v23, v24, v25, v45);
        goto LABEL_13;
      }
    }
  }
  LOBYTE(v9) = 0;
  if (!a3 || !a4)
    return v9 & 1;
  name = protocol_getMethodDescription((Protocol *)a4, a3, 1, 1).name;
  v11 = -[NSObject conformsToProtocol:](self, "conformsToProtocol:", a4);
  v9 = v11;
  if (a5)
  {
    if (v11)
      LOBYTE(v9) = objc_opt_respondsToSelector(self, a3);
    return v9 & 1;
  }
  v27 = TSAccessibilityShouldPerformValidationChecks() ^ 1;
  if (!name)
    v27 = 1;
  if (((v27 | v9) & 1) == 0)
  {
    v28 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v29 = (objc_class *)objc_opt_class(self);
    v30 = NSStringFromClass(v29);
    NSStringFromProtocol((Protocol *)a4);
    if (__TSAccessibilityHandleValidationErrorWithDescription(v28, 0, (uint64_t)CFSTR("<%@: %p> doesn't conform to the protocol: %@"), v31, v32, v33, v34, v35, (uint64_t)v30))LABEL_26:abort();
  }
  if ((v9 & 1) == 0)
  {
    LOBYTE(v9) = 0;
    return v9 & 1;
  }
  LOBYTE(v9) = objc_opt_respondsToSelector(self, a3);
  if (TSAccessibilityShouldPerformValidationChecks() && name && (v9 & 1) == 0)
  {
    v36 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v37 = (objc_class *)objc_opt_class(self);
    v38 = NSStringFromClass(v37);
    NSStringFromSelector(a3);
    v26 = __TSAccessibilityHandleValidationErrorWithDescription(v36, 0, (uint64_t)CFSTR("<%@: %p> doesn't respond to the following abstract method: %@"), v39, v40, v41, v42, v43, (uint64_t)v38);
LABEL_13:
    LOBYTE(v9) = 0;
    if (!v26)
      return v9 & 1;
    goto LABEL_26;
  }
  return v9 & 1;
}

- (NSMutableArray)_tsaxChildrenCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_5439E0);
}

- (void)_tsaxSetChildrenCache:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_5439E0, a3);
}

- (BOOL)_tsaxIsBuildingChildrenCache
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5439E1);
}

- (void)_tsaxSetBuildingChildrenCache:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_5439E1, a3);
}

- (BOOL)_tsaxIsInvalidatingChildrenCache
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5439E2);
}

- (void)_tsaxSetInvalidatingChildrenCache:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_5439E2, a3);
}

- (TSAccessibilityTimer)_tsaxChildInvalidationTimer
{
  return (TSAccessibilityTimer *)__TSAccessibilityGetAssociatedObject(self, &unk_5439E3);
}

- (void)_tsaxSetChildInvalidationTimer:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_5439E3, a3);
}

- (NSMutableArray)_tsaxChildInvalidationCompletionBlocks
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_5439E4);
}

- (void)_tsaxSetChildInvalidationCompletionBlocks:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_5439E4, a3);
}

- (void)tsaxAccessibilityUnregister
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_249904;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (UIView)tsaxAncestorView
{
  uint64_t v3;

  v3 = objc_opt_class(UIView);
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0)
    return (UIView *)self;
  else
    return (UIView *)-[NSObject tsaxAncestorOfType:](self, "tsaxAncestorOfType:", objc_opt_class(UIView));
}

- (id)tsaxAncestorOfType:(Class)a3
{
  id i;

  for (i = -[NSObject tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("accessibilityContainer"));
        i;
        i = objc_msgSend(i, "tsaxValueForKey:", CFSTR("accessibilityContainer")))
  {
    if ((objc_opt_isKindOfClass(i, a3) & 1) != 0)
      break;
  }
  return i;
}

- (id)tsaxViewAncestorOfType:(Class)a3
{
  uint64_t v5;
  NSObject *v6;

  v5 = objc_opt_class(UIView);
  if ((objc_opt_isKindOfClass(self, v5) & 1) == 0)
    return 0;
  do
  {
    v6 = -[NSObject superview](self, "superview");
    self = v6;
  }
  while (v6 && (objc_opt_isKindOfClass(v6, a3) & 1) == 0);
  return self;
}

- (BOOL)tsaxIsDescendantOfElement:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = self != 0;
  if (self != a3 && self)
  {
    v11 = v4;
    v12 = v3;
    v13 = v5;
    v14 = v6;
    do
    {
      self = -[NSObject tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("accessibilityContainer"), v11, v12, v13, v14);
      v7 = self != 0;
    }
    while (self != a3 && self != 0);
  }
  return v7;
}

- (id)tsaxFindDescendantPassingTest:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  char *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v14[5];

  v5 = (void *)objc_opt_new(NSMutableArray, a2);
  objc_msgSend(v5, "addObject:", self);
  while (objc_msgSend(v5, "count"))
  {
    v6 = objc_msgSend(v5, "lastObject");
    objc_msgSend(v5, "removeLastObject");
    v7 = v6;
    if (((*((uint64_t (**)(id, id))a3 + 2))(a3, v6) & 1) == 0)
    {
      v8 = (char *)objc_msgSend(v6, "accessibilityElementCount");
      if ((unint64_t)(v8 - 1) > 0x7FFFFFFFFFFFFFFDLL)
      {
        v11 = objc_opt_class(UIView);
        if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
        {
          v12 = objc_msgSend(v6, "subviews");
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_249BF8;
          v14[3] = &unk_4278D8;
          v14[4] = v5;
          objc_msgSend(v12, "enumerateObjectsWithOptions:usingBlock:", 2, v14);
        }
      }
      else
      {
        v9 = (unint64_t)(v8 + 1);
        do
        {
          v10 = objc_msgSend(v6, "accessibilityElementAtIndex:", v9 - 2);
          if (v10)
            objc_msgSend(v5, "addObject:", v10);
          --v9;
        }
        while (v9 > 1);
      }
      v7 = 0;
    }

    if (v7)
      goto LABEL_16;
  }
  v7 = 0;
LABEL_16:

  return v7;
}

- (id)tsaxChildren
{
  NSMutableArray *v3;
  _BOOL8 v4;
  uint64_t v5;
  int v6;
  void *v7;
  NSMutableArray *v8;

  if (!-[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___TSAccessibilityContainer))return 0;
  v3 = -[NSObject _tsaxChildrenCache](self, "_tsaxChildrenCache");
  if (v3)
    return v3;
  if ((objc_opt_respondsToSelector(self, "tsaxIsReadyToLoadChildren") & 1) != 0
    && !-[NSObject tsaxIsReadyToLoadChildren](self, "tsaxIsReadyToLoadChildren"))
  {
    return 0;
  }
  v4 = -[NSObject _tsaxIsBuildingChildrenCache](self, "_tsaxIsBuildingChildrenCache");
  -[NSObject _tsaxSetBuildingChildrenCache:](self, "_tsaxSetBuildingChildrenCache:", 1);
  v3 = (NSMutableArray *)objc_opt_new(NSMutableArray, v5);
  if ((objc_opt_respondsToSelector(self, "tsaxShouldCacheChildren") & 1) != 0
    && !-[NSObject tsaxShouldCacheChildren](self, "tsaxShouldCacheChildren"))
  {
    v6 = 0;
  }
  else
  {
    -[NSObject _tsaxSetChildrenCache:](self, "_tsaxSetChildrenCache:", v3);
    v6 = 1;
  }
  v7 = objc_autoreleasePoolPush();
  -[NSObject tsaxLoadChildrenIntoCollection:](self, "tsaxLoadChildrenIntoCollection:", v3);
  if ((objc_opt_respondsToSelector(self, "tsaxShouldSortChildrenUsingStandardAlgorithm") & 1) != 0
    && -[NSObject tsaxShouldSortChildrenUsingStandardAlgorithm](self, "tsaxShouldSortChildrenUsingStandardAlgorithm"))
  {
    -[NSMutableArray sortUsingSelector:](v3, "sortUsingSelector:", NSSelectorFromString(CFSTR("accessibilityCompareGeometry:")));
  }
  objc_autoreleasePoolPop(v7);
  if (v6)

  else
    v8 = v3;
  -[NSObject _tsaxSetBuildingChildrenCache:](self, "_tsaxSetBuildingChildrenCache:", v4);
  return v3;
}

- (void)tsaxInvalidateChildrenEventuallyWithCompletion:(id)a3
{
  TSAccessibilityTimer *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];

  if (!-[NSObject _tsaxChildInvalidationTimer](self, "_tsaxChildInvalidationTimer"))
  {
    v5 = -[TSAccessibilityTimer initWithTargetSerialQueue:]([TSAccessibilityTimer alloc], "initWithTargetSerialQueue:", &_dispatch_main_q);
    -[TSAccessibilityTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v5, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    -[NSObject _tsaxSetChildInvalidationTimer:](self, "_tsaxSetChildInvalidationTimer:", v5);

  }
  if (!-[NSObject _tsaxChildInvalidationCompletionBlocks](self, "_tsaxChildInvalidationCompletionBlocks"))
  {
    v8 = (void *)objc_opt_new(NSMutableArray, v6);
    -[NSObject _tsaxSetChildInvalidationCompletionBlocks:](self, "_tsaxSetChildInvalidationCompletionBlocks:", v8);

    if (!a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (a3)
  {
LABEL_5:
    v7 = objc_msgSend(a3, "copy");
    -[NSMutableArray addObject:](-[NSObject _tsaxChildInvalidationCompletionBlocks](self, "_tsaxChildInvalidationCompletionBlocks"), "addObject:", v7);

  }
LABEL_6:
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_249E64;
  v9[3] = &unk_426DD0;
  v9[4] = self;
  -[TSAccessibilityTimer afterDelay:processBlock:](-[NSObject _tsaxChildInvalidationTimer](self, "_tsaxChildInvalidationTimer"), "afterDelay:processBlock:", v9, 0.25);
}

- (void)tsaxInvalidateChildrenEventually
{
  -[NSObject tsaxInvalidateChildrenEventuallyWithCompletion:](self, "tsaxInvalidateChildrenEventuallyWithCompletion:", 0);
}

- (void)tsaxInvalidateChildrenImmediately
{
  unsigned int v3;
  NSMutableArray *v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (!-[NSObject _tsaxIsInvalidatingChildrenCache](self, "_tsaxIsInvalidatingChildrenCache"))
  {
    -[NSObject _tsaxSetInvalidatingChildrenCache:](self, "_tsaxSetInvalidatingChildrenCache:", 1);
    v3 = -[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___TSAccessibilityContainer);
    if (v3)
    {
      if ((objc_opt_respondsToSelector(self, "tsaxShouldCacheChildren") & 1) != 0
        && !-[NSObject tsaxShouldCacheChildren](self, "tsaxShouldCacheChildren"))
      {
        v4 = -[NSObject tsaxChildren](self, "tsaxChildren");
      }
      else
      {
        v4 = -[NSObject _tsaxChildrenCache](self, "_tsaxChildrenCache");
      }
    }
    else
    {
      v4 = -[NSObject _tsaxElementAccessibilityChildren:](self, "_tsaxElementAccessibilityChildren:", self);
    }
    v5 = v4;
    if (v4)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v12;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
            if (v3 && (objc_opt_respondsToSelector(self, "tsaxChildWillBeRemoved:") & 1) != 0)
              -[NSObject tsaxChildWillBeRemoved:](self, "tsaxChildWillBeRemoved:", v10);
            objc_msgSend(v10, "tsaxInvalidateChildrenImmediately");
          }
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v7);
      }
      if (v3)
      {
        -[NSObject _tsaxSetChildrenCache:](self, "_tsaxSetChildrenCache:", 0);
        if ((objc_opt_respondsToSelector(self, "tsaxDidInvalidateChildren") & 1) != 0)
          -[NSObject tsaxDidInvalidateChildren](self, "tsaxDidInvalidateChildren");
      }
    }
    -[NSObject _tsaxSetInvalidatingChildrenCache:](self, "_tsaxSetInvalidatingChildrenCache:", 0);
  }
}

- (id)_tsaxElementAccessibilityChildren:(id)a3
{
  id result;
  objc_class *v5;
  uint64_t v6;
  objc_class *v7;
  char v8;
  char v9;

  if ((objc_msgSend(a3, "isAccessibilityElement") & 1) != 0)
    return 0;
  if (objc_msgSend(a3, "tsaxBoolValueForKey:", CFSTR("_accessibilityHasOrderedChildren")))
  {
    v9 = 0;
    v5 = (objc_class *)objc_opt_class(NSArray);
    result = (id)__TSAccessibilityCastAsClass(v5, (uint64_t)objc_msgSend(a3, "tsaxValueForKey:", CFSTR("accessibilityElements")), 1, &v9);
    if (!v9)
      return result;
LABEL_8:
    abort();
  }
  v6 = objc_opt_class(UIView);
  if ((objc_opt_isKindOfClass(a3, v6) & 1) == 0)
    return 0;
  v8 = 0;
  v7 = (objc_class *)objc_opt_class(NSArray);
  result = (id)__TSAccessibilityCastAsClass(v7, (uint64_t)objc_msgSend(a3, "tsaxValueForKey:", CFSTR("_accessibilitySubviews")), 1, &v8);
  if (v8)
    goto LABEL_8;
  return result;
}

- (void)tsaxHandleTextOperationAction:(id)a3 usingBlock:(id)a4
{
  double v7;
  NSMutableString *v8;
  NSString *UIKitLocalizedString;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a4)
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    if (v7 <= *(double *)&qword_5439E8 + 0.2)
    {
      (*((void (**)(id))a4 + 2))(a4);
    }
    else
    {
      qword_5439E8 = *(_QWORD *)&v7;
      (*((void (**)(id))a4 + 2))(a4);
      v8 = -[UIPasteboard string](+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"), "string");
      if (-[NSMutableString length](v8, "length"))
      {
        if (objc_msgSend(a3, "length"))
        {
          UIKitLocalizedString = TSAccessibilityGetUIKitLocalizedString((uint64_t)a3);
          v8 = __TSAccessibilityStringForVariables(1, v8, v10, v11, v12, v13, v14, v15, (uint64_t)UIKitLocalizedString);
        }
        TSAccessibilityPostHighPriorityAnnouncementNotification((uint64_t)self, (uint64_t)v8);
      }
    }
  }
}

- (CGRect)boundsOfLineFragmentAtIndex:(unint64_t)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (_NSRange)rangeOfLineFragmentAtIndex:(unint64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)rectsForSelection:(id)a3
{
  return 0;
}

- (id)substringWithRange:(_NSRange)a3
{
  return 0;
}

- (id)valueForProperty:(int)a3 atCharIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  return 0;
}

- (__CTFont)createFontAtCharIndex:(unint64_t)a3 scaleTextPercent:(unint64_t)a4 effectiveRange:(_NSRange *)a5 styleProvider:(id)a6
{
  return 0;
}

- (id)columnForCharIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)charIndexForPointWithPinning:(CGPoint)a3
{
  return 0;
}

- (unint64_t)lineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4
{
  return 0;
}

- (id)stringEquivalentFromRange:(_NSRange)a3
{
  return 0;
}

- (_NSRange)paragraphIndexRangeForCharRange:(_NSRange)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = NSInvalidRange[0];
  v4 = NSInvalidRange[1];
  result.length = v4;
  result.location = v3;
  return result;
}

- (BOOL)thaxUsesChildrenFramesForSorting
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A2A);
}

- (void)thaxSetUsesChildrenFramesForSorting:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A2A, a3);
}

- (id)thaxDocumentViewController
{
  return 0;
}

- (id)thaxPageController
{
  return 0;
}

@end
