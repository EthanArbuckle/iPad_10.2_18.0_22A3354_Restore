@implementation PAETwirl

- (PAETwirl)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAETwirl;
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
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("MayRemapTime"), v4, CFSTR("PositionIndependent"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7;
  uint64_t v9;
  id result;
  objc_class *v11;
  id v12;
  char v13;
  double v14;

  v7 = -[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4);
  v14 = 0.0;
  if ((objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v14, 1, a3.var1) & 1) != 0
    && (v13 = 0, (objc_msgSend(v7, "getBoolValue:fromParm:atFxTime:", &v13, 4, a3.var1) & 1) != 0))
  {
    if (v14 == 0.0 && v13 == 0)
      v9 = 6;
    else
      v9 = 1;
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9, v14), CFSTR("PixelTransformSupport"), 0);
  }
  else if (a4)
  {
    v11 = (objc_class *)objc_opt_class();
    v12 = -[PAEFilterDefaultBase getParamErrorFor:](self, "getParamErrorFor:", NSStringFromClass(v11));
    result = 0;
    *a4 = v12;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)addParameters
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PAETwirl;
  -[PAESharedDefaultBase addParameters](&v10, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v4 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
  {
    v7 = (void *)v4;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Twirl::Amount"), 0, 0), 1, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Twirl::Twirl"), 0, 0), 2, 0, 180.0, -12.5663706, 12.5663706);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Twirl::Center"), 0, 0), 3, 0, 0.5, 0.5);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Twirl::Crop"), 0, 0), 4, objc_msgSend(v7, "versionAtCreation") < 3, 33);
  }
  return v6;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  uint64_t v10;
  void *v11;
  unint64_t var0;
  unint64_t var1;
  float v14;
  signed int v15;
  char v17;
  double v18;

  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4590);
  if (v10)
  {
    v11 = (void *)v10;
    LOBYTE(v10) = 0;
    if (a3)
    {
      if (a4)
      {
        v18 = 0.0;
        objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &v18, 1, a6->var0.var1);
        v17 = 0;
        objc_msgSend(v11, "getBoolValue:fromParm:atFxTime:", &v17, 4, a6->var0.var1);
        var0 = a5->var0;
        var1 = a5->var1;
        if (!v17)
        {
          v14 = v18 * (double)var0;
          v15 = 2 * vcvtps_s32_f32(v14);
          var0 += v15;
          var1 += v15;
        }
        *a3 = var0;
        *a4 = var1;
        LOBYTE(v10) = 1;
      }
    }
  }
  return v10;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  int v12;
  void *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  unsigned int v15;
  unsigned int v16;
  BOOL v17;
  _BOOL4 v18;
  id v19;
  unint64_t v20;
  id v25;
  id v26;
  HTwirl *v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  HGOverwrite *v34;
  HGOverwrite *v36;
  char v37;
  __int128 v38;
  __int128 v39;
  double v40[16];
  double v41;
  double v42;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    _ZF = v10 == 0;
  else
    _ZF = 1;
  if (_ZF)
    goto LABEL_6;
  v13 = (void *)v10;
  var1 = a5->var0.var1;
  v42 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v42, 1, var1);
  if (v42 == 0.0)
  {
    if (a4)
      objc_msgSend(a4, "heliumRef", v42);
    else
      v40[0] = 0.0;
    objc_msgSend(a3, "setHeliumRef:", v40);
    if (*(_QWORD *)&v40[0])
      (*(void (**)(_QWORD))(**(_QWORD **)&v40[0] + 24))(*(_QWORD *)&v40[0]);
LABEL_32:
    LOBYTE(v12) = 1;
    return v12;
  }
  v15 = objc_msgSend(v13, "versionAtCreation", v42);
  v16 = v15;
  v17 = v15 == 1 || v15 > 2;
  v18 = v17;
  v19 = v18 ? a4 : a3;
  v20 = objc_msgSend(v19, "width");
  v41 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v41, 2, var1);
  -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
  __asm { FMOV            V0.2D, #0.5 }
  v39 = _Q0;
  objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v39, (char *)&v39 + 8, 3, var1);
  v25 = v16 == 1 ? a3 : a4;
  -[PAESharedDefaultBase convertRelativeToPixelCoordinates:withImage:](self, "convertRelativeToPixelCoordinates:withImage:", &v39, v25);
  v39 = v38;
  v37 = 0;
  objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v37, 4, a5->var0.var1);
  v26 = v18 ? a3 : a4;
  if (objc_msgSend(v26, "imageType") != 3)
  {
LABEL_6:
    LOBYTE(v12) = 0;
  }
  else
  {
    v12 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    if (v12)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        *(_QWORD *)&v38 = 0;
      v27 = (HTwirl *)HGObject::operator new(0x1C0uLL);
      HTwirl::HTwirl(v27);
      (*(void (**)(HTwirl *, _QWORD, _QWORD))(*(_QWORD *)v27 + 120))(v27, 0, v38);
      v28 = *(double *)&v39;
      v29 = *((double *)&v39 + 1);
      v30 = v42 * (double)v20 * v40[0];
      v31 = v41;
      v32 = v40[0];
      v33 = v40[5];
      HTwirl::init(v27, v28, v29, v30, v31, v32, v33);
      v34 = (HGOverwrite *)HGObject::operator new(0x1A0uLL);
      HGOverwrite::HGOverwrite(v34);
      (*(void (**)(HGOverwrite *, _QWORD, _QWORD))(*(_QWORD *)v34 + 120))(v34, 0, v38);
      (*(void (**)(HGOverwrite *, uint64_t, HTwirl *))(*(_QWORD *)v34 + 120))(v34, 1, v27);
      v36 = v34;
      (*(void (**)(HGOverwrite *))(*(_QWORD *)v34 + 16))(v34);
      if (v37)
        -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v36, a4, a3);
      objc_msgSend(a3, "setHeliumRef:", &v36);
      if (v36)
        (*(void (**)(HGOverwrite *))(*(_QWORD *)v36 + 24))(v36);
      (*(void (**)(HGOverwrite *))(*(_QWORD *)v34 + 24))(v34);
      (*(void (**)(HTwirl *))(*(_QWORD *)v27 + 24))(v27);
      if ((_QWORD)v38)
        (*(void (**)(_QWORD))(*(_QWORD *)v38 + 24))(v38);
      goto LABEL_32;
    }
  }
  return v12;
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
