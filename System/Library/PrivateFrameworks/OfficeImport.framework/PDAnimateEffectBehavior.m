@implementation PDAnimateEffectBehavior

- (PDAnimateEffectBehavior)init
{
  PDAnimateEffectBehavior *v2;
  uint64_t v3;
  NSMutableDictionary *mPropertyMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDAnimateEffectBehavior;
  v2 = -[PDAnimateBehavior init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mPropertyMap = v2->mPropertyMap;
    v2->mPropertyMap = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)setTransition:(int)a3
{
  self->mHasTransition = 1;
  self->mTransition = a3;
}

- (BOOL)hasTransition
{
  return self->mHasTransition;
}

- (int)transition
{
  return self->mTransition;
}

- (BOOL)hasProperties
{
  return -[NSMutableDictionary count](self->mPropertyMap, "count") != 0;
}

- (NSMutableDictionary)propertyMap
{
  return self->mPropertyMap;
}

- (void)setPropertyMap:(id)a3
{
  objc_storeStrong((id *)&self->mPropertyMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPropertyMap, 0);
}

@end
