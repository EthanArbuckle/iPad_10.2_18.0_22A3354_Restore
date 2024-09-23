@implementation CHDLineSeries

- (CHDLineSeries)initWithChart:(id)a3
{
  CHDLineSeries *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHDLineSeries;
  result = -[CHDSeries initWithChart:](&v4, sel_initWithChart_, a3);
  if (result)
    result->mSmooth = 0;
  return result;
}

- (void)setSmooth:(BOOL)a3
{
  self->mSmooth = a3;
}

- (void)setMarker:(id)a3
{
  CHDMarker *v5;
  CHDMarker *v6;

  v5 = (CHDMarker *)a3;
  if (self->mMarker != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mMarker, a3);
    v5 = v6;
  }

}

- (id)marker
{
  return self->mMarker;
}

- (BOOL)isSmooth
{
  return self->mSmooth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMarker, 0);
}

@end
