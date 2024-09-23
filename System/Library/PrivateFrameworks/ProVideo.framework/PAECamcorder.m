@implementation PAECamcorder

- (PAECamcorder)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAECamcorder;
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
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 65792);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 590080);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("SDRWorkingSpace"), v8, CFSTR("HDRWorkingSpace"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PAECamcorder;
  -[PAESharedDefaultBase addParameters](&v16, sel_addParameters);
  v3 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (!v3)
    return 1;
  v4 = (void *)v3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Camcorder::Offset Red X"), 0, 0), 1, 0, 0.0, -100.0, 100.0, -100.0, 100.0, 0.1);
  v7 = v6 & objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Camcorder::Offset Red Y"), 0, 0), 2, 0, 0.0, -100.0, 100.0, -100.0, 100.0, 0.1);
  v8 = objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Camcorder::Offset Green X"), 0, 0), 4, 0, 0.0, -100.0, 100.0, -100.0, 100.0, 0.1);
  v9 = v7 & v8 & objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Camcorder::Offset Green Y"), 0, 0), 5, 0, 0.0, -100.0, 100.0, -100.0, 100.0, 0.1);
  v10 = objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Camcorder::Offset Blue X"), 0, 0), 7, 0, 0.0, -100.0, 100.0, -100.0, 100.0, 0.1);
  v11 = v10 & objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Camcorder::Offset Blue Y"), 0, 0), 8, 0, 0.0, -100.0, 100.0, -100.0, 100.0, 0.1);
  v12 = v9 & v11 & objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Camcorder::Blur Amount"), 0, 0), 9, 0, 0.0, 0.0, 50.0, 0.0, 50.0, 0.1);
  v13 = objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Camcorder::Blur Red"), 0, 0), 10, 0, 0);
  v14 = v13 & objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Camcorder::Blur Green"), 0, 0), 11, 0, 0);
  return v12 & v14 & objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Camcorder::Blur Blue"), 0, 0), 12, 0, 0);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v8;
  void *v9;
  double var3;
  double var4;
  HgcCamcorder *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  HGaussianBlur *v19;
  float v20;
  float v21;
  float v22;
  float v23;
  HgcChannelBlur *v24;
  void (*v25)(HgcChannelBlur *);
  uint64_t v27;
  HgcChannelBlur *v28;
  char v29;
  __int16 v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;

  v8 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v8)
  {
    v9 = v8;
    v36 = 0.0;
    v37 = 0.0;
    v34 = 0.0;
    v35 = 0.0;
    v32 = 0.0;
    v33 = 0.0;
    v31 = 0.0;
    v30 = 0;
    v29 = 0;
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v37, 1, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v36, 2, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v35, 4, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v34, 5, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v33, 7, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v32, 8, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v31, 9, a5->var0.var1);
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", (char *)&v30 + 1, 10, a5->var0.var1);
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v30, 11, a5->var0.var1);
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v29, 12, a5->var0.var1);
    var3 = a5->var3;
    var4 = a5->var4;
    v36 = var4 * v36;
    v37 = var3 * v37;
    v34 = var4 * v34;
    v35 = var3 * v35;
    v32 = var4 * v32;
    v33 = var3 * v33;
    v28 = 0;
    if (a4)
      objc_msgSend(a4, "heliumRef");
    else
      v27 = 0;
    v12 = (HgcCamcorder *)HGObject::operator new(0x1B0uLL);
    HgcCamcorder::HgcCamcorder(v12);
    (*(void (**)(HgcCamcorder *, _QWORD, uint64_t))(*(_QWORD *)v12 + 120))(v12, 0, v27);
    v13 = v37;
    v14 = v35;
    v15 = v33;
    (*(void (**)(HgcCamcorder *, _QWORD, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 0, v13, v14, v15, 0.0);
    v16 = v36;
    v17 = v34;
    v18 = v32;
    (*(void (**)(HgcCamcorder *, uint64_t, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 1, v16, v17, v18, 0.0);
    v19 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
    HGaussianBlur::HGaussianBlur(v19);
    v20 = v31;
    HGaussianBlur::init(v19, v20, 1.0, 1.0, 0, 0, 0);
    (*(void (**)(HGaussianBlur *, _QWORD, HgcCamcorder *))(*(_QWORD *)v19 + 120))(v19, 0, v12);
    if (HIBYTE(v30))
      v21 = 1.0;
    else
      v21 = 0.0;
    if ((_BYTE)v30)
      v22 = 1.0;
    else
      v22 = 0.0;
    if (v29)
      v23 = 1.0;
    else
      v23 = 0.0;
    v24 = (HgcChannelBlur *)HGObject::operator new(0x1A0uLL);
    HgcChannelBlur::HgcChannelBlur(v24);
    (*(void (**)(HgcChannelBlur *, uint64_t, HGaussianBlur *))(*(_QWORD *)v24 + 120))(v24, 1, v19);
    (*(void (**)(HgcChannelBlur *, _QWORD, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 0, v21, v22, v23, 1.0);
    (*(void (**)(HgcChannelBlur *, _QWORD, HgcCamcorder *))(*(_QWORD *)v24 + 120))(v24, 0, v12);
    v25 = *(void (**)(HgcChannelBlur *))(*(_QWORD *)v24 + 16);
    v28 = v24;
    v25(v24);
    objc_msgSend(a3, "setHeliumRef:", &v28);
    (*(void (**)(HgcChannelBlur *))(*(_QWORD *)v24 + 24))(v24);
    (*(void (**)(HGaussianBlur *))(*(_QWORD *)v19 + 24))(v19);
    (*(void (**)(HgcCamcorder *))(*(_QWORD *)v12 + 24))(v12);
    if (v27)
      (*(void (**)(uint64_t))(*(_QWORD *)v27 + 24))(v27);
    if (v28)
      (*(void (**)(HgcChannelBlur *))(*(_QWORD *)v28 + 24))(v28);
  }
  return 1;
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
