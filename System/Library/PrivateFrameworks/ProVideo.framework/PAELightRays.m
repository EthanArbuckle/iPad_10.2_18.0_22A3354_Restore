@implementation PAELightRays

- (PAELightRays)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAELightRays;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAELightRays;
  -[PAESharedDefaultBase dealloc](&v2, sel_dealloc);
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
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("InputSizeLimit"), 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id result;
  objc_class *v13;
  id v14;
  char v15;
  double v16;

  v7 = -[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4);
  v16 = 0.0;
  v15 = 0;
  if (objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v16, 1, a3.var1)
    && (objc_msgSend(v7, "getBoolValue:fromParm:atFxTime:", &v15, 5, a3.var1) & 1) != 0)
  {
    if (v16 == 0.0)
      v8 = 6;
    else
      v8 = 1;
    if (v15)
      v9 = 1;
    else
      v9 = 3;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8, v16);
    return (id)objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9), CFSTR("AutoColorProcessingSupport"), 0);
  }
  else if (a4)
  {
    v13 = (objc_class *)objc_opt_class();
    v14 = -[PAEFilterDefaultBase getParamErrorFor:](self, "getParamErrorFor:", NSStringFromClass(v13));
    result = 0;
    *a4 = v14;
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
  unsigned int v4;
  _BOOL8 v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PAELightRays;
  -[PAESharedDefaultBase addParameters](&v8, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v4 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190), "versionAtCreation");
  if (v3)
  {
    v5 = v4 < 2;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LightRays::Amount"), 0, 0), 1, 0, 50.0, 0.0, 200.0, 0.0, 200.0, 1.0);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LightRays::Center"), 0, 0), 2, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LightRays::Glow"), 0, 0), 3, 0, 1.5, 0.0, 8.0, 0.0, 8.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LightRays::Expansion"), 0, 0), 4, 32, 0.4, 0.0, 2.0, 0.0, 2.0, 0.1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LightRays::Clip"), 0, 0), 5, v5, 1);
  }
  return 1;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  void *v10;
  void *v11;
  unint64_t var1;
  float v13;
  uint64_t v14;
  double v16;
  double v17;

  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4590);
  v11 = v10;
  if (v10)
  {
    v17 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v17, 1, a6->var0.var1);
    v16 = 0.0;
    objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &v16, 4, a6->var0.var1);
    var1 = a5->var1;
    v13 = v17 * v16;
    v14 = (int)(2 * vcvtps_s32_f32(v13));
    if (a3)
      *a3 = a5->var0 + v14;
    if (a4)
      *a4 = var1 + v14;
  }
  return v11 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  int64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  HGTextureWrap *v16;
  char *v17;
  double v18;
  double v19;
  float v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  float v33;
  float v34;
  float v35;
  float *v36;
  int64_t v37;
  float v38;
  HGNode *v39;
  uint64_t v40;
  float v41;
  float v42;
  float *v43;
  HGRect *v44;
  HgcConvolvePass8tapPoint *v45;
  __n128 v46;
  uint64_t i;
  __n128 v48;
  uint64_t j;
  HgcScaleAndAddClampDazzle *v50;
  __n128 v51;
  id *v53;
  void *v54;
  HgcScaleAndAddClampDazzle *v55;
  double v56;
  double v57;
  uint64_t v58;
  char v59;
  double v60;
  double v61;
  double v62;
  double v63;
  float v64[1024];
  HGRect v65[256];
  _QWORD v66[4];

  v6 = MEMORY[0x1E0C80A78](self);
  v8 = v7;
  v10 = v9;
  v54 = v11;
  v66[2] = *MEMORY[0x1E0C80C00];
  v53 = (id *)v6;
  v12 = (void *)objc_msgSend(*(id *)(v6 + 8), "apiForProtocol:", &unk_1EF0A4590);
  v13 = v12;
  if (v12)
  {
    v63 = 0.0;
    objc_msgSend(v12, "getFloatValue:fromParm:atFxTime:", &v63, 1, *v8);
    if (v63 == 0.0)
    {
      if (v10)
        objc_msgSend(v10, "heliumRef", v63);
      else
        *(_QWORD *)&v65[0].var0 = 0;
      objc_msgSend(v54, "setHeliumRef:", v65);
      if (*(_QWORD *)&v65[0].var0)
        (*(void (**)(_QWORD))(**(_QWORD **)&v65[0].var0 + 24))(*(_QWORD *)&v65[0].var0);
    }
    else
    {
      v61 = 0.5;
      v62 = 0.5;
      objc_msgSend(v13, "getXValue:YValue:fromParm:atFxTime:", &v62, &v61, 2, *v8, v63);
      v60 = 0.0;
      objc_msgSend(v13, "getFloatValue:fromParm:atFxTime:", &v60, 3, *v8);
      v59 = 0;
      objc_msgSend(v13, "getBoolValue:fromParm:atFxTime:", &v59, 5, *v8);
      if (v10)
        objc_msgSend(v10, "heliumRef");
      else
        v58 = 0;
      v14 = objc_msgSend(v54, "width");
      v15 = objc_msgSend(v54, "height");
      v66[0] = 0;
      v66[1] = 0;
      v16 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
      HGTextureWrap::HGTextureWrap(v16);
      HGTextureWrap::SetTextureWrapMode((uint64_t)v16, 0, v17);
      HGTextureWrap::SetTextureBorderColor(v16, (float *)v66);
      (*(void (**)(HGTextureWrap *, _QWORD, uint64_t))(*(_QWORD *)v16 + 120))(v16, 0, v58);
      v18 = (double)v14 * 0.5;
      v19 = (double)v15 * 0.5;
      v20 = v18;
      v21 = v19;
      *(_QWORD *)&v65[0].var0 = HGRectMake4f(v22, -v20, -v21, v20, v21);
      *(_QWORD *)&v65[0].var2 = v23;
      HGTextureWrap::SetCropRect(v16, v65);
      v24 = objc_msgSend((id)objc_msgSend(v53[1], "apiForProtocol:", &unk_1EF0A8190), "versionAtCreation");
      v25 = v62;
      if (v24)
      {
        v26 = objc_msgSend(v10, "width");
        v27 = objc_msgSend(v10, "width");
        v28 = v61;
        v5 = objc_msgSend(v10, "height");
        v29 = v25 * (double)v26 + (double)v27 * -0.5;
        v30 = v28 * (double)(unint64_t)v5 + (double)(unint64_t)objc_msgSend(v10, "height") * -0.5;
      }
      else
      {
        v29 = v62 * (double)v14 - v18;
        v30 = v61 * (double)v15 - v19;
      }
      objc_msgSend(v53, "getScaleForImage:", v10);
      v31 = v56;
      if (v56 <= v57)
        v31 = v57;
      LODWORD(v5) = vcvtpd_s64_f64(v31 * v63 * 0.5);
      if ((int)v5 >= 1)
      {
        v32 = 0;
        v33 = 0.00390625 / v31;
        v34 = 0.0;
        do
        {
          v35 = 1.0 - (float)((float)(int)v32 / (float)(int)v5);
          *((float *)&v65[0].var0 + v32) = v35;
          v34 = v34 + v35;
          v64[v32] = 1.0 - (float)(v33 * (float)(int)v32);
          ++v32;
        }
        while (v5 != v32);
        v36 = (float *)v65;
        v37 = v5;
        v38 = 1.0 / v34;
        do
        {
          *v36 = v38 * *v36;
          ++v36;
          --v37;
        }
        while (v37);
      }
      v55 = 0;
      if ((_DWORD)v5)
      {
        v39 = (HGNode *)HGObject::operator new(0x1A0uLL);
        HGNode::HGNode(v39);
        if (v39)
          v55 = (HgcScaleAndAddClampDazzle *)v39;
        if ((int)v5 >= 1)
        {
          v40 = 0;
          v41 = v29;
          v42 = v30;
          v43 = v64;
          v44 = v65;
          do
          {
            v45 = (HgcConvolvePass8tapPoint *)HGObject::operator new(0x1B0uLL);
            HgcConvolvePass8tapPoint::HgcConvolvePass8tapPoint(v45);
            *(_QWORD *)v45 = &unk_1E64DAB40;
            HGNode::SetInput((HGNode *)v45, 0, (HGNode *)v16);
            for (i = 0; i != 8; ++i)
            {
              v46.n128_u32[0] = 1.0;
              if (v40 + i < v5)
                v46.n128_f32[0] = v43[i];
              (*(void (**)(HgcConvolvePass8tapPoint *, uint64_t, __n128, float, float, float))(*(_QWORD *)v45 + 96))(v45, i, v46, v46.n128_f32[0], 0.0, 0.0);
            }
            for (j = 0; j != 8; ++j)
            {
              v46.n128_u32[0] = 0;
              v48.n128_u32[0] = 0;
              if (v40 + j < v5)
              {
                v48.n128_u32[0] = *(&v44->var0 + j);
                v46.n128_f64[0] = v60 * v48.n128_f32[0];
                v46.n128_f32[0] = v46.n128_f64[0];
              }
              (*(void (**)(HgcConvolvePass8tapPoint *, _QWORD, __n128, float, float, __n128))(*(_QWORD *)v45 + 96))(v45, (j + 8), v46, v46.n128_f32[0], v46.n128_f32[0], v48);
            }
            (*(void (**)(HgcConvolvePass8tapPoint *, uint64_t, float, float, float, float))(*(_QWORD *)v45 + 96))(v45, 16, v41, v42, 0.0, 0.0);
            v50 = (HgcScaleAndAddClampDazzle *)HGObject::operator new(0x1A0uLL);
            HgcScaleAndAddClampDazzle::HgcScaleAndAddClampDazzle(v50);
            (*(void (**)(HgcScaleAndAddClampDazzle *, _QWORD, HgcConvolvePass8tapPoint *))(*(_QWORD *)v50 + 120))(v50, 0, v45);
            (*(void (**)(HgcScaleAndAddClampDazzle *, uint64_t, HGNode *))(*(_QWORD *)v50 + 120))(v50, 1, v39);
            (*(void (**)(HgcScaleAndAddClampDazzle *, _QWORD, float, float, float, float))(*(_QWORD *)v50 + 96))(v50, 0, 1.0, 1.0, 1.0, 1.0);
            v51.n128_u32[0] = 2139095039;
            if (v59)
              v51.n128_f32[0] = 1.0;
            (*(void (**)(HgcScaleAndAddClampDazzle *, uint64_t, __n128, float, float, float))(*(_QWORD *)v50 + 96))(v50, 1, v51, 0.0, 0.0, 0.0);
            if (v55 != v50)
            {
              if (v55)
                (*(void (**)(void))(*(_QWORD *)v55 + 24))();
              v55 = v50;
              (*(void (**)(HgcScaleAndAddClampDazzle *))(*(_QWORD *)v50 + 16))(v50);
            }
            (*(void (**)(HgcScaleAndAddClampDazzle *))(*(_QWORD *)v50 + 24))(v50);
            (*(void (**)(HgcConvolvePass8tapPoint *))(*(_QWORD *)v45 + 24))(v45);
            v40 += 8;
            v43 += 8;
            v44 += 2;
            v39 = (HGNode *)v50;
          }
          while ((int)v40 < (int)v5);
        }
      }
      else
      {
        v55 = v16;
        (*(void (**)(HGTextureWrap *))(*(_QWORD *)v16 + 16))(v16);
      }
      objc_msgSend(v53, "crop:fromImage:toImage:", &v55, v54, v54);
      objc_msgSend(v54, "setHeliumRef:", &v55);
      if (v55)
        (*(void (**)(HgcScaleAndAddClampDazzle *))(*(_QWORD *)v55 + 24))(v55);
      (*(void (**)(HGTextureWrap *))(*(_QWORD *)v16 + 24))(v16);
      if (v58)
        (*(void (**)(uint64_t))(*(_QWORD *)v58 + 24))(v58);
    }
  }
  return v13 != 0;
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
