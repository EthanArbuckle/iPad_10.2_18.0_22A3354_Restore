@implementation PAEDroplet

- (PAEDroplet)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEDroplet;
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
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("InputSizeLimit"), v8, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PAEDroplet;
  -[PAESharedDefaultBase addParameters](&v13, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
  {
    v7 = objc_msgSend(v4, "versionAtCreation");
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Droplet::Center"), 0, 0), 1, 0, 0.5, 0.5);
    v9 = objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Droplet::Radius"), 0, 0);
    if (v7 >= 2)
      v10 = 2000.0;
    else
      v10 = 100.0;
    if (v7 >= 2)
      v11 = 200.0;
    else
      v11 = 100.0;
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", v9, 2, 0, 300.0, -50.0, dbl_1B3050860[v7 < 2], -50.0, dbl_1B3050870[v7 < 2], 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Droplet::Width"), 0, 0), 4, 0, 40.0, 0.0, v10, 0.0, v11, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Droplet::Height"), 0, 0), 3, 0, 30.0, -50.0, 50.0, -50.0, 50.0, 1.0);
    if (v7)
      objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Droplet::Crop"), 0, 0), 5, 0, 33);
  }
  return v6;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  void *v10;
  unint64_t var1;
  double v12;
  double v13;
  double v15;
  char v16;

  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v16 = 0;
  objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v16, 5, a6->var0.var1);
  if (v16)
  {
    *a3 = a5->var0;
    var1 = a5->var1;
  }
  else
  {
    v15 = 30.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v15, 3, a6->var0.var1);
    v12 = fabs(v15);
    v13 = v12 + v12;
    *a3 = (unint64_t)(v13 + (double)a5->var0);
    var1 = (unint64_t)(v13 + (double)a5->var1);
  }
  *a4 = var1;
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  BOOL v11;
  float64x2_t v17;
  HDroplet *v18;
  HDroplet *v20;
  char v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  float64x2_t v26[8];
  _OWORD v27[8];
  _OWORD v28[17];

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
    v11 = v10 && objc_msgSend(v10, "versionAtCreation") == 0;
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
    __asm { FMOV            V0.2D, #0.5 }
    v28[0] = _Q0;
    objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", v28, (char *)v28 + 8, 1, a5->var0.var1);
    -[PAESharedDefaultBase convertRelativeToImageCoordinates:withImage:](self, "convertRelativeToImageCoordinates:withImage:", v28, a4);
    v27[4] = v28[13];
    v27[5] = v28[14];
    v27[6] = v28[15];
    v27[7] = v28[16];
    v28[0] = v27[0];
    v27[0] = v28[9];
    v27[1] = v28[10];
    v27[2] = v28[11];
    v27[3] = v28[12];
    v26[4] = (float64x2_t)v28[5];
    v26[5] = (float64x2_t)v28[6];
    v26[6] = (float64x2_t)v28[7];
    v26[7] = (float64x2_t)v28[8];
    v26[0] = (float64x2_t)v28[1];
    v26[1] = (float64x2_t)v28[2];
    v26[2] = (float64x2_t)v28[3];
    v26[3] = (float64x2_t)v28[4];
    PCMatrix44Tmpl<double>::rightTranslate((double *)v27, *(double *)v28, *((double *)v28 + 1), 0.0);
    v17.f64[0] = -*(double *)v28;
    v25 = 300.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v25, 2, a5->var0.var1, PCMatrix44Tmpl<double>::leftTranslate(v26, v17, -*((double *)v28 + 1), 0.0).f64[0]);
    v24 = 40.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v24, 4, a5->var0.var1);
    v23 = 30.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v23, 3, a5->var0.var1);
    if (-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1))
    {
      if (objc_msgSend(a4, "imageType") == 3)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v22 = 0;
        v21 = 1;
        if (!v11)
          objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v21, 5, a5->var0.var1);
        if (v24 <= 0.0)
        {
          objc_msgSend(a3, "setHeliumRef:", &v22, v24);
        }
        else
        {
          v18 = (HDroplet *)HGObject::operator new(0x2C0uLL);
          HDroplet::HDroplet(v18);
          (*(void (**)(HDroplet *, _QWORD, uint64_t))(*(_QWORD *)v18 + 120))(v18, 0, v22);
          HDroplet::SetOutputToImage((double *)v18, v26[0].f64);
          HDroplet::SetImageToInput((double *)v18, (double *)v27);
          HDroplet::SetBiasThicknessAndScale(v18, v25, v24, v23);
          v20 = v18;
          (*(void (**)(HDroplet *))(*(_QWORD *)v18 + 16))(v18);
          if (v21)
            -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v20, a4, a3);
          objc_msgSend(a3, "setHeliumRef:", &v20);
          if (v20)
            (*(void (**)(HDroplet *))(*(_QWORD *)v20 + 24))(v20);
          (*(void (**)(HDroplet *))(*(_QWORD *)v18 + 24))(v18);
        }
        if (v22)
          (*(void (**)(uint64_t))(*(_QWORD *)v22 + 24))(v22);
      }
    }
  }
  return v9 != 0;
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
