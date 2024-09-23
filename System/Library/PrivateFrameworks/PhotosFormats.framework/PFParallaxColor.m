@implementation PFParallaxColor

- (PFParallaxColor)init
{
  return -[PFParallaxColor initWithRed:green:blue:](self, "initWithRed:green:blue:", 0.0, 0.0, 0.0);
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_cgColor);
  v3.receiver = self;
  v3.super_class = (Class)PFParallaxColor;
  -[PFParallaxColor dealloc](&v3, sel_dealloc);
}

- (PFParallaxColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5
{
  PFParallaxColor *v5;
  float64x2_t v6;
  int8x16_t v7;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  simd_double2 v18;
  int8x16_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  simd_double2 v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  long double v36;
  __int128 v37;
  __int128 v38;
  simd_double2 x;
  simd_double2 v41;
  float64x2_t v42;
  float64x2_t v43;
  int8x16_t v44;
  float64x2_t v45;
  int8x16_t v46;
  float64x2_t v47;
  float64x2_t v48;
  int8x16_t v49;
  simd_double2 v50;
  int8x16_t v51;
  simd_double2 v52;
  int8x16_t v54;
  float64x2_t v55;
  float64x2_t v56;
  int8x16_t v58;
  float64x2_t v59;
  objc_super v60;

  v45 = *(float64x2_t *)&a5;
  v60.receiver = self;
  v60.super_class = (Class)PFParallaxColor;
  v5 = -[PFParallaxColor init](&v60, sel_init);
  v6.f64[0] = a3;
  v6.f64[1] = a4;
  *(float64x2_t *)v5->_srgb = v6;
  *(float64x2_t *)&v5->_srgb[16] = v45;
  v58 = (int8x16_t)vdupq_n_s64(0x8000000000000000);
  v7.i64[0] = 0x8000000000000000;
  v54 = v7;
  __asm { FMOV            V2.2D, #1.0 }
  v49 = _Q2;
  v47 = (float64x2_t)vbslq_s8(vorrq_s8((int8x16_t)vcltzq_f64(v45), (int8x16_t)vcgtzq_f64(v45)), vorrq_s8(vandq_s8((int8x16_t)v45, v7), _Q2), (int8x16_t)0);
  v48 = (float64x2_t)vandq_s8(vorrq_s8(vandq_s8((int8x16_t)v6, v58), _Q2), vorrq_s8((int8x16_t)vcltzq_f64(v6), (int8x16_t)vcgtzq_f64(v6)));
  v13 = (float64x2_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v51 = (int8x16_t)v13;
  v42 = vabsq_f64(v6);
  v43 = vabsq_f64(v45);
  v13.f64[0] = 12.92;
  v14 = vdivq_f64(v43, v13);
  v15 = vdivq_f64(v42, (float64x2_t)vdupq_n_s64(0x4029D70A3D70A3D7uLL));
  v44 = (int8x16_t)v15;
  v46 = (int8x16_t)v14;
  v15.f64[0] = 0.055;
  v16 = vaddq_f64(v43, v15);
  v17 = (float64x2_t)vdupq_n_s64(0x3FF0E147AE147AE1uLL);
  v18 = (simd_double2)vdivq_f64(vaddq_f64(v42, (float64x2_t)vdupq_n_s64(0x3FAC28F5C28F5C29uLL)), v17);
  v17.f64[0] = 1.055;
  x = (simd_double2)(unint64_t)*(_OWORD *)&vdivq_f64(v16, v17);
  v41 = _simd_pow_d2(v18, (simd_double2)vdupq_n_s64(0x4003333333333333uLL));
  v19 = (int8x16_t)_simd_pow_d2(x, (simd_double2)xmmword_1A17B6C90);
  v20.f64[0] = 0.04045;
  v21 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vcgtq_f64(v42, (float64x2_t)vdupq_n_s64(0x3FA4B5DCC63F1412uLL))), (int8x16_t)v41, v44);
  v22 = vmulq_f64(v47, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64((int64x2_t)vcgtq_f64(v43, v20).u64[0]), v19, v46));
  v23 = vmulq_f64(v48, v21);
  v21.f64[0] = 0.017752387;
  v24.f64[1] = 0.757894462;
  v25 = vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_1A17B6CA0, v23.f64[0]), (float64x2_t)xmmword_1A17B6CB0, v23, 1);
  v24.f64[0] = 0.109442094;
  v26 = vmlaq_laneq_f64(vmulq_f64(v23, v21), v24, v23, 1);
  v23.f64[0] = 0.872569225;
  v27 = vmlaq_f64(v26, v23, v22);
  v28 = vmlaq_n_f64(v25, (float64x2_t)xmmword_1A17B6CC0, v22.f64[0]);
  v55 = (float64x2_t)vbslq_s8(vorrq_s8((int8x16_t)vcltzq_f64(v27), (int8x16_t)vcgtzq_f64(v27)), vorrq_s8(vandq_s8((int8x16_t)v27, v54), v49), (int8x16_t)0);
  v59 = (float64x2_t)vandq_s8(vorrq_s8(vandq_s8((int8x16_t)v28, v58), v49), vorrq_s8((int8x16_t)vcltzq_f64(v28), (int8x16_t)vcgtzq_f64(v28)));
  v29 = (simd_double2)vandq_s8((int8x16_t)v28, v51);
  v52 = (simd_double2)(unint64_t)*(_OWORD *)&vabsq_f64(v27);
  v50 = _simd_pow_d2(v29, (simd_double2)vdupq_n_s64(0x3FDB851EB851EB85uLL));
  v30 = vmulq_f64((float64x2_t)_simd_pow_d2(v52, (simd_double2)xmmword_1A17B6CD0), v55);
  v31 = vmulq_f64((float64x2_t)v50, v59);
  v32.f64[1] = 4.455;
  v32.f64[0] = 0.8056;
  v33 = vmulq_f64(v31, v32);
  v32.f64[0] = 0.3572;
  v34 = vmlaq_laneq_f64(v33, v32, v31, 1);
  v35 = vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_1A17B6CE0, v31.f64[0]), (float64x2_t)xmmword_1A17B6CF0, v31, 1);
  v31.f64[1] = 0.396;
  v56 = vmlaq_n_f64(v35, (float64x2_t)xmmword_1A17B6D00, v30.f64[0]);
  v31.f64[0] = -1.1628;
  *(_QWORD *)&v59.f64[0] = *(_OWORD *)&vmlaq_f64(v34, v31, v30);
  v36 = atan2(v59.f64[0], v56.f64[1]);
  *(float64_t *)&v37 = v56.f64[0];
  *((long double *)&v37 + 1) = v36;
  *(double *)&v38 = sqrt(vmlad_n_f64(vmuld_lane_f64(v56.f64[1], v56, 1), v59.f64[0], v59.f64[0]));
  *(_OWORD *)v5->_lhc = v37;
  *(_OWORD *)&v5->_lhc[16] = v38;
  return v5;
}

- (double)red
{
  return *(double *)self->_srgb;
}

- (double)green
{
  return *(double *)&self->_srgb[8];
}

- (double)blue
{
  return *(double *)&self->_srgb[16];
}

- (double)luminance
{
  float64x2_t v2;

  v2.f64[0] = 0.114;
  return vmulq_f64(*(float64x2_t *)&self->_srgb[16], v2).f64[0]
       + vaddvq_f64(vmulq_f64(*(float64x2_t *)self->_srgb, (float64x2_t)xmmword_1A17B6D10));
}

- (PFParallaxColor)initWithLuma:(double)a3 hue:(double)a4 chroma:(double)a5
{
  PFParallaxColor *v7;
  double v8;
  __int128 v9;
  double v10;
  double v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v16[2];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PFParallaxColor;
  v7 = -[PFParallaxColor init](&v17, sel_init);
  v8 = fmod(a4, 360.0);
  v10 = v8 + -360.0;
  if (v8 <= 180.0)
    v10 = v8;
  if (v8 >= -180.0)
    v11 = v10;
  else
    v11 = v8 + 360.0;
  v12.f64[0] = a3;
  v12.f64[1] = v11 * 3.14159265 / 180.0;
  *(double *)&v9 = a5 * 0.707106781;
  *(float64x2_t *)v7->_lhc = v12;
  *(_OWORD *)&v7->_lhc[16] = v9;
  lhc_to_srgb(v16, v12, a5 * 0.707106781);
  v13 = v16[1];
  *(float64x2_t *)v7->_srgb = v16[0];
  *(float64x2_t *)&v7->_srgb[16] = v13;
  return v7;
}

- (double)luma
{
  return *(double *)self->_lhc;
}

- (double)hue
{
  return *(double *)&self->_lhc[8] * 180.0 / 3.14159265;
}

- (double)chroma
{
  return *(double *)&self->_lhc[16] / 0.707106781;
}

- (CGPoint)pt
{
  double v2;
  __double2 v3;
  double v4;
  double v5;
  CGPoint result;

  v2 = *(double *)&self->_lhc[16];
  v3 = __sincos_stret(*(double *)&self->_lhc[8]);
  v4 = v2 * v3.__sinval;
  v5 = v2 * v3.__cosval;
  result.y = v4;
  result.x = v5;
  return result;
}

- (PFParallaxColor)initWithHue:(double)a3 tone:(double)a4
{
  PFParallaxColor *v6;
  float64x2_t v7;
  __int128 v8;
  float64x2_t v9;
  float64x2_t v11[2];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PFParallaxColor;
  v6 = -[PFParallaxColor init](&v12, sel_init);
  v7.f64[0] = (2.0 - a4) * a4;
  v7.f64[1] = a3 * 3.14159265 / 180.0;
  *(double *)&v8 = (1.0 - a4) * 0.707106781;
  *(float64x2_t *)v6->_lhc = v7;
  *(_OWORD *)&v6->_lhc[16] = v8;
  lhc_to_srgb(v11, v7, *(double *)&v8);
  v9 = v11[1];
  *(float64x2_t *)v6->_srgb = v11[0];
  *(float64x2_t *)&v6->_srgb[16] = v9;
  return v6;
}

- (double)tone
{
  double v2;
  double v3;
  double result;

  v2 = *(double *)self->_lhc;
  v3 = *(double *)&self->_lhc[16] / 0.707106781;
  if (v3 > v2)
    return (v2 / v3 + 2.0 - sqrt(v2 / v3 * (v2 / v3) + 4.0)) * 0.5;
  result = 1.0;
  if (v3 > 0.0)
    return (v3 / v2 * 2.0 + 1.0 - sqrt(v3 / v2 * 4.0 * (v3 / v2) + 1.0)) / (v3 / v2 + v3 / v2);
  return result;
}

- (BOOL)isWarm
{
  double v3;
  double v5;

  -[PFParallaxColor hue](self, "hue");
  if (v3 < 0.0)
    return 0;
  -[PFParallaxColor hue](self, "hue");
  return v5 <= 120.0;
}

- (BOOL)isCool
{
  double v3;
  double v4;

  -[PFParallaxColor hue](self, "hue");
  if (v3 >= 150.0)
    return 1;
  -[PFParallaxColor hue](self, "hue");
  return v4 <= -30.0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PFParallaxColor red](self, "red");
  v5 = v4;
  -[PFParallaxColor green](self, "green");
  v7 = v6;
  -[PFParallaxColor blue](self, "blue");
  v9 = v8;
  -[PFParallaxColor luminance](self, "luminance");
  v11 = v10;
  -[PFParallaxColor luma](self, "luma");
  v13 = v12;
  -[PFParallaxColor hue](self, "hue");
  v15 = v14;
  -[PFParallaxColor chroma](self, "chroma");
  v17 = v16;
  -[PFParallaxColor tone](self, "tone");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("(R:%.3f G:%.3f B:%.3f L: %.3f, l:%.3f, h:%.3f c:%.3f t:%.3f)"), v5, v7, v9, v11, v13, v15, v17, v18);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[PFParallaxColor isEqualToParallaxColor:](self, "isEqualToParallaxColor:", v4);

  return v5;
}

- (BOOL)isEqualToParallaxColor:(id)a3
{
  float64x2_t v3;
  float64x2_t v4;
  int64x2_t v5;

  v3 = *((float64x2_t *)a3 + 2);
  v4 = vabdq_f64(*(float64x2_t *)&self->_srgb[16], v3);
  v3.f64[0] = 0.0001;
  v5 = vcgtq_f64((float64x2_t)vdupq_n_s64(0x3F1A36E2EB1C432DuLL), vabdq_f64(*(float64x2_t *)self->_srgb, *((float64x2_t *)a3 + 1)));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v5, 1), vandq_s8((int8x16_t)vcgtq_f64(v3, v4), (int8x16_t)v5)).u64[0] >> 63;
}

- (double)distanceToColor:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double result;

  v4 = a3;
  -[PFParallaxColor hue](self, "hue");
  v6 = v5 + 0.0;
  objc_msgSend(v4, "hue");
  v8 = vabdd_f64(v6, v7);
  -[PFParallaxColor hue](self, "hue");
  v10 = v9 + 360.0;
  objc_msgSend(v4, "hue");
  v12 = vabdd_f64(v10, v11);
  -[PFParallaxColor hue](self, "hue");
  v14 = v13 + -360.0;
  objc_msgSend(v4, "hue");
  v16 = v15;

  result = vabdd_f64(v14, v16);
  if (v12 < result)
    result = v12;
  if (v8 < result)
    return v8;
  return result;
}

- (double)deltaE94DistanceToColor:(id)a3
{
  id v4;
  double v5;
  __int128 v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  double v11;
  double v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float v16;
  float64x2_t v17;
  float64x2_t v18;
  float v19;
  float v20;
  float v21;
  float64x2_t v23;
  float64_t v24;
  float64_t v25;
  float64x2_t v26;
  float64x2_t v27;
  __int128 v28;
  float64x2_t v29;
  float64_t v30;
  float64x2_t v31;

  v4 = a3;
  -[PFParallaxColor luma](self, "luma");
  v30 = v5;
  -[PFParallaxColor pt](self, "pt");
  v28 = v6;
  -[PFParallaxColor pt](self, "pt");
  v7.f64[1] = *((float64_t *)&v28 + 1);
  v8.f64[0] = v30;
  *(_QWORD *)&v8.f64[1] = v28;
  v9.f64[0] = 255.0;
  v7.f64[0] = -128.0;
  v27 = v9;
  v29 = v7;
  v31 = vmlaq_f64(v7, v9, v10);
  v26 = vmlaq_f64((float64x2_t)xmmword_1A17B6D30, (float64x2_t)xmmword_1A17B6D20, v8);
  objc_msgSend(v4, "luma");
  v25 = v11;
  objc_msgSend(v4, "pt");
  v24 = v12;
  objc_msgSend(v4, "pt");
  v23 = v13;

  v14.f64[0] = v25;
  v14.f64[1] = v24;
  v15 = vmlaq_f64((float64x2_t)xmmword_1A17B6D30, (float64x2_t)xmmword_1A17B6D20, v14);
  v16 = v26.f64[0] - v15.f64[0];
  v17 = v15;
  *(float *)v14.f64 = COERCE_DOUBLE(*(_QWORD *)&vsubq_f64(v26, v15).f64[1]);
  v18 = vmlaq_f64(v29, v27, v23);
  *(float *)v15.f64 = v31.f64[0] - v18.f64[0];
  v19 = sqrt(vaddq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)vmulq_f64(v26, v26), 1), vmulq_f64(v31, v31)).f64[0]);
  v20 = sqrt(vaddq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)vmulq_f64(v17, v17), 1), vmulq_f64(v18, v18)).f64[0]);
  *(float *)v18.f64 = v19 - v20;
  *(float *)v14.f64 = fmax((float)((float)((float)(*(float *)v15.f64 * *(float *)v15.f64)+ (float)(*(float *)v14.f64 * *(float *)v14.f64))- (float)(*(float *)v18.f64 * *(float *)v18.f64)), 0.0);
  v15.f64[0] = sqrtf(v19 * v20);
  v21 = v15.f64[0] * 0.045 + 1.0;
  *(float *)v15.f64 = v15.f64[0] * 0.015 + 1.0;
  return sqrtf((float)(*(float *)v14.f64 / (float)(*(float *)v15.f64 * *(float *)v15.f64))+ (float)((float)((float)(*(float *)v18.f64 / v21) * (float)(*(float *)v18.f64 / v21)) + (float)(v16 * v16)));
}

- (NSArray)RGBValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)self->_srgb);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&self->_srgb[8], v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&self->_srgb[16]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (PFParallaxColor)complementaryColor
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[PFParallaxColor red](self, "red");
  v4 = 1.0 - v3;
  -[PFParallaxColor green](self, "green");
  v6 = 1.0 - v5;
  -[PFParallaxColor blue](self, "blue");
  return -[PFParallaxColor initWithRed:green:blue:]([PFParallaxColor alloc], "initWithRed:green:blue:", v4, v6, 1.0 - v7);
}

- (CGColor)CGColor
{
  PFParallaxColor *v2;
  CGColorSpace *v3;
  uint64_t v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_cgColor)
  {
    v3 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
    v4 = *(_QWORD *)&v2->_srgb[16];
    v6 = *(_OWORD *)v2->_srgb;
    v7 = v4;
    v8 = 0x3FF0000000000000;
    v2->_cgColor = CGColorCreate(v3, (const CGFloat *)&v6);
    CGColorSpaceRelease(v3);
  }
  objc_sync_exit(v2);

  return v2->_cgColor;
}

- (id)debugQuickLookObject
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithCGColor:", -[PFParallaxColor CGColor](self, "CGColor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugQuickLookObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PFParallaxColor RGBValues](self, "RGBValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("rgbValues"));

}

- (PFParallaxColor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  PFParallaxColor *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("rgbValues"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = -[PFParallaxColor initWithRed:green:blue:](self, "initWithRed:green:blue:", v8, v11, v13);

  return v14;
}

+ (PFParallaxColor)colorWithCGColor:(CGColor *)a3
{
  CGColorSpace *v5;
  CGColor *CopyByMatchingToColorSpace;
  const CGFloat *Components;
  _QWORD *v8;

  v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v5, kCGRenderingIntentDefault, a3, 0);
  Components = CGColorGetComponents(CopyByMatchingToColorSpace);
  v8 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:", *Components, Components[1], Components[2]);
  v8[10] = CopyByMatchingToColorSpace;
  CGColorSpaceRelease(v5);
  return (PFParallaxColor *)v8;
}

+ (PFParallaxColor)whiteColor
{
  return -[PFParallaxColor initWithRed:green:blue:]([PFParallaxColor alloc], "initWithRed:green:blue:", 1.0, 1.0, 1.0);
}

+ (PFParallaxColor)blackColor
{
  return -[PFParallaxColor initWithRed:green:blue:]([PFParallaxColor alloc], "initWithRed:green:blue:", 0.0, 0.0, 0.0);
}

+ (PFParallaxColor)colorWithTone:(double)a3 hue:(double)a4
{
  return (PFParallaxColor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithHue:tone:", a4, a3);
}

+ (PFParallaxColor)colorWithRGBValues:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count") == 3)
  {
    v6 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        break;
      if (++v6 == 3)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v11 = v10;

        objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

        objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16;

        a4 = -[PFParallaxColor initWithRed:green:blue:]([PFParallaxColor alloc], "initWithRed:green:blue:", v11, v14, v17);
        goto LABEL_11;
      }
    }
    if (a4)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2938];
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("Color value at index %d is not a number: %@"), v6, v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v24);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
  }
  else if (a4)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RGB array is invalid: %@"), v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v20);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    a4 = 0;
  }
LABEL_11:

  return (PFParallaxColor *)a4;
}

+ (PFParallaxColor)warmColor
{
  return (PFParallaxColor *)objc_msgSend(a1, "colorWithTone:hue:", 0.5, 60.0);
}

+ (PFParallaxColor)coolColor
{
  return (PFParallaxColor *)objc_msgSend(a1, "colorWithTone:hue:", 0.5, -120.0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
