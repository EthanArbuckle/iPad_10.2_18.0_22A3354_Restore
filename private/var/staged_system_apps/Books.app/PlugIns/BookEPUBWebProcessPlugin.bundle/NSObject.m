@implementation NSObject

- (id)_baxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 expectedTypeEncoding:(const char *)a5
{
  return -[NSObject _baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, a4, a5, 0);
}

- (id)_baxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 possibleExpectedTypeEncodings:(const char *)a5
{
  id v8;
  uint64_t v9;
  id v10;
  const char *v11;
  const char **v12;
  const char **v14;
  uint64_t v15;

  v8 = a3;
  v9 = objc_claimAutoreleasedReturnValue(-[NSObject baxValueForKey:](self, "baxValueForKey:", v8));
  v10 = (id)v9;
  if (v9)
  {
    if ((objc_opt_isKindOfClass(v9, a4) & 1) == 0)
    {
      if (qword_271D8 == -1)
      {
LABEL_10:

        v10 = 0;
        goto LABEL_11;
      }
LABEL_13:
      dispatch_once(&qword_271D8, &stru_209C8);
      goto LABEL_10;
    }
    if (a5)
    {
      v10 = objc_retainAutorelease(v10);
      v11 = (const char *)objc_msgSend(v10, "objCType");
      if (strcmp(v11, a5))
      {
        v14 = (const char **)&v15;
        while (1)
        {
          v12 = v14++;
          if (!*v12)
            break;
          if (!strcmp(v11, *v12))
            goto LABEL_11;
        }
        if (qword_271D8 == -1)
          goto LABEL_10;
        goto LABEL_13;
      }
    }
  }
LABEL_11:

  return v10;
}

- (id)baxValueForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject valueForKey:](self, "valueForKey:", v4));

  return v5;
}

- (BOOL)baxBoolValueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v6 = -[NSObject _baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(NSNumber, v5), "i", "c", "B", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = objc_msgSend(v7, "BOOLValue");
  return v8;
}

- (int)baxIntValueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  int v8;

  v4 = a3;
  v6 = -[NSObject _baxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_baxValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(NSNumber, v5), "i");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = objc_msgSend(v7, "intValue");
  return v8;
}

- (unsigned)baxUnsignedIntValueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  unsigned int v8;

  v4 = a3;
  v6 = -[NSObject _baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(NSNumber, v5), "i", "I", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = objc_msgSend(v7, "unsignedIntValue");
  return v8;
}

- (int64_t)baxIntegerValueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = -[NSObject _baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(NSNumber, v5), "q", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = objc_msgSend(v7, "integerValue");
  return (int64_t)v8;
}

- (unint64_t)baxUnsignedIntegerValueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = -[NSObject _baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(NSNumber, v5), "Q", "q", "Q", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  return (unint64_t)v8;
}

- (float)baxFloatValueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  float v8;
  float v9;

  v4 = a3;
  v6 = -[NSObject _baxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_baxValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(NSNumber, v5), "f");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  objc_msgSend(v7, "floatValue");
  v9 = v8;

  return v9;
}

- (double)baxDoubleValueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  v6 = -[NSObject _baxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_baxValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(NSNumber, v5), "d");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  return v9;
}

- (double)baxTimeIntervalValueForKey:(id)a3
{
  double result;

  -[NSObject baxDoubleValueForKey:](self, "baxDoubleValueForKey:", a3);
  return result;
}

- (_NSRange)baxRangeValueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v4 = a3;
  v6 = -[NSObject _baxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_baxValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(NSValue, v5), "{_NSRange=QQ}");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = objc_msgSend(v7, "rangeValue");
  v10 = v9;

  v11 = (NSUInteger)v8;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (double)baxCGFloatValueForKey:(id)a3
{
  double result;

  -[NSObject baxDoubleValueForKey:](self, "baxDoubleValueForKey:", a3);
  return result;
}

- (CGPoint)baxCGPointValueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v4 = a3;
  v6 = -[NSObject _baxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_baxValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(NSValue, v5), "{CGPoint=dd}");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  objc_msgSend(v7, "CGPointValue");
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGSize)baxCGSizeValueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v4 = a3;
  v6 = -[NSObject _baxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_baxValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(NSValue, v5), "{CGSize=dd}");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  objc_msgSend(v7, "CGSizeValue");
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGRect)baxCGRectValueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v4 = a3;
  v6 = -[NSObject _baxValidatedValueForKey:expectedClass:expectedTypeEncoding:](self, "_baxValidatedValueForKey:expectedClass:expectedTypeEncoding:", v4, objc_opt_class(NSValue, v5), "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  objc_msgSend(v7, "CGRectValue");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

@end
