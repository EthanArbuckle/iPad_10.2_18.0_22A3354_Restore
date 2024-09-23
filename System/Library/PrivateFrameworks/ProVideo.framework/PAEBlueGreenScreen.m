@implementation PAEBlueGreenScreen

- (PAEBlueGreenScreen)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEBlueGreenScreen;
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
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", &unk_1E6649168, CFSTR("PixelTransformSupport"), v3, CFSTR("PositionIndependent"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("MayRemapTime"), v6, CFSTR("SupportsLargeRenderScale"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEBlueGreenScreen;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BlueGreenScreen::Key Mode"), 0, 0), 1, 0, objc_msgSend((id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BlueGreenScreen::Mode Entries"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BlueGreenScreen::Color Level"), 0, 0), 2, 0, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BlueGreenScreen::Color Tolerance"), 0, 0), 3, 0, 10.0, 1.0, 100.0, 1.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BlueGreenScreen::Edge Thin"), 0, 0), 4, 0, 0.0, -100.0, 100.0, -100.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BlueGreenScreen::Invert Alpha"), 0, 0), 6, 0, 1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  int v14;
  HgcDiffScreen *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  __n128 v20;
  HgcDiffScreen *v22;
  uint64_t v23;
  char v24;
  double v25;
  double v26;
  double v27;
  int v28;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (!v9)
  {
LABEL_22:
    LOBYTE(v14) = 1;
    return v14;
  }
  v10 = v9;
  v28 = 0;
  v26 = 0.0;
  v27 = 0.0;
  v25 = 0.0;
  v24 = 0;
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v28, 1, a5->var0.var1);
  objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v27, 2, a5->var0.var1);
  objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v26, 3, a5->var0.var1);
  objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v25, 4, a5->var0.var1);
  objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v24, 6, a5->var0.var1);
  v12 = v26;
  v11 = v27;
  v13 = v25;
  v14 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  if (v14)
  {
    if (objc_msgSend(a4, "imageType") == 3)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        v23 = 0;
      v22 = 0;
      if (v28 == 2)
      {
        v15 = (HgcDiffScreen *)HGObject::operator new(0x1A0uLL);
        HgcDiffScreen::HgcDiffScreen(v15);
      }
      else if (v28 == 1)
      {
        v15 = (HgcDiffScreen *)HGObject::operator new(0x1A0uLL);
        HgcGreenScreen::HgcGreenScreen(v15);
      }
      else
      {
        v15 = 0;
        if (v28)
        {
LABEL_16:
          (*(void (**)(HgcDiffScreen *, _QWORD, uint64_t))(*(_QWORD *)v15 + 120))(v15, 0, v23);
          v16 = (v11 - v12) / 100.0;
          (*(void (**)(HgcDiffScreen *, _QWORD, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 0, v16, v16, v16, v16);
          v17 = (v11 + v12) / 100.0;
          (*(void (**)(HgcDiffScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 1, v17, v17, v17, v17);
          v18 = v13 * 0.5 / 100.0 + 0.5;
          v19 = 0.5 - vabdd_f64(0.5, v18);
          (*(void (**)(HgcDiffScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 2, v18 - v19, v18 - v19, v18 - v19, v18 - v19);
          (*(void (**)(HgcDiffScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 3, v18 + v19, v18 + v19, v18 + v19, v18 + v19);
          v20.n128_u32[0] = 0;
          if (v24)
            v20.n128_f32[0] = 1.0;
          (*(void (**)(HgcDiffScreen *, uint64_t, __n128, float, float, float))(*(_QWORD *)v15 + 96))(v15, 4, v20, v20.n128_f32[0], v20.n128_f32[0], v20.n128_f32[0]);
          objc_msgSend(a3, "setHeliumRef:", &v22);
          if (v22)
            (*(void (**)(HgcDiffScreen *))(*(_QWORD *)v22 + 24))(v22);
          if (v23)
            (*(void (**)(uint64_t))(*(_QWORD *)v23 + 24))(v23);
          goto LABEL_22;
        }
        v15 = (HgcDiffScreen *)HGObject::operator new(0x1A0uLL);
        HgcBlueScreen::HgcBlueScreen(v15);
      }
      if (v15)
        v22 = v15;
      goto LABEL_16;
    }
    LOBYTE(v14) = 0;
  }
  return v14;
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
