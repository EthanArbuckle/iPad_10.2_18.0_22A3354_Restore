@implementation CRLStroke

- (CRLStroke)initWithColor:(id)a3 width:(double)a4 cap:(unint64_t)a5 join:(unint64_t)a6 pattern:(id)a7 miterLimit:(double)a8
{
  id v14;
  id v15;
  CRLStroke *v16;
  void *v17;
  void *v18;
  void *v19;
  CRLColor *v20;
  CRLColor *color;
  CRLStrokePattern *v22;
  CRLStrokePattern *pattern;
  objc_super v25;

  v14 = a3;
  v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CRLStroke;
  v16 = -[CRLStroke init](&v25, "init");
  if (v16)
  {
    if (a4 < 0.0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012501F0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1DFE4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101250210);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStroke initWithColor:width:cap:join:pattern:miterLimit:]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLStroke.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 371, 0, "Stroke width (%f) should not be negative.", *(_QWORD *)&a4);

    }
    if (a4 < 0.0)
      a4 = 0.0;
    v20 = (CRLColor *)objc_msgSend(v14, "copy");
    color = v16->_color;
    v16->_color = v20;

    v16->_width = a4;
    v16->_actualWidth = a4;
    v16->_cap = a5;
    v16->_join = a6;
    v22 = (CRLStrokePattern *)objc_msgSend(v15, "copy");
    pattern = v16->_pattern;
    v16->_pattern = v22;

    v16->_miterLimit = a8;
    if (objc_msgSend(v15, "isRoundDash"))
      v16->_cap = 1;
  }

  return v16;
}

- (CRLStroke)init
{
  void *v3;
  void *v4;
  CRLStroke *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern solidPattern](CRLStrokePattern, "solidPattern"));
  v5 = -[CRLStroke initWithColor:width:cap:join:pattern:](self, "initWithColor:width:cap:join:pattern:", v3, 0, 0, v4, 1.0);

  return v5;
}

- (CRLStroke)initWithColor:(id)a3 width:(double)a4 cap:(unint64_t)a5 join:(unint64_t)a6 pattern:(id)a7
{
  return -[CRLStroke initWithColor:width:cap:join:pattern:miterLimit:](self, "initWithColor:width:cap:join:pattern:miterLimit:", a3, a5, a6, a7, a4, 4.0);
}

+ (Class)mutableClass
{
  return (Class)objc_opt_class(CRLMutableStroke, a2);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRLMutableStroke *v4;
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  double v11;
  CRLMutableStroke *v12;

  v4 = +[CRLMutableStroke allocWithZone:](CRLMutableStroke, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
  -[CRLStroke width](self, "width");
  v7 = v6;
  v8 = -[CRLStroke cap](self, "cap");
  v9 = -[CRLStroke join](self, "join");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke pattern](self, "pattern"));
  -[CRLStroke miterLimit](self, "miterLimit");
  v12 = -[CRLStroke initWithColor:width:cap:join:pattern:miterLimit:](v4, "initWithColor:width:cap:join:pattern:miterLimit:", v5, v8, v9, v10, v7, v11);

  -[CRLStroke actualWidth](self, "actualWidth");
  -[CRLStroke i_setActualWidth:](v12, "i_setActualWidth:");
  return v12;
}

- (CRLColor)color
{
  return -[CRLStroke i_color](self, "i_color");
}

+ (CRLColor)colorOnSuppressedBackgrounds
{
  return +[CRLColor blackColor](CRLColor, "blackColor");
}

+ (BOOL)requiresCustomBoundsMeasurement
{
  return 0;
}

+ (BOOL)isMoreOptimalToDrawWithOtherStrokesIfPossible
{
  return 0;
}

- (void)i_setWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;

  if (a3 < 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250230);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1E06C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250250);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStroke i_setWidth:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLStroke.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 443, 0, "Stroke width (%f) should not be negative.", *(_QWORD *)&a3);

  }
  v8 = 0.0;
  if (a3 >= 0.0)
    v8 = a3;
  self->_width = v8;
}

- (void)i_setCap:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (self->_cap != a3)
  {
    if (-[CRLStroke isRoundDash](self, "isRoundDash"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101250270);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1E0F4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101250290);
      v5 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStroke i_setCap:]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLStroke.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 455, 0, "Cannot change cap style on a round-dash stroke.");

    }
    else
    {
      self->_cap = a3;
    }
  }
}

- (unint64_t)join
{
  return -[CRLStroke i_join](self, "i_join");
}

- (double)miterLimit
{
  double result;

  -[CRLStroke i_miterLimit](self, "i_miterLimit");
  return result;
}

- (CRLStrokePattern)pattern
{
  return -[CRLStroke i_pattern](self, "i_pattern");
}

- (void)i_setPattern:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  CRLStrokePattern *v7;
  CRLStrokePattern *pattern;
  uint64_t v9;
  id v10;

  v10 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLStroke pattern](self, "pattern"));

  v5 = v10;
  if (v4 != v10)
  {
    v6 = -[CRLStroke isRoundDash](self, "isRoundDash");
    v7 = (CRLStrokePattern *)objc_msgSend(v10, "copy");
    pattern = self->_pattern;
    self->_pattern = v7;

    if (objc_msgSend(v10, "isRoundDash"))
    {
      v5 = v10;
      if ((v6 & 1) == 0)
      {
        v9 = 1;
LABEL_7:
        -[CRLStroke i_setCap:](self, "i_setCap:", v9);
        v5 = v10;
      }
    }
    else
    {
      v5 = v10;
      if (v6)
      {
        v9 = 0;
        goto LABEL_7;
      }
    }
  }

}

- (double)actualWidth
{
  double result;

  -[CRLStroke i_actualWidth](self, "i_actualWidth");
  return result;
}

- (void)i_setActualWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;

  if (a3 < 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012502B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1E180();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012502D0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStroke i_setActualWidth:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLStroke.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 497, 0, "Actual stroke width (%f) should not be negative.", *(_QWORD *)&a3);

  }
  v8 = 0.0;
  if (a3 >= 0.0)
    v8 = a3;
  self->_actualWidth = v8;
}

+ (id)i_newStroke
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern solidPattern](CRLStrokePattern, "solidPattern"));
  v5 = objc_msgSend(v2, "initWithColor:width:cap:join:pattern:", v3, 0, 0, v4, 1.0);

  return v5;
}

+ (id)i_newEmptyStroke
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern emptyPattern](CRLStrokePattern, "emptyPattern"));
  v5 = objc_msgSend(v2, "initWithColor:width:cap:join:pattern:", v3, 0, 0, v4, 1.0);

  return v5;
}

+ (id)stroke
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FF180;
  block[3] = &unk_10122DC38;
  block[4] = a1;
  if (qword_101415420 != -1)
    dispatch_once(&qword_101415420, block);
  return (id)qword_101415428;
}

+ (id)emptyStroke
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FF218;
  block[3] = &unk_10122DC38;
  block[4] = a1;
  if (qword_101415430 != -1)
    dispatch_once(&qword_101415430, block);
  return (id)qword_101415438;
}

+ (CRLStroke)strokeWithColor:(id)a3 width:(double)a4
{
  id v6;
  uint64_t v7;
  Class v8;
  id v9;
  void *v10;
  id v11;

  v6 = a3;
  objc_opt_class(a1, v7);
  v9 = [v8 alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern solidPattern](CRLStrokePattern, "solidPattern"));
  v11 = objc_msgSend(v9, "initWithColor:width:cap:join:pattern:", v6, 0, 0, v10, a4);

  return (CRLStroke *)v11;
}

+ (CRLStroke)strokeWithColor:(id)a3 width:(double)a4 pattern:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  Class v11;
  id v12;

  v8 = a5;
  v9 = a3;
  objc_opt_class(a1, v10);
  v12 = objc_msgSend([v11 alloc], "initWithColor:width:cap:join:pattern:", v9, 0, 0, v8, a4);

  return (CRLStroke *)v12;
}

+ (CRLStroke)strokeWithColor:(id)a3 width:(double)a4 cap:(unint64_t)a5 join:(unint64_t)a6 pattern:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  Class v15;
  id v16;

  v12 = a7;
  v13 = a3;
  objc_opt_class(a1, v14);
  v16 = objc_msgSend([v15 alloc], "initWithColor:width:cap:join:pattern:", v13, a5, a6, v12, a4);

  return (CRLStroke *)v16;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  CRLStroke *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  id v11;
  id v12;
  uint64_t v13;
  double v14;
  id v15;
  BOOL v16;
  unsigned int v17;
  unsigned int v18;
  double v19;
  double v20;
  double v21;
  unsigned int v22;
  unsigned int v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  unsigned int v29;
  unsigned int v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  unsigned int v34;
  unsigned int v35;
  CRLColor *color;
  uint64_t v37;
  void *v38;
  unsigned __int8 v39;

  v5 = (CRLStroke *)a3;
  if (v5 == self)
    goto LABEL_30;
  objc_opt_class(CRLStroke, v4);
  if ((objc_opt_isKindOfClass(self, v6) & 1) == 0)
    goto LABEL_5;
  objc_opt_class(CRLStroke, v7);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) == 0)
    goto LABEL_5;
  *(_QWORD *)&v10 = objc_opt_class(self, v9).n128_u64[0];
  v12 = objc_msgSend(v11, "mutableClass", v10);
  *(_QWORD *)&v14 = objc_opt_class(v5, v13).n128_u64[0];
  if (v12 != objc_msgSend(v15, "mutableClass", v14))
    goto LABEL_5;
  v17 = -[CRLStroke supportsWidth](self, "supportsWidth");
  v18 = -[CRLStroke supportsWidth](v5, "supportsWidth");
  if (v17)
  {
    if (!v18)
      goto LABEL_5;
    -[CRLStroke width](self, "width");
    v20 = v19;
    -[CRLStroke width](v5, "width");
    if (v20 != v21 && vabdd_f64(v20, v21) >= 0.00999999978)
      goto LABEL_5;
  }
  else if ((v18 & 1) != 0)
  {
    goto LABEL_5;
  }
  v22 = -[CRLStroke supportsLineOptions](self, "supportsLineOptions");
  v23 = -[CRLStroke supportsLineOptions](v5, "supportsLineOptions");
  if (v22)
  {
    if (!v23)
      goto LABEL_5;
    v24 = -[CRLStroke cap](self, "cap");
    if (v24 != (void *)-[CRLStroke cap](v5, "cap"))
      goto LABEL_5;
    v25 = -[CRLStroke join](self, "join");
    if (v25 != (void *)-[CRLStroke join](v5, "join"))
      goto LABEL_5;
    -[CRLStroke miterLimit](self, "miterLimit");
    v27 = v26;
    -[CRLStroke miterLimit](v5, "miterLimit");
    if (v27 != v28)
      goto LABEL_5;
  }
  else if ((v23 & 1) != 0)
  {
    goto LABEL_5;
  }
  v29 = -[CRLStroke supportsPattern](self, "supportsPattern");
  v30 = -[CRLStroke supportsPattern](v5, "supportsPattern");
  if (v29)
  {
    if (!v30)
      goto LABEL_5;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke pattern](self, "pattern"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke pattern](v5, "pattern"));
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if ((v33 & 1) == 0)
      goto LABEL_5;
  }
  else if ((v30 & 1) != 0)
  {
    goto LABEL_5;
  }
  v34 = -[CRLStroke supportsColor](self, "supportsColor");
  v35 = -[CRLStroke supportsColor](v5, "supportsColor");
  if (v34)
  {
    if (v35)
    {
      color = self->_color;
      v37 = objc_claimAutoreleasedReturnValue(-[CRLStroke color](v5, "color"));
      if (!((unint64_t)color | v37))
        goto LABEL_30;
      v38 = (void *)v37;
      v39 = -[CRLColor isEqual:](color, "isEqual:", v37);

      if ((v39 & 1) != 0)
        goto LABEL_30;
    }
  }
  else if ((v35 & 1) == 0)
  {
LABEL_30:
    v16 = 1;
    goto LABEL_31;
  }
LABEL_5:
  v16 = 0;
LABEL_31:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (-[CRLStroke supportsColor](self, "supportsColor"))
    v3 = -[CRLColor hash](self->_color, "hash");
  else
    v3 = 0xCBF29CE484222325;
  if (-[CRLStroke supportsLineOptions](self, "supportsLineOptions"))
  {
    v4 = sub_1000BC018((char *)&self->_cap, 8, v3);
    v5 = sub_1000BC018((char *)&self->_join, 8, v4);
    v3 = sub_1000BC018((char *)&self->_miterLimit, 8, v5);
  }
  if (-[CRLStroke supportsPattern](self, "supportsPattern"))
    return -[CRLStrokePattern hash](self->_pattern, "hash") ^ v3;
  return v3;
}

- (NSString)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke pattern](self, "pattern"));
  -[CRLStroke width](self, "width");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
  v10 = sub_1004115B4(-[CRLStroke cap](self, "cap"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = sub_1004115D8(-[CRLStroke join](self, "join"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p pattern=<%@>' width=%f color=<%@> cap=%@ join=%@>"), v5, self, v6, v8, v9, v11, v13));

  return (NSString *)v14;
}

- (double)renderedWidth
{
  return self->_width;
}

- (double)dashSpacing
{
  CRLStrokePattern *pattern;
  double v4;

  pattern = self->_pattern;
  v4 = 0.0;
  if (pattern && (id)-[CRLStrokePattern count](pattern, "count") == (id)2)
    return -[CRLStrokePattern pattern](self->_pattern, "pattern")[1];
  return v4;
}

- (BOOL)isDash
{
  _BOOL4 v3;

  v3 = -[CRLStrokePattern isDash](self->_pattern, "isDash");
  if (v3)
    LOBYTE(v3) = self->_cap != 1;
  return v3;
}

- (BOOL)isRoundDash
{
  _BOOL4 v3;

  v3 = -[CRLStrokePattern isRoundDash](self->_pattern, "isRoundDash");
  if (v3)
    LOBYTE(v3) = self->_cap == 1;
  return v3;
}

- (BOOL)drawsOutsideStrokeBounds
{
  return 0;
}

- (BOOL)needsToExtendJoinsForBoundsCalculation
{
  return 0;
}

- (CGPath)pathToStrokeFromCGPath:(CGPath *)a3
{
  return a3;
}

- (id)pathToStrokeFromCRLBezierPath:(id)a3
{
  id v4;
  CGPath *v5;
  id v6;
  CRLBezierPath *v7;
  void *v8;

  v4 = objc_retainAutorelease(a3);
  v5 = -[CRLStroke pathToStrokeFromCGPath:](self, "pathToStrokeFromCGPath:", objc_msgSend(v4, "CGPath"));
  v6 = objc_retainAutorelease(v4);
  if (v5 == objc_msgSend(v6, "CGPath"))
  {
    v7 = (CRLBezierPath *)v6;
  }
  else
  {
    v7 = objc_alloc_init(CRLBezierPath);
    objc_msgSend(v6, "copyPathAttributesTo:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", v5));
    -[CRLBezierPath appendBezierPath:](v7, "appendBezierPath:", v8);

  }
  return v7;
}

- (_CRLStrokeOutsets)outsets
{
  unsigned int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _CRLStrokeOutsets result;

  v3 = -[CRLStroke supportsWidth](self, "supportsWidth");
  v4 = 0.0;
  if (v3)
  {
    -[CRLStroke width](self, "width", 0.0);
    v4 = v5 * 0.5;
  }
  v6 = v4;
  v7 = v4;
  v8 = v4;
  result.var3 = v8;
  result.var2 = v7;
  result.var1 = v6;
  result.var0 = v4;
  return result;
}

- (void)i_setPropertiesFromStroke:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "color"));
  -[CRLStroke setI_color:](self, "setI_color:", v5);

  objc_msgSend(v4, "width");
  -[CRLStroke i_setWidth:](self, "i_setWidth:");
  -[CRLStroke setI_join:](self, "setI_join:", objc_msgSend(v4, "join"));
  objc_msgSend(v4, "miterLimit");
  -[CRLStroke setI_miterLimit:](self, "setI_miterLimit:");
  objc_msgSend(v4, "actualWidth");
  -[CRLStroke i_setActualWidth:](self, "i_setActualWidth:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pattern"));
  -[CRLStroke i_setPattern:](self, "i_setPattern:", v6);

  v7 = objc_msgSend(v4, "cap");
  -[CRLStroke i_setCap:](self, "i_setCap:", v7);
}

- (void)i_setPatternPropertiesFromStroke:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CRLStroke setI_join:](self, "setI_join:", objc_msgSend(v4, "join"));
  objc_msgSend(v4, "miterLimit");
  -[CRLStroke setI_miterLimit:](self, "setI_miterLimit:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pattern"));
  -[CRLStroke i_setPattern:](self, "i_setPattern:", v5);

  v6 = objc_msgSend(v4, "cap");
  -[CRLStroke i_setCap:](self, "i_setCap:", v6);
}

- (void)applyToContext:(CGContext *)a3
{
  -[CRLStroke applyToContext:insideStroke:](self, "applyToContext:insideStroke:", a3, 0);
}

- (void)applyToContext:(CGContext *)a3 insideStroke:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double width;
  CGLineJoin v9;
  CGLineCap v10;
  unint64_t cap;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke colorForCGContext:](self, "colorForCGContext:"));
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(v7, "CGColor"));
  width = self->_width;
  if (v4)
    width = width + width;
  CGContextSetLineWidth(a3, width);
  v9 = sub_1000D7994(self->_join);
  CGContextSetLineJoin(a3, v9);
  CGContextSetMiterLimit(a3, self->_miterLimit);
  cap = self->_cap;
  -[CRLStrokePattern i_applyToContext:lineWidth:capStyle:](self->_pattern, "i_applyToContext:lineWidth:capStyle:", a3, &cap, self->_width * (self->_actualWidth / self->_width));
  v10 = sub_1000D7994(cap);
  CGContextSetLineCap(a3, v10);

}

- (BOOL)isNullStroke
{
  return (id)-[CRLStrokePattern patternType](self->_pattern, "patternType") == (id)2;
}

- (BOOL)shouldRender
{
  return self->_width > 0.0 && (id)-[CRLStrokePattern patternType](self->_pattern, "patternType") != (id)2;
}

- (double)lineEndInsetAdjustment
{
  return 0.5;
}

- (id)strokeLineEnd:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v5 = v4;
  if (v4 && objc_msgSend(v4, "rangeOfString:", CFSTR(":")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", (char *)objc_msgSend(v5, "rangeOfString:", CFSTR(":")) + 1));
    v6 = (id)objc_claimAutoreleasedReturnValue(+[CRLLineEnd lineEndWithIdentifier:](CRLLineEnd, "lineEndWithIdentifier:", v7));

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (id)colorForCGContext:(CGContext *)a3
{
  uint64_t v4;
  double v5;
  id v6;
  void *v7;

  if ((sub_100411EAC((uint64_t)a3) & 1) != 0)
  {
    *(_QWORD *)&v5 = objc_opt_class(self, v4).n128_u64[0];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorOnSuppressedBackgrounds", v5));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
  }
  return v7;
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  -[CRLStroke paintRect:wantsInteriorStroke:inContext:](self, "paintRect:wantsInteriorStroke:inContext:", 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)paintRect:(CGRect)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5
{
  _BOOL8 v6;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPath *Mutable;
  CGRect v13;

  v6 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGPathAddRect(Mutable, 0, v13);
  -[CRLStroke paintPath:wantsInteriorStroke:inContext:](self, "paintPath:wantsInteriorStroke:inContext:", Mutable, v6, a5);
  CGPathRelease(Mutable);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  -[CRLStroke paintPath:wantsInteriorStroke:inContext:](self, "paintPath:wantsInteriorStroke:inContext:", a3, 0, a4);
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5
{
  -[CRLStroke paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:](self, "paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:", a3, a4, a5, 0, 0, 0);
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8
{
  _BOOL8 v9;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  CGFloat v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v9 = a4;
  if (-[CRLStroke shouldRender](self, "shouldRender", a3, a4, a5, a6, a7, a8))
  {
    CGContextSaveGState(a5);
    if ((unint64_t)sub_1000C9440(a3) > 0x9C40)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", a3));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pathSplitAtSubpathBoundariesWithSoftElementLimit:hardElementLimit:", 40000, 50000));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
      objc_msgSend(v14, "alphaComponent");
      v16 = v15;

      if (v16 >= 1.0)
      {
        -[CRLStroke applyToContext:insideStroke:](self, "applyToContext:insideStroke:", a5, v9);
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
        objc_msgSend(v17, "alphaComponent");
        CGContextSetAlpha(a5, v18);

        CGContextBeginTransparencyLayer(a5, 0);
        v19 = -[CRLStroke mutableCopy](self, "mutableCopy");
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "color"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "colorWithAlphaComponent:", 1.0));
        objc_msgSend(v19, "setColor:", v21);

        objc_msgSend(v19, "applyToContext:insideStroke:", a5, v9);
      }
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v22 = v13;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(_QWORD *)v29 != v25)
              objc_enumerationMutation(v22);
            v27 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i));
            -[CRLStroke p_strokePathChunk:inContext:wantsInteriorStroke:](self, "p_strokePathChunk:inContext:wantsInteriorStroke:", objc_msgSend(v27, "CGPath", (_QWORD)v28), a5, v9);
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v24);
      }

      if (v16 < 1.0)
        CGContextEndTransparencyLayer(a5);

    }
    else
    {
      -[CRLStroke applyToContext:insideStroke:](self, "applyToContext:insideStroke:", a5, v9);
      -[CRLStroke p_strokePathChunk:inContext:wantsInteriorStroke:](self, "p_strokePathChunk:inContext:wantsInteriorStroke:", a3, a5, v9);
    }
    CGContextRestoreGState(a5);
  }
}

- (void)p_strokePathChunk:(CGPath *)a3 inContext:(CGContext *)a4 wantsInteriorStroke:(BOOL)a5
{
  _BOOL4 v5;

  v5 = a5;
  CGContextSaveGState(a4);
  if (v5)
  {
    CGContextAddPath(a4, a3);
    CGContextClip(a4);
  }
  CGContextAddPath(a4, a3);
  CGContextStrokePath(a4);
  CGContextRestoreGState(a4);
}

- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7
{
  -[CRLStroke paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:](self, "paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:", a3, a7, 0, a4.x, a4.y, a5, a6);
}

- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7 useFastDrawing:(BOOL)a8
{
  CGFloat y;
  CGFloat x;
  id v14;
  double v15;
  CGFloat v16;
  double v17;
  id v18;
  double v19;
  CGAffineTransform v20;
  CGAffineTransform transform;
  CGAffineTransform v22;

  y = a4.y;
  x = a4.x;
  v14 = a3;
  CGContextSaveGState(a7);
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeTranslation(&v22, x, y);
  v20 = v22;
  CGAffineTransformScale(&transform, &v20, a6, a6);
  v22 = transform;
  v20 = transform;
  CGAffineTransformRotate(&transform, &v20, a5);
  v22 = transform;
  objc_msgSend(v14, "endPoint");
  v16 = -v15;
  objc_msgSend(v14, "endPoint");
  v20 = v22;
  CGAffineTransformTranslate(&transform, &v20, v16, -v17);
  v22 = transform;
  CGContextConcatCTM(a7, &transform);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path")));
  CGContextAddPath(a7, (CGPathRef)objc_msgSend(v18, "CGPath"));

  if (objc_msgSend(v14, "isFilled"))
  {
    CGContextFillPath(a7);
  }
  else
  {
    -[CRLStroke width](self, "width");
    CGContextSetLineWidth(a7, v19 / a6);
    CGContextSetLineJoin(a7, (CGLineJoin)objc_msgSend(v14, "lineJoin"));
    CGContextStrokePath(a7);
  }
  CGContextRestoreGState(a7);

}

- (CGRect)boundsForLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 transform:(CGAffineTransform *)a7
{
  CGFloat y;
  CGFloat x;
  id v13;
  double v14;
  CGFloat v15;
  double v16;
  __int128 v17;
  id v18;
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
  CGAffineTransform v32;
  CGAffineTransform t1;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGRect result;

  y = a4.y;
  x = a4.x;
  v13 = a3;
  memset(&v35, 0, sizeof(v35));
  CGAffineTransformMakeTranslation(&v35, x, y);
  t1 = v35;
  CGAffineTransformScale(&v34, &t1, a6, a6);
  v35 = v34;
  t1 = v34;
  CGAffineTransformRotate(&v34, &t1, a5);
  v35 = v34;
  objc_msgSend(v13, "endPoint");
  v15 = -v14;
  objc_msgSend(v13, "endPoint");
  t1 = v35;
  CGAffineTransformTranslate(&v34, &t1, v15, -v16);
  v35 = v34;
  t1 = v34;
  v17 = *(_OWORD *)&a7->c;
  *(_OWORD *)&v32.a = *(_OWORD *)&a7->a;
  *(_OWORD *)&v32.c = v17;
  *(_OWORD *)&v32.tx = *(_OWORD *)&a7->tx;
  CGAffineTransformConcat(&v34, &t1, &v32);
  v35 = v34;
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", objc_msgSend(v18, "CGPath")));

  v34 = v35;
  objc_msgSend(v19, "transformUsingAffineTransform:", &v34);
  if (objc_msgSend(v13, "isFilled"))
  {
    objc_msgSend(v19, "bounds");
  }
  else
  {
    -[CRLStroke width](self, "width");
    objc_msgSend(v19, "setLineWidth:");
    objc_msgSend(v19, "setLineJoinStyle:", sub_1000D79AC((int)objc_msgSend(v13, "lineJoin")));
    objc_msgSend(v19, "boundsIncludingStroke");
  }
  v24 = v20;
  v25 = v21;
  v26 = v22;
  v27 = v23;

  v28 = v24;
  v29 = v25;
  v30 = v26;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (id)pathForLineEnd:(id)a3 wrapPath:(BOOL)a4 atPoint:(CGPoint)a5 atAngle:(double)a6 withScale:(double)a7
{
  CGFloat y;
  CGFloat x;
  id v13;
  double v14;
  CGFloat v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;

  y = a5.y;
  x = a5.x;
  v13 = a3;
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeTranslation(&v24, x, y);
  v22 = v24;
  CGAffineTransformScale(&v23, &v22, a7, a7);
  v24 = v23;
  v22 = v23;
  CGAffineTransformRotate(&v23, &v22, a6);
  v24 = v23;
  objc_msgSend(v13, "endPoint");
  v15 = -v14;
  objc_msgSend(v13, "endPoint");
  v22 = v24;
  CGAffineTransformTranslate(&v23, &v22, v15, -v16);
  v24 = v23;
  if (a4)
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "wrapPath"));
  else
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
  v18 = v17;
  v19 = objc_msgSend(v17, "copy");

  v23 = v24;
  objc_msgSend(v19, "transformUsingAffineTransform:", &v23);
  if (objc_msgSend(v13, "isFilled"))
  {
    objc_msgSend(v19, "setLineWidth:", 0.0);
  }
  else
  {
    -[CRLStroke width](self, "width");
    objc_msgSend(v19, "setLineWidth:");
    objc_msgSend(v19, "setLineJoinStyle:", sub_1000D79AC((int)objc_msgSend(v13, "lineJoin")));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "strokedCopy"));

    v19 = (id)v20;
  }

  return v19;
}

- (double)horizontalMarginForSwatch
{
  void *v2;
  unsigned int v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke pattern](self, "pattern"));
  v3 = objc_msgSend(v2, "isRoundDash");

  result = 0.0;
  if (v3)
    return -3.0;
  return result;
}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  float v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  CGFloat v23;
  double MidY;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  double v30;
  CGFloat v31;
  CGPath *Mutable;
  CGFloat MinX;
  CGFloat v34;
  CGFloat MaxX;
  CGFloat v36;
  NSAttributedStringKey v37;
  void *v38;
  CGFloat lengths[3];
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CRLStroke horizontalMarginForSwatch](self, "horizontalMarginForSwatch");
  v11 = v10;
  if (-[CRLStroke isNullStroke](self, "isNullStroke"))
  {
    CGContextSaveGState(a4);
    v12 = (height + -35.0) * 0.5;
    v13 = y + floorf(v12) + 0.5;
    v14 = width + v11 * -2.0 + -1.0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
    CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v15, "CGColor"));

    *(_OWORD *)lengths = xmmword_100EEF260;
    CGContextSetLineWidth(a4, 1.0);
    CGContextSetLineDash(a4, 0.0, lengths, 2uLL);
    v40.origin.x = x + v11 + 0.5;
    v40.origin.y = v13;
    v40.size.width = v14;
    v40.size.height = 35.0;
    CGContextStrokeRect(a4, v40);
    CGContextRestoreGState(a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
    CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v16, "CGColor"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("NONE_STROKE_LABEL"), CFSTR("None"), 0));

    UIGraphicsPushContext(a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 16.0));
    v37 = NSFontAttributeName;
    v38 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
    objc_msgSend(v18, "sizeWithAttributes:", v20);
    *(float *)&v21 = (v14 - v21) * 0.5;
    *(float *)&v22 = (35.0 - v22) * 0.5;
    objc_msgSend(v18, "drawAtPoint:withAttributes:", v20, x + v11 + 0.5 + floorf(*(float *)&v21), v13 + floorf(*(float *)&v22));
    UIGraphicsPopContext();

  }
  else
  {
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    *(_QWORD *)&v23 = (unint64_t)CGRectInset(v41, v11, 0.0);
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    MidY = CGRectGetMidY(v42);
    -[CRLStroke width](self, "width");
    v26 = MidY + v25 * -0.5;
    -[CRLStroke width](self, "width");
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke pattern](self, "pattern"));
    -[CRLStroke width](self, "width");
    objc_msgSend(v29, "p_renderableLengthForUnclippedPatternWithLineWidth:withinAvailableLength:");
    v31 = v30;

    Mutable = CGPathCreateMutable();
    v43.origin.x = v23;
    v43.origin.y = v26;
    v43.size.width = v31;
    v43.size.height = v28;
    MinX = CGRectGetMinX(v43);
    v44.origin.x = v23;
    v44.origin.y = v26;
    v44.size.width = v31;
    v44.size.height = v28;
    v34 = CGRectGetMidY(v44);
    CGPathMoveToPoint(Mutable, 0, MinX, v34);
    v45.origin.x = v23;
    v45.origin.y = v26;
    v45.size.width = v31;
    v45.size.height = v28;
    MaxX = CGRectGetMaxX(v45);
    v46.origin.x = v23;
    v46.origin.y = v26;
    v46.size.width = v31;
    v46.size.height = v28;
    v36 = CGRectGetMidY(v46);
    CGPathAddLineToPoint(Mutable, 0, MaxX, v36);
    -[CRLStroke paintPath:inContext:](self, "paintPath:inContext:", Mutable, a4);
    CGPathRelease(Mutable);
  }
}

- (BOOL)supportsPattern
{
  return 1;
}

- (BOOL)supportsWidth
{
  return (id)-[CRLStrokePattern patternType](self->_pattern, "patternType") != (id)2;
}

- (BOOL)supportsColor
{
  return (id)-[CRLStrokePattern patternType](self->_pattern, "patternType") != (id)2;
}

- (BOOL)supportsLineOptions
{
  return 1;
}

- (double)suggestedMinimumLineWidth
{
  return 0.0;
}

- (BOOL)isNearlyWhite
{
  void *v4;
  unsigned __int8 v5;

  if (-[CRLStroke isNullStroke](self, "isNullStroke"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
  v5 = objc_msgSend(v4, "isNearlyWhite");

  return v5;
}

- (BOOL)requiresOutlineOnBackgroundWithAppearance:(unint64_t)a3
{
  void *v6;
  unsigned __int8 v7;

  if (-[CRLStroke isNullStroke](self, "isNullStroke"))
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
  v7 = objc_msgSend(v6, "requiresOutlineOnBackgroundWithAppearance:", a3);

  return v7;
}

- (BOOL)canApplyDirectlyToRepRenderable
{
  void *v3;
  unsigned int v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  unint64_t v8;
  BOOL v9;

  if (!-[CRLStroke shouldRender](self, "shouldRender"))
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
  v4 = objc_msgSend(v3, "isOpaque");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke pattern](self, "pattern"));
  if (objc_msgSend(v5, "count"))
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "patternType") != (id)1;
  v8 = -[CRLStroke cap](self, "cap");
  v9 = (v8 | -[CRLStroke join](self, "join")) == 0;
  if (v6)
    v9 = 0;
  if (v4)
    v7 = v9;
  else
    v7 = 0;

  return v7;
}

- (void)applyToRepRenderable:(id)a3 withScale:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  v6 = a3;
  if (!-[CRLStroke canApplyDirectlyToRepRenderable](self, "canApplyDirectlyToRepRenderable"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012502F0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1E208();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250310);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStroke applyToRepRenderable:withScale:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLStroke.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 1056, 0, "Applying stroke with unsupported properties to renderable");

  }
  if (-[CRLStroke shouldRender](self, "shouldRender"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
    objc_msgSend(v6, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    -[CRLStroke width](self, "width");
    v12 = v11 * a4;
  }
  else
  {
    objc_msgSend(v6, "setBorderColor:", 0);
    v12 = 0.0;
  }
  objc_msgSend(v6, "setBorderWidth:", v12);

}

- (BOOL)canApplyToShapeRenderable
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  double v7;
  uint64_t v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLStroke, a2).n128_u64[0];
  if ((-[CRLStroke isMemberOfClass:](self, "isMemberOfClass:", v4, v3) & 1) != 0)
    return 1;
  *(_QWORD *)&v7 = objc_opt_class(CRLMutableStroke, v5).n128_u64[0];
  return -[CRLStroke isMemberOfClass:](self, "isMemberOfClass:", v8, v7);
}

- (void)applyToShapeRenderable:(id)a3 withScale:(double)a4
{
  -[CRLStroke applyToShapeRenderable:insideStroke:withScale:](self, "applyToShapeRenderable:insideStroke:withScale:", a3, 0, a4);
}

- (void)applyToShapeRenderable:(id)a3 insideStroke:(BOOL)a4 withScale:(double)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  float v13;
  void *v14;
  float v15;
  void *v16;

  v6 = a4;
  v8 = a3;
  if (!-[CRLStroke canApplyToShapeRenderable](self, "canApplyToShapeRenderable"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250330);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1E294();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250350);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStroke applyToShapeRenderable:insideStroke:withScale:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLStroke.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 1082, 0, "don't try to apply this stroke to a shape renderable");

  }
  if (-[CRLStroke shouldRender](self, "shouldRender"))
  {
    -[CRLStroke width](self, "width");
    v13 = v12 * a5;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
    objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v14, "CGColor"));

    v15 = v13 + v13;
    if (!v6)
      v15 = v13;
    objc_msgSend(v8, "setLineWidth:", v15);
    -[CRLStroke miterLimit](self, "miterLimit");
    objc_msgSend(v8, "setMiterLimit:");
    objc_msgSend(v8, "setCGLineCap:", sub_1000D7994(-[CRLStroke cap](self, "cap")));
    objc_msgSend(v8, "setCGLineJoin:", sub_1000D7994(-[CRLStroke join](self, "join")));
    if (-[CRLStroke supportsPattern](self, "supportsPattern"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke pattern](self, "pattern"));
      objc_msgSend(v16, "p_applyToShapeRenderable:lineWidth:", v8, v13);

    }
    else
    {
      objc_msgSend(v8, "setLineDashPattern:", 0);
    }
  }
  else
  {
    objc_msgSend(v8, "setStrokeColor:", 0);
  }

}

- (BOOL)drawsInOneStep
{
  return 1;
}

- (BOOL)shouldAntialiasDefeat
{
  return 1;
}

- (id)strokeByTransformingByTransform:(CGAffineTransform *)a3
{
  double v3;
  id v4;
  double v5;

  v3 = fmin(a3->a, a3->d);
  v4 = -[CRLStroke mutableCopy](self, "mutableCopy");
  objc_msgSend(v4, "width");
  objc_msgSend(v4, "setWidth:", fmax(floor(v3 * v5), 0.25));
  return v4;
}

- (CRLColor)i_color
{
  return self->_color;
}

- (void)setI_color:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)i_width
{
  return self->_width;
}

- (unint64_t)i_cap
{
  return self->_cap;
}

- (unint64_t)i_join
{
  return self->_join;
}

- (void)setI_join:(unint64_t)a3
{
  self->_join = a3;
}

- (double)i_miterLimit
{
  return self->_miterLimit;
}

- (void)setI_miterLimit:(double)a3
{
  self->_miterLimit = a3;
}

- (CRLStrokePattern)i_pattern
{
  return self->_pattern;
}

- (double)i_actualWidth
{
  return self->_actualWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
