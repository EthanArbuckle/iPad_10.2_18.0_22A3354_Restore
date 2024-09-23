@implementation SXAutoPlacementAdvertisingSettings

- (SXAutoPlacementAdvertisingSettings)initWithFrequency:(unint64_t)a3 bannerType:(unint64_t)a4 layout:(id)a5 distanceFromMedia:(_SXConvertibleValue)a6
{
  unint64_t unit;
  double value;
  id v12;
  SXAutoPlacementAdvertisingSettings *v13;
  SXAutoPlacementAdvertisingSettings *v14;
  objc_super v16;

  unit = a6.unit;
  value = a6.value;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SXAutoPlacementAdvertisingSettings;
  v13 = -[SXAutoPlacementAdvertisingSettings init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_frequency = a3;
    v13->_bannerType = a4;
    objc_storeStrong((id *)&v13->_layout, a5);
    v14->_distanceFromMedia.value = value;
    v14->_distanceFromMedia.unit = unit;
  }

  return v14;
}

- (unint64_t)bannerType
{
  return self->_bannerType;
}

- (SXAutoPlacementLayout)layout
{
  return self->_layout;
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (_SXConvertibleValue)distanceFromMedia
{
  unint64_t unit;
  double value;
  _SXConvertibleValue result;

  unit = self->_distanceFromMedia.unit;
  value = self->_distanceFromMedia.value;
  result.unit = unit;
  result.value = value;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
