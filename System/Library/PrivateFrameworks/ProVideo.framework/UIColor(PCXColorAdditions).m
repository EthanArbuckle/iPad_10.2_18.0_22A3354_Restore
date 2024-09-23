@implementation UIColor(PCXColorAdditions)

- (double)pcxHueComponent
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v2, 0, 0, 0);
  return v2;
}

- (double)pcxSaturationComponent
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", 0, &v2, 0, 0);
  return v2;
}

- (double)pcxBrightnessComponent
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", 0, 0, &v2, 0);
  return v2;
}

- (double)pcxRedComponent
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v2, 0, 0, 0);
  return v2;
}

- (double)pcxGreenComponent
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", 0, &v2, 0, 0);
  return v2;
}

- (double)pcxBlueComponent
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", 0, 0, &v2, 0);
  return v2;
}

- (double)pcxAlphaComponent
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", 0, 0, 0, &v2);
  return v2;
}

- (uint64_t)pcxGetComponents:()PCXColorAdditions
{
  return objc_msgSend(a1, "getRed:green:blue:alpha:", a3, a3 + 8, a3 + 16, a3 + 24);
}

- (CGColor)pcxColorUsingColorSpace:()PCXColorAdditions
{
  CGColor *result;
  CGColor *v5;
  const CGFloat *Components;
  uint64_t v7;

  result = CGColorCreateCopyByMatchingToColorSpace(a3, kCGRenderingIntentPerceptual, (CGColorRef)objc_msgSend(a1, "CGColor"), 0);
  if (result)
  {
    v5 = result;
    Components = CGColorGetComponents(result);
    v7 = objc_msgSend(MEMORY[0x1E0CEA478], "pcxColorWithColorSpace:components:count:", a3, Components, CGColorGetNumberOfComponents(v5));
    CGColorRelease(v5);
    return (CGColor *)v7;
  }
  return result;
}

- (BOOL)isColorSpaceModelRGB
{
  CGColorSpace *ColorSpace;

  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(a1, "CGColor"));
  return CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelRGB;
}

- (BOOL)isColorSpaceModelGray
{
  CGColorSpace *ColorSpace;

  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(a1, "CGColor"));
  return CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelMonochrome;
}

+ (uint64_t)pcxColorWithSRGBRed:()PCXColorAdditions green:blue:alpha:
{
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  *(double *)v7 = a2;
  *(double *)&v7[1] = a3;
  *(double *)&v7[2] = a4;
  *(double *)&v7[3] = a5;
  if (sRGBColorSpace_once != -1)
    dispatch_once(&sRGBColorSpace_once, &__block_literal_global_88);
  return objc_msgSend(a1, "pcxColorWithColorSpace:components:count:", sRGBColorSpace_result, v7, 4);
}

+ (uint64_t)pcxColorWithGenericGamma22White:()PCXColorAdditions alpha:
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  if (GenericGrayGamma22ColorSpace_once != -1)
    dispatch_once(&GenericGrayGamma22ColorSpace_once, &__block_literal_global_89);
  return objc_msgSend(a1, "pcxColorWithColorSpace:components:count:", GenericGrayGamma22ColorSpace_result, v5, 2);
}

+ (uint64_t)pcxColorWithCalibratedWhite:()PCXColorAdditions alpha:
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  if (CalibratedGray_once != -1)
    dispatch_once(&CalibratedGray_once, &__block_literal_global_90);
  return objc_msgSend(a1, "pcxColorWithColorSpace:components:count:", CalibratedGray_result, v5, 2);
}

+ (uint64_t)pcxColorWithDeviceWhite:()PCXColorAdditions alpha:
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  if (DeviceRGB_once != -1)
    dispatch_once(&DeviceRGB_once, &__block_literal_global_91);
  return objc_msgSend(a1, "pcxColorWithColorSpace:components:count:", DeviceRGB_result, v5, 2);
}

+ (uint64_t)pcxColorWithDeviceRed:()PCXColorAdditions green:blue:alpha:
{
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  *(double *)v7 = a2;
  *(double *)&v7[1] = a3;
  *(double *)&v7[2] = a4;
  *(double *)&v7[3] = a5;
  if (DeviceRGB_once != -1)
    dispatch_once(&DeviceRGB_once, &__block_literal_global_91);
  return objc_msgSend(a1, "pcxColorWithColorSpace:components:count:", DeviceRGB_result, v7, 4);
}

+ (uint64_t)pcxColorWithDeviceHue:()PCXColorAdditions saturation:brightness:alpha:
{
  if (DeviceRGB_once != -1)
    dispatch_once(&DeviceRGB_once, &__block_literal_global_91);
  return objc_msgSend(a1, "pcxColorWithColorSpace:hue:saturation:brightness:alpha:", DeviceRGB_result, a2, a3, a4, a5);
}

+ (uint64_t)pcxColorWithDeviceCyan:()PCXColorAdditions magenta:yellow:black:alpha:
{
  return 0;
}

+ (uint64_t)pcxColorWithCalibratedRed:()PCXColorAdditions green:blue:alpha:
{
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  *(double *)v7 = a2;
  *(double *)&v7[1] = a3;
  *(double *)&v7[2] = a4;
  *(double *)&v7[3] = a5;
  if (CalibratedRGB_once != -1)
    dispatch_once(&CalibratedRGB_once, &__block_literal_global_92);
  return objc_msgSend(a1, "pcxColorWithColorSpace:components:count:", CalibratedRGB_result, v7, 4);
}

+ (uint64_t)pcxColorWithCalibratedHue:()PCXColorAdditions saturation:brightness:alpha:
{
  if (CalibratedRGB_once != -1)
    dispatch_once(&CalibratedRGB_once, &__block_literal_global_92);
  return objc_msgSend(a1, "pcxColorWithColorSpace:hue:saturation:brightness:alpha:", CalibratedRGB_result, a2, a3, a4, a5);
}

+ (uint64_t)pcxColorWithColorSpace:()PCXColorAdditions components:count:
{
  CGColorRef v7;
  uint64_t v8;

  if (CGColorSpaceGetNumberOfComponents(space) + 1 != a5)
    return 0;
  v7 = CGColorCreate(space, a4);
  v8 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", v7);
  CFRelease(v7);
  return v8;
}

+ (uint64_t)pcxColorWithColorSpace:()PCXColorAdditions hue:saturation:brightness:alpha:
{
  float v7;
  float v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v17;
  float32x4_t v19;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v25;
  float64x2_t v27;
  double v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  *(float *)&a2 = a2;
  v7 = a3;
  v8 = a4;
  v9 = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a2, 0), (float32x4_t)xmmword_1B305A2F0);
  v10 = v9;
  v10.i32[3] = 0;
  v11 = vsubq_f32(v9, vrndmq_f32(v10));
  v11.i32[3] = 0;
  __asm { FMOV            V4.4S, #6.0 }
  v17 = vmulq_f32(vminnmq_f32(v11, (float32x4_t)xmmword_1B305A300), _Q4);
  __asm { FMOV            V4.4S, #-3.0 }
  v19 = vabsq_f32(vaddq_f32(v17, _Q4));
  __asm { FMOV            V4.4S, #-1.0 }
  v21 = vaddq_f32(v19, _Q4);
  v21.i32[3] = 0;
  v22 = vmaxnmq_f32(v21, (float32x4_t)0);
  v22.i32[3] = 0;
  v23 = vmulq_n_f32(vaddq_f32(vminnmq_f32(v22, (float32x4_t)xmmword_1B3051560), _Q4), v7);
  __asm { FMOV            V1.4S, #1.0 }
  v25 = vmulq_n_f32(vaddq_f32(v23, _Q1), v8);
  v27 = vcvtq_f64_f32(*(float32x2_t *)v25.f32);
  v28 = v25.f32[2];
  v29 = a5;
  return objc_msgSend(a1, "pcxColorWithColorSpace:components:count:", a7, &v27, 4);
}

@end
