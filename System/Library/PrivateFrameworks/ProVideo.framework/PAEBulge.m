@implementation PAEBulge

- (PAEBulge)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEBulge;
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

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("InputSizeLimit"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
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
  if ((objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v14, 2, a3.var1) & 1) != 0
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
  void *v4;
  BOOL v5;
  BOOL v6;
  void *v7;
  unsigned int v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PAEBulge;
  -[PAESharedDefaultBase addParameters](&v11, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
  {
    v7 = v4;
    v8 = objc_msgSend(v4, "versionAtCreation");
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Bulge::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Bulge::Amount"), 0, 0), 2, 0, 300.0, 0.0, dbl_1B3050670[v8 < 2], 0.0, dbl_1B3050080[v8 < 2], 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Bulge::Scale"), 0, 0), 3, 0, 0.5, -5.0, 5.0, -2.0, 2.0, 0.5);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Bulge::Crop"), 0, 0), 4, objc_msgSend(v7, "versionAtCreation") == 0, 33);
  }
  return v6;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  void *v6;
  unsigned __int8 v7;

  v6 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v6)
  {
    v7 = 0;
    objc_msgSend(v6, "getBoolValue:fromParm:atFxTime:", &v7, 4, a4->var0.var1);
    *a3 = v7;
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  HGOverwrite *v15;
  HgcBulge *v16;
  unint64_t v17;
  unint64_t v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  HGOverwrite *v27;
  HGOverwrite *v29;
  HGOverwrite *v30;
  HGOverwrite *v31;
  char v32;
  double v33;
  double v34;
  double v35;
  _QWORD v36[2];
  double v37;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = v9;
    v37 = 150.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v37, 2, a5->var0.var1);
    if (v37 == 0.0)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef", v37);
      else
        v36[0] = 0;
      objc_msgSend(a3, "setHeliumRef:", v36);
      if (v36[0])
        (*(void (**)(_QWORD))(*(_QWORD *)v36[0] + 24))(v36[0]);
LABEL_12:
      LOBYTE(v9) = 1;
      return (char)v9;
    }
    -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4, v37);
    v12 = *(double *)v36;
    v11 = *(double *)&v36[1];
    v34 = 0.5;
    v35 = 0.5;
    objc_msgSend(v10, "getXValue:YValue:fromParm:atFxTime:", &v35, &v34, 1, a5->var0.var1);
    v13 = objc_msgSend(a4, "width");
    v35 = v35 * (double)v13;
    v14 = objc_msgSend(a4, "height");
    v34 = v34 * (double)v14;
    v33 = 0.5;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v33, 3, a5->var0.var1);
    v32 = 0;
    objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v32, 4, a5->var0.var1);
    LODWORD(v9) = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    if ((_DWORD)v9)
    {
      if (objc_msgSend(a4, "imageType") == 3)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v31 = 0;
        if (v32)
        {
          v29 = v31;
          if (v31)
            (*(void (**)(HGOverwrite *))(*(_QWORD *)v31 + 16))(v31);
          -[PAESharedDefaultBase smear:fromImage:toImage:](self, "smear:fromImage:toImage:", &v29, a4, a4);
          v15 = v30;
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
              v15 = v30;
            }
            v30 = 0;
            v31 = v15;
          }
          if (v29)
            (*(void (**)(HGOverwrite *))(*(_QWORD *)v29 + 24))(v29);
        }
        v16 = (HgcBulge *)HGObject::operator new(0x1A0uLL);
        HgcBulge::HgcBulge(v16);
        *(_QWORD *)v16 = &unk_1E64DCBD0;
        v17 = objc_msgSend(a3, "width");
        v18 = objc_msgSend(a3, "height");
        (*(void (**)(HgcBulge *, _QWORD, HGOverwrite *))(*(_QWORD *)v16 + 120))(v16, 0, v31);
        v19 = v35 - (double)v17 * 0.5;
        v20 = v34 + (double)v18 * -0.5;
        (*(void (**)(HgcBulge *, _QWORD, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 0, v19, v20, 0.0, 0.0);
        v21 = 1.0 / (v37 + 0.0001);
        v22 = v33 + -1.0;
        (*(void (**)(HgcBulge *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 1, v21, v22, 0.0, 0.0);
        v23 = v12;
        v24 = v11;
        v25 = 1.0 / v12;
        v26 = 1.0 / v11;
        (*(void (**)(HgcBulge *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 2, v23, v24, v25, v26);
        v27 = (HGOverwrite *)HGObject::operator new(0x1A0uLL);
        HGOverwrite::HGOverwrite(v27);
        (*(void (**)(HGOverwrite *, _QWORD, HGOverwrite *))(*(_QWORD *)v27 + 120))(v27, 0, v31);
        (*(void (**)(HGOverwrite *, uint64_t, HgcBulge *))(*(_QWORD *)v27 + 120))(v27, 1, v16);
        v30 = v27;
        (*(void (**)(HGOverwrite *))(*(_QWORD *)v27 + 16))(v27);
        if (v32)
          -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v30, a4, a3);
        objc_msgSend(a3, "setHeliumRef:", &v30, v29);
        if (v30)
          (*(void (**)(HGOverwrite *))(*(_QWORD *)v30 + 24))(v30);
        (*(void (**)(HGOverwrite *))(*(_QWORD *)v27 + 24))(v27);
        (*(void (**)(HgcBulge *))(*(_QWORD *)v16 + 24))(v16);
        if (v31)
          (*(void (**)(HGOverwrite *))(*(_QWORD *)v31 + 24))(v31);
        goto LABEL_12;
      }
      LOBYTE(v9) = 0;
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
