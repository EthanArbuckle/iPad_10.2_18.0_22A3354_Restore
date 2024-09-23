@implementation PAEiOSLightTunnel

- (PAEiOSLightTunnel)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEiOSLightTunnel;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0), CFSTR("MayRemapTime"), 0);
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
  v9.super_class = (Class)PAEiOSLightTunnel;
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
  objc_msgSend(v4, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("iOSLightTunnel::Center"), 0, 0), 1, 0, 0.5, 0.5);
  objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("iOSLightTunnel::Radius"), 0, 0), 2, 0, 100.0, 1.0, 500.0, 1.0, 500.0, 1.0);
  objc_msgSend(v4, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("iOSLightTunnel::Rotation"), 0, 0), 3, 0, 0.0, 0.0, 6.28318531);
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
    objc_msgSend(v12, "setFloatValue:toParm:atFxTime:", 2, &v14, a5 * 100.0);
    objc_msgSend(v13, "setFloatValue:toParm:atFxTime:", 3, &v14, a7);
    objc_msgSend(v13, "setXValue:YValue:toParm:atFxTime:", 1, &v14, x, y);
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v8;
  void *v9;
  double v10;
  double v11;
  HgciOSLightTunnel *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  HgciOSLightTunnel *v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v8 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v9 = v8;
  if (v8)
  {
    v21 = 0.5;
    v22 = 0.5;
    objc_msgSend(v8, "getXValue:YValue:fromParm:atFxTime:", &v22, &v21, 1, a5->var0.var1);
    v10 = v22 + -0.5;
    v22 = v10 * (double)(unint64_t)objc_msgSend(a4, "width");
    v11 = v21 + -0.5;
    v21 = v11 * (double)(unint64_t)objc_msgSend(a4, "height");
    v20 = 100.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v20, 2, a5->var0.var1);
    v19 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v19, 3, a5->var0.var1);
    v12 = (HgciOSLightTunnel *)HGObject::operator new(0x1A0uLL);
    HgciOSLightTunnel::HgciOSLightTunnel(v12);
    *(_QWORD *)v12 = &unk_1E64D9AA0;
    (*(void (**)(HgciOSLightTunnel *, _QWORD, uint64_t))(*(_QWORD *)v12 + 120))(v12, 0, objc_msgSend(a4, "heliumNode"));
    v13 = v22;
    v14 = v21;
    v15 = v20;
    v16 = v19 / 6.28318531;
    (*(void (**)(HgciOSLightTunnel *, _QWORD, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 0, v13, v14, v15, v16);
    v18 = v12;
    (*(void (**)(HgciOSLightTunnel *))(*(_QWORD *)v12 + 16))(v12);
    objc_msgSend(a3, "setHeliumRef:", &v18);
    if (v18)
      (*(void (**)(HgciOSLightTunnel *))(*(_QWORD *)v18 + 24))(v18);
    (*(void (**)(HgciOSLightTunnel *))(*(_QWORD *)v12 + 24))(v12);
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
