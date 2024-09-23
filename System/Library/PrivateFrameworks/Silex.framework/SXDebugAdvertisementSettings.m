@implementation SXDebugAdvertisementSettings

- (SXDebugAdvertisementSettings)initWithFrequency:(unint64_t)a3 bannerType:(id)a4 layout:(id)a5 distanceFromMedia:(_SXConvertibleValue)a6
{
  unint64_t unit;
  double value;
  id v11;
  id v12;
  SXDebugAdvertisementSettings *v13;
  SXDebugAdvertisementSettings *v14;
  id v15;
  uint64_t v16;
  objc_super v18;

  unit = a6.unit;
  value = a6.value;
  v11 = a4;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SXDebugAdvertisementSettings;
  v13 = -[SXDebugAdvertisementSettings init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_frequency = a3;
    v15 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("any")) & 1) != 0)
      {
        v16 = 1;
      }
      else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("standard")) & 1) != 0)
      {
        v16 = 2;
      }
      else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("double_height")) & 1) != 0)
      {
        v16 = 3;
      }
      else if (objc_msgSend(v15, "isEqualToString:", CFSTR("large")))
      {
        v16 = 4;
      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
    }

    v14->_bannerType = v16;
    objc_storeStrong((id *)&v14->_layout, a5);
    v14->_distanceFromMedia.value = value;
    v14->_distanceFromMedia.unit = unit;
  }

  return v14;
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (unint64_t)bannerType
{
  return self->_bannerType;
}

- (SXAutoPlacementLayout)layout
{
  return self->_layout;
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
