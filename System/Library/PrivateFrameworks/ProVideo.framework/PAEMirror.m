@implementation PAEMirror

- (PAEMirror)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEMirror;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEMirror;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Mirror::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Mirror::Angle"), 0, 0), 2, 0, 0.0, 0.0, 6.28318531);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Mirror::Repeat Border Pixels"), 0, 0), 3, 1, 33);
  }
  return v3 != 0;
}

- (void)handleUIEventWithPosition:(CGPoint)a3 velocity:(CGPoint)a4 scale:(double)a5 scaleVelocity:(double)a6 rotation:(double)a7 rotationVelocity:(double)a8
{
  double y;
  double x;
  void *v10;
  __int128 v11;
  uint64_t v12;

  y = a3.y;
  x = a3.x;
  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7268, a3.x, a3.y, a4.x, a4.y, a5, a6, a7, a8);
  if (v10)
  {
    v11 = *MEMORY[0x1E0CA2E68];
    v12 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    objc_msgSend(v10, "setXValue:YValue:toParm:atFxTime:", 1, &v11, x, y);
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  int v11;
  HMirror *v12;
  __double2 v13;
  HMirror *v14;
  double v15;
  unint64_t v16;
  double v17;
  unint64_t v18;
  float v19;
  float v20;
  float cosval;
  float sinval;
  int v23;
  unint64_t v24;
  unint64_t v25;
  __n128 v26;
  float v27;
  HMirror *v29;
  HMirror *v30;
  HMirror *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  int v37;
  double v38;
  double v39;
  double v40;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = v9;
    v39 = 0.0;
    v40 = 0.0;
    v38 = 0.0;
    objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v40, &v39, 1, a5->var0.var1);
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v38, 2, a5->var0.var1);
    v37 = 0;
    v11 = objc_msgSend(v10, "getIntValue:fromParm:atFxTime:", &v37, 3, a5->var0.var1);
    v36 = 0;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    if (a3)
    {
      objc_msgSend(a3, "imageInfo");
      if (*((_QWORD *)&v34 + 1))
        v38 = -v38;
    }
    LODWORD(v9) = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    if ((_DWORD)v9)
    {
      if (objc_msgSend(a4, "imageType") == 3)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v31 = 0;
        if (v37)
        {
          v29 = v31;
          if (v31)
            (*(void (**)(HMirror *))(*(_QWORD *)v31 + 16))(v31);
          -[PAESharedDefaultBase smear:fromImage:toImage:](self, "smear:fromImage:toImage:", &v29, a4, a4);
          v12 = v30;
          if (v31 == v30)
          {
            if (v31)
              (*(void (**)(void))(*(_QWORD *)v31 + 24))();
          }
          else
          {
            if (v31)
            {
              (*(void (**)(void))(*(_QWORD *)v31 + 24))();
              v12 = v30;
            }
            v30 = 0;
            v31 = v12;
          }
          if (v29)
            (*(void (**)(HMirror *))(*(_QWORD *)v29 + 24))(v29);
        }
        v13 = __sincos_stret(v38);
        v14 = (HMirror *)HGObject::operator new(0x1E0uLL);
        HMirror::HMirror(v14);
        (*(void (**)(HMirror *, _QWORD, HMirror *))(*(_QWORD *)v14 + 120))(v14, 0, v31);
        v15 = v40;
        v16 = objc_msgSend(a4, "width");
        v17 = v39;
        v18 = objc_msgSend(a4, "height");
        v19 = (v15 + -0.5) * (double)v16;
        v20 = (v17 + -0.5) * (double)v18;
        (*(void (**)(HMirror *, _QWORD, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 0, v19, v20, 0.0, 0.0);
        cosval = v13.__cosval;
        sinval = v13.__sinval;
        (*(void (**)(HMirror *, uint64_t, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 1, cosval, sinval, -sinval, cosval);
        (*(void (**)(HMirror *, uint64_t, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 2, cosval, -sinval, sinval, cosval);
        if (v37)
          v23 = v11;
        else
          v23 = 0;
        if (v23 == 1)
        {
          v24 = objc_msgSend(a4, "width");
          v25 = objc_msgSend(a4, "height");
          v26.n128_u32[0] = 0.5;
          v27 = -0.5;
        }
        else
        {
          v24 = objc_msgSend(a4, "width");
          v25 = objc_msgSend(a4, "height");
          v26.n128_u32[0] = -0.5;
          v27 = 0.5;
        }
        (*(void (**)(HMirror *, uint64_t, float, float, __n128, float))(*(_QWORD *)v14 + 96))(v14, 3, v27 + (float)v24, v27 + (float)v25, v26, v26.n128_f32[0]);
        v30 = v14;
        (*(void (**)(HMirror *))(*(_QWORD *)v14 + 16))(v14);
        -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v30, a4, a3);
        objc_msgSend(a3, "setHeliumRef:", &v30);
        if (v30)
          (*(void (**)(HMirror *))(*(_QWORD *)v30 + 24))(v30);
        (*(void (**)(HMirror *))(*(_QWORD *)v14 + 24))(v14);
        if (v31)
          (*(void (**)(HMirror *))(*(_QWORD *)v31 + 24))(v31);
        LOBYTE(v9) = 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
  }
  return (char)v9;
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
