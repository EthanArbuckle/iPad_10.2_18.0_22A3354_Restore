@implementation PAESimpleBorder

- (PAESimpleBorder)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAESimpleBorder;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAESimpleBorder;
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
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  void *v10;
  double var4;
  double var3;
  double var8;
  double v14;
  double v15;
  double v16;
  int v18;
  double v19;

  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v19 = 0.0;
  objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v19, 1, a6->var0.var1);
  v18 = 0;
  objc_msgSend(v10, "getIntValue:fromParm:atFxTime:", &v18, 3, a6->var0.var1);
  var3 = a6->var3;
  var4 = a6->var4;
  var8 = a5->var8;
  v14 = (double)a5->var0 / var3 * var8;
  v15 = (double)a5->var1 / var4;
  if (v18 == 2)
  {
    v16 = v19 + v19;
    goto LABEL_5;
  }
  if (v18 == 1)
  {
    v16 = v19;
LABEL_5:
    v14 = v14 + v16;
    v15 = v15 + v16;
  }
  *a3 = (int)vcvtpd_s64_f64(var3 * (v14 / var8));
  *a4 = (int)vcvtpd_s64_f64(var4 * v15);
  return 1;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAESimpleBorder;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SimpleBorder::Size"), 0, 0), 1, 0, 10.0, 0.0, 1000.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SimpleBorder::Color"), 0, 0), 2, 0, 0.0, 0.0, 0.0, 1.0);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SimpleBorder::Border Placement"), 0, 0), 3, 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SimpleBorder::Inside"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SimpleBorder::Overlap"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SimpleBorder::Outside"), 0, 0), 0), 1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9;
  void *v10;
  int v11;
  BOOL v12;
  BOOL v13;
  float v14;
  float32x2_t v16[2];
  __int128 v17[2];
  uint64_t v18;
  double v19[16];
  int v20;
  __int128 v21;
  double v22[3];
  double v23;

  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (!v9)
    return 0;
  v10 = (void *)v9;
  v23 = 0.0;
  v21 = 0u;
  *(_OWORD *)v22 = 0u;
  v20 = 0;
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a3);
  objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v23, 1, a5->var0.var1);
  objc_msgSend(v10, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v21, (char *)&v21 + 8, v22, &v22[1], 2, a5->var0.var1);
  *(double *)&v21 = v22[1] * *(double *)&v21;
  *((double *)&v21 + 1) = v22[1] * *((double *)&v21 + 1);
  v22[0] = v22[1] * v22[0];
  objc_msgSend(v10, "getIntValue:fromParm:atFxTime:", &v20, 3, a5->var0.var1);
  v11 = objc_msgSend(a4, "imageType");
  if (-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1))
    v12 = v11 == 3;
  else
    v12 = 0;
  v13 = v12;
  if (v12)
  {
    if (a4)
      objc_msgSend(a4, "heliumRef");
    else
      v18 = 0;
    -[PAESharedDefaultBase getImageBoundary:](self, "getImageBoundary:", a4);
    v17[0] = (__int128)vcvtq_f64_f32(v16[0]);
    v17[1] = (__int128)vcvtq_f64_f32(v16[1]);
    v14 = v23;
    fxSimpleBorder(&v18, v17, (double *)&v21, v19, v20, (HGNode **)v16, v14, v14);
    objc_msgSend(a3, "setHeliumRef:", v16);
    if (v16[0])
      (*(void (**)(_QWORD))(**(_QWORD **)v16 + 24))(*(_QWORD *)v16);
    if (v18)
      (*(void (**)(uint64_t))(*(_QWORD *)v18 + 24))(v18);
  }
  return v13;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  __int128 v6;
  _OWORD v8[3];

  *a6 = 1;
  *a5 = 0;
  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v8, a5, a6);
  return 1;
}

@end
