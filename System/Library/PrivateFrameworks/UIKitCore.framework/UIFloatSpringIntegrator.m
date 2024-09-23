@implementation UIFloatSpringIntegrator

+ ($F24F406B2B787EFB06265DBA3D28CBD5)integrateWithState:(id)result springParameters:(id *)a4 deltaTime:(double)a5
{
  double var1;
  double v8;
  double v9;
  double v10;
  double var2;
  double v12;
  double v13;
  double v14;
  double v15;
  __double2 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  long double v24;
  double v25;
  double v26;
  long double v27;
  long double v28;
  long double v29;
  double v30;
  double v31;
  double v32;

  var1 = result.var1;
  if (result.var0 != a4->var0 || result.var1 != 0.0)
  {
    v8 = a4->var1;
    objc_msgSend(a1, "displacementFromValue:toTarget:function:", a4->var3);
    v10 = v9;
    var2 = a4->var2;
    v12 = sqrt(v8);
    v13 = var2 * 0.5;
    if (var2 * 0.5 >= v12)
    {
      if (var2 * 0.5 <= v12)
      {
        v29 = exp(-(v13 * a5));
        v30 = var1 + v10 * v13;
        v31 = v10 + v30 * a5;
        v19 = v29 * v31;
        var1 = v29 * v30 - v29 * v13 * v31;
        goto LABEL_9;
      }
      v22 = sqrt(v13 * v13 - v12 * v12);
      v23 = exp(-(v13 * a5));
      v24 = v22 * a5;
      v25 = cosh(v24);
      v26 = (var1 + v10 * v13) / v22;
      v27 = sinh(v24);
      v28 = v10 * v25 + v26 * v27;
      v19 = v23 * v28;
      v20 = v23 * (v22 * (v26 * v25) + v22 * (v10 * v27));
      v21 = v23 * v13 * v28;
    }
    else
    {
      v14 = sqrt(v12 * v12 - v13 * v13);
      v15 = exp(-(v13 * a5));
      v16 = __sincos_stret(v14 * a5);
      v17 = (var1 + v10 * v13) / v14;
      v18 = v10 * v16.__cosval + v17 * v16.__sinval;
      v19 = v15 * v18;
      v20 = v15 * (v14 * (v17 * v16.__cosval) - v14 * (v10 * v16.__sinval));
      v21 = v15 * v13 * v18;
    }
    var1 = v20 - v21;
LABEL_9:
    result.var0 = v19 + a4->var0;
  }
  v32 = var1;
  result.var1 = v32;
  return result;
}

+ (double)displacementFromValue:(double)a3 toTarget:(double)a4 function:(int64_t)a5
{
  double result;
  __double2 v7;

  result = a3 - a4;
  if ((unint64_t)(a5 - 1) <= 2)
  {
    v7 = __sincos_stret(result);
    result = atan2(v7.__sinval, v7.__cosval);
    if (result > 0.0 && a5 == 2)
      result = result + -6.28318531;
    if (result < 0.0 && a5 == 3)
      return result + 6.28318531;
  }
  return result;
}

@end
