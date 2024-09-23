@implementation PAEColorize

- (PAEColorize)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEColorize;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAEColorize;
  -[PAESharedDefaultBase dealloc](&v2, sel_dealloc);
}

- (id)properties
{
  if (-[PAEColorize properties]::once != -1)
    dispatch_once(&-[PAEColorize properties]::once, &__block_literal_global_41);
  return (id)-[PAEColorize properties]::sPropertiesDict;
}

uint64_t __25__PAEColorize_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 65792);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 590080);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", &unk_1E66491B0, CFSTR("PixelTransformSupport"), v1, CFSTR("PixelIndependent"), v2, CFSTR("PositionIndependent"), v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsLargeRenderScale"), v5, CFSTR("SupportsHeliumRendering"), v6, CFSTR("SDRWorkingSpace"), v7, CFSTR("HDRWorkingSpace"), v8,
             CFSTR("SupportsInternalMixing"),
             objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1),
             CFSTR("AutoColorProcessingSupport"),
             0);
  -[PAEColorize properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PAEColorize;
  -[PAESharedDefaultBase addParameters](&v7, sel_addParameters);
  v3 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v4, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Colorize::RemapBlackTo"), 0, 0), 1, 0, 0.0901960784, 0.0, 0.0);
    objc_msgSend(v4, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Colorize::RemapWhiteTo"), 0, 0), 2, 0, 1.0, 0.811764706, 0.639215686);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Colorize::Intensity"), 0, 0), 3, 0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.05);
    objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Colorize::HDR In Rec. 709"), 0, 0), 4, 0, 2);
  }
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double *v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  int v20;
  float v21;
  float v22;
  float v23;
  uint64_t v24;
  HgcColorize *v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  char v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;

  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4590);
  if (!v9)
    return v9;
  v10 = (void *)v9;
  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A2958);
  if (!v9)
    return v9;
  v11 = (void *)v9;
  v12 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  if (objc_msgSend(a4, "imageType") != 3 && v12)
  {
    LOBYTE(v9) = 0;
    return v9;
  }
  v47 = 0.0;
  objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v47, 3, a5->var0.var1);
  v45 = 0.0;
  v46 = 0.0;
  v44 = 0.0;
  objc_msgSend(v10, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v46, &v45, &v44, 1, a5->var0.var1);
  v42 = 0.0;
  v43 = 0.0;
  v41 = 0.0;
  objc_msgSend(v10, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v43, &v42, &v41, 2, a5->var0.var1);
  objc_msgSend(v10, "mixAmountAtTime:", a5->var0.var1);
  v14 = v13;
  v15 = (double *)objc_msgSend((id)objc_msgSend(v11, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
  v16 = *v15;
  v17 = v15[1];
  v18 = v15[2];
  v40 = 0;
  objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v40, 4, a5->var0.var1);
  v19 = objc_msgSend(v11, "colorPrimaries") != 1 || v40 == 0;
  v20 = !v19;
  if (v19)
  {
    v21 = v16;
    v22 = v17;
    v23 = v18;
    if (a4)
    {
LABEL_14:
      objc_msgSend(a4, "heliumRef");
      if (!v20)
        goto LABEL_24;
LABEL_18:
      FxApplyColorConform(&v38, (uint64_t)&kPCNCLC_Rec2020, 1, (uint64_t)&kPCNCLC_Rec709, (char *)1, &v37);
      v24 = v37;
      if (v38 == v37)
      {
        if (v38)
          (*(void (**)(void))(*(_QWORD *)v38 + 24))();
      }
      else
      {
        if (v38)
        {
          (*(void (**)(void))(*(_QWORD *)v38 + 24))();
          v24 = v37;
        }
        v38 = v24;
      }
      goto LABEL_24;
    }
  }
  else
  {
    PCGetRec709LuminanceCoefficients((uint64_t)&v38);
    v22 = *((float *)&v38 + 1);
    v21 = *(float *)&v38;
    v23 = v39;
    convertRGBColor(&v46, &v45, &v44);
    convertRGBColor(&v43, &v42, &v41);
    if (a4)
      goto LABEL_14;
  }
  v38 = 0;
  if (v20)
    goto LABEL_18;
LABEL_24:
  v25 = (HgcColorize *)HGObject::operator new(0x1A0uLL);
  HgcColorize::HgcColorize(v25);
  (*(void (**)(HgcColorize *, _QWORD, uint64_t))(*(_QWORD *)v25 + 120))(v25, 0, v38);
  v26 = v46;
  v27 = v45;
  v28 = v44;
  (*(void (**)(HgcColorize *, _QWORD, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 0, v26, v27, v28, 0.0);
  v29 = v43;
  v30 = v42;
  v31 = v41;
  (*(void (**)(HgcColorize *, uint64_t, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 1, v29, v30, v31, 0.0);
  v32 = v47;
  (*(void (**)(HgcColorize *, uint64_t, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 2, v32, 0.0, 0.0, 0.0);
  v33 = v14;
  (*(void (**)(HgcColorize *, uint64_t, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 3, v33, 0.0, 0.0, 0.0);
  (*(void (**)(HgcColorize *, uint64_t, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 4, v21, v22, v23, 0.0);
  v37 = (uint64_t)v25;
  (*(void (**)(HgcColorize *))(*(_QWORD *)v25 + 16))(v25);
  if (v20)
  {
    FxApplyColorConform(&v37, (uint64_t)&kPCNCLC_Rec709, 1, (uint64_t)&kPCNCLC_Rec2020, (char *)1, &v36);
    v34 = v36;
    if (v37 == v36)
    {
      if (v37)
        (*(void (**)(void))(*(_QWORD *)v37 + 24))();
    }
    else
    {
      if (v37)
      {
        (*(void (**)(void))(*(_QWORD *)v37 + 24))();
        v34 = v36;
      }
      v37 = v34;
    }
  }
  objc_msgSend(a3, "setHeliumRef:", &v37);
  if (v37)
    (*(void (**)(uint64_t))(*(_QWORD *)v37 + 24))(v37);
  (*(void (**)(HgcColorize *))(*(_QWORD *)v25 + 24))(v25);
  if (v38)
    (*(void (**)(uint64_t))(*(_QWORD *)v38 + 24))(v38);
  LOBYTE(v9) = 1;
  return v9;
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
