@implementation PXBezierCurve

- (_OWORD)initWithStartingPoint:(__n128)a3 controlPoint1:(double)a4 controlPoint2:(float64_t)a5 endPoint:(__n128)a6
{
  _OWORD *result;
  __int128 v21;
  __int128 v22;
  float64x2_t v23;
  __int128 v24;
  float64x2_t v25;
  float v26;
  float v27;
  objc_super v32;

  v32.receiver = a1;
  v32.super_class = (Class)PXBezierCurve;
  result = objc_msgSendSuper2(&v32, sel_init);
  if (result)
  {
    v23.f64[0] = a2;
    *(_QWORD *)&v23.f64[1] = a3.n128_u64[0];
    *(float32x2_t *)&v24 = vcvt_f32_f64(v23);
    *(float *)v23.f64 = a4;
    *((_QWORD *)&v24 + 1) = __PAIR64__(a3.n128_u32[3], LODWORD(v23.f64[0]));
    v25.f64[0] = a5;
    *(_QWORD *)&v25.f64[1] = a6.n128_u64[0];
    *(float32x2_t *)&v23.f64[0] = vcvt_f32_f64(v25);
    *(float *)v25.f64 = a7;
    *(_QWORD *)&v23.f64[1] = __PAIR64__(a6.n128_u32[3], LODWORD(v25.f64[0]));
    result[1] = v24;
    result[2] = v23;
    *(float32x2_t *)&v22 = vcvt_f32_f64(a17);
    v26 = a18;
    *((float *)&v22 + 2) = v26;
    *(float32x2_t *)&v21 = vcvt_f32_f64(a19);
    v27 = a20;
    *((float *)&v21 + 2) = v27;
    result[3] = v22;
    result[4] = v21;
  }
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)positionOnCurveAtFraction:(double)a3
{
  float32x4_t v3;
  float v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  double v9;
  double v10;
  double v11;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v3 = *(float32x4_t *)self->_ctrlP1;
  v4 = a3;
  v5 = vmlaq_n_f32(*(float32x4_t *)self->_startP, vsubq_f32(v3, *(float32x4_t *)self->_startP), v4);
  v6 = vmlaq_n_f32(v3, vsubq_f32(*(float32x4_t *)self->_ctrlP2, v3), v4);
  v7 = vmlaq_n_f32(v5, vsubq_f32(v6, v5), v4);
  v8 = vmlaq_n_f32(v7, vsubq_f32(vmlaq_n_f32(v6, vsubq_f32(vmlaq_n_f32(v3, vsubq_f32(*(float32x4_t *)self->_endP, v3), v4), v6), v4), v7), v4);
  v9 = v8.f32[0];
  v10 = v8.f32[1];
  v11 = v8.f32[2];
  result.var2 = v11;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

@end
