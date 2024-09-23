@implementation CRLWPPadding

+ (id)padding
{
  return objc_alloc_init((Class)objc_opt_class(a1, a2));
}

+ (id)paddingWithTopInset:(double)a3 leftInset:(double)a4 bottomInset:(double)a5 rightInset:(double)a6
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithTopInset:leftInset:bottomInset:rightInset:", a3, a4, a5, a6);
}

- (CRLWPPadding)init
{
  return -[CRLWPPadding initWithTopInset:leftInset:bottomInset:rightInset:](self, "initWithTopInset:leftInset:bottomInset:rightInset:", 0.0, 0.0, 0.0, 0.0);
}

- (CRLWPPadding)initWithTopInset:(double)a3 leftInset:(double)a4 bottomInset:(double)a5 rightInset:(double)a6
{
  char *v6;
  double v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  objc_super v24;
  uint8_t buf[24];

  v24.receiver = self;
  v24.super_class = (Class)CRLWPPadding;
  v6 = -[CRLWPPadding init](&v24, "init");
  if (v6)
  {
    v7 = a3;
    if (a3 > 50000000.0 || (v7 = a4, a4 > 50000000.0) || (v7 = a5, a5 > 50000000.0) || (v7 = a6, a6 > 50000000.0))
    {
      v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", 50000000.0, v7);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124A428);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E15558(v8, v9);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124A448);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100E02830(v11, buf, v8, (os_log_t)v10);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPPadding initWithTopInset:leftInset:bottomInset:rightInset:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPPadding.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 53, 0, "Illegal huge padding value");

    }
    v14.f64[0] = a3;
    v14.f64[1] = a4;
    v15 = vmaxnmq_f64(v14, (float64x2_t)0);
    v16 = (float64x2_t)vdupq_n_s64(0x4187D78400000000uLL);
    *(int8x16_t *)(v6 + 8) = vbslq_s8((int8x16_t)vcgtq_f64(v15, v16), (int8x16_t)v16, (int8x16_t)v15);
    v17.f64[0] = a5;
    v17.f64[1] = a6;
    v18 = vmaxnmq_f64(v17, (float64x2_t)0);
    *(int8x16_t *)(v6 + 24) = vbslq_s8((int8x16_t)vcgtq_f64(v18, v16), (int8x16_t)v16, (int8x16_t)v18);
  }
  return (CRLWPPadding *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5;
  id v6;

  *(_QWORD *)&v5 = objc_opt_class(self, a2).n128_u64[0];
  return objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "initWithTopInset:leftInset:bottomInset:rightInset:", self->_topInset, self->_leftInset, self->_bottomInset, self->_rightInset);
}

- (void)transform:(CGAffineTransform *)a3
{
  double a;

  a = a3->a;
  if (a3->a >= a3->d)
    a = a3->d;
  *(float64x2_t *)&self->_topInset = vmulq_n_f64(*(float64x2_t *)&self->_topInset, a);
  *(float64x2_t *)&self->_bottomInset = vmulq_n_f64(*(float64x2_t *)&self->_bottomInset, a);
}

- (id)paddingByMirroringHorizontal
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[CRLWPPadding topInset](self, "topInset");
  v4 = v3;
  -[CRLWPPadding rightInset](self, "rightInset");
  v6 = v5;
  -[CRLWPPadding bottomInset](self, "bottomInset");
  v8 = v7;
  -[CRLWPPadding leftInset](self, "leftInset");
  return +[CRLWPPadding paddingWithTopInset:leftInset:bottomInset:rightInset:](CRLWPPadding, "paddingWithTopInset:leftInset:bottomInset:rightInset:", v4, v6, v8, v9);
}

- (UIEdgeInsets)edgeInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  -[CRLWPPadding topInset](self, "topInset");
  v4 = v3;
  -[CRLWPPadding leftInset](self, "leftInset");
  v6 = v5;
  -[CRLWPPadding bottomInset](self, "bottomInset");
  v8 = v7;
  -[CRLWPPadding rightInset](self, "rightInset");
  v10 = v9;
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.right = v10;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  double *v7;
  double v8;
  double topInset;
  double v10;
  double leftInset;
  double v12;
  double bottomInset;
  double v14;
  double rightInset;
  BOOL v16;

  v5 = a3;
  if (v5 && (v6 = objc_opt_class(self, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = (double *)v5;
    v8 = v7[1];
    topInset = self->_topInset;
    if ((v8 == topInset || vabdd_f64(v8, topInset) < fabs(topInset * 0.000000999999997))
      && ((v10 = v7[2], leftInset = self->_leftInset, v10 == leftInset)
       || vabdd_f64(v10, leftInset) < fabs(leftInset * 0.000000999999997))
      && ((v12 = v7[3], bottomInset = self->_bottomInset, v12 == bottomInset)
       || vabdd_f64(v12, bottomInset) < fabs(bottomInset * 0.000000999999997)))
    {
      v14 = v7[4];
      rightInset = self->_rightInset;
      v16 = v14 == rightInset || vabdd_f64(v14, rightInset) < fabs(rightInset * 0.000000999999997);
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  return 0;
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@*)%p { topInset=%f; leftInset=%f; bottomInset=%f; rightInset=%f }"),
                   v5,
                   self,
                   *(_QWORD *)&self->_topInset,
                   *(_QWORD *)&self->_leftInset,
                   *(_QWORD *)&self->_bottomInset,
                   *(_QWORD *)&self->_rightInset));

  return v6;
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

- (double)leftInset
{
  return self->_leftInset;
}

- (void)setLeftInset:(double)a3
{
  self->_leftInset = a3;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (void)setBottomInset:(double)a3
{
  self->_bottomInset = a3;
}

- (double)rightInset
{
  return self->_rightInset;
}

- (void)setRightInset:(double)a3
{
  self->_rightInset = a3;
}

@end
