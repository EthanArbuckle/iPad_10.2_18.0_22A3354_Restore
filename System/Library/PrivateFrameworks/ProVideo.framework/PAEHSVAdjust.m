@implementation PAEHSVAdjust

- (PAEHSVAdjust)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEHSVAdjust;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  if (-[PAEHSVAdjust properties]::once != -1)
    dispatch_once(&-[PAEHSVAdjust properties]::once, &__block_literal_global_43);
  return (id)-[PAEHSVAdjust properties]::sPropertiesDict;
}

uint64_t __26__PAEHSVAdjust_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 65792);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 590080);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", &unk_1E66491C8, CFSTR("PixelTransformSupport"), v1, CFSTR("PixelIndependent"), v2, CFSTR("PositionIndependent"), v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsLargeRenderScale"), v5, CFSTR("SupportsHeliumRendering"), v6, CFSTR("SDRWorkingSpace"), v7, CFSTR("HDRWorkingSpace"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1),
             CFSTR("AutoColorProcessingSupport"),
             0);
  -[PAEHSVAdjust properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEHSVAdjust;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HSVAdjust::Hue"), 0, 0), 1, 0, 0.0, 0.0, 6.28318531);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HSVAdjust::Saturation"), 0, 0), 2, 0, 0.0, -1.0, 3.0, -1.0, 3.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HSVAdjust::Value"), 0, 0), 3, 0, 1.0, 0.0, 2.0, 0.0, 2.0, 0.1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  BOOL v13;
  char v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  int v18;
  double v19;
  HgcHSVAdjust *v20;
  float v21;
  float v22;
  float v23;
  HGColorMatrix *v24;
  __double2 v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double *v29;
  uint64_t i;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t j;
  uint64_t v35;
  double *v36;
  __int128 v37;
  double v38;
  unsigned int v39;
  _QWORD v41[9];
  _BYTE v42[16];
  uint64_t v43;
  _QWORD v44[9];
  double v45[9];
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55[7];
  __double2 v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  _OWORD v61[4];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  v11 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A2958);
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  v13 = v12 || v11 == 0;
  v14 = v13;
  if (!v13)
  {
    v15 = (void *)v11;
    v16 = objc_msgSend(a4, "dynamicRangeType");
    if (objc_msgSend(v10, "versionAtCreation"))
      v17 = 0;
    else
      v17 = v16 == 0;
    v18 = v17;
    v59 = 0.0;
    v60 = 0.0;
    v58 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v60, 1, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v59, 2, a5->var0.var1);
    v59 = v59 + 1.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v58, 3, a5->var0.var1);
    if (v18)
      v60 = v60 * 180.0 / 3.14159265;
    if (a4)
      objc_msgSend(a4, "heliumRef");
    else
      v57 = 0;
    v19 = v60;
    if (v18)
    {
      if (v60 < 0.0)
      {
        do
          v19 = v19 + 360.0;
        while (v19 < 0.0);
        v60 = v19;
      }
      if (v19 > 360.0)
      {
        do
          v19 = v19 + -360.0;
        while (v19 > 360.0);
        v60 = v19;
      }
      v20 = (HgcHSVAdjust *)HGObject::operator new(0x1A0uLL);
      HgcHSVAdjust::HgcHSVAdjust(v20);
      *(_QWORD *)&v55[0] = v20;
      (*(void (**)(HgcHSVAdjust *, _QWORD, uint64_t))(*(_QWORD *)v20 + 120))(v20, 0, v57);
      v21 = v60 / 360.0 + 1.0;
      v22 = v59;
      v23 = v58;
      (*(void (**)(HgcHSVAdjust *, _QWORD, float, float, float, float))(*(_QWORD *)v20 + 96))(v20, 0, v21, v22, v23, 0.0);
      objc_msgSend(a3, "setHeliumRef:", v55);
      if (*(_QWORD *)&v55[0])
        (*(void (**)(_QWORD))(**(_QWORD **)&v55[0] + 24))(*(_QWORD *)&v55[0]);
    }
    else
    {
      if (v60 < 0.0)
      {
        do
          v19 = v19 + 6.28318531;
        while (v19 < 0.0);
        v60 = v19;
      }
      if (v19 > 6.28318531)
      {
        do
          v19 = v19 + -6.28318531;
        while (v19 > 6.28318531);
        v60 = v19;
      }
      v24 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
      HGColorMatrix::HGColorMatrix(v24);
      (*(void (**)(HGColorMatrix *, _QWORD, uint64_t))(*(_QWORD *)v24 + 120))(v24, 0, v57);
      v55[0] = 1.0;
      memset(&v55[1], 0, 24);
      v25 = __sincos_stret(v60);
      v55[4] = v25.__cosval;
      v55[5] = -v25.__sinval;
      v55[6] = 0.0;
      v56 = v25;
      v46 = 0x3FF0000000000000;
      v47 = 0.0;
      v48 = 0.0;
      v49 = 0.0;
      v50 = 1.0;
      v51 = 0.0;
      v26 = v58 * v59;
      v52 = 0.0;
      v53 = 0.0;
      v54 = 1.0;
      if (v58 != 1.0)
      {
        v46 = *(_QWORD *)&v58;
        v47 = v58 * 0.0;
        v48 = v58 * 0.0;
      }
      if (v26 != 1.0)
      {
        v49 = v26 * 0.0;
        v50 = v58 * v59;
        v51 = v26 * 0.0;
        v52 = v26 * 0.0;
        v53 = v26 * 0.0;
        v54 = v58 * v59;
      }
      v45[0] = 1.0;
      memset(&v45[1], 0, 24);
      v45[4] = 1.0;
      memset(&v45[5], 0, 24);
      v45[8] = 1.0;
      v44[0] = 0x3FF0000000000000;
      memset(&v44[1], 0, 24);
      v44[4] = 0x3FF0000000000000;
      memset(&v44[5], 0, 24);
      v44[8] = 0x3FF0000000000000;
      v27 = objc_msgSend((id)objc_msgSend(v15, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
      v28 = 0;
      v29 = v45;
      do
      {
        for (i = 0; i != 3; ++i)
          v29[i] = *(double *)(v27 + i * 8);
        ++v28;
        v29 += 3;
        v27 += 32;
      }
      while (v28 != 3);
      v31 = objc_msgSend((id)objc_msgSend(v15, "colorMatrixFromYCbCrToDesiredRGBAtTime:", a5->var0.var1), "matrix");
      v32 = 0;
      v33 = v44;
      do
      {
        for (j = 0; j != 3; ++j)
          v33[j] = *(_QWORD *)(v31 + j * 8);
        ++v32;
        v33 += 3;
        v31 += 32;
      }
      while (v32 != 3);
      PCMatrix33Tmpl<double>::operator*((uint64_t)v44, (double *)&v46, (uint64_t)v41);
      PCMatrix33Tmpl<double>::operator*((uint64_t)v41, v55, (uint64_t)v61);
      PCMatrix33Tmpl<double>::operator*((uint64_t)v61, v45, (uint64_t)v42);
      v35 = 0;
      v36 = (double *)&v43;
      do
      {
        *(float32x2_t *)&v37 = vcvt_f32_f64(*(float64x2_t *)(v36 - 2));
        v38 = *v36;
        v36 += 3;
        *(float *)&v39 = v38;
        *((_QWORD *)&v37 + 1) = v39;
        v61[v35++] = v37;
      }
      while (v35 != 3);
      v61[3] = xmmword_1B304EFF0;
      HGColorMatrix::LoadMatrix(v24, v61, 1);
      v41[0] = v24;
      (*(void (**)(HGColorMatrix *))(*(_QWORD *)v24 + 16))(v24);
      objc_msgSend(a3, "setHeliumRef:", v41);
      if (v41[0])
        (*(void (**)(_QWORD))(*(_QWORD *)v41[0] + 24))(v41[0]);
      (*(void (**)(HGColorMatrix *))(*(_QWORD *)v24 + 24))(v24);
    }
    if (v57)
      (*(void (**)(uint64_t))(*(_QWORD *)v57 + 24))(v57);
  }
  return v14 ^ 1;
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
