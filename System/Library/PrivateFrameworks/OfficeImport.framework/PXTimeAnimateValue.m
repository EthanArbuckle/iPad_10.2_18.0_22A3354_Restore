@implementation PXTimeAnimateValue

- (PXTimeAnimateValue)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXTimeAnimateValue;
  return -[PXTimeAnimateValue init](&v3, sel_init);
}

- (id)variant
{
  return self->mVariant;
}

- (void)setVariant:(id)a3
{
  objc_storeStrong(&self->mVariant, a3);
}

- (BOOL)hasPercentTime
{
  return self->mHasPercentTime;
}

- (double)percentTime
{
  return self->mPercentTime;
}

- (void)setPercentTime:(double)a3
{
  self->mHasPercentTime = 1;
  self->mPercentTime = a3;
}

- (id)formula
{
  return self->mFormula;
}

- (void)setFormula:(id)a3
{
  objc_storeStrong((id *)&self->mFormula, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFormula, 0);
  objc_storeStrong(&self->mVariant, 0);
}

@end
