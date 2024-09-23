@implementation OITSUBasicProgress

- (OITSUBasicProgress)initWithMaxValue:(double)a3
{
  OITSUBasicProgress *v4;
  OITSUBasicProgressStorage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OITSUBasicProgress;
  v4 = -[OITSUProgress init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(OITSUBasicProgressStorage);
    v4->mStorage = v5;
    -[OITSUBasicProgressStorage setMaxValue:](v5, "setMaxValue:", a3);
  }
  return v4;
}

- (OITSUBasicProgress)init
{
  return -[OITSUBasicProgress initWithMaxValue:](self, "initWithMaxValue:", 1.0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OITSUBasicProgress;
  -[OITSUProgress dealloc](&v3, sel_dealloc);
}

- (double)value
{
  double result;

  -[OITSUBasicProgressStorage value](self->mStorage, "value");
  return result;
}

- (void)setValue:(double)a3
{
  -[OITSUBasicProgressStorage setValue:](self->mStorage, "setValue:", a3);
  -[OITSUProgress protected_progressDidChange](self, "protected_progressDidChange");
}

- (double)maxValue
{
  double result;

  -[OITSUBasicProgressStorage maxValue](self->mStorage, "maxValue");
  return result;
}

- (BOOL)isIndeterminate
{
  return -[OITSUBasicProgressStorage isIndeterminate](self->mStorage, "isIndeterminate");
}

- (void)setIndeterminate:(BOOL)a3
{
  -[OITSUBasicProgressStorage setIndeterminate:](self->mStorage, "setIndeterminate:", a3);
  -[OITSUProgress protected_progressDidChange](self, "protected_progressDidChange");
}

@end
