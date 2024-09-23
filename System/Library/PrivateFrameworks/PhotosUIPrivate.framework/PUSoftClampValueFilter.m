@implementation PUSoftClampValueFilter

+ (id)scrollViewFilter
{
  id v2;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v2, "setResistance:", 100.0);
  return v2;
}

- (double)updatedValue:(double)a3 withTargetValue:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;

  -[PUSoftClampValueFilter resistance](self, "resistance", a3);
  v7 = v6;
  -[PUClampValueFilter maximumValue](self, "maximumValue");
  if (v8 < a4)
    a4 = v8 + v7 * log((a4 - v8) / v7 + 1.0);
  -[PUClampValueFilter minimumValue](self, "minimumValue");
  if (a4 >= v9)
    return a4;
  else
    return v9 - v7 * log((v9 - a4) / v7 + 1.0);
}

- (double)resistance
{
  return self->_resistance;
}

- (void)setResistance:(double)a3
{
  self->_resistance = a3;
}

@end
