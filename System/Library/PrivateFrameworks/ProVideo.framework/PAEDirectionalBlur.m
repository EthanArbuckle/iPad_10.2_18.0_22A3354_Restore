@implementation PAEDirectionalBlur

- (PAEDirectionalBlur)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEDirectionalBlur;
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
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsLargeRenderScale"), v5, CFSTR("SupportsHeliumRendering"), v6, CFSTR("InputSizeLimit"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id result;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  char v20;

  v6 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (!v6)
  {
    v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Unable to retrieve FxParameterRetrievalAPI object"), *MEMORY[0x1E0CB2D50], 0);
    if (a4)
    {
      v13 = v17;
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = FxPlugErrorDomain;
      v16 = 100001;
      goto LABEL_12;
    }
    return 0;
  }
  v7 = v6;
  v20 = 0;
  v19 = 0.0;
  if (!objc_msgSend(v6, "getBoolValue:fromParm:atFxTime:", &v20, 3, a3.var1)
    || (objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v19, 1, a3.var1) & 1) == 0)
  {
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Unable to retrieve a parameter in [-PAEPrism dynamicPropertiesAtTime:withError:]"), *MEMORY[0x1E0CB2D50], 0);
    if (a4)
    {
      v13 = v12;
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = FxPlugErrorDomain;
      v16 = 100002;
LABEL_12:
      v18 = (void *)objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, v13);
      result = 0;
      *a4 = v18;
      return result;
    }
    return 0;
  }
  if (v20 == 0 && v19 == 0.0)
    v8 = 6;
  else
    v8 = 3;
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
  return (id)objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("PositionIndependent"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8), CFSTR("PixelTransformSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  _BOOL4 v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PAEDirectionalBlur;
  -[PAESharedDefaultBase addParameters](&v10, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
  {
    v7 = objc_msgSend(v4, "versionAtCreation") == 0;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DirectionalBlur::Amount"), 0, 0), 1, 0, 7.0, 0.0, dbl_1B3050110[v7], 0.0, 32.0, 1.0);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DirectionalBlur::Angle"), 0, 0), 2, 0, 0.0, 0.0, 6.28318531);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DirectionalBlur::Crop"), 0, 0), 3, 0, 33);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DirectionalBlur::OSC Center"), 0, 0), 4, 2, 0.5, 0.5);
  }
  return v6;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  void *v10;
  void *v11;
  unint64_t var1;
  unint64_t var0;
  float v15;
  uint64_t v16;
  char v17;
  double v18;

  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4590);
  v11 = v10;
  if (v10)
  {
    v18 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v18, 1, a6->var0.var1);
    v17 = 0;
    objc_msgSend(v11, "getBoolValue:fromParm:atFxTime:", &v17, 3, a6->var0.var1);
    var0 = a5->var0;
    var1 = a5->var1;
    if (v17)
    {
      if (a3)
        *a3 = var0;
      if (a4)
LABEL_6:
        *a4 = var1;
    }
    else
    {
      v15 = v18 + v18;
      v16 = (int)(2 * vcvtps_s32_f32(v15));
      if (a3)
        *a3 = var0 + v16;
      var1 += v16;
      if (a4)
        goto LABEL_6;
    }
  }
  return v11 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  HDirectionalBlur *v10;
  __double2 v11;
  double v13[2];
  uint64_t v14;
  char v15;
  double v16;
  double v17[17];

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4590);
  if (v9)
  {
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
    v17[0] = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", v17, 1, a5->var0.var1);
    v17[0] = v17[0] * 0.5;
    v16 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v16, 2, a5->var0.var1);
    if (objc_msgSend(a4, "origin") == 2)
      v16 = 6.28318531 - v16;
    v15 = 0;
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v15, 3, a5->var0.var1);
    if (-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1))
    {
      if (v17[0] == 0.0)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef", v17[0]);
        else
          v13[0] = 0.0;
        objc_msgSend(a3, "setHeliumRef:", v13);
        if (*(_QWORD *)&v13[0])
          (*(void (**)(_QWORD))(**(_QWORD **)&v13[0] + 24))(*(_QWORD *)&v13[0]);
      }
      else
      {
        if (a4)
          objc_msgSend(a4, "heliumRef", v17[0]);
        else
          v14 = 0;
        v10 = (HDirectionalBlur *)HGObject::operator new(0x1B0uLL);
        HDirectionalBlur::HDirectionalBlur(v10);
        v11 = __sincos_stret(v16);
        v13[0] = (v11.__cosval * v17[1] + v11.__sinval * v17[2]) * v17[0];
        v13[1] = (v11.__cosval * v17[5] + v11.__sinval * v17[6]) * v17[0];
        HDirectionalBlur::init((uint64_t)v10, v13);
        *(_QWORD *)&v13[0] = v10;
        if (v10)
          (*(void (**)(HDirectionalBlur *))(*(_QWORD *)v10 + 16))(v10);
        (*(void (**)(HDirectionalBlur *, _QWORD, uint64_t))(*(_QWORD *)v10 + 120))(v10, 0, v14);
        if (v15)
          -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", v13, a4, a3);
        objc_msgSend(a3, "setHeliumRef:", v13);
        if (*(_QWORD *)&v13[0])
          (*(void (**)(_QWORD))(**(_QWORD **)&v13[0] + 24))(*(_QWORD *)&v13[0]);
        (*(void (**)(HDirectionalBlur *))(*(_QWORD *)v10 + 24))(v10);
        if (v14)
          (*(void (**)(uint64_t))(*(_QWORD *)v14 + 24))(v14);
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
