@implementation CRLStrokePattern

- (CRLStrokePattern)initWithPatternType:(int64_t)a3 pattern:(const double *)a4 count:(unint64_t)a5 phase:(double)a6
{
  CRLStrokePattern *v9;
  CRLStrokePattern *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CRLStrokePattern;
  v9 = -[CRLStrokePattern init](&v16, "init", a6);
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    if (a5 >= 7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012500B0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1DEA8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012500D0);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStrokePattern initWithPatternType:pattern:count:phase:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLStroke.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 46, 0, "Pattern should have no more than CRL_MAX_STROKE_PATTERN (%d) elements", 6);

    }
    v14 = 6;
    if (a5 < 6)
      v14 = a5;
    v10->_count = v14;
    if (a4)
      memcpy(v10->_pattern, a4, 8 * v14);
  }
  return v10;
}

- (CRLStrokePattern)initWithPattern:(const double *)a3 count:(unint64_t)a4 phase:(double)a5
{
  return -[CRLStrokePattern initWithPatternType:pattern:count:phase:](self, "initWithPatternType:pattern:count:phase:", 0, a3, a4, a5);
}

+ (id)solidPattern
{
  if (qword_1014153C0 != -1)
    dispatch_once(&qword_1014153C0, &stru_1012500F0);
  return (id)qword_1014153C8;
}

+ (id)emptyPattern
{
  if (qword_1014153D0 != -1)
    dispatch_once(&qword_1014153D0, &stru_101250110);
  return (id)qword_1014153D8;
}

+ (id)shortDashPattern
{
  if (qword_1014153E0 != -1)
    dispatch_once(&qword_1014153E0, &stru_101250130);
  return (id)qword_1014153E8;
}

+ (id)mediumDashPattern
{
  if (qword_1014153F0 != -1)
    dispatch_once(&qword_1014153F0, &stru_101250150);
  return (id)qword_1014153F8;
}

+ (id)longDashPattern
{
  if (qword_101415400 != -1)
    dispatch_once(&qword_101415400, &stru_101250170);
  return (id)qword_101415408;
}

+ (id)roundDashPattern
{
  if (qword_101415410 != -1)
    dispatch_once(&qword_101415410, &stru_101250190);
  return (id)qword_101415418;
}

+ (id)roundDashPatternWithSpacing:(double)a3
{
  _QWORD v4[2];

  v4[0] = 0x3F50624DD2F1A9FCLL;
  *(double *)&v4[1] = a3;
  return (id)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern strokePatternWithPattern:count:phase:](CRLStrokePattern, "strokePatternWithPattern:count:phase:", v4, 2, 0.0));
}

+ (id)dashPatternWithSpacing:(double)a3
{
  _QWORD v4[2];

  *(double *)v4 = a3;
  *(double *)&v4[1] = a3;
  return (id)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern strokePatternWithPattern:count:phase:](CRLStrokePattern, "strokePatternWithPattern:count:phase:", v4, 2, 0.0));
}

+ (CRLStrokePattern)strokePatternWithPattern:(const double *)a3 count:(unint64_t)a4 phase:(double)a5
{
  return -[CRLStrokePattern initWithPattern:count:phase:]([CRLStrokePattern alloc], "initWithPattern:count:phase:", a3, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  CRLStrokePattern *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  double *v16;
  double *pattern;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  _BOOL4 v23;
  BOOL v25;

  v4 = (CRLStrokePattern *)a3;
  objc_opt_class(CRLStrokePattern, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v4)
    goto LABEL_22;
  if (v4 == self)
  {
LABEL_23:
    LOBYTE(v23) = 1;
    goto LABEL_24;
  }
  if (-[CRLStrokePattern patternType](self, "patternType")
    && (v9 = -[CRLStrokePattern patternType](self, "patternType"), v9 != objc_msgSend(v8, "patternType"))
    || (-[CRLStrokePattern phase](self, "phase"), v11 = v10, objc_msgSend(v8, "phase"), v11 != v12)
    && vabdd_f64(v11, v12) >= 0.00999999978
    || (v13 = -[CRLStrokePattern count](self, "count"), v13 != objc_msgSend(v8, "count")))
  {
LABEL_22:
    LOBYTE(v23) = 0;
    goto LABEL_24;
  }
  v14 = -[CRLStrokePattern count](self, "count");
  if (v14 >= 6)
    v15 = 6;
  else
    v15 = v14;
  v16 = (double *)objc_msgSend(v8, "pattern");
  if (!v15)
    goto LABEL_23;
  pattern = self->_pattern;
  v18 = v15 - 1;
  do
  {
    v19 = *pattern++;
    v20 = v19;
    v21 = *v16++;
    v22 = v20 == v21;
    v23 = vabdd_f64(v20, v21) < 0.00999999978 || v22;
    v25 = v18-- != 0;
  }
  while (v23 && v25);
LABEL_24:

  return v23;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = sub_1000BBFE0((char *)&self->_count, 8);
  return sub_1000BC018((char *)&self->_type, 8, v3);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  Class v6;
  NSString *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokePattern p_patternString](self, "p_patternString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokePattern p_typeString](self, "p_typeString"));
  objc_opt_class(self, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%p) pattern: %@ count: %ld phase: %f type: %@"), v8, self, v3, self->_count, *(_QWORD *)&self->_phase, v4));

  return v9;
}

- (id)p_patternString
{
  unint64_t v3;
  __CFString *v4;
  double *pattern;
  NSString *v6;
  __CFString *v7;
  uint64_t v9;

  if (self->_count)
  {
    v3 = 0;
    v4 = CFSTR("none");
    pattern = self->_pattern;
    do
    {
      if (v3)
        v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %f"), v4, *(_QWORD *)&pattern[v3]);
      else
        v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), *(_QWORD *)pattern, v9);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v6);

      ++v3;
      v4 = v7;
    }
    while (v3 < self->_count);
  }
  else
  {
    v7 = CFSTR("none");
  }
  return v7;
}

- (id)p_typeString
{
  unint64_t type;

  type = self->_type;
  if (type > 2)
    return CFSTR("unknown");
  else
    return *(&off_101250370 + type);
}

- (double)pattern
{
  return self->_pattern;
}

- (BOOL)isDash
{
  double v2;
  double v3;

  if (self->_count != 2)
    return 0;
  v2 = self->_pattern[0];
  v3 = self->_pattern[1];
  if (v2 != v3 && vabdd_f64(v2, v3) >= 0.0001)
    return 0;
  if (fabs(v2 + -0.001) >= 0.0001)
    return v2 != 0.001;
  return 0;
}

- (BOOL)isRoundDash
{
  BOOL result;
  double v4;
  double v5;

  if (self->_count != 2)
    return 0;
  result = 0;
  v4 = self->_pattern[0];
  v5 = self->_pattern[1];
  if (v4 != v5 && vabdd_f64(v4, v5) >= 0.0001)
    return fabs(v4 + -0.001) < 0.0001 || v4 == 0.001;
  return result;
}

- (void)applyToContext:(CGContext *)a3 lineWidth:(double)a4
{
  -[CRLStrokePattern i_applyToContext:lineWidth:capStyle:](self, "i_applyToContext:lineWidth:capStyle:", a3, 0, a4);
}

- (void)i_applyToContext:(CGContext *)a3 lineWidth:(double)a4 capStyle:(unint64_t *)a5
{
  double *v9;
  unint64_t count;
  CGFloat *v11;
  double v12;
  double phase;
  double v14;
  float v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGFloat lengths[2];
  __int128 v19;
  __int128 v20;

  v19 = 0u;
  v20 = 0u;
  *(_OWORD *)lengths = 0u;
  v9 = -[CRLStrokePattern pattern](self, "pattern");
  count = self->_count;
  if (count)
  {
    v11 = lengths;
    do
    {
      v12 = *v9++;
      *v11++ = v12 * a4;
      --count;
    }
    while (count);
  }
  phase = self->_phase;
  if (-[CRLStrokePattern isRoundDash](self, "isRoundDash"))
  {
    memset(&v17, 0, sizeof(v17));
    CGContextGetCTM(&v17, a3);
    v16 = v17;
    v14 = sub_10007922C(&v16.a);
    if (a5 && *a5 == 1 && v14 * a4 <= 2.0)
    {
      lengths[0] = a4;
      *a5 = 0;
      v15 = 0.0;
    }
    else
    {
      lengths[1] = lengths[1] + a4;
      v15 = 0.5;
    }
  }
  else
  {
    v15 = phase * a4;
  }
  CGContextSetLineDash(a3, v15, lengths, self->_count);
}

- (double)p_renderableLengthForUnclippedPatternWithLineWidth:(double)a3 withinAvailableLength:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  float v17;
  double v18;

  if ((id)-[CRLStrokePattern count](self, "count") == (id)2)
  {
    v7 = *-[CRLStrokePattern pattern](self, "pattern") * a3;
    v8 = -[CRLStrokePattern pattern](self, "pattern")[1] * a3;
    -[CRLStrokePattern phase](self, "phase");
    v10 = v9 * a3;
    v11 = -[CRLStrokePattern isRoundDash](self, "isRoundDash");
    v12 = -0.0;
    if (v11)
      v12 = a3;
    v13 = v7 + v12;
    v14 = 0.5;
    if (!v11)
      v14 = v10;
    v15 = a4 - (v8 + v13 - v14);
    v16 = v8 + v13;
    v17 = fmodf(v15, v16);
    v18 = v17;
    if (v17 > 0.0 && v17 < 5.0 && v13 > v18)
    {
      a4 = a4 - v18;
      if (-[CRLStrokePattern isRoundDash](self, "isRoundDash"))
        return a4 + v8 * -0.5;
    }
  }
  return a4;
}

- (void)applyToShapeRenderable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012501B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1DF48();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012501D0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStrokePattern applyToShapeRenderable:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLStroke.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 324, 0, "invalid nil value for '%{public}s'", "shapeRenderable");

  }
  objc_msgSend(v4, "lineWidth");
  -[CRLStrokePattern p_applyToShapeRenderable:lineWidth:](self, "p_applyToShapeRenderable:lineWidth:", v4);

}

- (void)p_applyToShapeRenderable:(id)a3 lineWidth:(double)a4
{
  id v6;
  double *v7;
  double *v8;
  unint64_t v9;
  double v10;
  void *v11;
  id v12;

  v12 = a3;
  if ((id)-[CRLStrokePattern patternType](self, "patternType") == (id)1)
  {
    objc_msgSend(v12, "setLineDashPattern:", 0);
  }
  else if (!-[CRLStrokePattern patternType](self, "patternType"))
  {
    objc_msgSend(v12, "setLineDashPhase:", self->_phase * a4);
    v6 = objc_alloc_init((Class)NSMutableArray);
    v7 = -[CRLStrokePattern pattern](self, "pattern");
    if (self->_count)
    {
      v8 = v7;
      v9 = 0;
      do
      {
        v10 = v8[v9] * a4;
        if (v9 == 1 && -[CRLStrokePattern isRoundDash](self, "isRoundDash"))
        {
          objc_msgSend(v12, "setLineDashPhase:", 0.5);
          v10 = v10 + a4;
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10));
        objc_msgSend(v6, "addObject:", v11);

        ++v9;
      }
      while (v9 < self->_count);
    }
    objc_msgSend(v12, "setLineDashPattern:", v6);

  }
}

- (int64_t)patternType
{
  return self->_type;
}

- (unint64_t)count
{
  return self->_count;
}

- (double)phase
{
  return self->_phase;
}

@end
