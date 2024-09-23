@implementation PAEDesaturate

- (PAEDesaturate)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEDesaturate;
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

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", &unk_1E66491E0, CFSTR("PixelTransformSupport"), v3, CFSTR("PixelIndependent"), v4, CFSTR("PositionIndependent"), v5, CFSTR("MayRemapTime"), v6, CFSTR("SupportsLargeRenderScale"), v7, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEDesaturate;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Desaturate::Desaturation"), 0, 0), 1, 0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Desaturate::Luminance Type"), 0, 0), 2, 0, objc_msgSend((id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Desaturate::TypeEntries"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  HgcDesaturate *v14;
  float v15;
  HgcDesaturate *v17;
  uint64_t v18;
  signed int v19;
  double v20;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = v9;
    v20 = 0.0;
    v19 = 0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v20, 1, a5->var0.var1);
    objc_msgSend(v10, "getIntValue:fromParm:atFxTime:", &v19, 2, a5->var0.var1);
    if (v19 > 5)
    {
      v13 = 1.0;
      v11 = 0.0;
      v12 = 0.0;
    }
    else
    {
      v11 = flt_1B3050CC8[v19];
      v12 = flt_1B3050CE0[v19];
      v13 = flt_1B3050CF8[v19];
    }
    LODWORD(v9) = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    if ((_DWORD)v9)
    {
      if (objc_msgSend(a4, "imageType") == 3)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v18 = 0;
        v14 = (HgcDesaturate *)HGObject::operator new(0x1A0uLL);
        HgcDesaturate::HgcDesaturate(v14);
        v17 = v14;
        (*(void (**)(HgcDesaturate *, _QWORD, uint64_t))(*(_QWORD *)v14 + 120))(v14, 0, v18);
        v15 = v20;
        (*(void (**)(HgcDesaturate *, _QWORD, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 0, v15, 0.0, 0.0, 0.0);
        (*(void (**)(HgcDesaturate *, uint64_t, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 1, v11, v12, v13, 1.0);
        objc_msgSend(a3, "setHeliumRef:", &v17);
        if (v17)
          (*(void (**)(HgcDesaturate *))(*(_QWORD *)v17 + 24))(v17);
        if (v18)
          (*(void (**)(uint64_t))(*(_QWORD *)v18 + 24))(v18);
        LOBYTE(v9) = 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
  }
  return (char)v9;
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
