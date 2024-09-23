@implementation PAEHalftone

- (PAEHalftone)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEHalftone;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAEHalftone;
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
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 65792);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 590080);
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("SDRWorkingSpace"), v8, CFSTR("HDRWorkingSpace"), v9, CFSTR("SupportsInternalMixing"), v10, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1),
               CFSTR("AutoColorProcessingSupport"),
               0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEHalftone;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Halftone::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Halftone::Angle"), 0, 0), 2, 0, 45.0, 0.0, 360.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Halftone::Scale"), 0, 0), 3, 0, 6.0, 2.0, 100.0, 2.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Halftone::Contrast"), 0, 0), 4, 0, 0.5, 0.0, 0.99, 0.0, 0.99, 0.1);
  }
  return v3 != 0;
}

- (void)compute_2x2_matrix:(double *)a3 fromAngle:(double)a4 andScale:(double)a5
{
  float v6;
  float v7;
  __float2 v8;

  v6 = 1.0 / a5;
  v7 = a4;
  v8 = __sincosf_stret(v7);
  *a3 = (float)((float)(v8.__cosval + (float)(v8.__sinval * 0.0)) * v6);
  a3[1] = (float)((float)((float)(v8.__cosval * 0.0) - v8.__sinval) * v6);
  a3[2] = (float)(v8.__sinval * v6);
  a3[3] = (float)(v8.__cosval * v6);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  BOOL v13;
  char v14;
  void *v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  double v20;
  double *v21;
  HGColorClamp *v22;
  HGGamma *v23;
  HgcHalftone *v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  HgcHalftone *v39;
  HGNode *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48[6];

  v48[4] = *(double *)MEMORY[0x1E0C80C00];
  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  v11 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A2958);
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  v13 = v12 || v11 == 0;
  v14 = v13;
  if (!v13)
  {
    v15 = (void *)v11;
    v16 = objc_msgSend(v10, "versionAtCreation");
    v46 = 0.5;
    v47 = 0.5;
    v45 = 45.0;
    v43 = 0.5;
    v44 = 6.0;
    v17 = objc_msgSend(a4, "width");
    v18 = objc_msgSend(a4, "height");
    objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v47, &v46, 1, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v45, 2, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v44, 3, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v43, 4, a5->var0.var1);
    objc_msgSend(v9, "mixAmountAtTime:", a5->var0.var1);
    v20 = v19;
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4);
    -[PAEHalftone compute_2x2_matrix:fromAngle:andScale:](self, "compute_2x2_matrix:fromAngle:andScale:", v48, v45, v44);
    v21 = (double *)objc_msgSend((id)objc_msgSend(v15, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
    if (-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1))
    {
      if (objc_msgSend(a4, "imageType") == 3)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v40 = 0;
        if (!a5->var5)
        {
          v22 = (HGColorClamp *)HGObject::operator new(0x1C0uLL);
          HGColorClamp::HGColorClamp(v22);
          (*(void (**)(HGColorClamp *, _QWORD, HGNode *))(*(_QWORD *)v22 + 120))(v22, 0, v40);
          if (v40 != (HGNode *)v22)
          {
            if (v40)
              (*(void (**)(void))(*(_QWORD *)v40 + 24))();
            v40 = (HGNode *)v22;
            (*(void (**)(HGColorClamp *))(*(_QWORD *)v22 + 16))(v22);
          }
          (*(void (**)(HGColorClamp *))(*(_QWORD *)v22 + 24))(v22);
        }
        if (!v16)
        {
          v23 = (HGGamma *)HGObject::operator new(0x1B0uLL);
          HGGamma::HGGamma(v23);
          (*(void (**)(HGGamma *, _QWORD, float, float, float, float))(*(_QWORD *)v23 + 96))(v23, 0, 1.1111, 0.0, 0.0, 0.0);
          (*(void (**)(HGGamma *, _QWORD, HGNode *))(*(_QWORD *)v23 + 120))(v23, 0, v40);
          if (v40 != (HGNode *)v23)
          {
            if (v40)
              (*(void (**)(void))(*(_QWORD *)v40 + 24))();
            v40 = (HGNode *)v23;
            (*(void (**)(HGGamma *))(*(_QWORD *)v23 + 16))(v23);
          }
          (*(void (**)(HGGamma *))(*(_QWORD *)v23 + 24))(v23);
        }
        v24 = (HgcHalftone *)HGObject::operator new(0x1A0uLL);
        HgcHalftone::HgcHalftone(v24);
        *(_QWORD *)v24 = &unk_1E64D9FB0;
        v46 = (v46 + -0.5) * (double)v18;
        v47 = (v47 + -0.5) * (double)v17;
        HGNode::SetInput((HGNode *)v24, 0, v40);
        v25 = v47;
        v26 = v46;
        (*(void (**)(HgcHalftone *, _QWORD, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 0, v25, v26, 0.0, 0.0);
        v27 = v48[0];
        v28 = v48[1];
        (*(void (**)(HgcHalftone *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 1, v27, v28, 0.0, 0.0);
        v29 = v48[2];
        v30 = v48[3];
        (*(void (**)(HgcHalftone *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 2, v29, v30, 0.0, 0.0);
        v31 = 1.0 / (1.0 - v43);
        (*(void (**)(HgcHalftone *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 3, v31, 0.0, 0.0, 0.0);
        v32 = v41;
        v33 = v42;
        (*(void (**)(HgcHalftone *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 4, v32, v33, 0.0, 0.0);
        v34 = v20;
        (*(void (**)(HgcHalftone *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 6, v34, 0.0, 0.0, 0.0);
        v35 = *v21;
        v36 = v21[1];
        v37 = v21[2];
        (*(void (**)(HgcHalftone *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 5, v35, v36, v37, 0.0);
        v39 = v24;
        (*(void (**)(HgcHalftone *))(*(_QWORD *)v24 + 16))(v24);
        objc_msgSend(a3, "setHeliumRef:", &v39);
        if (v39)
          (*(void (**)(HgcHalftone *))(*(_QWORD *)v39 + 24))(v39);
        (*(void (**)(HgcHalftone *))(*(_QWORD *)v24 + 24))(v24);
        if (v40)
          (*(void (**)(HGNode *))(*(_QWORD *)v40 + 24))(v40);
      }
    }
  }
  return v14 ^ 1;
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
