@implementation PAELumaKey

- (PAELumaKey)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAELumaKey;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", &unk_1E6649138, CFSTR("PixelTransformSupport"), v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAELumaKey;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LumaKey::Key Mode"), 0, 0), 1, 0, objc_msgSend((id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LumaKey::ModeEntries"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 1);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LumaKey::Luminance Type"), 0, 0), 2, 0, objc_msgSend((id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LumaKey::TypeEntries"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LumaKey::Threshold"), 0, 0), 3, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LumaKey::Tolerance"), 0, 0), 4, 0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.01);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  float v20;
  int v21;
  HgcLumaKey *v22;
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
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  float v37;
  float v38;
  uint64_t v39;
  uint64_t v41;
  HgcLumaKey *v42;
  double v43;
  double v44;
  uint64_t v45;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = v9;
  if (v9)
  {
    v44 = 0.0;
    v45 = 0;
    v43 = 0.0;
    objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v45, 1, a5->var0.var1);
    objc_msgSend(v10, "getIntValue:fromParm:atFxTime:", (char *)&v45 + 4, 2, a5->var0.var1);
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v43, 3, a5->var0.var1);
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v44, 4, a5->var0.var1);
    if (HIDWORD(v45) >= 6)
    {
      PCPrint("File %s, line %d should not have been reached:\n\t", v11, v12, v13, v14, v15, v16, v17, (char)"/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAELumaKey.mm");
      pcAbortImpl();
    }
    v18 = flt_1B3050900[SHIDWORD(v45)];
    v19 = flt_1B3050918[SHIDWORD(v45)];
    v20 = flt_1B3050930[SHIDWORD(v45)];
    v21 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    if (v21 && objc_msgSend(a4, "imageType") == 3)
    {
      v22 = (HgcLumaKey *)HGObject::operator new(0x1A0uLL);
      HgcLumaKey::HgcLumaKey(v22);
      v42 = v22;
      v23 = v43 * 0.25 + 0.25;
      v24 = v44 * (0.25 - vabdd_f64(0.25, v23));
      v25 = v23 - v24;
      v26 = v23 + v24;
      v27 = v43 * 0.5 + 0.5;
      v28 = v44 * (0.5 - vabdd_f64(0.5, v27));
      v29 = v27 - v28;
      v30 = v27 + v28;
      if ((int)v45 <= 1)
        v31 = v29;
      else
        v31 = v25;
      if ((int)v45 <= 1)
        v32 = v30;
      else
        v32 = v26;
      (*(void (**)(HgcLumaKey *, _QWORD, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 0, v18, v19, v20, 0.0);
      v36.n128_u32[0] = 1.0;
      if ((_DWORD)v45 == 1)
        v33.n128_f32[0] = 1.0;
      else
        v33.n128_f32[0] = 0.0;
      if ((_DWORD)v45)
        v34.n128_f32[0] = 0.0;
      else
        v34.n128_f32[0] = 1.0;
      if ((_DWORD)v45 == 2)
        v35.n128_f32[0] = 1.0;
      else
        v35.n128_f32[0] = 0.0;
      if ((_DWORD)v45 != 3)
        v36.n128_f32[0] = 0.0;
      (*(void (**)(HgcLumaKey *, uint64_t, __n128, __n128, __n128, __n128))(*(_QWORD *)v22 + 96))(v22, 1, v33, v34, v35, v36);
      v37 = v31;
      v38 = v32;
      (*(void (**)(HgcLumaKey *, uint64_t, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 2, v37, v38, 0.0, 0.0);
      if (a4)
      {
        objc_msgSend(a4, "heliumRef");
        v39 = v41;
      }
      else
      {
        v39 = 0;
        v41 = 0;
      }
      (*(void (**)(HgcLumaKey *, _QWORD, uint64_t))(*(_QWORD *)v22 + 120))(v22, 0, v39);
      if (v41)
        (*(void (**)(uint64_t))(*(_QWORD *)v41 + 24))(v41);
      objc_msgSend(a3, "setHeliumRef:", &v42);
      if (v42)
        (*(void (**)(HgcLumaKey *))(*(_QWORD *)v42 + 24))(v42);
    }
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
