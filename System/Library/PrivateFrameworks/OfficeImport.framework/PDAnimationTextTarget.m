@implementation PDAnimationTextTarget

- (PDAnimationTextTarget)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDAnimationTextTarget;
  return -[PDAnimationShapeTarget init](&v3, sel_init);
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setRange:(_NSRange)a3
{
  self->mRange = a3;
}

- (int)type
{
  return self->mType;
}

- (_NSRange)range
{
  _NSRange *p_mRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_mRange = &self->mRange;
  location = self->mRange.location;
  length = p_mRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)hash
{
  char *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDAnimationTextTarget;
  v3 = -[PDAnimationShapeTarget hash](&v8, sel_hash);
  v4 = &v3[-[PDAnimationTextTarget type](self, "type")];
  v5 = &v4[16 * -[PDAnimationTextTarget range](self, "range")];
  -[PDAnimationTextTarget range](self, "range");
  return (unint64_t)&v5[v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v12.receiver = self,
        v12.super_class = (Class)PDAnimationTextTarget,
        -[PDAnimationShapeTarget isEqual:](&v12, sel_isEqual_, v4))
    && (v5 = -[PDAnimationTextTarget type](self, "type"), v5 == objc_msgSend(v4, "type"))
    && (v6 = -[PDAnimationTextTarget range](self, "range"), v6 == objc_msgSend(v4, "range")))
  {
    -[PDAnimationTextTarget range](self, "range");
    v8 = v7;
    objc_msgSend(v4, "range");
    v10 = v8 == v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
