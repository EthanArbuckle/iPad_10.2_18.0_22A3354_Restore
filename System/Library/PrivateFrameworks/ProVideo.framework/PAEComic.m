@implementation PAEComic

- (PAEComic)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEComic;
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

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 65792);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 590080);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("SDRWorkingSpace"), v8, CFSTR("HDRWorkingSpace"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PAEComic;
  -[PAESharedDefaultBase addParameters](&v15, sel_addParameters);
  v3 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (!v3)
    return 1;
  v4 = (void *)v3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = objc_msgSend(v4, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Comic::Style"), 0, 0), 1, 0, objc_msgSend((id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Comic::StyleEntries"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 1);
  v7 = v6 & objc_msgSend(v4, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Comic::Ink Color"), 0, 0), 2, 2, 0.0, 0.0, 0.0);
  v8 = objc_msgSend(v4, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Comic::Fill Color"), 0, 0), 3, 2, 1.0, 1.0, 1.0);
  v9 = v7 & v8 & objc_msgSend(v4, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Comic::Smoothness"), 0, 0), 4, 0, 0.25, 0.0, 1.0, 0.0, 1.0, 0.01);
  v10 = objc_msgSend(v4, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Comic::Ink Edges"), 0, 0), 5, 0, 0.25, 0.0, 1.0, 0.0, 1.0, 0.01);
  v11 = v10 & objc_msgSend(v4, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Comic::Ink Smoothness"), 0, 0), 6, 0, 0.3, 0.0, 1.0, 0.0, 1.0, 0.01);
  v12 = v9 & v11 & objc_msgSend(v4, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Comic::Ink Fill"), 0, 0), 7, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 0.01);
  LODWORD(v14) = 0;
  LOBYTE(v11) = objc_msgSend(v4, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Comic::Posterize Levels"), 0, 0), 8, 6, 2, 1000, 2, 0x100000032, v14);
  return v12 & v11 & objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Comic::Affect Alpha"), 0, 0), 9, 0, 3);
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a3 != 1)
    return 1;
  v18 = v3;
  v19 = v4;
  v6 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v7 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7268);
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
    return 0;
  v10 = (void *)v7;
  v16 = *MEMORY[0x1E0CA2E18];
  v17 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v15 = 0;
  objc_msgSend(v6, "getIntValue:fromParm:atFxTime:", &v15, 1, &v16);
  v14 = 0;
  v13 = 0;
  v12 = 0;
  objc_msgSend(v6, "getParameterFlags:fromParm:", &v14, 2);
  objc_msgSend(v6, "getParameterFlags:fromParm:", (char *)&v13 + 4, 3);
  objc_msgSend(v6, "getParameterFlags:fromParm:", &v13, 8);
  objc_msgSend(v6, "getParameterFlags:fromParm:", &v12, 9);
  if (v15 > 1)
  {
    objc_msgSend(v10, "setParameterFlags:toParm:", v14 & 0xFFFFFFFD, 2);
    objc_msgSend(v10, "setParameterFlags:toParm:", HIDWORD(v13) & 0xFFFFFFFD, 3);
    objc_msgSend(v10, "setParameterFlags:toParm:", v12 & 0xFFFFFFFD, 9);
    v11 = v13 | 2;
  }
  else
  {
    objc_msgSend(v10, "setParameterFlags:toParm:", v14 | 2u, 2);
    objc_msgSend(v10, "setParameterFlags:toParm:", HIDWORD(v13) | 2u, 3);
    objc_msgSend(v10, "setParameterFlags:toParm:", v12 | 2u, 9);
    v11 = v13 & 0xFFFFFFFD;
  }
  objc_msgSend(v10, "setParameterFlags:toParm:", v11, 8);
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  HGComicDesignerInterface *v12;
  HGTextureWrap *v13;
  char *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  int v24;
  float v25;
  float v26;
  __n128 v27;
  __n128 v28;
  HgcColorize *v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  double *v36;
  float v37;
  float v38;
  float v39;
  void (*v40)(_QWORD);
  void (*v41)(_QWORD);
  char v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51[3];
  uint64_t v52;
  HgcColorize *v53;
  int v54;
  double v55;
  double v56;
  double v57;
  double v58;
  int v59;
  _QWORD v60[3];

  v60[2] = *MEMORY[0x1E0C80C00];
  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A2958);
  if (!v9)
    return 1;
  v11 = (void *)v10;
  v59 = 0;
  v58 = 0.0;
  v56 = 0.0;
  v57 = 0.0;
  v55 = 0.0;
  v54 = 0;
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v59, 1, a5->var0.var1);
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v58, 4, a5->var0.var1);
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v57, 5, a5->var0.var1);
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v56, 6, a5->var0.var1);
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v54, 8, a5->var0.var1);
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v55, 7, a5->var0.var1);
  v12 = (HGComicDesignerInterface *)HGObject::operator new(0x1A0uLL);
  HGComicDesignerInterface::HGComicDesignerInterface(v12);
  v53 = 0;
  if (a4)
    objc_msgSend(a4, "heliumRef");
  else
    v52 = 0;
  v13 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
  HGTextureWrap::HGTextureWrap(v13);
  HGTextureWrap::SetTextureWrapMode((uint64_t)v13, 0, v14);
  v60[0] = 0;
  v60[1] = 0;
  HGTextureWrap::SetTextureBorderColor(v13, (float *)v60);
  (*(void (**)(HGTextureWrap *, _QWORD, uint64_t))(*(_QWORD *)v13 + 120))(v13, 0, v52);
  (*(void (**)(HGComicDesignerInterface *, _QWORD, HGTextureWrap *))(*(_QWORD *)v12 + 120))(v12, 0, v13);
  v15 = v58 * 100.0;
  (*(void (**)(HGComicDesignerInterface *, _QWORD, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 0, v15, 0.0, 0.0, 0.0);
  v16 = (1.0 - v57) * 100.0;
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 1, v16, 0.0, 0.0, 0.0);
  v17 = v56 * 100.0;
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 2, v17, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 4, (float)v54, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 5, 720.0, 0.0, 0.0, 0.0);
  v18 = v55 * 100.0;
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 7, v18, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 3, -1.0, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 11, 1.0, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 12, 1.0, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 10, 1.0, 0.0, 0.0, 0.0);
  v19 = objc_msgSend(a3, "dod");
  v22 = HGRectMake4i(v19, HIDWORD(v19), v20, v21);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 8, (float)(int)v22, (float)SHIDWORD(v22), (float)v23, (float)v24);
  -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
  v25 = v51[1];
  v26 = v51[2];
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 9, v25, v26, 0.0, 0.0);
  if (v59 == 1)
  {
    v27.n128_u32[0] = 10.0;
  }
  else
  {
    if (v59 == 2)
    {
      v50 = 0.0;
      v51[0] = 0.0;
      v48 = 0;
      v49 = 0.0;
      v46 = 0.0;
      v47 = 0.0;
      v44 = 0;
      v45 = 0.0;
      v43 = 0;
      objc_msgSend(v9, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", v51, &v50, &v49, &v48, 2, a5->var0.var1);
      objc_msgSend(v9, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v47, &v46, &v45, &v44, 3, a5->var0.var1);
      objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v43, 9, a5->var0.var1);
      (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 6, 24.0, 0.0, 0.0, 0.0);
      v28.n128_u32[0] = 1.0;
      if (v43)
        v28.n128_f32[0] = 0.0;
      (*(void (**)(HGComicDesignerInterface *, uint64_t, __n128, float, float, float))(*(_QWORD *)v12 + 96))(v12, 10, v28, 0.0, 0.0, 0.0);
      v29 = (HgcColorize *)HGObject::operator new(0x1A0uLL);
      HgcColorize::HgcColorize(v29);
      (*(void (**)(HgcColorize *, _QWORD, HGComicDesignerInterface *))(*(_QWORD *)v29 + 120))(v29, 0, v12);
      v30 = v51[0];
      v31 = v50;
      v32 = v49;
      (*(void (**)(HgcColorize *, _QWORD, float, float, float, float))(*(_QWORD *)v29 + 96))(v29, 0, v30, v31, v32, 0.0);
      v33 = v47;
      v34 = v46;
      v35 = v45;
      (*(void (**)(HgcColorize *, uint64_t, float, float, float, float))(*(_QWORD *)v29 + 96))(v29, 1, v33, v34, v35, 0.0);
      (*(void (**)(HgcColorize *, uint64_t, float, float, float, float))(*(_QWORD *)v29 + 96))(v29, 2, 1.0, 0.0, 0.0, 0.0);
      (*(void (**)(HgcColorize *, uint64_t, float, float, float, float))(*(_QWORD *)v29 + 96))(v29, 3, 1.0, 0.0, 0.0, 0.0);
      v36 = (double *)objc_msgSend((id)objc_msgSend(v11, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
      v37 = *v36;
      v38 = v36[1];
      v39 = v36[2];
      (*(void (**)(HgcColorize *, uint64_t, float, float, float, float))(*(_QWORD *)v29 + 96))(v29, 4, v37, v38, v39, 0.0);
      v40 = *(void (**)(_QWORD))(*(_QWORD *)v29 + 16);
      v53 = v29;
      v40(v29);
      (*(void (**)(HgcColorize *))(*(_QWORD *)v29 + 24))(v29);
      goto LABEL_13;
    }
    v27.n128_u32[0] = 7.0;
  }
  (*(void (**)(HGComicDesignerInterface *, uint64_t, __n128, float, float, float))(*(_QWORD *)v12 + 96))(v12, 6, v27, 0.0, 0.0, 0.0);
  v41 = *(void (**)(_QWORD))(*(_QWORD *)v12 + 16);
  v53 = v12;
  v41(v12);
LABEL_13:
  objc_msgSend(a3, "setHeliumRef:", &v53);
  (*(void (**)(HGTextureWrap *))(*(_QWORD *)v13 + 24))(v13);
  if (v52)
    (*(void (**)(uint64_t))(*(_QWORD *)v52 + 24))(v52);
  if (v53)
    (*(void (**)(HgcColorize *))(*(_QWORD *)v53 + 24))(v53);
  (*(void (**)(HGComicDesignerInterface *))(*(_QWORD *)v12 + 24))(v12);
  return 1;
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
