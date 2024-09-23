@implementation _UICubicPolyTangent

- (_UICubicPolyTangent)init
{
  _UICubicPolyTangent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UICubicPolyTangent;
  result = -[_UICubicPolyTangent init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_cubicGain = 0u;
    *(_OWORD *)&result->_initialLinearGain = 0u;
    *(_OWORD *)&result->_tangentLineSpeed = xmmword_186684C20;
    result->_tangentCbrtSpeed = 0.0;
    result->_tangentHyperCbrtSpeed = 0.0;
  }
  return result;
}

- (BOOL)isEmpty
{
  return self->_initialLinearGain == 0.0
      && self->_parabolicGain == 0.0
      && self->_cubicGain == 0.0
      && self->_quarticGain == 0.0;
}

- (double)clipForIOFixedMath:(double)a3 polynomialPower:(int)a4 tangencyStartingAt:(double)a5
{
  double result;

  result = pow(a5 * 0.0078125 * 16383.0, 1.0 / (double)a4) / a5;
  if (result >= a3)
    result = a3;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (void)clipGainsForIOFixedMathWithTangency
{
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[_UICubicPolyTangent tangentSpeedForPower:](self, "tangentSpeedForPower:", -[_UICubicPolyTangent RootPowerOfEarliestTangent:](self, "RootPowerOfEarliestTangent:", 1));
  if (v3 <= 128.0 && v3 > 0.0)
    v5 = v3;
  else
    v5 = 128.0;
  -[_UICubicPolyTangent clipForIOFixedMath:polynomialPower:tangencyStartingAt:](self, "clipForIOFixedMath:polynomialPower:tangencyStartingAt:", 1, self->_initialLinearGain, v5);
  self->_initialLinearGain = v6;
  -[_UICubicPolyTangent clipForIOFixedMath:polynomialPower:tangencyStartingAt:](self, "clipForIOFixedMath:polynomialPower:tangencyStartingAt:", 2, self->_parabolicGain, v5);
  self->_parabolicGain = v7;
  -[_UICubicPolyTangent clipForIOFixedMath:polynomialPower:tangencyStartingAt:](self, "clipForIOFixedMath:polynomialPower:tangencyStartingAt:", 3, self->_cubicGain, v5);
  self->_cubicGain = v8;
  -[_UICubicPolyTangent clipForIOFixedMath:polynomialPower:tangencyStartingAt:](self, "clipForIOFixedMath:polynomialPower:tangencyStartingAt:", 4, self->_quarticGain, v5);
  self->_quarticGain = v9;
}

- (void)setInitialLinearGain:(double)a3
{
  self->_initialLinearGain = a3;
  -[_UICubicPolyTangent clipGainsForIOFixedMathWithTangency](self, "clipGainsForIOFixedMathWithTangency");
}

- (void)setParabolicGain:(double)a3
{
  self->_parabolicGain = a3;
  -[_UICubicPolyTangent clipGainsForIOFixedMathWithTangency](self, "clipGainsForIOFixedMathWithTangency");
}

- (void)setCubicGain:(double)a3
{
  self->_cubicGain = a3;
  -[_UICubicPolyTangent clipGainsForIOFixedMathWithTangency](self, "clipGainsForIOFixedMathWithTangency");
}

- (void)setQuarticGain:(double)a3
{
  self->_quarticGain = a3;
  -[_UICubicPolyTangent clipGainsForIOFixedMathWithTangency](self, "clipGainsForIOFixedMathWithTangency");
}

- (void)setTangentLineSpeed:(double)a3
{
  self->_tangentLineSpeed = a3;
  -[_UICubicPolyTangent clipGainsForIOFixedMathWithTangency](self, "clipGainsForIOFixedMathWithTangency");
}

- (void)setTangentSqrtSpeed:(double)a3
{
  self->_tangentSqrtSpeed = a3;
  -[_UICubicPolyTangent clipGainsForIOFixedMathWithTangency](self, "clipGainsForIOFixedMathWithTangency");
}

- (void)setTangentCbrtSpeed:(double)a3
{
  self->_tangentCbrtSpeed = a3;
  -[_UICubicPolyTangent clipGainsForIOFixedMathWithTangency](self, "clipGainsForIOFixedMathWithTangency");
}

- (void)setTangentHyperCbrtSpeed:(double)a3
{
  self->_tangentHyperCbrtSpeed = a3;
  -[_UICubicPolyTangent clipGainsForIOFixedMathWithTangency](self, "clipGainsForIOFixedMathWithTangency");
}

- (double)tangentSpeedForPower:(int)a3
{
  uint64_t v3;

  if (a3 < 1)
    return 0.0;
  v3 = 8 * (a3 - 1) + 40;
  if (a3 >= 4)
    v3 = 64;
  return *(double *)((char *)&self->super.isa + v3);
}

- (double)gainForPower:(int)a3
{
  uint64_t v3;

  if (a3 < 1)
    return 0.0;
  v3 = 8 * (a3 - 1) + 8;
  if (a3 >= 4)
    v3 = 32;
  return *(double *)((char *)&self->super.isa + v3);
}

- (int)RootPowerOfEarliestTangent:(int)a3
{
  uint64_t v3;
  int v5;
  double v6;
  double v7;

  if (a3 > 4)
    return 0;
  v3 = *(_QWORD *)&a3;
  v5 = 0;
  v6 = 0.0;
  do
  {
    -[_UICubicPolyTangent tangentSpeedForPower:](self, "tangentSpeedForPower:", v3);
    if (v7 != 0.0 && (v7 < v6 || v6 <= 0.0))
    {
      v6 = v7;
      v5 = v3;
    }
    v3 = (v3 + 1);
  }
  while ((_DWORD)v3 != 5);
  return v5;
}

- (double)quarticDerivative:(double)a3
{
  double quarticGain;

  quarticGain = self->_quarticGain;
  return self->_initialLinearGain
       + (self->_parabolicGain + self->_parabolicGain) * (self->_parabolicGain * a3)
       + self->_cubicGain * a3 * (self->_cubicGain * 3.0 * (self->_cubicGain * a3))
       + quarticGain * a3 * (quarticGain * a3 * (quarticGain * 4.0 * (quarticGain * a3)));
}

- (double)quarticFunction:(double)a3
{
  return self->_initialLinearGain * a3
       + self->_parabolicGain * a3 * (self->_parabolicGain * a3)
       + self->_cubicGain * a3 * (self->_cubicGain * a3 * (self->_cubicGain * a3))
       + self->_quarticGain * a3 * (self->_quarticGain * a3 * (self->_quarticGain * a3 * (self->_quarticGain * a3)));
}

- (double)quarticTangentFunction:(double)a3 powerOfEarliestTangent:(int)a4
{
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v7 = -[_UICubicPolyTangent RootPowerOfEarliestTangent:](self, "RootPowerOfEarliestTangent:", 2);
  -[_UICubicPolyTangent tangentSpeedForPower:](self, "tangentSpeedForPower:", v7);
  v9 = v8;
  if (a4 == 1)
  {
    -[_UICubicPolyTangent quarticDerivative:](self, "quarticDerivative:", self->_tangentLineSpeed);
    v11 = v10;
    -[_UICubicPolyTangent quarticFunction:](self, "quarticFunction:", self->_tangentLineSpeed);
    v13 = v12 - v11 * self->_tangentLineSpeed;
    if (v9 >= a3 || v9 == 0.0)
      return v11 * a3 + v13;
    v14 = v9 * v11 + v13;
  }
  else
  {
    -[_UICubicPolyTangent quarticFunction:](self, "quarticFunction:", v8);
    v14 = v15;
    -[_UICubicPolyTangent quarticDerivative:](self, "quarticDerivative:", v9);
    v11 = v16;
  }
  if ((_DWORD)v7 == 3)
    return pow(v14 * (v14 * (v11 * 3.0)) * a3 + v14 * (v14 * v14) - v14 * (v14 * (v11 * 3.0)) * self->_tangentCbrtSpeed, 0.33333);
  if ((_DWORD)v7 == 2)
    return sqrt(v14 * (v11 + v11) * a3 + v14 * v14 - v14 * (v11 + v11) * self->_tangentSqrtSpeed);
  return pow(v14 * (v14 * (v14 * (v11 * 4.0))) * a3+ v14 * (v14 * (v14 * v14))- v14 * (v14 * (v14 * (v11 * 4.0))) * self->_tangentHyperCbrtSpeed, 0.25);
}

- (double)piecewiseCubicAcceleratedSpeed:(double)a3
{
  uint64_t v5;
  double v6;
  double result;

  v5 = -[_UICubicPolyTangent RootPowerOfEarliestTangent:](self, "RootPowerOfEarliestTangent:", 1);
  -[_UICubicPolyTangent tangentSpeedForPower:](self, "tangentSpeedForPower:", v5);
  if (v6 >= a3 || v6 == 0.0)
    -[_UICubicPolyTangent quarticFunction:](self, "quarticFunction:", a3);
  else
    -[_UICubicPolyTangent quarticTangentFunction:powerOfEarliestTangent:](self, "quarticTangentFunction:powerOfEarliestTangent:", v5, a3);
  return result;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("linear")))
  {
    objc_msgSend(v7, "linear");
    -[_UICubicPolyTangent setTangentLineSpeed:](self, "setTangentLineSpeed:");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("parabolic")))
  {
    objc_msgSend(v7, "parabolic");
    -[_UICubicPolyTangent setTangentSqrtSpeed:](self, "setTangentSqrtSpeed:");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("gain")))
  {
    objc_msgSend(v7, "gain");
    -[_UICubicPolyTangent setParabolicGain:](self, "setParabolicGain:");
  }

}

+ (id)keyboardTrackpadCurve
{
  if (qword_1ECD81F40 != -1)
    dispatch_once(&qword_1ECD81F40, &__block_literal_global_603);
  return (id)_MergedGlobals_1286;
}

- (double)initialLinearGain
{
  return self->_initialLinearGain;
}

- (double)parabolicGain
{
  return self->_parabolicGain;
}

- (double)cubicGain
{
  return self->_cubicGain;
}

- (double)quarticGain
{
  return self->_quarticGain;
}

- (double)tangentLineSpeed
{
  return self->_tangentLineSpeed;
}

- (double)tangentSqrtSpeed
{
  return self->_tangentSqrtSpeed;
}

- (double)tangentCbrtSpeed
{
  return self->_tangentCbrtSpeed;
}

- (double)tangentHyperCbrtSpeed
{
  return self->_tangentHyperCbrtSpeed;
}

@end
