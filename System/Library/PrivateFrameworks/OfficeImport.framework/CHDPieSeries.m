@implementation CHDPieSeries

- (void)setExplosion:(int)a3
{
  *(_DWORD *)(&self->super.mHiddenFlag + 3) = a3;
}

- (id)shallowCopy
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHDPieSeries;
  -[CHDSeries shallowCopy](&v5, sel_shallowCopy);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExplosion:", *(unsigned int *)(&self->super.mHiddenFlag + 3));
  return v3;
}

- (int)explosion
{
  return *(_DWORD *)(&self->super.mHiddenFlag + 3);
}

- (CHDPieSeries)init
{
  CHDPieSeries *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDPieSeries;
  result = -[CHDPieSeries init](&v3, sel_init);
  if (result)
    *(_DWORD *)(&result->super.mHiddenFlag + 3) = 0;
  return result;
}

@end
