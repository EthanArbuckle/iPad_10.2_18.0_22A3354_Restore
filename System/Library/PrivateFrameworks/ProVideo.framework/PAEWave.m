@implementation PAEWave

- (PAEWave)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEWave;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAEWave;
  -[PAESharedDefaultBase dealloc](&v2, sel_dealloc);
}

- (BOOL)variesOverTime
{
  return 0;
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

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  uint64_t v6;
  id result;
  id v8;
  double v9;

  v9 = 0.0;
  if ((objc_msgSend(-[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4), "getFloatValue:fromParm:atFxTime:", &v9, 1, a3.var1) & 1) != 0)
  {
    if (v9 == 0.0)
      v6 = 6;
    else
      v6 = 1;
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6, v9), CFSTR("PixelTransformSupport"), 0);
  }
  else if (a4)
  {
    v8 = -[PAEFilterDefaultBase getParamErrorFor:](self, "getParamErrorFor:", CFSTR("PAEWave"));
    result = 0;
    *a4 = v8;
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
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEWave;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Wave::Amplitude"), 0, 0), 1, 0, 10.0, 0.0, 500.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Wave::Wave Length"), 0, 0), 2, 0, 100.0, 1.0, 500.0, 1.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Wave::Offset"), 0, 0), 3, 0, 100.0, -500.0, 500.0, -500.0, 500.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Wave::Vertical"), 0, 0), 4, 0, 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Wave::Repeat Edges"), 0, 0), 5, 1, 33);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  double v11;
  int v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  double v16;
  double v17;
  HGNode *v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  HgcWave *v24;
  float v25;
  float v26;
  float v27;
  float v28;
  __n128 v29;
  __n128 v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  char v40;
  unint64_t v41;
  unint64_t v42;
  float32x2_t v43;
  HGNode *v44;
  float32x2_t v45[2];
  _OWORD v46[2];
  HGNode *v47;
  double v48[5];
  double v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int16 v55;
  double v56;
  double v57;
  double v58[2];

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (!v9)
  {
LABEL_11:
    LOBYTE(v12) = 1;
    return v12;
  }
  v10 = v9;
  v57 = 0.0;
  v58[0] = 0.0;
  v56 = 0.0;
  v55 = 0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", v58, 1, a5->var0.var1);
  if (v58[0] == 0.0)
  {
    if (a4)
      objc_msgSend(a4, "heliumRef", v58[0]);
    else
      v48[0] = 0.0;
    objc_msgSend(a3, "setHeliumRef:", v48);
    if (*(_QWORD *)&v48[0])
      (*(void (**)(_QWORD))(**(_QWORD **)&v48[0] + 24))(*(_QWORD *)&v48[0]);
    goto LABEL_11;
  }
  objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v57, 2, a5->var0.var1, v58[0]);
  objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v56, 3, a5->var0.var1);
  objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", (char *)&v55 + 1, 4, a5->var0.var1);
  objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v55, 5, a5->var0.var1);
  v54 = 0;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  if (a4)
  {
    objc_msgSend(a4, "imageInfo");
    v11 = v56;
    if (*((_QWORD *)&v52 + 1) == 2)
    {
      v11 = -v56;
      v56 = -v56;
    }
  }
  else
  {
    v11 = v56;
  }
  v13 = objc_msgSend(a4, "width");
  v14 = v56;
  v15 = objc_msgSend(a4, "height");
  v16 = v57;
  if (v57 == 0.0)
    v57 = 1.0;
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4, v16);
  v17 = fabs(v49) * v57;
  v57 = v17;
  v58[0] = fabs(v48[0]) * v58[0];
  v12 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  if (v12)
  {
    if (objc_msgSend(a4, "imageType") == 3)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        v47 = 0;
      -[PAESharedDefaultBase getImageBoundary:](self, "getImageBoundary:", a4);
      v46[0] = vcvtq_f64_f32(v45[0]);
      v46[1] = vcvtq_f64_f32(v45[1]);
      if (PCMatrix44Tmpl<double>::transformRect<double>(v48, (double *)v46, (uint64_t)v46))
      {
        v44 = v47;
        if (v47)
          (*(void (**)(HGNode *))(*(_QWORD *)v47 + 16))(v47);
        -[PAESharedDefaultBase changeDOD:withRect:](self, "changeDOD:withRect:", &v44, v46);
        v18 = (HGNode *)v45[0];
        if (v47 == (HGNode *)v45[0])
        {
          if (v47)
            (*(void (**)(void))(*(_QWORD *)v47 + 24))();
        }
        else
        {
          if (v47)
          {
            (*(void (**)(void))(*(_QWORD *)v47 + 24))();
            v18 = (HGNode *)v45[0];
          }
          v47 = v18;
          v45[0] = 0;
        }
        if (v44)
          (*(void (**)(HGNode *))(*(_QWORD *)v44 + 24))(v44);
        v19 = objc_msgSend(a4, "width");
        v20 = objc_msgSend(a4, "height");
        if (*((_QWORD *)&v52 + 1) == 2)
          v21 = -(6.28318531 / v17);
        else
          v21 = 6.28318531 / v17;
        v22 = objc_msgSend(a3, "width");
        v23 = objc_msgSend(a3, "height");
        v42 = objc_msgSend(a3, "width");
        v41 = objc_msgSend(a3, "height");
        v24 = (HgcWave *)HGObject::operator new(0x1A0uLL);
        HgcWave::HgcWave(v24);
        *(_QWORD *)v24 = &unk_1E64E1150;
        v45[0] = (float32x2_t)v24;
        v40 = v55;
        HGNode::SetInput((HGNode *)v24, 0, v47);
        v25 = v58[0];
        (*(void (**)(_QWORD, _QWORD, float, float, float, float))(**(_QWORD **)v45 + 96))(*(_QWORD *)v45, 0, v25, 0.0, 0.0, 0.0);
        v26 = v21;
        (*(void (**)(_QWORD, uint64_t, float, float, float, float))(**(_QWORD **)v45 + 96))(*(_QWORD *)v45, 1, v26, 0.0, 0.0, 0.0);
        v27 = v11 / 100.0 * (double)v13 + (double)v19 * -0.5;
        v28 = v14 / 100.0 * (double)v15 + (double)v20 * -0.5;
        (*(void (**)(_QWORD, uint64_t, float, float, float, float))(**(_QWORD **)v45 + 96))(*(_QWORD *)v45, 2, v27, v28, 0.0, 0.0);
        v30.n128_u32[0] = 1.0;
        if (HIBYTE(v55))
          v29.n128_f32[0] = 0.0;
        else
          v29.n128_f32[0] = 1.0;
        if (!HIBYTE(v55))
          v30.n128_f32[0] = 0.0;
        (*(void (**)(__n128, __n128, float, float))(**(_QWORD **)v45 + 96))(v29, v30, 0.0, 0.0);
        v31 = (double)v22 * 0.5 + -2.0;
        v32 = (double)v23 * 0.5 + -2.0;
        v33 = (float)v42 * -0.5 + 2.0;
        v34 = (float)v41 * -0.5 + 2.0;
        (*(void (**)(_QWORD, uint64_t, float, float, float, float))(**(_QWORD **)v45 + 96))(*(_QWORD *)v45, 4, v31, v32, v33, v34);
        (*(void (**)(_QWORD, uint64_t, float, float, float, float))(**(_QWORD **)v45 + 96))(*(_QWORD *)v45, 5, (float)(char)(v40 - 1), (float)(char)(v40 - 1), (float)(char)(v40 - 1), (float)(char)(v40 - 1));
        v35 = v48[0];
        v36 = v49;
        v37 = 1.0 / v48[0];
        v38 = 1.0 / fabs(v49);
        (*(void (**)(_QWORD, uint64_t, float, float, float, float))(**(_QWORD **)v45 + 96))(*(_QWORD *)v45, 6, v35, fabsf(v36), v37, v38);
        -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", v45, a4, a3);
        v43 = v45[0];
        if (v45[0])
          (*(void (**)(_QWORD))(**(_QWORD **)v45 + 16))(*(_QWORD *)v45);
        objc_msgSend(a3, "setHeliumRef:", &v43);
        if (v43)
          (*(void (**)(float32x2_t))(**(_QWORD **)&v43 + 24))(v43);
        if (v45[0])
          (*(void (**)(_QWORD))(**(_QWORD **)v45 + 24))(*(_QWORD *)v45);
        if (v47)
          (*(void (**)(HGNode *))(*(_QWORD *)v47 + 24))(v47);
        goto LABEL_11;
      }
      if (v47)
        (*(void (**)(HGNode *))(*(_QWORD *)v47 + 24))(v47);
    }
    LOBYTE(v12) = 0;
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

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

@end
