@implementation PAESunburst

- (PAESunburst)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAESunburst;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAESunburst;
  -[PAESharedDefaultBase dealloc](&v2, sel_dealloc);
}

- (BOOL)variesOverTime
{
  return 0;
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("MayRemapTime"), v4, CFSTR("PixelTransformSupport"), v5, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v2;
  void *v3;

  v2 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4358);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v2, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Sunburst::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v2, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Sunburst::Sun Color"), 0, 0), 9, 0, 1.0, 0.5, 0.0, 1.0);
    objc_msgSend(v2, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Sunburst::Background Color"), 0, 0), 10, 0, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Sunburst::Number of Arms"), 0, 0), 2, 0, 20.0, 2.0, 4096.0, 2.0, 255.0, 1.0);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Sunburst::Radius"), 0, 0), 3, 32, 200.0, 0.0, 4096.0, 0.0, 2000.0, 1.0);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Sunburst::Inner Radius"), 0, 0), 4, 32, 0.5, 0.01, 1.0, 0.01, 1.0, 0.1);
    objc_msgSend(v2, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Sunburst::Rotation"), 0, 0), 5, 0, 0.0, -3600.0, 3600.0);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Sunburst::Waviness Amplitude"), 0, 0), 6, 0, 0.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Sunburst::Waviness Frequency"), 0, 0), 7, 0, 2.2, 0.0, 10.0, 0.0, 10.0, 1.0);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Sunburst::Waviness Phase"), 0, 0), 8, 0, 0.0, -1000.0, 1000.0, -10.0, 10.0, 1.0);
    objc_msgSend(v2, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Sunburst::Contrast"), 0, 0), 11, 0, 0.75, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", CFSTR("Hidden Inner Radius"), 12, 2, 100.0, 0.0, 4096.0, 0.0, 4096.0, 1.0);
  }
  return v2 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  return 1;
}

- (id)multiplyMatrix:(id)a3 byMatrix:(id)a4
{
  uint64_t v5;
  double *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double *v29;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "matrix", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v6 = (double *)objc_msgSend(a4, "matrix");
  v7 = 0;
  v8 = *v6;
  v9 = v6[1];
  v10 = v6[2];
  v11 = v6[3];
  v12 = v6[4];
  v13 = v6[5];
  v14 = v6[6];
  v15 = v6[7];
  v16 = v6[8];
  v17 = v6[9];
  v18 = v6[10];
  v19 = v6[11];
  v20 = v6[12];
  v21 = v6[13];
  v22 = v5 + 96;
  v23 = v6[14];
  v24 = v6[15];
  do
  {
    v25 = *(double *)(v5 + v7);
    v26 = *(double *)(v22 + v7 - 64);
    v27 = *(double *)(v22 + v7 - 32);
    v28 = *(double *)(v22 + v7);
    v29 = (double *)((char *)&v31 + v7);
    *v29 = v25 * v8 + v26 * v9 + v27 * v10 + v28 * v11;
    v29[4] = v25 * v12 + v26 * v13 + v27 * v14 + v28 * v15;
    v29[8] = v25 * v16 + v26 * v17 + v27 * v18 + v28 * v19;
    v29[12] = v25 * v20 + v26 * v21 + v27 * v23 + v28 * v24;
    v7 += 8;
  }
  while (v7 != 32);
  return -[FxMatrix44 initWithMatrix44Data:]([FxMatrix44 alloc], "initWithMatrix44Data:", &v31);
}

- (void)getTransformMatrix:(double *)(a3 forCenterX:centerY:angle:andOutputImage:
{
  __double2 v12;
  _QWORD v13[4];
  __int128 v14;
  uint64_t v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  __double2 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = __sincos_stret(a6);
  v21[0] = *(_QWORD *)&v12.__cosval;
  *(double *)&v21[1] = -v12.__sinval;
  v21[2] = 0;
  v21[3] = 0;
  v22 = v12;
  v23 = 0;
  v24 = 0;
  v25 = xmmword_1B304FDC8;
  v26 = unk_1B304FDD8;
  v27 = xmmword_1B304FDE8;
  v28 = unk_1B304FDF8;
  v13[1] = 0;
  v13[2] = 0;
  v13[0] = 0x3FF0000000000000;
  *(double *)&v13[3] = a4;
  v14 = xmmword_1B304EEE0;
  v15 = 0;
  v16 = a5;
  v17 = xmmword_1B304FDC8;
  v18 = unk_1B304FDD8;
  v19 = xmmword_1B304FDE8;
  v20 = unk_1B304FDF8;
  *a3 = (double (*)[4][4])objc_msgSend(-[PAESunburst multiplyMatrix:byMatrix:](self, "multiplyMatrix:byMatrix:", -[PAESunburst multiplyMatrix:byMatrix:](self, "multiplyMatrix:byMatrix:", objc_msgSend(a7, "inversePixelTransform"), -[FxMatrix44 initWithMatrix44Data:]([FxMatrix44 alloc], "initWithMatrix44Data:", v13)), -[FxMatrix44 initWithMatrix44Data:]([FxMatrix44 alloc], "initWithMatrix44Data:", v21)), "matrix");
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  HgcSunburst *v15;
  double v16;
  double v17;
  __double2 v18;
  __double2 v19;
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
  float v43;
  float v44;
  float v45;
  float v46;
  HgcSunburst *v48;
  double *v49;
  double v50;
  double v51;
  double __x;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;

  v7 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v8 = v7;
  if (v7)
  {
    v66 = 300.0;
    v67 = 20.0;
    v64 = 0;
    v65 = 0.5;
    v62 = 0.0;
    v63 = 0.0;
    v60 = 0.0;
    v61 = 0.0;
    v58 = 0.0;
    v59 = 0.0;
    v56 = 1.0;
    v57 = 0.0;
    v54 = 1.0;
    v55 = 1.0;
    __x = 0.5;
    v53 = 1.0;
    objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v67, 2, a4->var0.var1);
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v66, 3, a4->var0.var1);
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v65, 4, a4->var0.var1);
    v9 = v67;
    if (v67 == 3.0)
    {
      v9 = v65;
      if (v65 == 0.5)
        v65 = 0.49999;
    }
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v64, 5, a4->var0.var1, v9);
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v63, 6, a4->var0.var1);
    v63 = v63 / 10.0;
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v62, 7, a4->var0.var1);
    v62 = v62 / 10.0;
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v61, 8, a4->var0.var1);
    objc_msgSend(v8, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v60, &v59, &v58, &v57, 9, a4->var0.var1);
    v59 = v57 * v59;
    v60 = v57 * v60;
    v58 = v57 * v58;
    objc_msgSend(v8, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v56, &v55, &v54, &v53, 10, a4->var0.var1);
    v55 = v53 * v55;
    v56 = v53 * v56;
    v54 = v53 * v54;
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &__x, 11, a4->var0.var1);
    __x = pow(__x, 3.0);
    objc_msgSend(a3, "bounds");
    v11 = v10;
    v13 = v12;
    v50 = 0.5;
    v51 = 0.5;
    objc_msgSend(v8, "getXValue:YValue:fromParm:atFxTime:", &v51, &v50, 1, a4->var0.var1);
    v50 = v13 * (0.5 - v50);
    v51 = v11 * (0.5 - v51);
    v49 = 0;
    -[PAESunburst getTransformMatrix:forCenterX:centerY:angle:andOutputImage:](self, "getTransformMatrix:forCenterX:centerY:angle:andOutputImage:", &v49, a3);
    v14 = v67;
    v15 = (HgcSunburst *)HGObject::operator new(0x1A0uLL);
    HgcSunburst::HgcSunburst(v15);
    v16 = v66;
    v17 = v65;
    v18 = __sincos_stret(6.28318531 / v14 * 0.5);
    v19 = __sincos_stret(6.28318531 / v14);
    v20 = 6.28318531 / v14;
    (*(void (**)(HgcSunburst *, _QWORD, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 0, v20, 0.0, 0.0, 0.0);
    v21 = v60;
    v22 = v59;
    v23 = v58;
    v24 = v57;
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 1, v21, v22, v23, v24);
    v25 = v56;
    v26 = v55;
    v27 = v54;
    v28 = v53;
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 2, v25, v26, v27, v28);
    v29 = *v49;
    v30 = v49[1];
    v31 = v49[2];
    v32 = v49[3];
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 3, v29, v30, v31, v32);
    v33 = v49[4];
    v34 = v49[5];
    v35 = v49[6];
    v36 = v49[7];
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 4, v33, v34, v35, v36);
    v37 = __x;
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 9, v37, 0.0, 0.0, 0.0);
    v38 = v16 * v17;
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 5, v38, 0.0, 0.0, 0.0);
    v39 = v18.__cosval * v16;
    v40 = v18.__sinval * v16;
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 6, v39, v40, 0.0, 0.0);
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 7, v39, v40, 0.0, 0.0);
    v41 = v19.__cosval * (v16 * v17);
    v42 = v19.__sinval * (v16 * v17);
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 8, v41, v42, 0.0, 0.0);
    v43 = v66;
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 10, v43, 0.0, 0.0, 0.0);
    v44 = v63 / 6.28318531;
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 11, v44, 0.0, 0.0, 0.0);
    v45 = v62;
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 12, v45, 0.0, 0.0, 0.0);
    v46 = v61;
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 13, v46, 0.0, 0.0, 0.0);
    v48 = v15;
    (*(void (**)(HgcSunburst *))(*(_QWORD *)v15 + 16))(v15);
    objc_msgSend(a3, "setHeliumRef:", &v48);
    if (v48)
      (*(void (**)(HgcSunburst *))(*(_QWORD *)v48 + 24))(v48);
    (*(void (**)(HgcSunburst *))(*(_QWORD *)v15 + 24))(v15);
  }
  return v8 != 0;
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  __int128 v5;
  _OWORD v7[3];

  *a5 = 0;
  *a4 = 0;
  v5 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v7);
  return 1;
}

- (BOOL)frameCleanup
{
  return 1;
}

@end
