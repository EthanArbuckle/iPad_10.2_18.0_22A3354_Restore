@implementation PAEScrape

- (PAEScrape)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEScrape;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAEScrape;
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
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("MayRemapTime"), v4, CFSTR("PositionIndependent"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEScrape;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Scrape::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Scrape::Rotation"), 0, 0), 2, 0, 0.0, 0.0, 6.28318531);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Scrape::Amount"), 0, 0), 3, 0, 50.0, 0.0, 200.0, 0.0, 200.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Scrape::Crop"), 0, 0), 4, 1, 33);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  double v16;
  double v17;
  double v18;
  __double2 v19;
  HgcScrape *v20;
  float v21;
  float v22;
  float sinval;
  float cosval;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  HgcScrape *v32;
  HGNode *v33;
  int v34;
  double v35;
  __int128 v36;
  __int128 v37;
  double v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
    v44 = 0;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    if (a3)
    {
      objc_msgSend(a3, "imageInfo");
      v10 = *((_QWORD *)&v42 + 1);
    }
    else
    {
      v10 = 0;
    }
    -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
    __asm { FMOV            V0.2D, #0.5 }
    v37 = _Q0;
    objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v37, (char *)&v37 + 8, 1, a5->var0.var1);
    -[PAESharedDefaultBase convertRelativeToPixelCoordinates:withImage:](self, "convertRelativeToPixelCoordinates:withImage:", &v37, a4);
    v37 = v36;
    *(_QWORD *)&v36 = 0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v36, 2, a5->var0.var1);
    if (v10)
      *(double *)&v36 = -(*(double *)&v36 + -3.14159265);
    v35 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v35, 3, a5->var0.var1);
    v16 = 200.0 - v35;
    if (v35 > 200.0)
      v16 = 0.0;
    if (v35 >= 0.0)
      v17 = v16;
    else
      v17 = 200.0;
    v35 = v17;
    if (v17 <= 0.0)
      v18 = 0.0;
    else
      v18 = 1.0 / v17;
    v34 = 0;
    objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v34, 4, a5->var0.var1);
    v19 = __sincos_stret(*(double *)&v36);
    if (-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1)
      && objc_msgSend(a4, "imageType") == 3)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        v33 = 0;
      v20 = (HgcScrape *)HGObject::operator new(0x1B0uLL);
      HgcScrape::HgcScrape(v20);
      *(_QWORD *)v20 = &unk_1E64E02C0;
      v32 = v20;
      HGNode::SetInput((HGNode *)v20, 0, v33);
      v21 = *(double *)&v37;
      v22 = *((double *)&v37 + 1);
      (*(void (**)(HgcScrape *, _QWORD, float, float, float, float))(*(_QWORD *)v20 + 96))(v20, 0, v21, v22, 0.0, 0.0);
      sinval = v19.__sinval;
      cosval = v19.__cosval;
      (*(void (**)(HgcScrape *, uint64_t, float, float, float, float))(*(_QWORD *)v20 + 96))(v20, 1, -sinval, cosval, 0.0, 0.0);
      v25 = v35;
      (*(void (**)(HgcScrape *, uint64_t, float, float, float, float))(*(_QWORD *)v20 + 96))(v20, 2, v25, 0.0, 0.0, 0.0);
      v26 = v18;
      (*(void (**)(HgcScrape *, uint64_t, float, float, float, float))(*(_QWORD *)v20 + 96))(v20, 3, v26, 0.0, 0.0, 0.0);
      v27 = v38;
      v28 = v39;
      v29 = 1.0 / v38;
      v30 = 1.0 / v39;
      (*(void (**)(HgcScrape *, uint64_t, float, float, float, float))(*(_QWORD *)v20 + 96))(v20, 4, v27, v28, v29, v30);
      if (v34)
        -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v32, a4, a3);
      objc_msgSend(a3, "setHeliumRef:", &v32);
      if (v32)
        (*(void (**)(HgcScrape *))(*(_QWORD *)v32 + 24))(v32);
      if (v33)
        (*(void (**)(HGNode *))(*(_QWORD *)v33 + 24))(v33);
    }
  }
  return v9 != 0;
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
