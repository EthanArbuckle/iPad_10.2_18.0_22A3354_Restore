@implementation PDAnimateScaleBehavior

- (PDAnimateScaleBehavior)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDAnimateScaleBehavior;
  return -[PDAnimateBehavior init](&v3, sel_init);
}

- (void)setFrom:(CGPoint)a3
{
  self->mHasFrom = 1;
  self->mFrom = a3;
}

- (void)setTo:(CGPoint)a3
{
  self->mHasTo = 1;
  self->mTo = a3;
}

- (void)setBy:(CGPoint)a3
{
  self->mHasBy = 1;
  self->mBy = a3;
}

- (BOOL)hasTo
{
  return self->mHasTo;
}

- (CGPoint)to
{
  double x;
  double y;
  CGPoint result;

  x = self->mTo.x;
  y = self->mTo.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)hasFrom
{
  return self->mHasFrom;
}

- (CGPoint)from
{
  double x;
  double y;
  CGPoint result;

  x = self->mFrom.x;
  y = self->mFrom.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)hasBy
{
  return self->mHasBy;
}

- (CGPoint)by
{
  double x;
  double y;
  CGPoint result;

  x = self->mBy.x;
  y = self->mBy.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double x;
  double y;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  BOOL v18;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v27;

  v4 = a3;
  v5 = objc_opt_class();
  TSUDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_11;
  x = self->mTo.x;
  y = self->mTo.y;
  objc_msgSend(v6, "to");
  v12 = x == v11 && y == v10;
  if (v12
    && ((v13 = self->mFrom.x, v14 = self->mFrom.y, objc_msgSend(v7, "from"), v13 == v16)
      ? (v17 = v14 == v15)
      : (v17 = 0),
        v17))
  {
    v20 = self->mBy.x;
    v21 = self->mBy.y;
    objc_msgSend(v7, "by");
    v23 = v22;
    v25 = v24;

    if (v20 == v23 && v21 == v25)
    {
      v27.receiver = self;
      v27.super_class = (Class)PDAnimateScaleBehavior;
      v18 = -[PDAnimateBehavior isEqual:](&v27, sel_isEqual_, v4);
      goto LABEL_13;
    }
  }
  else
  {
LABEL_11:

  }
  v18 = 0;
LABEL_13:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v2;

  if (self->mHasTo)
    v2 = (unint64_t)self->mTo.y ^ (unint64_t)self->mTo.x;
  else
    v2 = 0;
  if (self->mHasFrom)
    v2 ^= (unint64_t)self->mFrom.x ^ (unint64_t)self->mFrom.y;
  if (self->mHasBy)
    v2 ^= (unint64_t)self->mBy.x ^ (unint64_t)self->mBy.y;
  return v2;
}

@end
