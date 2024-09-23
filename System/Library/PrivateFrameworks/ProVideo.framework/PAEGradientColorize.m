@implementation PAEGradientColorize

- (PAEGradientColorize)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEGradientColorize;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 65792);
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 590080);
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", &unk_1E6649090, CFSTR("PixelTransformSupport"), v3, CFSTR("PixelIndependent"), v4, CFSTR("PositionIndependent"), v5, CFSTR("MayRemapTime"), v6, CFSTR("SupportsLargeRenderScale"), v7, CFSTR("SupportsHeliumRendering"), v8, CFSTR("SDRWorkingSpace"), v9, CFSTR("HDRWorkingSpace"), v10,
               CFSTR("SupportsInternalMixing"),
               objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1),
               CFSTR("AutoColorProcessingSupport"),
               0);
}

- (BOOL)addParameters
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PAEGradientColorize;
  -[PAESharedDefaultBase addParameters](&v10, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v4 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4A30);
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
  {
    v7 = (void *)v4;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v7, "addGradientWithName:parmId:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GradientColorize::Gradient"), 0, 0), 2989, 0);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GradientColorize::Offset"), 0, 0), 2, 0, 0.0, 0.0, 3141.59265);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GradientColorize::Repeats"), 0, 0), 3, 0, 1.0, 0.001, 512.0, 1.0, 32.0, 1.0);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GradientColorize::Repeat Method"), 0, 0), 4, 1, objc_msgSend((id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GradientColorize::Repeat Method Entries"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 1);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GradientColorize::Which Channel"), 0, 0), 5, 0, objc_msgSend((id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GradientColorize::Which Channel Entries"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GradientColorize::Saturation"), 0, 0), 6, 0, 1.0, 0.0, 32.0, 0.0, 2.0, 0.1);
  }
  return v6;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  HGBitmap *v20;
  double v21;
  double v22;
  double *v23;
  double *v24;
  float v25;
  float v26;
  float v27;
  float v28;
  double v29;
  double v30;
  HGradientColorize *v31;
  float v32;
  float v33;
  float v34;
  __n128 v35;
  float v36;
  float v37;
  float v38;
  float v39;
  __n128 v40;
  HGBitmapLoader *v41;
  int v43;
  HGradientColorize *v44;
  uint64_t v45;
  double v46;
  int v47;
  int v48;
  double v49;
  double v50;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7358);
  v11 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A2958);
  v12 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    v13 = v10 == 0;
  else
    v13 = 1;
  if (v13 || v11 == 0 || v12 == 0)
    return 0;
  v43 = objc_msgSend(v12, "versionAtCreation");
  v17 = HGRectMake4i(0, 0, 0x100u, 1u);
  v19 = v18;
  v20 = (HGBitmap *)HGObject::operator new(0x80uLL);
  HGBitmap::HGBitmap(v20, v17, v19, 28);
  objc_msgSend(v10, "getGradientSamples:numSamples:depth:fromParm:atFxTime:", *((_QWORD *)v20 + 10), 256, 4, 2989, a5->var0.var1);
  v50 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v50, 2, a5->var0.var1);
  v50 = v50 / 6.28318531;
  v49 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v49, 3, a5->var0.var1);
  v48 = 0;
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v48, 4, a5->var0.var1);
  v47 = 0;
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v47, 5, a5->var0.var1);
  v46 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v46, 6, a5->var0.var1);
  objc_msgSend(v9, "mixAmountAtTime:", a5->var0.var1);
  v22 = v21;
  v23 = (double *)objc_msgSend((id)objc_msgSend(v11, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
  v24 = v23;
  v25 = 0.0;
  v26 = 1.0;
  v27 = 0.0;
  v28 = 0.0;
  switch(v47)
  {
    case 0:
      v26 = *v23;
      v27 = v23[1];
      v28 = v23[2];
      break;
    case 1:
      break;
    case 2:
      v27 = 1.0;
      goto LABEL_19;
    case 3:
      v28 = 1.0;
      goto LABEL_19;
    case 4:
      v25 = 1.0;
LABEL_19:
      v26 = 0.0;
      break;
    default:
      v25 = 1.0;
      v26 = 0.0;
      v27 = 0.0;
      v28 = 0.0;
      break;
  }
  v30 = v49;
  v29 = v50;
  if (-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1)
    && objc_msgSend(a4, "imageType") == 3)
  {
    if (a4)
      objc_msgSend(a4, "heliumRef");
    else
      v45 = 0;
    v31 = (HGradientColorize *)HGObject::operator new(0x1A0uLL);
    HGradientColorize::HGradientColorize(v31);
    (*(void (**)(HGradientColorize *, _QWORD, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 0, v26, v27, v28, v25);
    v32 = v30;
    v33 = v29 * v32;
    (*(void (**)(HGradientColorize *, uint64_t, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 1, v32, v33, 0.0, 0.0);
    v34 = v22;
    (*(void (**)(HGradientColorize *, uint64_t, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 7, v34, 0.0, 0.0, 0.0);
    v35.n128_u32[0] = 1.0;
    if (!v48)
      v35.n128_f32[0] = -1.0;
    (*(void (**)(HGradientColorize *, uint64_t, __n128, float, float, float))(*(_QWORD *)v31 + 96))(v31, 2, v35, v35.n128_f32[0], v35.n128_f32[0], v35.n128_f32[0]);
    (*(void (**)(HGradientColorize *, uint64_t, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 3, 256.0, 255.0, 0.0, 0.0);
    v36 = v46;
    (*(void (**)(HGradientColorize *, uint64_t, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 4, v36, v36, v36, v36);
    v37 = *v24;
    v38 = v24[1];
    v39 = v24[2];
    (*(void (**)(HGradientColorize *, uint64_t, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 5, 0.0, v37, v38, v39);
    v40.n128_u32[0] = 1.0;
    if (v43 >= 2)
      v40.n128_f32[0] = 0.0;
    (*(void (**)(HGradientColorize *, uint64_t, __n128, float, float, float))(*(_QWORD *)v31 + 96))(v31, 6, v40, 0.0, 0.0, 0.0);
    v41 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
    HGBitmapLoader::HGBitmapLoader(v41, v20);
    (*(void (**)(HGradientColorize *, _QWORD, uint64_t))(*(_QWORD *)v31 + 120))(v31, 0, v45);
    (*(void (**)(HGradientColorize *, uint64_t, HGBitmapLoader *))(*(_QWORD *)v31 + 120))(v31, 1, v41);
    v44 = v31;
    (*(void (**)(HGradientColorize *))(*(_QWORD *)v31 + 16))(v31);
    objc_msgSend(a3, "setHeliumRef:", &v44);
    if (v44)
      (*(void (**)(HGradientColorize *))(*(_QWORD *)v44 + 24))(v44);
    if (v41)
      (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v41 + 24))(v41);
    (*(void (**)(HGradientColorize *))(*(_QWORD *)v31 + 24))(v31);
    if (v45)
      (*(void (**)(uint64_t))(*(_QWORD *)v45 + 24))(v45);
    v16 = 1;
  }
  else
  {
    v16 = 0;
  }
  (*(void (**)(HGBitmap *))(*(_QWORD *)v20 + 24))(v20);
  return v16;
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
