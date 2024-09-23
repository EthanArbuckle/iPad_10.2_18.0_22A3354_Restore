@implementation PAEOffset

- (PAEOffset)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEOffset;
  return -[PAETile initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
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

- (BOOL)addParameters
{
  void *v2;
  void *v3;

  v2 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Offset::Horizontal Offset"), 0, 0), 1, 0, 0.0, -10000.0, 10000.0, -1000.0, 1000.0, 0.1);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Offset::Vertical Offset"), 0, 0), 2, 0, 0.0, -10000.0, 10000.0, -1000.0, 1000.0, 0.1);
  }
  return v2 != 0;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;
  unint64_t v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  double v29;
  double v30;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = v9;
  if (v9)
  {
    v29 = 0.0;
    v30 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v30, 1, a5->var0.var1);
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v29, 2, a5->var0.var1);
    v28 = 0;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    if (a3)
      objc_msgSend(a3, "imageInfo");
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4);
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
    v11 = v29;
    if (*((_QWORD *)&v26 + 1))
      v11 = -v29;
    v29 = v11 / 100.0 - floor(v11 / 100.0);
    v30 = v30 / 100.0 - floor(v30 / 100.0);
    if (-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1)
      && objc_msgSend(a4, "imageType") == 3)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        v23 = 0;
      -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
      v19 = v23;
      if (v23)
        (*(void (**)(uint64_t))(*(_QWORD *)v23 + 16))(v23);
      v12 = v30;
      v13 = objc_msgSend(a4, "width");
      v14 = v21;
      v15 = v29;
      v16 = objc_msgSend(a4, "height");
      *(double *)v18 = v21;
      *(double *)&v18[1] = v22;
      -[PAETile transformAndTile:withXValue:YValue:skew:scale:stretch:rotation:resolution:inputImage:](self, "transformAndTile:withXValue:YValue:skew:scale:stretch:rotation:resolution:inputImage:", &v19, v18, a4, v12 * (double)v13 * v14, v15 * (double)v16 * v22, 0.0, 1.0, 1.0, 0.0);
      if (v19)
        (*(void (**)(uint64_t))(*(_QWORD *)v19 + 24))(v19);
      objc_msgSend(a3, "setHeliumRef:", &v20);
      if (v20)
        (*(void (**)(uint64_t))(*(_QWORD *)v20 + 24))(v20);
      if (v23)
        (*(void (**)(uint64_t))(*(_QWORD *)v23 + 24))(v23);
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
