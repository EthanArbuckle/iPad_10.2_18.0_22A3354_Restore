@implementation PAEPoke

- (PAEPoke)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEPoke;
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
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("SupportsHeliumRendering"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEPoke;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Poke::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Poke::Radius"), 0, 0), 2, 0, 300.0, 0.0, 1000.0, 0.0, 1000.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Poke::Scale"), 0, 0), 3, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 1.0);
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
    objc_msgSend(v11, "setFloatValue:toParm:atFxTime:", 3, &v13, a5 * 0.5);
    objc_msgSend(v12, "setXValue:YValue:toParm:atFxTime:", 1, &v13, x, y);
  }
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

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9;
  void *v10;
  double v16;
  int v17;
  HPoke *v18;
  float v19;
  float v20;
  float v21;
  float v22;
  __int128 v24;
  double v25;
  double v26;
  __int128 v27;
  double v28[16];

  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = (void *)v9;
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
    __asm { FMOV            V0.2D, #0.5 }
    v27 = _Q0;
    objc_msgSend(v10, "getXValue:YValue:fromParm:atFxTime:", &v27, (char *)&v27 + 8, 1, a5->var0.var1);
    v26 = 300.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v26, 2, a5->var0.var1);
    v16 = v26;
    if (v26 < 0.00001)
      v16 = 0.00001;
    v26 = v16;
    v25 = 0.5;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v25, 3, a5->var0.var1);
    v17 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    -[PAESharedDefaultBase convertRelativeToImageCoordinates:withImage:](self, "convertRelativeToImageCoordinates:withImage:", &v27, a4);
    v27 = v24;
    if (v17 && objc_msgSend(a4, "imageType") == 3)
    {
      v18 = (HPoke *)HGObject::operator new(0x2A0uLL);
      HPoke::HPoke(v18);
      v19 = *(double *)&v27;
      v20 = *((double *)&v27 + 1);
      v21 = 1.0 / v26;
      v22 = v25;
      (*(void (**)(HPoke *, _QWORD, float, float, float, float))(*(_QWORD *)v18 + 96))(v18, 0, v19, v20, v21, v22);
      HPoke::setPixelTransform((double *)v18, v28);
      if (a4)
      {
        objc_msgSend(a4, "heliumRef");
        a4 = (id)v24;
        if ((_QWORD)v24)
          (*(void (**)(_QWORD))(*(_QWORD *)v24 + 24))(v24);
      }
      (*(void (**)(HPoke *, _QWORD, id))(*(_QWORD *)v18 + 120))(v18, 0, a4);
      *(_QWORD *)&v24 = v18;
      (*(void (**)(HPoke *))(*(_QWORD *)v18 + 16))(v18);
      objc_msgSend(a3, "setHeliumRef:", &v24);
      if ((_QWORD)v24)
        (*(void (**)(_QWORD))(*(_QWORD *)v24 + 24))(v24);
      (*(void (**)(HPoke *))(*(_QWORD *)v18 + 24))(v18);
      LOBYTE(v9) = 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

@end
