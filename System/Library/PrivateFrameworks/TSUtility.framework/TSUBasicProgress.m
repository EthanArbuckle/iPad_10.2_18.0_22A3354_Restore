@implementation TSUBasicProgress

- (TSUBasicProgress)initWithMaxValue:(double)a3
{
  TSUBasicProgress *v4;
  TSUBasicProgressStorage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSUBasicProgress;
  v4 = -[TSUProgress init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(TSUBasicProgressStorage);
    v4->mStorage = v5;
    -[TSUBasicProgressStorage setMaxValue:](v5, "setMaxValue:", a3);
  }
  return v4;
}

- (TSUBasicProgress)init
{
  return -[TSUBasicProgress initWithMaxValue:](self, "initWithMaxValue:", 1.0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSUBasicProgress;
  -[TSUProgress dealloc](&v3, sel_dealloc);
}

- (double)value
{
  double result;

  -[TSUBasicProgressStorage value](self->mStorage, "value");
  return result;
}

- (void)setValue:(double)a3
{
  -[TSUBasicProgressStorage setValue:](self->mStorage, "setValue:", a3);
  -[TSUProgress protected_progressDidChange](self, "protected_progressDidChange");
}

- (double)maxValue
{
  double result;

  -[TSUBasicProgressStorage maxValue](self->mStorage, "maxValue");
  return result;
}

- (BOOL)isIndeterminate
{
  return -[TSUBasicProgressStorage isIndeterminate](self->mStorage, "isIndeterminate");
}

- (void)setIndeterminate:(BOOL)a3
{
  -[TSUBasicProgressStorage setIndeterminate:](self->mStorage, "setIndeterminate:", a3);
  -[TSUProgress protected_progressDidChange](self, "protected_progressDidChange");
}

@end
