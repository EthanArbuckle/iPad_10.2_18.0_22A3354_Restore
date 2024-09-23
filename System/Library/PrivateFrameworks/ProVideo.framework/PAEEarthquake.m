@implementation PAEEarthquake

- (PAEEarthquake)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEEarthquake;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (BOOL)variesOverTime
{
  return 1;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
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
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PAEEarthquake;
  -[PAESharedDefaultBase addParameters](&v8, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Earthquake::Twist"), 0, 0), 1, 0, 0.1, 0.0, 10.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Earthquake::Horizontal Shake"), 0, 0), 2, 0, 0.1, 0.0, 10.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Earthquake::Vertical Shake"), 0, 0), 3, 0, 0.1, 0.0, 10.0, 0.0, 1.0, 0.01);
    LODWORD(v6) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Earthquake::Layers"), 0, 0), 4, 1, 1, 8, 1, 0x100000008, v6);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Earthquake::Center"), 0, 0), 5, 0, 0.5, 0.5);
    LODWORD(v7) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Earthquake::RandomSeed"), 0, 0), 6, 0, 2294967296, 2000000000, 0, 0x1000003E8, v7);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  double v20;
  double v21;
  _OWORD v23[2];
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  unsigned int v32;
  double v33;
  double v34;
  int v35;
  double v36;
  double v37;
  double v38;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = v9;
  if (v9)
  {
    v38 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v38, 1, a5->var0.var1);
    v37 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v37, 2, a5->var0.var1);
    v36 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v36, 3, a5->var0.var1);
    v35 = 0;
    objc_msgSend(v10, "getIntValue:fromParm:atFxTime:", &v35, 4, a5->var0.var1);
    v33 = 0.0;
    v34 = 0.0;
    objc_msgSend(v10, "getXValue:YValue:fromParm:atFxTime:", &v34, &v33, 5, a5->var0.var1);
    v32 = 0;
    objc_msgSend(v10, "getIntValue:fromParm:atFxTime:", &v32, 6, a5->var0.var1);
    v31 = 0;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    if (a4)
    {
      objc_msgSend(a4, "imageInfo");
      if (*((_QWORD *)&v29 + 1))
        v38 = -v38;
    }
    v11 = objc_msgSend(a4, "imageType");
    if (-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1))
      v12 = v11 == 3;
    else
      v12 = 0;
    LOBYTE(v10) = v12;
    if (v12)
    {
      objc_msgSend(a4, "bounds");
      v16 = (v34 + -0.5) * v15;
      v18 = v17 * (v33 + -0.5);
      v33 = v18;
      v34 = v16;
      if (a4)
      {
        objc_msgSend(a4, "heliumRef");
        v18 = v33;
        v16 = v34;
      }
      else
      {
        v25 = 0;
      }
      v19 = *(_OWORD *)&a5->var2;
      v23[0] = *(_OWORD *)&a5->var0.var0;
      v23[1] = v19;
      v24 = *(_OWORD *)&a5->var4;
      HIDWORD(v20) = DWORD1(v24);
      *(float *)&v14 = v18;
      *(float *)&v13 = v16;
      *(float *)&v19 = (float)v35;
      *(float *)&v20 = v36;
      *(float *)&v18 = v37;
      HIDWORD(v21) = HIDWORD(v38);
      *(float *)&v21 = v38;
      -[PAEEarthquake quakeHeliumNodeWithInputImage:inputImage:outputImage:renderInfo:twist:horizontalShake:verticalShake:layers:centerX:centerY:randomSeed:](self, "quakeHeliumNodeWithInputImage:inputImage:outputImage:renderInfo:twist:horizontalShake:verticalShake:layers:centerX:centerY:randomSeed:", &v25, a4, a3, v23, v32, v21, v18, v20, *(double *)&v19, v13, v14);
      if (v25)
        (*(void (**)(uint64_t))(*(_QWORD *)v25 + 24))(v25);
      objc_msgSend(a3, "setHeliumRef:", &v26);
      if (v26)
        (*(void (**)(uint64_t))(*(_QWORD *)v26 + 24))(v26);
    }
  }
  return (char)v10;
}

- (HGRef<HGNode>)quakeHeliumNodeWithInputImage:(HGRef<HGNode>)a3 inputImage:(id)a4 outputImage:(id)a5 renderInfo:(id *)a6 twist:(float)a7 horizontalShake:(float)a8 verticalShake:(float)a9 layers:(float)a10 centerX:(float)a11 centerY:(float)a12 randomSeed:(int)a13
{
  HGXForm **v13;
  HGXForm **v25;
  double *v26;
  double *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  CMTimeEpoch v31;
  unint64_t v32;
  uint64_t i;
  unint64_t v34;
  uint64_t v35;
  float v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  HGXForm *v41;
  HGXForm *v42;
  __n128 v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  float64x2_t v49;
  float64x2_t v52[9];
  float64x2_t v53[9];
  CMTime time;
  _QWORD v55[102];
  _OWORD v56[2];
  _OWORD v57[2];
  _OWORD v58[2];
  _OWORD v59[2];
  uint64_t v60;

  v25 = v13;
  v60 = *MEMORY[0x1E0C80C00];
  v26 = (double *)objc_msgSend((id)objc_msgSend(a4, "pixelTransform"), "matrix");
  v27 = (double *)objc_msgSend((id)objc_msgSend(a4, "inversePixelTransform"), "matrix");
  v28 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A79F8);
  v29 = objc_msgSend(v28, "timelineFpsNumeratorForEffect:", self);
  v30 = objc_msgSend(v28, "timelineFpsDenominatorForEffect:", self);
  v31 = *((_QWORD *)a6->var0.var1 + 2);
  *(_OWORD *)&time.value = *(_OWORD *)a6->var0.var1;
  time.epoch = v31;
  v32 = a13 + 2302755 + (int)(CMTimeGetSeconds(&time) / ((double)v29 / (double)v30) * 1000.0);
  for (i = 1; i != 102; ++i)
  {
    v32 = ((v32 << 12) + 150889) % 0xAE529;
    v55[i] = v32;
  }
  v34 = (((_DWORD)v32 << 12) + 150889) % 0xAE529u;
  memset(v59, 0, sizeof(v59));
  memset(v58, 0, sizeof(v58));
  memset(v57, 0, sizeof(v57));
  memset(v56, 0, sizeof(v56));
  if (a10 > 0.0)
  {
    v35 = 0;
    do
    {
      *((float *)v59 + v35) = 1.0 / a10;
      v37 = v34 % 0x65;
      v38 = v55[v37 + 1];
      v55[v37 + 1] = ((v38 << 12) + 150889) % 0xAE529;
      v36 = a7 * 0.1;
      *((float *)v58 + v35) = (float)((float)(v36 + v36) * (float)((float)v38 / 714020.0)) - v36;
      v39 = v38 % 0x65;
      v40 = v55[v38 % 0x65 + 1];
      v55[v39 + 1] = ((v40 << 12) + 150889) % 0xAE529;
      *((float *)v57 + v35) = (float)((float)((float)(a8 * 25.0) + (float)(a8 * 25.0)) * (float)((float)v40 / 714020.0))
                            - (float)(a8 * 25.0);
      v40 %= 0x65uLL;
      v34 = v55[v40 + 1];
      v55[v40 + 1] = ((v34 << 12) + 150889) % 0xAE529;
      *((float *)v56 + v35++) = (float)((float)((float)(a9 * 25.0) + (float)(a9 * 25.0)) * (float)((float)v34 / 714020.0))
                              - (float)(a9 * 25.0);
    }
    while ((float)(int)v35 < a10);
  }
  v55[0] = v34;
  if (a10 == 1.0)
  {
    HGTransform::HGTransform((HGTransform *)v53);
    HGTransform::LoadMatrixd((HGTransform *)v53, v27);
    HGTransform::Transpose((HGTransform *)v53);
    HGTransform::Translate((HGTransform *)v53, (float)-a11, (float)-a12, 0.0);
    HGTransform::Rotate((HGTransform *)v53, *(float *)v58 * 57.2957795, 0.0, 0.0, 1.0);
    HGTransform::Translate((HGTransform *)v53, (float)-*(float *)v57, (float)-*(float *)v56, 0.0);
    HGTransform::Translate((HGTransform *)v53, a11, a12, 0.0);
    HGTransform::HGTransform((HGTransform *)v52);
    HGTransform::LoadMatrixd((HGTransform *)v52, v26);
    HGTransform::Transpose((HGTransform *)v52);
    HGTransform::Multiply(v53, v52);
    v41 = (HGXForm *)HGObject::operator new(0x210uLL);
    HGXForm::HGXForm(v41);
    (*(void (**)(HGXForm *, float64x2_t *))(*(_QWORD *)v41 + 576))(v41, v53);
    (*(void (**)(HGXForm *))(*(_QWORD *)v41 + 16))(v41);
    (*(void (**)(HGXForm *))(*(_QWORD *)v41 + 24))(v41);
    HGTransform::~HGTransform((HGTransform *)v52);
    HGTransform::~HGTransform((HGTransform *)v53);
  }
  else
  {
    v42 = (HGXForm *)HGMultiTexBlendBase::create((HGMultiTexBlendBase *)(int)a10);
    v41 = v42;
    if (a10 <= 0.0)
    {
      if (!v42)
        goto LABEL_14;
    }
    else
    {
      v44 = 0;
      v45 = (float)-a11;
      v46 = (float)-a12;
      v47 = a11;
      v48 = a12;
      do
      {
        HGTransform::HGTransform((HGTransform *)v53);
        HGTransform::LoadMatrixd((HGTransform *)v53, v27);
        HGTransform::Transpose((HGTransform *)v53);
        HGTransform::Translate((HGTransform *)v53, v45, v46, 0.0);
        HGTransform::Rotate((HGTransform *)v53, *((float *)v58 + v44) * 57.2957795, 0.0, 0.0, 1.0);
        HGTransform::Translate((HGTransform *)v53, (float)-*((float *)v57 + v44), (float)-*((float *)v56 + v44), 0.0);
        HGTransform::Translate((HGTransform *)v53, v47, v48, 0.0);
        HGTransform::HGTransform((HGTransform *)v52);
        HGTransform::LoadMatrixd((HGTransform *)v52, v26);
        HGTransform::Transpose((HGTransform *)v52);
        v49 = HGTransform::Multiply(v53, v52);
        (*(void (**)(HGXForm *, uint64_t, float64x2_t *, float64x2_t))(*(_QWORD *)v41 + 576))(v41, v44, v53, v49);
        (*(void (**)(HGXForm *, uint64_t, float))(*(_QWORD *)v41 + 584))(v41, v44, *((float *)v59 + v44));
        HGTransform::~HGTransform((HGTransform *)v52);
        HGTransform::~HGTransform((HGTransform *)v53);
        v43.n128_f32[0] = (float)(int)++v44;
      }
      while ((float)(int)v44 < a10);
    }
    (*(void (**)(HGXForm *, __n128))(*(_QWORD *)v41 + 16))(v41, v43);
    (*(void (**)(HGXForm *))(*(_QWORD *)v41 + 24))(v41);
  }
LABEL_14:
  (*(void (**)(HGXForm *, _QWORD, _QWORD))(*(_QWORD *)v41 + 120))(v41, 0, *(_QWORD *)a3.var0);
  *v25 = v41;
  (*(void (**)(HGXForm *))(*(_QWORD *)v41 + 16))(v41);
  -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", v25, a4, a5);
  return (HGRef<HGNode>)(*(uint64_t (**)(HGXForm *))(*(_QWORD *)v41 + 24))(v41);
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
