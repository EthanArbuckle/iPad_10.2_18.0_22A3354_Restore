@implementation PAETint

- (PAETint)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAETint;
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
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 65792);
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 590080);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PixelTransformSupport"), v4, CFSTR("PixelIndependent"), v5, CFSTR("PositionIndependent"), v6, CFSTR("MayRemapTime"), v7, CFSTR("SupportsLargeRenderScale"), v8, CFSTR("SupportsHeliumRendering"), v9, CFSTR("SDRWorkingSpace"), v10, CFSTR("HDRWorkingSpace"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1),
               CFSTR("AutoColorProcessingSupport"),
               0);
}

- (BOOL)addParameters
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PAETint;
  -[PAESharedDefaultBase addParameters](&v7, sel_addParameters);
  v3 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v4, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TintFx::Color"), 0, 0), 1, 0, 0.360784314, 0.203921569, 0.0901960784);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TintFx::Intensity"), 0, 0), 2, 0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.01);
  }
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v15;
  HgcTint *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  double *v21;
  float v22;
  float v23;
  float v24;
  HgcTint *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;

  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4590);
  if (!v9)
    return 0;
  v10 = (void *)v9;
  v11 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A2958);
  if (!v11)
    return 0;
  v12 = (void *)v11;
  if (objc_msgSend(a4, "imageType") - 4 < 0xFFFFFFFE)
    return 0;
  v29 = 0.0;
  v30 = 0.0;
  v28 = 0.0;
  v13 = 1;
  objc_msgSend(v10, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v30, &v29, &v28, 1, a5->var0.var1);
  v27 = 0.0;
  objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v27, 2, a5->var0.var1);
  if (-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1)
    && objc_msgSend(a4, "imageType") == 3)
  {
    v15 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
    if (!v15)
      return 0;
    if (!objc_msgSend(v15, "versionAtCreation"))
    {
      v29 = v29 * 0.78;
      v30 = v30 * 0.78;
      v28 = v28 * 0.78;
    }
    if (a4)
      objc_msgSend(a4, "heliumRef");
    else
      v26 = 0;
    v16 = (HgcTint *)HGObject::operator new(0x1A0uLL);
    HgcTint::HgcTint(v16);
    (*(void (**)(HgcTint *, _QWORD, uint64_t))(*(_QWORD *)v16 + 120))(v16, 0, v26);
    v17 = v30;
    v18 = v29;
    v19 = v28;
    (*(void (**)(HgcTint *, _QWORD, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 0, v17, v18, v19, 0.0);
    v20 = v27;
    (*(void (**)(HgcTint *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 1, v20, 0.0, 0.0, 0.0);
    v21 = (double *)objc_msgSend((id)objc_msgSend(v12, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
    v22 = *v21;
    v23 = v21[1];
    v24 = v21[2];
    (*(void (**)(HgcTint *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 2, v22, v23, v24, 0.0);
    v25 = v16;
    (*(void (**)(HgcTint *))(*(_QWORD *)v16 + 16))(v16);
    objc_msgSend(a3, "setHeliumRef:", &v25);
    if (v25)
      (*(void (**)(HgcTint *))(*(_QWORD *)v25 + 24))(v25);
    (*(void (**)(HgcTint *))(*(_QWORD *)v16 + 24))(v16);
    if (v26)
      (*(void (**)(uint64_t))(*(_QWORD *)v26 + 24))(v26);
  }
  return v13;
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
