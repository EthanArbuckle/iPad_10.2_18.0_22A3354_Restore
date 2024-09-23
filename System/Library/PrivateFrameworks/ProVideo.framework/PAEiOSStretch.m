@implementation PAEiOSStretch

- (PAEiOSStretch)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEiOSStretch;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("SupportsHeliumRendering"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEiOSStretch;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("iOSStretch::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("iOSStretch::Size"), 0, 0), 2, 0, 400.0, 0.0, 1000.0, 1.0, 1000.0, 1.0);
  }
  return v3 != 0;
}

- (void)handleUIEventWithPosition:(CGPoint)a3 velocity:(CGPoint)a4 scale:(double)a5 scaleVelocity:(double)a6 rotation:(double)a7 rotationVelocity:(double)a8
{
  double y;
  double x;
  void *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;

  y = a3.y;
  x = a3.x;
  v11 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7268, a3.x, a3.y, a4.x, a4.y, a5, a6, a7, a8);
  if (v11)
  {
    v12 = v11;
    v13 = *MEMORY[0x1E0CA2E68];
    v14 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    objc_msgSend(v11, "setFloatValue:toParm:atFxTime:", 2, &v13, a5 * 400.0);
    objc_msgSend(v12, "setXValue:YValue:toParm:atFxTime:", 1, &v13, x, y);
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  HGTextureWrap *v15;
  char *v16;
  HGCrop *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  HgciOSStretch *v25;
  float v26;
  float v27;
  char *v28;
  float v29;
  double v30;
  float v31;
  float v32;
  float v33;
  HgciOSStretch *v35;
  long double v36;
  double v37;
  double v38;

  v8 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v9 = v8;
  if (v8)
  {
    v37 = 0.5;
    v38 = 0.5;
    objc_msgSend(v8, "getXValue:YValue:fromParm:atFxTime:", &v38, &v37, 1, a5->var0.var1);
    v10 = v38 + -0.5;
    v38 = v10 * (double)(unint64_t)objc_msgSend(a4, "width");
    v11 = v37 + -0.5;
    v37 = v11 * (double)(unint64_t)objc_msgSend(a4, "height");
    v36 = 100.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v36, 2, a5->var0.var1);
    v12 = v36;
    v13 = hypot(v36, v36);
    if (v12 == 0.0)
      v13 = hypot((double)(unint64_t)objc_msgSend(a4, "width", v13), (double)(unint64_t)objc_msgSend(a4, "height"));
    v14 = v13;
    v15 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
    HGTextureWrap::HGTextureWrap(v15);
    (*(void (**)(HGTextureWrap *, _QWORD, uint64_t))(*(_QWORD *)v15 + 120))(v15, 0, objc_msgSend(a4, "heliumNode"));
    HGTextureWrap::SetTextureWrapMode((uint64_t)v15, (const char *)2, v16);
    v17 = (HGCrop *)HGObject::operator new(0x1A0uLL);
    HGCrop::HGCrop(v17);
    v18 = objc_msgSend(a4, "width");
    v19 = objc_msgSend(a4, "height");
    v20 = objc_msgSend(a4, "width");
    v21 = objc_msgSend(a4, "height");
    v22 = HGRectMake4i((int)-(double)v18, (int)-(double)v19, (int)((double)v20 + (double)v20), (int)((double)v21 + (double)v21));
    (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v17 + 96))(v17, 0, (float)(int)v22, (float)SHIDWORD(v22), (float)v23, (float)v24);
    (*(void (**)(HGCrop *, _QWORD, HGTextureWrap *))(*(_QWORD *)v17 + 120))(v17, 0, v15);
    v25 = (HgciOSStretch *)HGObject::operator new(0x1A0uLL);
    HgciOSStretch::HgciOSStretch(v25);
    *(_QWORD *)v25 = &unk_1E64E1888;
    v26 = v38;
    v27 = v37;
    HgciOSStretch::SetParameter(v25, 0, v26, v27, 0.0, 0.0, v28);
    v29 = v14;
    v30 = v29;
    v31 = v30 * 0.84 * 0.5;
    v32 = v30 * 0.18 * 0.5;
    v33 = v30 * 0.234 * 0.5;
    (*(void (**)(HgciOSStretch *, uint64_t, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 1, 1.0 / v31, v32, 1.0 / v33, 0.0);
    (*(void (**)(HgciOSStretch *, _QWORD, HGCrop *))(*(_QWORD *)v25 + 120))(v25, 0, v17);
    v35 = v25;
    (*(void (**)(HgciOSStretch *))(*(_QWORD *)v25 + 16))(v25);
    objc_msgSend(a3, "setHeliumRef:", &v35);
    if (v35)
      (*(void (**)(HgciOSStretch *))(*(_QWORD *)v35 + 24))(v35);
    (*(void (**)(HgciOSStretch *))(*(_QWORD *)v25 + 24))(v25);
    (*(void (**)(HGCrop *))(*(_QWORD *)v17 + 24))(v17);
    (*(void (**)(HGTextureWrap *))(*(_QWORD *)v15 + 24))(v15);
  }
  return v9 != 0;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  __int128 v6;
  _OWORD v8[3];

  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v8, a5, a6);
  return 1;
}

@end
