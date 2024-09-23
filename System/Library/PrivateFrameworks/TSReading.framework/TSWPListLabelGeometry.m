@implementation TSWPListLabelGeometry

- (TSWPListLabelGeometry)initWithScale:(double)a3 scaleWithText:(BOOL)a4 baselineOffset:(double)a5
{
  TSWPListLabelGeometry *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSWPListLabelGeometry;
  result = -[TSWPListLabelGeometry init](&v9, sel_init);
  if (result)
  {
    result->mScaleWithText = a4;
    result->mScale = a3;
    result->mBaselineOffset = a5;
  }
  return result;
}

+ (id)listLabelGeometry
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithScale:scaleWithText:baselineOffset:", 1, 1.0, 0.0);
}

- (BOOL)isEqual:(id)a3
{
  TSWPListLabelGeometry *v3;
  BOOL v4;
  double mScale;
  double v7;
  double mBaselineOffset;
  double v9;

  v3 = self;
  v4 = a3 == self;
  LOBYTE(self) = a3 == self;
  if (a3)
  {
    if (!v4)
    {
      LODWORD(self) = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
      if ((_DWORD)self)
      {
        mScale = v3->mScale;
        v7 = *((double *)a3 + 1);
        if ((mScale == v7 || vabdd_f64(mScale, v7) < fabs(v7 * 0.000000999999997))
          && ((mBaselineOffset = v3->mBaselineOffset, v9 = *((double *)a3 + 2), mBaselineOffset == v9)
           || vabdd_f64(mBaselineOffset, v9) < fabs(v9 * 0.000000999999997)))
        {
          LOBYTE(self) = v3->mScaleWithText ^ (*((_BYTE *)a3 + 24) == 0);
        }
        else
        {
          LOBYTE(self) = 0;
        }
      }
    }
  }
  return (char)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TSWPListLabelGeometry initWithScale:scaleWithText:baselineOffset:]([TSWPListLabelGeometry alloc], "initWithScale:scaleWithText:baselineOffset:", self->mScaleWithText, self->mScale, self->mBaselineOffset);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self->mScaleWithText)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> { scale=%.2f baselineOffset=%.2f scaleWithText=%@ }"), v5, self, *(_QWORD *)&self->mScale, *(_QWORD *)&self->mBaselineOffset, v6);
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
