@implementation CHDPieDataValueProperties

- (CHDPieDataValueProperties)init
{
  CHDPieDataValueProperties *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDPieDataValueProperties;
  result = -[CHDDataValueProperties init](&v3, sel_init);
  if (result)
  {
    result->mExplosion = 0;
    result->mIsExplosionSet = 0;
  }
  return result;
}

- (void)setExplosion:(int)a3
{
  self->mExplosion = a3;
  self->mIsExplosionSet = 1;
}

- (id)shallowCopyWithIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHDPieDataValueProperties;
  -[CHDDataValueProperties shallowCopyWithIndex:](&v7, sel_shallowCopyWithIndex_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->mIsExplosionSet)
    objc_msgSend(v4, "setExplosion:", self->mExplosion);
  return v5;
}

- (int)explosion
{
  return self->mExplosion;
}

- (BOOL)isExplosionSet
{
  return self->mIsExplosionSet;
}

@end
