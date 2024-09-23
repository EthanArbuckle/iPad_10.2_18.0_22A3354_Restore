@implementation PAESlicedScale

- (PAESlicedScale)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAESlicedScale;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];
  _QWORD v7[10];

  v7[9] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190), "versionAtCreation");
  v6[0] = CFSTR("PixelTransformSupport");
  v6[1] = CFSTR("MayRemapTime");
  if (v2 <= 1)
    v3 = 65792;
  else
    v3 = 67584;
  if (v2 <= 1)
    v4 = 590080;
  else
    v4 = 591872;
  v7[0] = &unk_1E66490A8;
  v7[1] = MEMORY[0x1E0C9AAA0];
  v6[2] = CFSTR("PixelIndependent");
  v6[3] = CFSTR("PositionIndependent");
  v7[2] = MEMORY[0x1E0C9AAA0];
  v7[3] = MEMORY[0x1E0C9AAA0];
  v6[4] = CFSTR("SupportsLargeRenderScale");
  v6[5] = CFSTR("SupportsHeliumRendering");
  v7[4] = MEMORY[0x1E0C9AAB0];
  v7[5] = MEMORY[0x1E0C9AAB0];
  v6[6] = CFSTR("SDRWorkingSpace");
  v7[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v6[7] = CFSTR("HDRWorkingSpace");
  v6[8] = CFSTR("AutoColorProcessingSupport");
  v7[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v7[8] = &unk_1E66490A8;
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 9);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PAESlicedScale;
  -[PAESharedDefaultBase addParameters](&v11, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
  {
    v7 = objc_msgSend(v4, "versionAtCreation");
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SlicedScale::editSlices"), 0, 0), 1, 0, 1);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SlicedScale::sliceRightTop"), 0, 0), 2, 34, 0.75, 0.75);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SlicedScale::sliceLeftBottom"), 0, 0), 3, 34, 0.25, 0.25);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SlicedScale::mode"), 0, 0), 4, 0, objc_msgSend((id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SlicedScale::modeEntries"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 1);
    objc_msgSend(v3, "add2DScaleWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SlicedScale::objectScale"), 0, 0), 5, 32, 1.0, 1.0);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SlicedScale::offset"), 0, 0), 6, 32, 0.5, 0.5);
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SlicedScale::expandGroup"), 0, 0), 7, 40);
    v9 = objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SlicedScale::expandLeft"), 0, 0);
    if (v7 < 2)
    {
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", v9, 8, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SlicedScale::expandRight"), 0, 0), 10, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SlicedScale::expandTop"), 0, 0), 11, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SlicedScale::expandBottom"), 0, 0), 9, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    }
    else
    {
      objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", v9, 8, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
      objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SlicedScale::expandRight"), 0, 0), 10, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
      objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SlicedScale::expandTop"), 0, 0), 11, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
      objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SlicedScale::expandBottom"), 0, 0), 9, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    }
    objc_msgSend(v3, "endParameterSubGroup");
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", CFSTR("Debug"), 12, 34);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", CFSTR("Ignore Offset values"), 15, 0, 33);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", CFSTR("Don't Auto-keyframe offset"), 16, 0, 33);
    objc_msgSend(v3, "endParameterSubGroup");
  }
  return v6;
}

- (void)innerScaleFromObjectScale:(PCVector2<double>)a3 innerScale:(void *)a4 xLeft:(double)a5 xRight:(double)a6 yTop:(double)a7 yBottom:(double)a8 inputSize:(PCVector2<double>)a9 newObjectSize:(void *)a10 mode:(int)a11
{
  float64x2_t *v11;
  int v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v22;
  float64x2_t v23;
  double v24;
  double v25;

  v13 = (float64x2_t)vdupq_n_s64(0x3EE4F8B588E368F1uLL);
  v14 = vmaxnmq_f64(*(float64x2_t *)a4, v13);
  *(float64x2_t *)a4 = v14;
  __asm { FMOV            V3.2D, #1.0 }
  v22 = vmulq_f64(vsubq_f64(*(float64x2_t *)&a3.var1, (float64x2_t)a3), **(float64x2_t **)&a11);
  v23 = vmaxnmq_f64(vdivq_f64(vsubq_f64(vaddq_f64(v22, vmaxnmq_f64(vmulq_f64(v14, **(float64x2_t **)&a11), _Q3)), **(float64x2_t **)&a11), v22), v13);
  if (v12 == 2)
  {
    v24 = floor(v23.f64[0] + 0.0000001);
    if (v23.f64[0] <= 1.0)
      v25 = v23.f64[0];
    else
      v25 = v24;
    v23.f64[0] = v25;
    if (v23.f64[1] > 1.0)
      v23.f64[1] = floor(v23.f64[1] + 0.0000001);
  }
  *v11 = vaddq_f64(**(float64x2_t **)&a11, vsubq_f64(vmulq_f64(v22, v23), v22));
  *(float64x2_t *)a10 = v23;
}

- (void)wholeTileExpandLeftScale:(double *)a3 expandRightScale:(double *)a4 expandBottomScale:(double *)a5 expandTopScale:(double *)a6 objectScale:(void *)a7 xLeft:(double)a8 xRight:(double)a9 yBottom:(double)a10 yTop:(double)a11
{
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  float64x2_t v40;
  float64x2_t v41;

  v11.f64[0] = a9;
  v11.f64[1] = a11;
  v12.f64[0] = a8;
  v12.f64[1] = a10;
  v13 = vsubq_f64(v11, v12);
  v14 = (float64x2_t)vdupq_n_s64(0x3EE4F8B588E368F1uLL);
  v15 = vaddq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v14, *(float64x2_t *)a7), (int8x16_t)v14, *(int8x16_t *)a7), v11);
  v16 = *a3 + 1.0;
  if (v16 < 0.00001)
    v16 = 0.00001;
  v17 = (v16 + a9 - a8 + -1.0) / v13.f64[0];
  if (v17 < 0.00001)
    v17 = 0.00001;
  v18 = floor(v17 + 0.0000001);
  if (v17 > 1.0)
    v17 = v18;
  v19 = *a5 + 1.0;
  if (v19 < 0.00001)
    v19 = 0.00001;
  v20 = (v19 + a11 - a10 + -1.0) / v13.f64[1];
  if (v20 < 0.00001)
    v20 = 0.00001;
  v21 = floor(v20 + 0.0000001);
  if (v20 > 1.0)
    v20 = v21;
  v22 = *a4 + 1.0;
  if (v22 < 0.00001)
    v22 = 0.00001;
  v23 = (v22 + a9 - a8 + -1.0) / v13.f64[0];
  if (v23 < 0.00001)
    v23 = 0.00001;
  v24 = floor(v23 + 0.0000001);
  if (v23 > 1.0)
    v23 = v24;
  v25 = *a6 + 1.0;
  if (v25 < 0.00001)
    v25 = 0.00001;
  v26 = (v25 + a11 - a10 + -1.0) / v13.f64[1];
  if (v26 < 0.00001)
    v26 = 0.00001;
  v27 = floor(v26 + 0.0000001);
  if (v26 > 1.0)
    v26 = v27;
  v28 = vmuld_lane_f64(v20 + -1.0, v13, 1) + 1.0;
  v29 = (v23 + -1.0) * v13.f64[0] + 1.0;
  v30 = vmuld_lane_f64(v26 + -1.0, v13, 1) + 1.0;
  v31 = (v17 + -1.0) * v13.f64[0] + 1.0 + -1.0;
  if (v31 < 0.0)
    v31 = 0.0;
  *a3 = v31;
  v32 = v29 + -1.0;
  if (v32 < 0.0)
    v32 = 0.0;
  *a4 = v32;
  v33 = v28 + -1.0;
  if (v28 + -1.0 < 0.0)
    v33 = 0.0;
  *a5 = v33;
  v34 = v30 + -1.0;
  if (v30 + -1.0 < 0.0)
    v34 = 0.0;
  *a6 = v34;
  __asm { FMOV            V1.2D, #-1.0 }
  v40 = vdivq_f64(vaddq_f64(vsubq_f64(v15, v12), _Q1), v13);
  v41 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v14, v40), (int8x16_t)v14, (int8x16_t)v40);
  __asm { FMOV            V2.2D, #1.0 }
  *(int8x16_t *)a7 = vbslq_s8((int8x16_t)vcgeq_f64(*(float64x2_t *)a7, _Q2), (int8x16_t)vaddq_f64(vmulq_f64(v13, vaddq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v41, _Q2), (int8x16_t)vrndmq_f64(vaddq_f64(v41, (float64x2_t)vdupq_n_s64(0x3E7AD7F29ABCAF48uLL))), (int8x16_t)v41), _Q1)), _Q2), *(int8x16_t *)a7);
}

- (void)additionalObjectDownScale:(void *)a3 objectScale:(PCVector2<double>)a4 innerScale:(PCVector2<double>)a5 xLeft:(double)a6 xRight:(double)a7 yTop:(double)a8 yBottom:(double)a9
{
  float64x2_t *v9;
  double *v10;
  float64x2_t v16;
  double v17;

  __asm { FMOV            V4.2D, #1.0 }
  *(_OWORD *)a3 = _Q4;
  v16 = vmaxnmq_f64(*v9, (float64x2_t)vdupq_n_s64(0x3EE4F8B588E368F1uLL));
  *v9 = v16;
  if (*v10 <= 0.00001)
    *(double *)a3 = v16.f64[0] / (*v10 * a4.var1 - *v10 * a4.var0 + a4.var0 - a4.var1 + 1.0);
  v17 = v10[1];
  if (v17 <= 0.00001)
    *((double *)a3 + 1) = v16.f64[1] / (v17 * a5.var0 - v17 * a5.var1 + a5.var1 - a5.var0 + 1.0);
}

- (void)calculateBounds:(CGRect *)a3 fromOrigin:(PCVector2<double>)a4 mode:(int)a5 inputSize:(PCVector2<double>)a6 ignoreOffsets:(BOOL)a7 xLeft:(double)a8 xRight:(double)a9 yBottom:(double)a10 yTop:(double)a11 objectScale:(PCVector2<double>)a12 offset:(PCVector2<double>)a13
{
  __int128 *v13;
  __int128 *v14;
  char var1_low;
  double var0;
  double *v17;
  double var1;
  double v19;
  double v20;
  double v21;
  __int128 v24;
  double v25;
  double v26;
  double v27;
  double v28;
  int8x16_t v29;
  CGPoint v35;
  float v36;
  float v37;
  double v38;
  float v39;
  double v40;
  float v41;
  float32x2_t v42;
  double v43;
  float v44;
  double v45;
  float64x2_t v47;
  double v49;
  double v50;
  _QWORD v51[2];
  __int128 v52;
  double v53;
  double v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  double v58;
  double v59;

  v14 = v13;
  var1_low = LOBYTE(a12.var1);
  var0 = a12.var0;
  v17 = *(double **)&a5;
  var1 = a6.var1;
  v19 = a6.var0;
  v20 = a4.var1;
  v21 = a4.var0;
  v58 = 0.0;
  v59 = 0.0;
  v57 = 0uLL;
  v24 = *v13;
  v55 = **(_OWORD **)&a12.var0;
  v56 = v24;
  -[PAESlicedScale innerScaleFromObjectScale:innerScale:xLeft:xRight:yTop:yBottom:inputSize:newObjectSize:mode:](self, "innerScaleFromObjectScale:innerScale:xLeft:xRight:yTop:yBottom:inputSize:newObjectSize:mode:", &v56, &v58, &v55, &v57, a7, a4.var0, a4.var1, a6.var1, a6.var0);
  v49 = v17[1];
  v50 = *v17;
  v26 = **(double **)&var0;
  v25 = *(double *)(*(_QWORD *)&var0 + 8);
  v28 = v58;
  v27 = v59;
  v53 = 0.0;
  v54 = 0.0;
  v52 = *v14;
  *(double *)v51 = v58;
  *(double *)&v51[1] = v59;
  -[PAESlicedScale additionalObjectDownScale:objectScale:innerScale:xLeft:xRight:yTop:yBottom:](self, "additionalObjectDownScale:objectScale:innerScale:xLeft:xRight:yTop:yBottom:", &v53, &v52, v51, v21, v20, var1, v19);
  if ((var1_low & 1) != 0)
  {
    v29 = **(int8x16_t **)&var0;
    __asm { FMOV            V0.2D, #-0.5 }
    v35 = (CGPoint)vmulq_f64(**(float64x2_t **)&var0, _Q0);
  }
  else
  {
    v36 = v50 / v26;
    v37 = v49 / v25;
    v38 = v21 - v28 * v21;
    v39 = v36 - v38;
    v40 = v19 - v27 * v19;
    v41 = v37 - v40;
    v42.f32[0] = (v38 - (v28 * v20 - v20)) * 0.5 + v39;
    v43 = (v40 - (v27 * var1 - var1)) * 0.5 + v41;
    if (v58 <= 0.00001)
    {
      v42.f32[0] = v53 * v42.f32[0];
      *(double *)&v57 = v53 * *(double *)&v57;
    }
    v44 = v43;
    if (v59 <= 0.00001)
    {
      v44 = v54 * v44;
      v45 = v54 * *((double *)&v57 + 1);
    }
    else
    {
      v45 = *((double *)&v57 + 1);
    }
    v42.f32[1] = v44;
    __asm { FMOV            V3.2D, #-0.5 }
    v47 = vaddq_f64(**(float64x2_t **)&a13.var0, _Q3);
    **(_OWORD **)&a13.var0 = v47;
    v35 = (CGPoint)vcvtq_f64_f32(vcvt_f32_f64(vmulq_f64(**(float64x2_t **)&var0, vcvtq_f64_f32(vcvt_f32_f64(vaddq_f64(v47, vcvtq_f64_f32(v42)))))));
    *(CGPoint *)v17 = v35;
    v29.i64[0] = v57;
    *(double *)&v29.i64[1] = v45;
  }
  __asm { FMOV            V1.2D, #1.0 }
  a3->origin = v35;
  a3->size = (CGSize)vbslq_s8((int8x16_t)vcgtq_f64((float64x2_t)_Q1, (float64x2_t)v29), _Q1, v29);
}

- (BOOL)getOutputBounds:(CGRect *)a3 withInputBounds:(CGRect)a4 withInputInfo:(id *)a5 withRenderInfo:(id *)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v13;
  BOOL v15;
  void *v16;
  CGSize v22;
  __int128 v24;
  float64x2_t v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _OWORD v28[2];
  __int128 v29;
  unsigned __int8 v30;
  unsigned int v31;
  float64x2_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  char v37;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8, a5);
  if (a3)
    _ZF = v13 == 0;
  else
    _ZF = 1;
  v15 = !_ZF;
  if (!_ZF)
  {
    v16 = v13;
    v37 = 0;
    objc_msgSend(v13, "getBoolValue:fromParm:atFxTime:", &v37, 1, a6->var0.var1);
    if (!v37)
    {
      v35 = 0.0;
      v36 = 0.0;
      v33 = 0.0;
      v34 = 0.0;
      objc_msgSend(v16, "getXValue:YValue:fromParm:atFxTime:", &v35, &v33, 3, a6->var0.var1);
      objc_msgSend(v16, "getXValue:YValue:fromParm:atFxTime:", &v36, &v34, 2, a6->var0.var1);
      v35 = v35 + -0.5;
      v36 = v36 + -0.5;
      v33 = v33 + -0.5;
      v34 = v34 + -0.5;
      __asm { FMOV            V0.2D, #1.0 }
      v32 = _Q0;
      objc_msgSend(v16, "getXValue:YValue:fromParm:atFxTime:", &v32, &v32.f64[1], 5, a6->var0.var1);
      v32 = vmaxnmq_f64(v32, (float64x2_t)vdupq_n_s64(0x3EE4F8B588E368F1uLL));
      v31 = 0;
      objc_msgSend(v16, "getIntValue:fromParm:atFxTime:", &v31, 4, a6->var0.var1);
      v30 = 0;
      objc_msgSend(v16, "getBoolValue:fromParm:atFxTime:", &v30, 15, a6->var0.var1);
      __asm { FMOV            V0.2D, #0.5 }
      v29 = _Q0;
      objc_msgSend(v16, "getXValue:YValue:fromParm:atFxTime:", &v29, (char *)&v29 + 8, 6, a6->var0.var1);
      *(CGFloat *)v27 = x;
      *(CGFloat *)&v27[1] = y;
      *(CGFloat *)v26 = width;
      *(CGFloat *)&v26[1] = height;
      v24 = v29;
      v25 = v32;
      -[PAESlicedScale calculateBounds:fromOrigin:mode:inputSize:ignoreOffsets:xLeft:xRight:yBottom:yTop:objectScale:offset:](self, "calculateBounds:fromOrigin:mode:inputSize:ignoreOffsets:xLeft:xRight:yBottom:yTop:objectScale:offset:", v28, v27, v31, v26, v30, &v25, v35, v36, v33, v34, &v24);
      v22 = (CGSize)v28[1];
      a3->origin = (CGPoint)v28[0];
      a3->size = v22;
    }
  }
  return v15;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  BOOL v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  float64x2_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64x2_t v25;
  double v26;
  double v27;
  float64x2_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v44;
  HGXForm *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  HGSolidColor *v50;
  HGHWBlendFlipped *v51;
  HgcSlicedTile *v52;
  char *v53;
  __n128 v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  HgcSlicedScale *v81;
  __n128 v82;
  float v83;
  char *v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  double v110;
  float64x2_t v111;
  float64x2_t v112;
  float64x2_t v113;
  float64x2_t v114;
  float64x2_t v115[9];
  float64x2_t v116;
  float64x2_t v117;
  float64x2_t v118;
  _QWORD v119[2];
  float64x2_t v120[2];
  float64x2_t v121;
  _QWORD v122[2];
  float64x2_t v123;
  double v124[2];
  float64x2_t v125;
  _QWORD v126[2];
  float64x2_t v127;
  float64x2_t v128;
  double v129[2];
  _QWORD v130[2];
  double v131;
  double v132;
  double v133;
  float64_t v134;
  unsigned int v135;
  float64x2_t v136;
  uint64_t v137;
  char v138;
  float64x2_t v139;
  unsigned __int8 v140;
  double v141;
  double v142;
  double v143;
  double v144;
  float64x2_t v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  float64_t v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  HGRect v162;
  HGRect v163;
  HGRect v164;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    _ZF = v10 == 0;
  else
    _ZF = 1;
  v12 = !_ZF;
  if (!_ZF)
  {
    v13 = objc_msgSend(v10, "versionAtCreation");
    v14 = objc_msgSend(a4, "width");
    v15 = objc_msgSend(a4, "height");
    -[PAESharedDefaultBase getImageBoundary:](self, "getImageBoundary:", a4);
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
    v16.f64[0] = v154;
    v16.f64[1] = v159;
    v112 = v16;
    v17 = v146;
    v18 = v149;
    v19 = v151;
    v20 = v153;
    v145 = 0uLL;
    v144 = 0.0;
    v143 = 0.0;
    v142 = 0.0;
    v141 = 0.0;
    v140 = 0;
    v139 = 0uLL;
    v138 = 0;
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v138, 1, a5->var0.var1);
    if (a4)
      objc_msgSend(a4, "heliumRef");
    else
      v137 = 0;
    if (v138)
    {
      objc_msgSend(a3, "setHeliumRef:", &v137);
    }
    else
    {
      __asm { FMOV            V0.2D, #1.0 }
      v136 = _Q0;
      objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v136, &v136.f64[1], 5, a5->var0.var1);
      v136 = vmaxnmq_f64(v136, (float64x2_t)vdupq_n_s64(0x3EE4F8B588E368F1uLL));
      objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v143, &v141, 3, a5->var0.var1);
      objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v144, &v142, 2, a5->var0.var1);
      v25.i64[0] = v14;
      v25.i64[1] = v15;
      v28 = vcvtq_f64_u64(v25);
      v26 = 1.0 / v28.f64[0];
      v114 = v28;
      v27 = v28.f64[1];
      v28.f64[0] = 1.0 / v28.f64[1];
      v29 = v143;
      if (v26 >= v143)
        v29 = v26;
      v143 = v29 + -0.5;
      v30 = v141;
      if (v28.f64[0] >= v141)
        v30 = 1.0 / v28.f64[1];
      v141 = v30 + -0.5;
      v31 = 1.0 - v26;
      if (v31 > v144)
        v31 = v144;
      v144 = v31 + -0.5;
      v32 = 1.0 - v28.f64[0];
      if (1.0 - v28.f64[0] > v142)
        v32 = v142;
      v142 = v32 + -0.5;
      objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v140, 15, a5->var0.var1);
      objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v139, &v139.f64[1], 6, a5->var0.var1);
      v135 = 0;
      objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v135, 4, a5->var0.var1);
      v133 = 0.0;
      v134 = 0.0;
      v131 = 0.0;
      v132 = 0.0;
      objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v134, 8, a5->var0.var1);
      objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v132, 9, a5->var0.var1);
      objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v133, 10, a5->var0.var1);
      objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v131, 11, a5->var0.var1);
      v33 = v135;
      if (v135 == 2 && v13 >= 2)
      {
        -[PAESlicedScale wholeTileExpandLeftScale:expandRightScale:expandBottomScale:expandTopScale:objectScale:xLeft:xRight:yBottom:yTop:](self, "wholeTileExpandLeftScale:expandRightScale:expandBottomScale:expandTopScale:objectScale:xLeft:xRight:yBottom:yTop:", &v134, &v133, &v132, &v131, &v136, v143, v144, v141, v142);
        v33 = v135;
      }
      v110 = v20;
      v34 = v18;
      v35 = v136.f64[0] + v134 + v133;
      v36 = v136.f64[1] + v132 + v131;
      v130[0] = 0;
      v130[1] = 0;
      v129[0] = v35;
      v129[1] = v36;
      v128 = v114;
      -[PAESlicedScale innerScaleFromObjectScale:innerScale:xLeft:xRight:yTop:yBottom:inputSize:newObjectSize:mode:](self, "innerScaleFromObjectScale:innerScale:xLeft:xRight:yTop:yBottom:inputSize:newObjectSize:mode:", v129, &v145, &v128, v130, v33, v143, v144, v142, v141);
      v127 = 0uLL;
      *(double *)v126 = v35;
      *(double *)&v126[1] = v36;
      v125 = v145;
      -[PAESlicedScale additionalObjectDownScale:objectScale:innerScale:xLeft:xRight:yTop:yBottom:](self, "additionalObjectDownScale:objectScale:innerScale:xLeft:xRight:yTop:yBottom:", &v127, v126, &v125, v143, v144, v142, v141);
      v37 = *(float *)v115[0].f64;
      v38 = *((float *)v115[0].f64 + 1);
      v111 = 0u;
      if (!v140)
      {
        v124[0] = *(float *)v115[0].f64;
        v124[1] = *((float *)v115[0].f64 + 1);
        v113 = vmulq_f64(v112, v114);
        v123 = v113;
        *(double *)v122 = v35;
        *(double *)&v122[1] = v36;
        v121 = v139;
        -[PAESlicedScale calculateBounds:fromOrigin:mode:inputSize:ignoreOffsets:xLeft:xRight:yBottom:yTop:objectScale:offset:](self, "calculateBounds:fromOrigin:mode:inputSize:ignoreOffsets:xLeft:xRight:yBottom:yTop:objectScale:offset:", v115, v124, v135, &v123, 0, v122, v143, v144, v141, v142, &v121);
        *(double *)v119 = v37;
        *(double *)&v119[1] = v38;
        v117 = v136;
        v118 = v113;
        v116 = v139;
        -[PAESlicedScale calculateBounds:fromOrigin:mode:inputSize:ignoreOffsets:xLeft:xRight:yBottom:yTop:objectScale:offset:](self, "calculateBounds:fromOrigin:mode:inputSize:ignoreOffsets:xLeft:xRight:yBottom:yTop:objectScale:offset:", v120, v119, v135, &v118, v140, &v117, v143, v144, v141, v142, &v116);
        v40.f64[0] = v133;
        v39.f64[0] = v134;
        v41.f64[0] = v143;
        v42.f64[0] = v144;
        __asm { FMOV            V5.2D, #0.5 }
        v39.f64[1] = v132;
        v40.f64[1] = v131;
        v41.f64[1] = v141;
        v42.f64[1] = v142;
        v44 = vaddq_f64(vsubq_f64(vsubq_f64(vdivq_f64(vmulq_f64(vaddq_f64(vaddq_f64(v120[0], v120[0]), v120[1]), _Q5), v113), vdivq_f64(vmulq_f64(vaddq_f64(vaddq_f64(v115[0], v115[0]), v115[1]), _Q5), v113)), vmulq_f64(vsubq_f64(v39, v40), _Q5)), vmulq_f64(vsubq_f64(vmulq_f64(v127, vsubq_f64(v41, vmulq_f64(v41, v145))), vmulq_f64(v127, vsubq_f64(vmulq_f64(v145, v42), v42))), _Q5));
        __asm { FMOV            V2.2D, #-0.5 }
        v111 = vmulq_f64(vaddq_f64(vaddq_f64(v139, _Q2), v44), v114);
      }
      HGTransform::HGTransform((HGTransform *)v115);
      HGTransform::Translate((HGTransform *)v115, v111.f64[0], v111.f64[1], 0.0);
      v46 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v46);
      (*(void (**)(HGXForm *, float64x2_t *))(*(_QWORD *)v46 + 576))(v46, v115);
      v47 = HGRectMake4i((int)(v17 * v37 + v34), (int)(v19 * v38 + v110), (int)(v17 * v37 + v34 + v114.f64[0]), (int)(v19 * v38 + v110 + v27));
      v49 = v48;
      v50 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
      *(_QWORD *)&v162.var0 = v47;
      *(_QWORD *)&v162.var2 = v49;
      HGSolidColor::HGSolidColor(v50, v162);
      (*(void (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v50 + 96))(v50, 0, 0.0, 0.0, 0.0, 0.0);
      v51 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v51);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v51 + 96))(v51, 0, 9.0, 0.0, 0.0, 0.0);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, float, float, float, float))(*(_QWORD *)v51 + 96))(v51, 1, 1.0, 0.0, 0.0, 0.0);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, HGSolidColor *))(*(_QWORD *)v51 + 120))(v51, 0, v50);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, uint64_t))(*(_QWORD *)v51 + 120))(v51, 1, v137);
      if (v135)
      {
        v52 = (HgcSlicedTile *)HGObject::operator new(0x1B0uLL);
        HgcSlicedTile::HgcSlicedTile(v52);
        *(_QWORD *)v52 = &unk_1E64DA218;
        v54.n128_u32[0] = 0;
        if (v135 == 1)
          v54.n128_f32[0] = 1.0;
        HgcSlicedTile::SetParameter(v52, 10, v54, 0.0, 0.0, 0.0, v53);
        (*(void (**)(HgcSlicedTile *, uint64_t, float, float, float, float))(*(_QWORD *)v52 + 96))(v52, 11, 0.0, 0.0, 0.0, 0.0);
        v55 = v145.f64[0];
        v56 = v145.f64[1];
        (*(void (**)(HgcSlicedTile *, _QWORD, float, float, float, float))(*(_QWORD *)v52 + 96))(v52, 0, v55, v56, 0.0, 0.0);
        (*(void (**)(HgcSlicedTile *, _QWORD, HGHWBlendFlipped *))(*(_QWORD *)v52 + 120))(v52, 0, v51);
        v57 = v144;
        (*(void (**)(HgcSlicedTile *, uint64_t, float, float, float, float))(*(_QWORD *)v52 + 96))(v52, 1, v57, 0.0, 0.0, 0.0);
        v58 = v143;
        (*(void (**)(HgcSlicedTile *, uint64_t, float, float, float, float))(*(_QWORD *)v52 + 96))(v52, 2, v58, 0.0, 0.0, 0.0);
        v59 = v142;
        (*(void (**)(HgcSlicedTile *, uint64_t, float, float, float, float))(*(_QWORD *)v52 + 96))(v52, 3, v59, 0.0, 0.0, 0.0);
        v60 = v141;
        (*(void (**)(HgcSlicedTile *, uint64_t, float, float, float, float))(*(_QWORD *)v52 + 96))(v52, 4, v60, 0.0, 0.0, 0.0);
        v61 = v154;
        v62 = v155;
        v63 = v156;
        v64 = v157;
        (*(void (**)(HgcSlicedTile *, uint64_t, float, float, float, float))(*(_QWORD *)v52 + 96))(v52, 5, v61, v62, v63, v64);
        v65 = v158;
        v66 = v159;
        v67 = v160;
        v68 = v161;
        (*(void (**)(HgcSlicedTile *, uint64_t, float, float, float, float))(*(_QWORD *)v52 + 96))(v52, 6, v65, v66, v67, v68);
        v69 = v146;
        v70 = v147;
        v71 = v148;
        v72 = v149;
        (*(void (**)(HgcSlicedTile *, uint64_t, float, float, float, float))(*(_QWORD *)v52 + 96))(v52, 7, v69, v70, v71, v72);
        v73 = v150;
        v74 = v151;
        v75 = v152;
        v76 = v153;
        (*(void (**)(HgcSlicedTile *, uint64_t, float, float, float, float))(*(_QWORD *)v52 + 96))(v52, 8, v73, v74, v75, v76);
        v77 = v114.f64[0];
        v78 = v27;
        (*(void (**)(HgcSlicedTile *, uint64_t, float, float, float, float))(*(_QWORD *)v52 + 96))(v52, 9, v77, v78, 0.0, 0.0);
        v79 = v127.f64[0];
        v80 = v127.f64[1];
        (*(void (**)(HgcSlicedTile *, uint64_t, float, float, float, float))(*(_QWORD *)v52 + 96))(v52, 12, v79, v80, 0.0, 0.0);
        (*(void (**)(HgcSlicedTile *, uint64_t, float, float, float, float))(*(_QWORD *)v52 + 96))(v52, 13, 0.00001, 0.0, 0.0, 0.0);
        *(_QWORD *)&v163.var0 = v47;
        *(_QWORD *)&v163.var2 = v49;
        HSlicedTile::setInputRect((HGRect *)v52, v163);
        (*(void (**)(HGXForm *, _QWORD, HgcSlicedTile *))(*(_QWORD *)v46 + 120))(v46, 0, v52);
        (*(void (**)(HgcSlicedTile *))(*(_QWORD *)v52 + 24))(v52);
      }
      else
      {
        v81 = (HgcSlicedScale *)HGObject::operator new(0x1B0uLL);
        HgcSlicedScale::HgcSlicedScale(v81);
        *(_QWORD *)v81 = &unk_1E64E37E0;
        v82.n128_u32[1] = HIDWORD(v145.f64[0]);
        v82.n128_f32[0] = v145.f64[0];
        v83 = v145.f64[1];
        HgcSlicedScale::SetParameter(v81, 0, v82, v83, 0.0, 0.0, v84);
        (*(void (**)(HgcSlicedScale *, _QWORD, HGHWBlendFlipped *))(*(_QWORD *)v81 + 120))(v81, 0, v51);
        v85 = v144;
        (*(void (**)(HgcSlicedScale *, uint64_t, float, float, float, float))(*(_QWORD *)v81 + 96))(v81, 1, v85, 0.0, 0.0, 0.0);
        v86 = v143;
        (*(void (**)(HgcSlicedScale *, uint64_t, float, float, float, float))(*(_QWORD *)v81 + 96))(v81, 2, v86, 0.0, 0.0, 0.0);
        v87 = v142;
        (*(void (**)(HgcSlicedScale *, uint64_t, float, float, float, float))(*(_QWORD *)v81 + 96))(v81, 3, v87, 0.0, 0.0, 0.0);
        v88 = v141;
        (*(void (**)(HgcSlicedScale *, uint64_t, float, float, float, float))(*(_QWORD *)v81 + 96))(v81, 4, v88, 0.0, 0.0, 0.0);
        v89 = v154;
        v90 = v155;
        v91 = v156;
        v92 = v157;
        (*(void (**)(HgcSlicedScale *, uint64_t, float, float, float, float))(*(_QWORD *)v81 + 96))(v81, 5, v89, v90, v91, v92);
        v93 = v158;
        v94 = v159;
        v95 = v160;
        v96 = v161;
        (*(void (**)(HgcSlicedScale *, uint64_t, float, float, float, float))(*(_QWORD *)v81 + 96))(v81, 6, v93, v94, v95, v96);
        v97 = v146;
        v98 = v147;
        v99 = v148;
        v100 = v149;
        (*(void (**)(HgcSlicedScale *, uint64_t, float, float, float, float))(*(_QWORD *)v81 + 96))(v81, 7, v97, v98, v99, v100);
        v101 = v150;
        v102 = v151;
        v103 = v152;
        v104 = v153;
        (*(void (**)(HgcSlicedScale *, uint64_t, float, float, float, float))(*(_QWORD *)v81 + 96))(v81, 8, v101, v102, v103, v104);
        v105 = v114.f64[0];
        v106 = v27;
        (*(void (**)(HgcSlicedScale *, uint64_t, float, float, float, float))(*(_QWORD *)v81 + 96))(v81, 9, v105, v106, 0.0, 0.0);
        v107 = v127.f64[0];
        v108 = v127.f64[1];
        (*(void (**)(HgcSlicedScale *, uint64_t, float, float, float, float))(*(_QWORD *)v81 + 96))(v81, 10, v107, v108, 0.0, 0.0);
        (*(void (**)(HgcSlicedScale *, uint64_t, float, float, float, float))(*(_QWORD *)v81 + 96))(v81, 11, 0.00001, 0.0, 0.0, 0.0);
        *(_QWORD *)&v164.var0 = v47;
        *(_QWORD *)&v164.var2 = v49;
        HSlicedTile::setInputRect((HGRect *)v81, v164);
        (*(void (**)(HGXForm *, _QWORD, HgcSlicedScale *))(*(_QWORD *)v46 + 120))(v46, 0, v81);
        (*(void (**)(HgcSlicedScale *))(*(_QWORD *)v81 + 24))(v81);
      }
      *(_QWORD *)&v120[0].f64[0] = v46;
      (*(void (**)(HGXForm *))(*(_QWORD *)v46 + 16))(v46);
      objc_msgSend(a3, "setHeliumRef:", v120);
      if (*(_QWORD *)&v120[0].f64[0])
        (*(void (**)(_QWORD))(**(_QWORD **)&v120[0].f64[0] + 24))(*(_QWORD *)&v120[0].f64[0]);
      (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v51 + 24))(v51);
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v50 + 24))(v50);
      (*(void (**)(HGXForm *))(*(_QWORD *)v46 + 24))(v46);
      HGTransform::~HGTransform((HGTransform *)v115);
    }
    if (v137)
      (*(void (**)(uint64_t))(*(_QWORD *)v137 + 24))(v137);
  }
  return v12;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  __int128 v6;
  _OWORD v8[3];

  *a6 = 0;
  *a5 = 0;
  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v8, a5, a6);
  return 1;
}

@end
