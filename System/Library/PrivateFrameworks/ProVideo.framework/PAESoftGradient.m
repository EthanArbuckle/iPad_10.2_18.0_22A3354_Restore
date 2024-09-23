@implementation PAESoftGradient

- (PAESoftGradient)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAESoftGradient;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (BOOL)variesOverTime
{
  return 0;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PAESoftGradient;
  -[PAESharedDefaultBase addParameters](&v8, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SoftGradient::Center"), 0, 0), 310, 0, 0.5, 0.5);
    v5 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190), "versionAtCreation");
    v6 = objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SoftGradient::Color"), 0, 0);
    if (v5 < 2)
      objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", v6, 311, 0, 1.0, 1.0, 1.0, 1.0);
    else
      objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", v6, 311, 0, 1.0, 1.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SoftGradient::Radius"), 0, 0), 312, 0, 240.0, 0.0, dbl_1B304FBB0[v5 < 3], 0.0, 1000.0, 10.0);
  }
  return v3 != 0;
}

- (id)properties
{
  if (-[PAESoftGradient properties]::once != -1)
    dispatch_once(&-[PAESoftGradient properties]::once, &__block_literal_global_20);
  return (id)-[PAESoftGradient properties]::sPropertiesDict;
}

uint64_t __29__PAESoftGradient_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 6);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, CFSTR("MayRemapTime"), v2, CFSTR("PreservesAlpha"), v3, CFSTR("PixelTransformSupport"), v4, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
  -[PAESoftGradient properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  void *v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unsigned int v16;
  double v17;
  HgcSoftGradient *v18;
  double v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  double v44;
  __int128 v45;
  __int128 v46;
  double v47;
  __int128 v48;
  __int128 v49;
  double v50;
  __int128 v51;
  __int128 v52;
  double v53;
  HgcSoftGradient *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;

  v7 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v8 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (!v9)
  {
    v11 = (void *)v8;
    v60 = 0.5;
    v61 = 0.5;
    v58 = 1.0;
    v59 = 1.0;
    v56 = 1.0;
    v57 = 1.0;
    v55 = 300.0;
    objc_msgSend(a3, "bounds");
    v13 = v12;
    v15 = v14;
    objc_msgSend(v7, "getXValue:YValue:fromParm:atFxTime:", &v61, &v60, 310, a4->var0.var1);
    v60 = v15 * (v60 + -0.5);
    v61 = v13 * (v61 + -0.5);
    v16 = objc_msgSend(v11, "versionAtCreation");
    if (v16 < 2)
    {
      objc_msgSend(v7, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v59, &v58, &v57, &v56, 311, a4->var0.var1);
      v17 = v56;
    }
    else
    {
      objc_msgSend(v7, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v59, &v58, &v57, 311, a4->var0.var1);
      v17 = 1.0;
    }
    v58 = v17 * v58;
    v59 = v17 * v59;
    v57 = v17 * v57;
    objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v55, 312, a4->var0.var1);
    v55 = 1.0 / v55;
    v18 = (HgcSoftGradient *)HGObject::operator new(0x1A0uLL);
    HgcSoftGradient::HgcSoftGradient(v18);
    *(_QWORD *)v18 = &unk_1E64DC170;
    v54 = v18;
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
    if (!v16)
    {
      objc_msgSend(a3, "pixelAspect");
      v44 = v44 / v19;
      v45 = 0u;
      v46 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 1.0;
      v51 = 0u;
      v52 = 0u;
      v53 = 1.0;
    }
    v20 = v61;
    v21 = v60;
    (*(void (**)(HgcSoftGradient *, _QWORD, float, float, float, float))(*(_QWORD *)v18 + 96))(v18, 0, v20, v21, 0.0, 0.0);
    v22 = v59;
    v23 = v58;
    v24 = v57;
    v25 = v56;
    (*(void (**)(HgcSoftGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v18 + 96))(v18, 1, v22, v23, v24, v25);
    v26 = v55;
    (*(void (**)(HgcSoftGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v18 + 96))(v18, 2, v26, 0.0, 0.0, 1.0);
    v27 = v44;
    v28 = *(double *)&v45;
    v29 = *((double *)&v45 + 1);
    v30 = *(double *)&v46;
    (*(void (**)(HgcSoftGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v18 + 96))(v18, 3, v27, v28, v29, v30);
    v31 = *((double *)&v46 + 1);
    v32 = v47;
    v33 = *(double *)&v48;
    v34 = *((double *)&v48 + 1);
    (*(void (**)(HgcSoftGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v18 + 96))(v18, 4, v31, v32, v33, v34);
    v35 = *(double *)&v49;
    v36 = *((double *)&v49 + 1);
    v37 = v50;
    v38 = *(double *)&v51;
    (*(void (**)(HgcSoftGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v18 + 96))(v18, 5, v35, v36, v37, v38);
    v39 = *((double *)&v51 + 1);
    v40 = *(double *)&v52;
    v41 = *((double *)&v52 + 1);
    v42 = v53;
    (*(void (**)(HgcSoftGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v18 + 96))(v18, 6, v39, v40, v41, v42);
    objc_msgSend(a3, "setHeliumRef:", &v54);
    if (v54)
      (*(void (**)(HgcSoftGradient *))(*(_QWORD *)v54 + 24))(v54);
  }
  return v10;
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  __int128 v5;
  _OWORD v7[3];

  *a5 = 0;
  *a4 = 1;
  v5 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v7);
  return 1;
}

@end
