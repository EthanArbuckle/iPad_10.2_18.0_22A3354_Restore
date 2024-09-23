@implementation PAEPixellate

- (PAEPixellate)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEPixellate;
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
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("MayRemapTime"), v6, CFSTR("SupportsLargeRenderScale"), v7, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEPixellate;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Pixellate::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Pixellate::Scale"), 0, 0), 2, 0, 8.0, 1.0, 2000.0, 1.0, 100.0, 1.0);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  HgcPixellate *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  __int128 v33;
  __int128 v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  uint64_t v54;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = v9;
  if (v9)
  {
    v53 = 0x3FE0000000000000;
    v54 = 0x3FE0000000000000;
    v52 = 8.0;
    objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v54, &v53, 1, a5->var0.var1);
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v52, 2, a5->var0.var1);
    if (-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1))
    {
      if (objc_msgSend(a4, "imageType") == 3)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v51 = 0;
        v11 = (HgcPixellate *)HGObject::operator new(0x1A0uLL);
        HgcPixellate::HgcPixellate(v11);
        *(_QWORD *)v11 = &unk_1E64D9838;
        -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4);
        -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
        *(_QWORD *)&v34 = v54;
        *((_QWORD *)&v34 + 1) = v53;
        -[PAESharedDefaultBase convertRelativeToPixelCoordinates:withImage:](self, "convertRelativeToPixelCoordinates:withImage:", &v34, a4);
        v34 = v33;
        (*(void (**)(HgcPixellate *, _QWORD, uint64_t))(*(_QWORD *)v11 + 120))(v11, 0, v51);
        v12 = v43;
        v13 = v44;
        v14 = v45;
        v15 = v46;
        (*(void (**)(HgcPixellate *, _QWORD, float, float, float, float))(*(_QWORD *)v11 + 96))(v11, 0, v12, v13, v14, v15);
        v16 = v47;
        v17 = v48;
        v18 = v49;
        v19 = v50;
        (*(void (**)(HgcPixellate *, uint64_t, float, float, float, float))(*(_QWORD *)v11 + 96))(v11, 1, v16, v17, v18, v19);
        v20 = v35;
        v21 = v36;
        v22 = v37;
        v23 = v38;
        (*(void (**)(HgcPixellate *, uint64_t, float, float, float, float))(*(_QWORD *)v11 + 96))(v11, 2, v20, v21, v22, v23);
        v24 = v39;
        v25 = v40;
        v26 = v41;
        v27 = v42;
        (*(void (**)(HgcPixellate *, uint64_t, float, float, float, float))(*(_QWORD *)v11 + 96))(v11, 3, v24, v25, v26, v27);
        v28 = *(double *)&v34;
        v29 = *((double *)&v34 + 1);
        (*(void (**)(HgcPixellate *, uint64_t, float, float, float, float))(*(_QWORD *)v11 + 96))(v11, 4, v28, v29, 0.0, 0.0);
        v30 = 1.0 / v52;
        v31 = v52;
        (*(void (**)(HgcPixellate *, uint64_t, float, float, float, float))(*(_QWORD *)v11 + 96))(v11, 5, v30, v31, 0.0, 0.0);
        *(_QWORD *)&v33 = v11;
        (*(void (**)(HgcPixellate *))(*(_QWORD *)v11 + 16))(v11);
        objc_msgSend(a3, "setHeliumRef:", &v33);
        if ((_QWORD)v33)
          (*(void (**)(_QWORD))(*(_QWORD *)v33 + 24))(v33);
        (*(void (**)(HgcPixellate *))(*(_QWORD *)v11 + 24))(v11);
        if (v51)
          (*(void (**)(uint64_t))(*(_QWORD *)v51 + 24))(v51);
      }
    }
  }
  return v10 != 0;
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
