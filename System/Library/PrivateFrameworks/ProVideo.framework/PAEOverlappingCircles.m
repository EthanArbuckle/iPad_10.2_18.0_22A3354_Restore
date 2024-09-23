@implementation PAEOverlappingCircles

- (PAEOverlappingCircles)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEOverlappingCircles;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAEOverlappingCircles;
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
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("MayRemapTime"), v4, CFSTR("PixelTransformSupport"), v5, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v2;
  void *v3;

  v2 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4358);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v2, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Overlapping Circles::Center"), 0, 0), 7, 32, 0.5, 0.5);
    objc_msgSend(v2, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Overlapping Circles::Color 1"), 0, 0), 3, 0, 0.0, 0.0, 0.0, 1.0);
    objc_msgSend(v2, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Overlapping Circles::Color 2"), 0, 0), 4, 0, 1.0, 1.0, 1.0, 1.0);
    objc_msgSend(v2, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Overlapping Circles::Background Color"), 0, 0), 8, 0, 0.5, 0.5, 0.5, 1.0);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Overlapping Circles::Size"), 0, 0), 1, 0, 80.0, 1.0, 1000.0, 1.0, 500.0, 1.0);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Overlapping Circles::Circle Offset"), 0, 0), 2, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v2, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Overlapping Circles::Angle"), 0, 0), 6, 0, 0.0, -3600.0, 3600.0);
    objc_msgSend(v2, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Overlapping Circles::Contrast"), 0, 0), 5, 0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.1);
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
  v25 = xmmword_1B304FCA8;
  v26 = unk_1B304FCB8;
  v27 = xmmword_1B304FCC8;
  v28 = unk_1B304FCD8;
  v13[1] = 0;
  v13[2] = 0;
  v13[0] = 0x3FF0000000000000;
  *(double *)&v13[3] = a4;
  v14 = xmmword_1B304EEE0;
  v15 = 0;
  v16 = a5;
  v17 = xmmword_1B304FCA8;
  v18 = unk_1B304FCB8;
  v19 = xmmword_1B304FCC8;
  v20 = unk_1B304FCD8;
  *a3 = (double (*)[4][4])objc_msgSend(-[PAEOverlappingCircles multiplyMatrix:byMatrix:](self, "multiplyMatrix:byMatrix:", -[PAEOverlappingCircles multiplyMatrix:byMatrix:](self, "multiplyMatrix:byMatrix:", objc_msgSend(a7, "inversePixelTransform"), -[FxMatrix44 initWithMatrix44Data:]([FxMatrix44 alloc], "initWithMatrix44Data:", v13)), -[FxMatrix44 initWithMatrix44Data:]([FxMatrix44 alloc], "initWithMatrix44Data:", v21)), "matrix");
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  HgcOverlappingCircles *v15;
  float v16;
  float v17;
  float v18;
  float v19;
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
  HgcOverlappingCircles *v40;
  double *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;

  v7 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v7)
  {
    objc_msgSend(a3, "bounds");
    v9 = v8;
    v11 = v10;
    v59 = 80.0;
    objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v59, 1, a4->var0.var1);
    v58 = 1.0;
    objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v58, 2, a4->var0.var1);
    v12 = sqrt(v59 * v59 * 0.5);
    v58 = (v58 * 0.414213562 + 1.0) * v12 + (v58 * 0.414213562 + 1.0) * v12;
    v57 = 0.0;
    objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v57, 6, a4->var0.var1);
    v57 = -v57;
    v56 = 0.5;
    v55 = 0.5;
    objc_msgSend(v7, "getXValue:YValue:fromParm:atFxTime:", &v56, &v55, 7, a4->var0.var1);
    v13 = v9 * (0.5 - v56);
    v14 = v11 * (0.5 - v55);
    v53 = 0.0;
    v54 = 0.0;
    v51 = 0.0;
    v52 = 0.0;
    objc_msgSend(v7, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v54, &v53, &v52, &v51, 3, a4->var0.var1);
    v53 = v51 * v53;
    v54 = v51 * v54;
    v52 = v51 * v52;
    v49 = 0.0;
    v50 = 0.0;
    v47 = 0.0;
    v48 = 0.0;
    objc_msgSend(v7, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v50, &v49, &v48, &v47, 4, a4->var0.var1);
    v49 = v47 * v49;
    v50 = v47 * v50;
    v48 = v47 * v48;
    v45 = 0.0;
    v46 = 0.0;
    v43 = 0.0;
    v44 = 0.0;
    objc_msgSend(v7, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v46, &v45, &v44, &v43, 8, a4->var0.var1);
    v45 = v43 * v45;
    v46 = v43 * v46;
    v44 = v43 * v44;
    v42 = 1.0;
    objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v42, 5, a4->var0.var1);
    v42 = v42 * v42;
    v41 = 0;
    -[PAEOverlappingCircles getTransformMatrix:forCenterX:centerY:angle:andOutputImage:](self, "getTransformMatrix:forCenterX:centerY:angle:andOutputImage:", &v41, a3, v13, v14, v57);
    v15 = (HgcOverlappingCircles *)HGObject::operator new(0x1A0uLL);
    HgcOverlappingCircles::HgcOverlappingCircles(v15);
    v16 = v59;
    (*(void (**)(HgcOverlappingCircles *, _QWORD, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 0, v16, 0.0, 0.0, 0.0);
    v17 = v58;
    (*(void (**)(HgcOverlappingCircles *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 1, v17, 0.0, 0.0, 0.0);
    v18 = v54;
    v19 = v53;
    v20 = v52;
    v21 = v51;
    (*(void (**)(HgcOverlappingCircles *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 2, v18, v19, v20, v21);
    v22 = v50;
    v23 = v49;
    v24 = v48;
    v25 = v47;
    (*(void (**)(HgcOverlappingCircles *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 3, v22, v23, v24, v25);
    v26 = v46;
    v27 = v45;
    v28 = v44;
    v29 = v43;
    (*(void (**)(HgcOverlappingCircles *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 4, v26, v27, v28, v29);
    v30 = v42;
    (*(void (**)(HgcOverlappingCircles *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 7, v30, 0.0, 0.0, 0.0);
    v31 = *v41;
    v32 = v41[1];
    v33 = v41[2];
    v34 = v41[3];
    (*(void (**)(HgcOverlappingCircles *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 5, v31, v32, v33, v34);
    v35 = v41[4];
    v36 = v41[5];
    v37 = v41[6];
    v38 = v41[7];
    (*(void (**)(HgcOverlappingCircles *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 6, v35, v36, v37, v38);
    v40 = v15;
    (*(void (**)(HgcOverlappingCircles *))(*(_QWORD *)v15 + 16))(v15);
    objc_msgSend(a3, "setHeliumRef:", &v40);
    if (v40)
      (*(void (**)(HgcOverlappingCircles *))(*(_QWORD *)v40 + 24))(v40);
    (*(void (**)(HgcOverlappingCircles *))(*(_QWORD *)v15 + 24))(v15);
  }
  return v7 != 0;
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
