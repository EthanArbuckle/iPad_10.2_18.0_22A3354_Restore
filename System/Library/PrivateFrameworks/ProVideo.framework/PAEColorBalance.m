@implementation PAEColorBalance

- (PAEColorBalance)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEColorBalance;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  if (-[PAEColorBalance properties]::once != -1)
    dispatch_once(&-[PAEColorBalance properties]::once, &__block_literal_global_34);
  return (id)-[PAEColorBalance properties]::sPropertiesDict;
}

uint64_t __29__PAEColorBalance_properties__block_invoke()
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
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", &unk_1E6649120, CFSTR("PixelTransformSupport"), v1, CFSTR("PixelIndependent"), v2, CFSTR("PositionIndependent"), v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsLargeRenderScale"), v5, CFSTR("SupportsHeliumRendering"), v6, CFSTR("SDRWorkingSpace"), v7, CFSTR("HDRWorkingSpace"), v8,
             CFSTR("SupportsInternalMixing"),
             objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1),
             CFSTR("AutoColorProcessingSupport"),
             0);
  -[PAEColorBalance properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  int v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PAEColorBalance;
  -[PAESharedDefaultBase addParameters](&v11, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v3)
    v5 = 1;
  else
    v5 = v4 == 0;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v4, "versionAtCreation");
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ColorBalance::ShadowWhitePoint"), 0, 0), 10, 1024, 0.5, 0.5, 0.5);
      objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ColorBalance::MidWhitePoint"), 0, 0), 11, 1024, 0.5, 0.5, 0.5);
      objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ColorBalance::HighlightsWhitePoint"), 0, 0), 12, 1024, 0.5, 0.5, 0.5);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ColorBalance::Boost"), 0, 0), 14, 0, 0.0, 0.0, 4.0, 0.0, 4.0, 0.1);
      objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Contrast::Clip"), 0, 0), 13, 0, objc_msgSend((id)objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Contrast::Clip Values"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 1);
      objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", CFSTR("IOS Compatability Behavior"), 15, 0, 2);
      objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", CFSTR("ColorBalance::HDR In Rec. 709"), 16, 0, 2);
    }
    else
    {
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ColorBalance::Shadow Red"), 0, 0), 1, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ColorBalance::Shadow Green"), 0, 0), 2, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ColorBalance::Shadow Blue"), 0, 0), 3, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ColorBalance::Midtone Red"), 0, 0), 4, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ColorBalance::Midtone Green"), 0, 0), 5, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ColorBalance::Midtone Blue"), 0, 0), 6, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ColorBalance::Highlight Red"), 0, 0), 7, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ColorBalance::Highlight Green"), 0, 0), 8, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ColorBalance::Highlight Blue"), 0, 0), 9, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
    }
  }
  return v6;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  float32x2_t v12;
  float v17;
  float v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  int v29;
  int v30;
  void *v31;
  _BOOL4 v32;
  HgcChannelBalance *v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  HgcColorBalance *v44;
  double v45;
  double v46;
  float v47;
  _BOOL4 v48;
  HgcColorBalance *v49;
  double v51;
  double v52;
  id v53;
  int v54;
  HgcColorBalance *v55;
  HgcColorBalance *v56;
  HgcColorBalance *v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  int v61;
  char v62;
  HgcColorBalance *v63;
  int v64;
  char v65;
  double v66;
  double v67;
  double v68;
  double v69;
  float64x2_t v70;
  double v71;
  double v72;
  double v73;
  _QWORD v74[3];

  v74[1] = *MEMORY[0x1E0C80C00];
  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    _ZF = v10 == 0;
  else
    _ZF = 1;
  if (_ZF)
    goto LABEL_16;
  v53 = a3;
  v66 = 1.0;
  v65 = 0;
  v64 = 0;
  v54 = objc_msgSend(v10, "versionAtCreation");
  if (v54)
  {
    objc_msgSend(v9, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v72, &v73, v74, 10, a5->var0.var1);
    objc_msgSend(v9, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v70, &v70.f64[1], &v71, 11, a5->var0.var1);
    v12 = vcvt_f32_f64(v70);
    __asm { FMOV            V2.2S, #1.0 }
    v70 = vcvtq_f64_f32((float32x2_t)vbic_s8(vbsl_s8((int8x8_t)vcgt_f32(v12, _D2), (int8x8_t)_D2, (int8x8_t)v12), (int8x8_t)vcltz_f32(v12)));
    v17 = v71;
    v18 = 1.0;
    if (v17 <= 1.0)
      v18 = v71;
    _NF = v17 < 0.0;
    v19 = 0.0;
    if (!_NF)
      v19 = v18;
    v71 = v19;
    objc_msgSend(v9, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v67, &v68, &v69, 12, a5->var0.var1);
    objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v64, 13, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v66, 14, a5->var0.var1);
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v65, 15, a5->var0.var1);
    v20 = 0.0;
    v21 = 0.5;
    v51 = 1.0;
    v22 = 1.0;
    v23 = 1.0;
    v24 = 0.5;
    v25 = 0.5;
    v26 = 0.0;
    v27 = 0.0;
  }
  else
  {
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v72, 1, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:");
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", v74, 3, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v70, 4, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v70.f64[1], 5, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v71, 6, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v67, 7, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v68, 8, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v69, 9, a5->var0.var1);
    v51 = v67 + 1.0;
    v22 = v68 + 1.0;
    v23 = v69 + 1.0;
    v21 = v70.f64[0] + 0.5;
    v24 = v70.f64[1] + 0.5;
    v25 = v71 + 0.5;
    v27 = v72;
    v26 = v73;
    v20 = *(double *)v74;
  }
  objc_msgSend(v9, "mixAmountAtTime:", a5->var0.var1);
  v52 = v28;
  v29 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  if (v29)
  {
    if (objc_msgSend(a4, "imageType") == 3)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        v63 = 0;
      if (v54)
      {
        v30 = v64;
        v66 = v66 + 1.0;
        v62 = 0;
        objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v62, 16, a5->var0.var1);
        v31 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A2958);
        if (v31)
          v32 = objc_msgSend(v31, "colorPrimaries") == 1;
        else
          v32 = 0;
        v60 = 0x100000001;
        v61 = 1;
        v58 = 0x100000009;
        v59 = 9;
        if (v32 && v62)
        {
          FxApplyColorConform((uint64_t *)&v63, (uint64_t)&v58, 1, (uint64_t)&v60, (char *)1, (uint64_t *)&v57);
          v44 = v57;
          if (v63 == v57)
          {
            if (v63)
              (*(void (**)(void))(*(_QWORD *)v63 + 24))();
          }
          else
          {
            if (v63)
            {
              (*(void (**)(void))(*(_QWORD *)v63 + 24))();
              v44 = v57;
            }
            v63 = v44;
          }
        }
        v56 = v63;
        if (v63)
          (*(void (**)(HgcColorBalance *))(*(_QWORD *)v63 + 16))(v63);
        v45 = -1.0;
        if ((v30 & 0xFFFFFFFD) == 1)
          v46 = -1.0;
        else
          v46 = 1.0;
        if ((v30 & 0xFFFFFFFE) != 2)
          v45 = 1.0;
        v47 = createColorBalance(&v56, &v72, &v67, v70.f64, v65, &v57, v52, v46, v45, v66);
        if (v56)
          (*(void (**)(HgcColorBalance *, float))(*(_QWORD *)v56 + 24))(v56, v47);
        if (v62)
          v48 = v32;
        else
          v48 = 0;
        if (v48)
        {
          FxApplyColorConform((uint64_t *)&v57, (uint64_t)&v60, 1, (uint64_t)&v58, (char *)1, (uint64_t *)&v55);
          v49 = v55;
          if (v57 == v55)
          {
            if (v57)
              (*(void (**)(void))(*(_QWORD *)v57 + 24))();
          }
          else
          {
            if (v57)
            {
              (*(void (**)(void))(*(_QWORD *)v57 + 24))();
              v49 = v55;
            }
            v57 = v49;
          }
        }
        objc_msgSend(v53, "setHeliumRef:", &v57);
        if (v57)
          (*(void (**)(HgcColorBalance *))(*(_QWORD *)v57 + 24))(v57);
      }
      else
      {
        v33 = (HgcChannelBalance *)HGObject::operator new(0x1A0uLL);
        HgcChannelBalance::HgcChannelBalance(v33);
        v60 = (uint64_t)v33;
        v34 = v27;
        v35 = v26;
        v36 = v20;
        (*(void (**)(HgcChannelBalance *, _QWORD, float, float, float, float))(*(_QWORD *)v33 + 96))(v33, 0, v34, v35, v36, 1.0);
        v37 = v21;
        v38 = v24;
        v39 = v25;
        (*(void (**)(HgcChannelBalance *, uint64_t, float, float, float, float))(*(_QWORD *)v33 + 96))(v33, 1, v37, v38, v39, 1.0);
        v40 = v51;
        v41 = v22;
        v42 = v23;
        (*(void (**)(HgcChannelBalance *, uint64_t, float, float, float, float))(*(_QWORD *)v33 + 96))(v33, 2, v40, v41, v42, 1.0);
        v43 = v52;
        (*(void (**)(HgcChannelBalance *, uint64_t, float, float, float, float))(*(_QWORD *)v33 + 96))(v33, 3, v43, v43, v43, v43);
        (*(void (**)(HgcChannelBalance *, _QWORD, HgcColorBalance *))(*(_QWORD *)v33 + 120))(v33, 0, v63);
        objc_msgSend(a3, "setHeliumRef:", &v60);
        if (v60)
          (*(void (**)(uint64_t))(*(_QWORD *)v60 + 24))(v60);
      }
      if (v63)
        (*(void (**)(HgcColorBalance *))(*(_QWORD *)v63 + 24))(v63);
      LOBYTE(v29) = 1;
      return v29;
    }
LABEL_16:
    LOBYTE(v29) = 0;
  }
  return v29;
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
