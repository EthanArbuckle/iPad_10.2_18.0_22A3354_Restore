@implementation PDAnimationOleChartTarget

- (PDAnimationOleChartTarget)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDAnimationOleChartTarget;
  return -[PDAnimationShapeTarget init](&v3, sel_init);
}

- (int)level
{
  return self->mLevel;
}

- (void)setLevel:(int)a3
{
  self->mLevel = a3;
}

- (int)chartSubElementType
{
  return self->mChartSubElementType;
}

- (void)setChartSubElementType:(int)a3
{
  self->mChartSubElementType = a3;
}

- (unint64_t)hash
{
  char *v3;
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDAnimationOleChartTarget;
  v3 = -[PDAnimationShapeTarget hash](&v6, sel_hash);
  v4 = &v3[-[PDAnimationOleChartTarget level](self, "level")];
  return (unint64_t)&v4[-[PDAnimationOleChartTarget chartSubElementType](self, "chartSubElementType")];
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)PDAnimationOleChartTarget,
        -[PDAnimationShapeTarget isEqual:](&v9, sel_isEqual_, v4))
    && (v5 = -[PDAnimationOleChartTarget level](self, "level"), v5 == objc_msgSend(v4, "level")))
  {
    v6 = -[PDAnimationOleChartTarget chartSubElementType](self, "chartSubElementType");
    v7 = v6 == objc_msgSend(v4, "chartSubElementType");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
