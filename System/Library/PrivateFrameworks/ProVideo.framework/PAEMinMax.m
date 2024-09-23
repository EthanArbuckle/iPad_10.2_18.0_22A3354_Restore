@implementation PAEMinMax

- (PAEMinMax)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEMinMax;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAEMinMax;
  -[PAESharedDefaultBase dealloc](&v2, sel_dealloc);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("InputSizeLimit"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  uint64_t v6;
  id result;
  objc_class *v8;
  id v9;
  double v10;

  v10 = 0.0;
  if ((objc_msgSend(-[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4), "getFloatValue:fromParm:atFxTime:", &v10, 2, a3.var1) & 1) != 0)
  {
    if (v10 == 0.0)
      v6 = 6;
    else
      v6 = 1;
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6, v10), CFSTR("PixelTransformSupport"), 0);
  }
  else if (a4)
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = -[PAEFilterDefaultBase getParamErrorFor:](self, "getParamErrorFor:", NSStringFromClass(v8));
    result = 0;
    *a4 = v9;
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
  void *v4;
  BOOL v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PAEMinMax;
  -[PAESharedDefaultBase addParameters](&v11, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v4)
    v5 = v3 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
  {
    if (objc_msgSend(v4, "versionAtCreation") >= 2)
      v7 = 250;
    else
      v7 = 1000;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MinMax::Mode"), 0, 0), 1, 0, objc_msgSend((id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MinMax::ModeEntries"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 1);
    LODWORD(v10) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MinMax::Radius"), 0, 0), 2, 0, 0, v7, 0, 0x100000064, v10);
  }
  return v6;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;
  double v13;
  double v14;
  int v15;
  BOOL v16;
  float32x2_t v18;
  int v19;
  HGTextureWrap *v20;
  char *v21;
  HGMinMax *v22;
  double v23;
  float v24;
  float32x2_t v25;
  float32x2_t v26[2];
  _OWORD v27[2];
  float32x2_t v28;
  uint64_t v29;
  double v30[16];

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
    return 0;
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
  v13 = v30[0];
  v14 = v30[5];
  v29 = 0;
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", (char *)&v29 + 4, 1, a5->var0.var1);
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v29, 2, a5->var0.var1);
  v15 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  if (!v15 || objc_msgSend(a4, "imageType") != 3)
    return 0;
  if (a4)
    objc_msgSend(a4, "heliumRef");
  else
    v28 = 0;
  v12 = (_DWORD)v29 == 0;
  if (!(_DWORD)v29)
  {
    objc_msgSend(a3, "setHeliumRef:", &v28);
    v16 = 0;
    goto LABEL_24;
  }
  -[PAESharedDefaultBase getImageBoundary:](self, "getImageBoundary:", a4);
  v27[0] = vcvtq_f64_f32(v26[0]);
  v27[1] = vcvtq_f64_f32(v26[1]);
  v16 = PCMatrix44Tmpl<double>::transformRect<double>(v30, (double *)v27, (uint64_t)v27);
  if (!v16)
  {
LABEL_24:
    v19 = 1;
    goto LABEL_32;
  }
  v25 = v28;
  if (v28)
    (*(void (**)(float32x2_t))(**(_QWORD **)&v28 + 16))(v28);
  -[PAESharedDefaultBase changeDOD:withRect:](self, "changeDOD:withRect:", &v25, v27);
  v18 = v26[0];
  if (*(_QWORD *)&v28 == *(_QWORD *)v26)
  {
    if (v28)
      (*(void (**)(void))(**(_QWORD **)&v28 + 24))();
  }
  else
  {
    if (v28)
    {
      (*(void (**)(void))(**(_QWORD **)&v28 + 24))();
      v18 = v26[0];
    }
    v28 = v18;
    v26[0] = 0;
  }
  if (v25)
    (*(void (**)(float32x2_t))(**(_QWORD **)&v25 + 24))(v25);
  v20 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
  HGTextureWrap::HGTextureWrap(v20);
  (*(void (**)(HGTextureWrap *, _QWORD, float32x2_t))(*(_QWORD *)v20 + 120))(v20, 0, v28);
  HGTextureWrap::SetTextureWrapMode((uint64_t)v20, (const char *)1, v21);
  v22 = (HGMinMax *)HGObject::operator new(0x1C0uLL);
  HGMinMax::HGMinMax(v22);
  (*(void (**)(HGMinMax *, _QWORD, HGTextureWrap *))(*(_QWORD *)v22 + 120))(v22, 0, v20);
  (*(void (**)(HGMinMax *, _QWORD, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 0, (float)SHIDWORD(v29), 0.0, 0.0, 0.0);
  v23 = (float)(int)v29;
  v24 = v13 * v23;
  *(float *)&v23 = v14 * v23;
  (*(void (**)(HGMinMax *, uint64_t, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 1, v24, *(float *)&v23, 0.0, 0.0);
  v26[0] = (float32x2_t)v22;
  (*(void (**)(HGMinMax *))(*(_QWORD *)v22 + 16))(v22);
  -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", v26, a4, a3);
  objc_msgSend(a3, "setHeliumRef:", v26);
  if (v26[0])
    (*(void (**)(_QWORD))(**(_QWORD **)v26 + 24))(*(_QWORD *)v26);
  (*(void (**)(HGMinMax *))(*(_QWORD *)v22 + 24))(v22);
  (*(void (**)(HGTextureWrap *))(*(_QWORD *)v20 + 24))(v20);
  v19 = 0;
LABEL_32:
  if (v28)
    (*(void (**)(float32x2_t))(**(_QWORD **)&v28 + 24))(v28);
  if (!v19)
    return v16;
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
