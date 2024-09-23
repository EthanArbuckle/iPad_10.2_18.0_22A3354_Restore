@implementation CRLWPListLabelGeometry

+ (id)listLabelGeometry
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithScale:scaleWithText:baselineOffset:", 1, 1.0, 0.0);
}

- (CRLWPListLabelGeometry)initWithScale:(double)a3 scaleWithText:(BOOL)a4 baselineOffset:(double)a5
{
  CRLWPListLabelGeometry *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLWPListLabelGeometry;
  result = -[CRLWPListLabelGeometry init](&v9, "init");
  if (result)
  {
    result->mScaleWithText = a4;
    result->mScale = a3;
    result->mBaselineOffset = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  CRLWPListLabelGeometry *v4;
  uint64_t v5;
  CRLWPListLabelGeometry *v6;
  BOOL v7;
  double v8;
  uint64_t v9;
  double *v10;
  double mScale;
  double v12;
  double mBaselineOffset;
  double v14;

  v4 = (CRLWPListLabelGeometry *)a3;
  v6 = v4;
  v7 = v4 == self;
  if (v4 && v4 != self)
  {
    *(_QWORD *)&v8 = objc_opt_class(self, v5).n128_u64[0];
    if (-[CRLWPListLabelGeometry isMemberOfClass:](v6, "isMemberOfClass:", v9, v8))
    {
      v10 = v6;
      mScale = self->mScale;
      v12 = v10[1];
      if ((mScale == v12 || vabdd_f64(mScale, v12) < fabs(v12 * 0.000000999999997))
        && ((mBaselineOffset = self->mBaselineOffset, v14 = v10[2], mBaselineOffset == v14)
         || vabdd_f64(mBaselineOffset, v14) < fabs(v14 * 0.000000999999997)))
      {
        v7 = self->mScaleWithText ^ (*((_BYTE *)v10 + 24) == 0);
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  CRLHasher *v3;
  unint64_t v4;

  v3 = objc_alloc_init(CRLHasher);
  -[CRLHasher addBool:](v3, "addBool:", self->mScaleWithText);
  v4 = -[CRLHasher hashValue](v3, "hashValue");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CRLWPListLabelGeometry initWithScale:scaleWithText:baselineOffset:]([CRLWPListLabelGeometry alloc], "initWithScale:scaleWithText:baselineOffset:", self->mScaleWithText, self->mScale, self->mBaselineOffset);
}

- (id)description
{
  Class v3;
  NSString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)v5;
  if (self->mScaleWithText)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> { scale=%.2f baselineOffset=%.2f scaleWithText=%@ }"), v5, self, *(_QWORD *)&self->mScale, *(_QWORD *)&self->mBaselineOffset, v7));

  return v8;
}

- (double)scale
{
  return self->mScale;
}

- (void)setScale:(double)a3
{
  self->mScale = a3;
}

- (double)baselineOffset
{
  return self->mBaselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->mBaselineOffset = a3;
}

- (BOOL)scaleWithText
{
  return self->mScaleWithText;
}

- (void)setScaleWithText:(BOOL)a3
{
  self->mScaleWithText = a3;
}

@end
