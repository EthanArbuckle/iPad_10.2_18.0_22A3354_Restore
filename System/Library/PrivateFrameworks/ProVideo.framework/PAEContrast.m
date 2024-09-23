@implementation PAEContrast

- (PAEContrast)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEContrast;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  if (-[PAEContrast properties]::once != -1)
    dispatch_once(&-[PAEContrast properties]::once, &__block_literal_global_42);
  return (id)-[PAEContrast properties]::sPropertiesDict;
}

uint64_t __25__PAEContrast_properties__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  id v10;

  v10 = objc_alloc(MEMORY[0x1E0C99D80]);
  v0 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 65792);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 590080);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  result = objc_msgSend(v10, "initWithObjectsAndKeys:", v0, CFSTR("PixelTransformSupport"), v1, CFSTR("PixelIndependent"), v2, CFSTR("PositionIndependent"), v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsLargeRenderScale"), v5, CFSTR("SupportsHeliumRendering"), v6, CFSTR("SDRWorkingSpace"), v7, CFSTR("HDRWorkingSpace"), v8,
             CFSTR("SupportsInternalMixing"),
             objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1),
             CFSTR("AutoColorProcessingSupport"),
             0);
  -[PAEContrast properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PAEContrast;
  -[PAESharedDefaultBase addParameters](&v7, sel_addParameters);
  v3 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
    objc_msgSend(v5, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Contrast::Contrast"), 0, 0), 1, 0, 1.0, 0.0, 10.0, 0.0, 2.0, 0.1);
    objc_msgSend(v5, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Contrast::Pivot"), 0, 0), 2, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v5, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Contrast::Bezier"), 0, 0), 4, 0, 1);
    objc_msgSend(v5, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Contrast::Luma"), 0, 0), 5, 0, 1);
    objc_msgSend(v5, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Contrast::Clip"), 0, 0), 3, 0, objc_msgSend((id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Contrast::Clip Values"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 1);
  }
  return v3 != 0;
}

- (CGPoint)calculateBezier:(double)a3 startPt:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPt:(CGPoint)a7
{
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v7 = 1.0 - a3;
  v8 = v7 * (v7 * v7);
  v9 = v7 * v7 * 3.0 * a3;
  v10 = a4.x * v8 + a5.x * v9;
  v11 = a3 * a3 * ((1.0 - a3) * 3.0);
  v12 = v11 * a6.x + v10;
  v13 = a3 * a3 * a3;
  v14 = v13 * a7.x + v12;
  v15 = v13 * a7.y + v11 * a6.y + a4.y * v8 + a5.y * v9;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)generateLut:(RGBAfPixel *)a3 forContrast:(double)a4 andPivot:(double)a5
{
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  __double2 v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double *v22;
  double v23;
  double v24;
  double v25;
  int32x2_t *v26;
  _BYTE v27[8];
  _QWORD v28[2048];

  v5 = MEMORY[0x1E0C80A78](self);
  v7 = v6;
  v9 = v8;
  v10 = (void *)v5;
  v28[2047] = *MEMORY[0x1E0C80C00];
  v12 = v6 + -1.0 + 1.0;
  v13 = __sincos_stret((1.0 - (v11 + -1.0)) * 1.57079633 * 0.5);
  v14 = 0;
  v15 = v28;
  do
  {
    if (v14 > 0x1FF)
      objc_msgSend(v10, "calculateBezier:startPt:controlPoint1:controlPoint2:endPt:", (double)((int)v14 - 512) / 511.0, v7, v7, v7, v7, (v12 + -1.0) * v13.__cosval - v13.__sinval * 0.0 + 1.0, (v12 + -1.0) * v13.__sinval + v13.__cosval * 0.0 + 1.0, 0x3FF0000000000000, 0x3FF0000000000000);
    else
      objc_msgSend(v10, "calculateBezier:startPt:controlPoint1:controlPoint2:endPt:", (double)(int)v14 * 0.001953125, 0.0, 0.0, v13.__cosval * v7 - v13.__sinval * 0.0, v13.__sinval * v7 + v13.__cosval * 0.0, v7, v7, *(_QWORD *)&v7, *(_QWORD *)&v7);
    *(v15 - 1) = v16;
    *v15 = v17;
    ++v14;
    v15 += 2;
  }
  while (v14 != 1024);
  v18 = 0;
  v19 = 0;
  do
  {
    v20 = (double)(int)v18 * 0.0009765625;
    v21 = (v19 << 32) - 0x100000000;
    v22 = (double *)&v28[2 * (int)v19 + 1];
    v19 = (int)v19 - 1;
    do
    {
      v23 = *v22;
      v22 += 2;
      v24 = v23;
      v21 += 0x100000000;
      ++v19;
    }
    while (v23 <= v20);
    v25 = *(double *)&v27[(v21 >> 28) + 8]
        + (v20 - *(double *)&v27[v21 >> 28])
        / (v24 - *(double *)&v27[v21 >> 28])
        * (*(v22 - 1) - *(double *)&v27[(v21 >> 28) + 8]);
    *(float *)&v25 = v25;
    v26 = (int32x2_t *)(v9 + 16 * v18);
    *v26 = vdup_lane_s32(*(int32x2_t *)&v25, 0);
    v26[1].i32[0] = LODWORD(v25);
    v26[1].i32[1] = 1065353216;
    ++v18;
  }
  while (v18 != 1024);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  HGBitmap *v19;
  double v20;
  double v21;
  HGBitmapLoader *v22;
  uint64_t v24;
  uint64_t v25;
  HGBitmapLoader *v26;
  uint64_t v27;
  HContrastBezierRGB *v28;
  HGBitmapLoader *v29;
  uint64_t v30;
  HContrastBezierRGB *v31;
  uint64_t v32;
  int v33;
  __int16 v34;
  double v35;
  double v36;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = v9;
  if (v9)
  {
    v35 = 0.0;
    v36 = 0.0;
    v34 = 0;
    v33 = 0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v36, 1, a5->var0.var1);
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v35, 2, a5->var0.var1);
    objc_msgSend(v10, "getIntValue:fromParm:atFxTime:", &v33, 3, a5->var0.var1);
    objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", (char *)&v34 + 1, 4, a5->var0.var1);
    objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v34, 5, a5->var0.var1);
    v11 = v33;
    objc_msgSend(v10, "mixAmountAtTime:", a5->var0.var1);
    v13 = v12;
    if (a4)
      objc_msgSend(a4, "heliumRef");
    else
      v32 = 0;
    v14 = v11 & 0xFFFFFFFD;
    v15 = v11 & 0xFFFFFFFE;
    if (HIBYTE(v34))
    {
      v16 = HGRectMake4i(0, 0, 0x400u, 1u);
      v18 = v17;
      v19 = (HGBitmap *)HGObject::operator new(0x80uLL);
      HGBitmap::HGBitmap(v19, v16, v18, 28);
      -[PAEContrast generateLut:forContrast:andPivot:](self, "generateLut:forContrast:andPivot:", *((_QWORD *)v19 + 10), v36, v35);
      objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v36, 1, a5->var0.var1);
      objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v35, 2, a5->var0.var1);
      objc_msgSend(v10, "getIntValue:fromParm:atFxTime:", &v33, 3, a5->var0.var1);
      objc_msgSend(v10, "mixAmountAtTime:", a5->var0.var1);
      v21 = v20;
      v22 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
      HGBitmapLoader::HGBitmapLoader(v22, v19);
      if ((_BYTE)v34)
      {
        v30 = v32;
        if (v32)
          (*(void (**)(uint64_t))(*(_QWORD *)v32 + 16))(v32);
        v29 = v22;
        if (v22)
          (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v22 + 16))(v22);
        createContrastBezierLumaNode(&v30, &v29, v15 == 2, v14 == 1, &v31, v21);
        if (v29)
          (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v29 + 24))(v29);
        if (v30)
          (*(void (**)(uint64_t))(*(_QWORD *)v30 + 24))(v30);
        v28 = v31;
        if (v31)
          (*(void (**)(HContrastBezierRGB *))(*(_QWORD *)v31 + 16))(v31);
        objc_msgSend(a3, "setHeliumRef:", &v28);
        if (v28)
          (*(void (**)(HContrastBezierRGB *))(*(_QWORD *)v28 + 24))(v28);
        if (v31)
          (*(void (**)(HContrastBezierRGB *))(*(_QWORD *)v31 + 24))(v31);
      }
      else
      {
        v27 = v32;
        if (v32)
          (*(void (**)(uint64_t))(*(_QWORD *)v32 + 16))(v32);
        v26 = v22;
        if (v22)
          (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v22 + 16))(v22);
        createContrastBezierRGBNode(&v27, &v26, v15 == 2, v14 == 1, &v31, v21);
        if (v26)
          (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v26 + 24))(v26);
        if (v27)
          (*(void (**)(uint64_t))(*(_QWORD *)v27 + 24))(v27);
        v28 = v31;
        if (v31)
          (*(void (**)(HContrastBezierRGB *))(*(_QWORD *)v31 + 16))(v31);
        objc_msgSend(a3, "setHeliumRef:", &v28);
        if (v28)
          (*(void (**)(HContrastBezierRGB *))(*(_QWORD *)v28 + 24))(v28);
        if (v31)
          (*(void (**)(HContrastBezierRGB *))(*(_QWORD *)v31 + 24))(v31);
      }
      if (v22)
        (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v22 + 24))(v22);
      (*(void (**)(HGBitmap *))(*(_QWORD *)v19 + 24))(v19);
    }
    else if ((_BYTE)v34)
    {
      v25 = v32;
      if (v32)
        (*(void (**)(uint64_t))(*(_QWORD *)v32 + 16))(v32);
      createContrastLumaNode(&v25, v15 == 2, v14 == 1, &v31, v36, v35, v13);
      if (v25)
        (*(void (**)(uint64_t))(*(_QWORD *)v25 + 24))(v25);
      v28 = v31;
      if (v31)
        (*(void (**)(HContrastBezierRGB *))(*(_QWORD *)v31 + 16))(v31);
      objc_msgSend(a3, "setHeliumRef:", &v28);
      if (v28)
        (*(void (**)(HContrastBezierRGB *))(*(_QWORD *)v28 + 24))(v28);
      if (v31)
        (*(void (**)(HContrastBezierRGB *))(*(_QWORD *)v31 + 24))(v31);
    }
    else
    {
      v24 = v32;
      if (v32)
        (*(void (**)(uint64_t))(*(_QWORD *)v32 + 16))(v32);
      createContrastRGBNode(&v24, v15 == 2, v14 == 1, &v31, v36, v35, v13);
      if (v24)
        (*(void (**)(uint64_t))(*(_QWORD *)v24 + 24))(v24);
      v28 = v31;
      if (v31)
        (*(void (**)(HContrastBezierRGB *))(*(_QWORD *)v31 + 16))(v31);
      objc_msgSend(a3, "setHeliumRef:", &v28, v24);
      if (v28)
        (*(void (**)(HContrastBezierRGB *))(*(_QWORD *)v28 + 24))(v28);
      if (v31)
        (*(void (**)(HContrastBezierRGB *))(*(_QWORD *)v31 + 24))(v31);
    }
    if (v32)
      (*(void (**)(uint64_t))(*(_QWORD *)v32 + 24))(v32);
  }
  return v10 != 0;
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
