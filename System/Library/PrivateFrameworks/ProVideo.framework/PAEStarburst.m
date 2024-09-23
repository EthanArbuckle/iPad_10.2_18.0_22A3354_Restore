@implementation PAEStarburst

- (PAEStarburst)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEStarburst;
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
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("MayRemapTime"), v6, CFSTR("SupportsLargeRenderScale"), v7, CFSTR("InputSizeLimit"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEStarburst;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Starburst::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Starburst::Radius"), 0, 0), 2, 0, 50.0, 0.01, 200.0, 0.01, 200.0, 10.0);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  double v12;
  double v13;
  int v18;
  HgcStarburst *v19;
  double v21;
  float v22;
  float v23;
  unsigned int v24;
  unsigned int v25;
  unsigned __int32 v26;
  __n128 v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  __n128 v34[2];
  double v35;
  double v36;
  __int128 v37;
  float32x2_t v38;
  float32x2_t v39;
  double v40[16];
  uint64_t v41;
  double v42;
  __int128 v43;
  double v44;
  double v45;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    _ZF = v10 == 0;
  else
    _ZF = 1;
  if (_ZF)
    goto LABEL_9;
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
  v12 = v44;
  v13 = v45;
  __asm { FMOV            V0.2D, #0.5 }
  v43 = _Q0;
  objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v43, (char *)&v43 + 8, 1, a5->var0.var1);
  -[PAESharedDefaultBase convertRelativeToPixelCoordinates:withImage:](self, "convertRelativeToPixelCoordinates:withImage:", &v43, a4);
  v43 = *(_OWORD *)v40;
  v42 = 50.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v42, 2, a5->var0.var1);
  v18 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  if (!v18)
    return v18;
  if (objc_msgSend(a4, "imageType") != 3)
  {
LABEL_9:
    LOBYTE(v18) = 0;
    return v18;
  }
  if (a4)
    objc_msgSend(a4, "heliumRef");
  else
    v41 = 0;
  v19 = (HgcStarburst *)HGObject::operator new(0x1B0uLL);
  HgcStarburst::HgcStarburst(v19);
  *(_QWORD *)v19 = &unk_1E64E0790;
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
  -[PAESharedDefaultBase getImageBoundary:](self, "getImageBoundary:", a4);
  v35 = 0.0;
  v36 = 0.0;
  __asm { FMOV            V0.2D, #-1.0 }
  v37 = _Q0;
  v34[0] = (__n128)vcvtq_f64_f32(v38);
  v34[1] = (__n128)vcvtq_f64_f32(v39);
  PCMatrix44Tmpl<double>::transformRect<double>(v40, v34[0].n128_f64, (uint64_t)&v35);
  HIDWORD(v21) = HIDWORD(v36);
  v22 = v35;
  *(float *)&v21 = v36;
  v23 = *(double *)&v37;
  v34[0].n128_u32[0] = HGRectfMake4f(v22, v21, v22 + v23);
  *(unint64_t *)((char *)v34[0].n128_u64 + 4) = __PAIR64__(v25, v24);
  v34[0].n128_u32[3] = v26;
  v27 = HFunHouse::SetRect((__n128 *)v19, v34);
  (*(void (**)(HgcStarburst *, _QWORD, uint64_t, __n128))(*(_QWORD *)v19 + 120))(v19, 0, v41, v27);
  v28 = *(double *)&v43;
  v29 = *((double *)&v43 + 1);
  (*(void (**)(HgcStarburst *, _QWORD, float, float, float, float))(*(_QWORD *)v19 + 96))(v19, 0, v28, v29, 0.0, 0.0);
  v30 = 1.0 / v42;
  (*(void (**)(HgcStarburst *, uint64_t, float, float, float, float))(*(_QWORD *)v19 + 96))(v19, 1, v30, 0.0, 0.0, 0.0);
  v31 = v13;
  v32 = v12;
  (*(void (**)(HgcStarburst *, uint64_t, float, float))(*(_QWORD *)v19 + 96))(v19, 2, 1.0 / v32, 1.0 / fabsf(v31));
  v34[0].n128_u64[0] = (unint64_t)v19;
  (*(void (**)(HgcStarburst *))(*(_QWORD *)v19 + 16))(v19);
  objc_msgSend(a3, "setHeliumRef:", v34);
  if (v34[0].n128_u64[0])
    (*(void (**)(unint64_t))(*(_QWORD *)v34[0].n128_u64[0] + 24))(v34[0].n128_u64[0]);
  (*(void (**)(HgcStarburst *))(*(_QWORD *)v19 + 24))(v19);
  if (v41)
    (*(void (**)(uint64_t))(*(_QWORD *)v41 + 24))(v41);
  LOBYTE(v18) = 1;
  return v18;
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
