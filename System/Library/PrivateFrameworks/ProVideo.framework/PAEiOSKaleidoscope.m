@implementation PAEiOSKaleidoscope

- (PAEiOSKaleidoscope)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEiOSKaleidoscope;
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
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PAEiOSKaleidoscope;
  -[PAESharedDefaultBase addParameters](&v9, sel_addParameters);
  v3 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (!v3)
    return 0;
  v4 = (void *)v3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 1;
  objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("iOSKaleidoscope::Count"), 0, 0), 1, 0, 6.0, 2.0, 100.0, 2.0, 100.0, 1.0);
  objc_msgSend(v4, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("iOSKaleidoscope::Center"), 0, 0), 2, 0, 0.5, 0.5);
  objc_msgSend(v4, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("iOSKaleidoscope::Angle"), 0, 0), 3, 0, 22.5, 0.0, 6.28318531);
  return v7;
}

- (void)handleUIEventWithPosition:(CGPoint)a3 velocity:(CGPoint)a4 scale:(double)a5 scaleVelocity:(double)a6 rotation:(double)a7 rotationVelocity:(double)a8
{
  double y;
  double x;
  void *v12;
  void *v13;
  __int128 v14;
  uint64_t v15;

  y = a3.y;
  x = a3.x;
  v12 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7268, a3.x, a3.y, a4.x, a4.y, a5, a6, a7, a8);
  if (v12)
  {
    v13 = v12;
    v14 = *MEMORY[0x1E0CA2E68];
    v15 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    objc_msgSend(v12, "setFloatValue:toParm:atFxTime:", 1, &v14, a5 * 6.0);
    objc_msgSend(v13, "setFloatValue:toParm:atFxTime:", 3, &v14, a7);
    objc_msgSend(v13, "setXValue:YValue:toParm:atFxTime:", 2, &v14, x, y);
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v8;
  void *v9;
  double v10;
  signed int v11;
  int v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  __double2 v16;
  double v17;
  double v18;
  HGTextureWrap *v19;
  char *v20;
  HgciOSKaleidoscope *v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float cosval;
  float sinval;
  HgciOSKaleidoscope *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;

  v8 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v9 = v8;
  if (v8)
  {
    v33 = 2.0;
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v33, 1, a5->var0.var1);
    *(double *)&v31 = 0.5;
    *(double *)&v32 = 0.5;
    objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v32, &v31, 2, a5->var0.var1);
    v30 = 0.392699082;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v30, 3, a5->var0.var1);
    v10 = *(double *)&v32;
    v11 = 2 * vcvtpd_s64_f64(v33);
    if (v11 <= 2)
      v12 = 2;
    else
      v12 = v11;
    v13 = objc_msgSend(a4, "width");
    v14 = *(double *)&v31;
    v15 = objc_msgSend(a4, "height");
    v16 = __sincos_stret(v30);
    v17 = floor(v33);
    if (v17 >= 1.0)
      v18 = v17;
    else
      v18 = 1.0;
    v33 = v18;
    v19 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
    HGTextureWrap::HGTextureWrap(v19);
    (*(void (**)(HGTextureWrap *, _QWORD, uint64_t))(*(_QWORD *)v19 + 120))(v19, 0, objc_msgSend(a4, "heliumNode"));
    HGTextureWrap::SetTextureWrapMode((uint64_t)v19, (const char *)2, v20);
    v21 = (HgciOSKaleidoscope *)HGObject::operator new(0x1B0uLL);
    HgciOSKaleidoscope::HgciOSKaleidoscope(v21);
    *(_QWORD *)v21 = &unk_1E64DF108;
    *((_QWORD *)v21 + 52) = 0;
    *((_DWORD *)v21 + 106) = 1;
    HGNode::SetInput((HGNode *)v21, 0, (HGNode *)v19);
    v22 = (v10 + -0.5) * (double)v13;
    v23 = (v14 + -0.5) * (double)v15;
    v24 = 6.28318531 / v18;
    v25 = v18 / 6.28318531;
    (*(void (**)(HgciOSKaleidoscope *, _QWORD, float, float, float, float))(*(_QWORD *)v21 + 96))(v21, 0, v22, v23, v24, v25);
    cosval = v16.__cosval;
    sinval = v16.__sinval;
    *((double *)v21 + 52) = v30;
    (*(void (**)(HgciOSKaleidoscope *, uint64_t, float, float, float, float))(*(_QWORD *)v21 + 96))(v21, 1, cosval, sinval, -sinval, cosval);
    (*(void (**)(HgciOSKaleidoscope *, uint64_t, float, float, float, float))(*(_QWORD *)v21 + 96))(v21, 2, cosval, -sinval, sinval, cosval);
    *((_DWORD *)v21 + 106) = v12;
    v29 = v21;
    (*(void (**)(HgciOSKaleidoscope *))(*(_QWORD *)v21 + 16))(v21);
    objc_msgSend(a3, "setHeliumRef:", &v29);
    if (v29)
      (*(void (**)(HgciOSKaleidoscope *))(*(_QWORD *)v29 + 24))(v29);
    (*(void (**)(HgciOSKaleidoscope *))(*(_QWORD *)v21 + 24))(v21);
    (*(void (**)(HGTextureWrap *))(*(_QWORD *)v19 + 24))(v19);
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
