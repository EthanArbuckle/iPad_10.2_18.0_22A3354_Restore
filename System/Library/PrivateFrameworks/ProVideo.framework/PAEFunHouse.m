@implementation PAEFunHouse

- (PAEFunHouse)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEFunHouse;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
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
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  int v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PAEFunHouse;
  -[PAESharedDefaultBase addParameters](&v10, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
  {
    v7 = objc_msgSend(v4, "versionAtCreation");
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FunHouse::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FunHouse::Width"), 0, 0), 2, 0, 400.0, 1.0, dbl_1B30506D0[v7 == 0], 1.0, dbl_1B304FBB0[v7 == 0], 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FunHouse::Amount"), 0, 0), 3, 0, 3.0, 1.0, 100.0, 1.0, 100.0, 1.0);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FunHouse::Angle"), 0, 0), 4, 0, 0.0, -360.0, 360.0);
  }
  return v6;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  int v13;
  __double2 v14;
  HFunHouse *v15;
  double v21;
  float v22;
  float v23;
  unsigned int v24;
  unsigned int v25;
  unsigned __int32 v26;
  unint64_t v27;
  double v28;
  float v29;
  float v30;
  float cosval;
  float sinval;
  double v33;
  float v34;
  double v35;
  float v36;
  double v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  unint64_t v49;
  __n128 v51[2];
  double v52;
  double v53;
  __int128 v54;
  float32x2_t v55;
  float32x2_t v56;
  double v57[16];
  double v58;
  double v59;
  double v60;
  double v61;
  double v62[3];

  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = (void *)v9;
    -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
    v12 = v62[1];
    v11 = v62[2];
    v61 = 0.5;
    v62[0] = 0.5;
    objc_msgSend(v10, "getXValue:YValue:fromParm:atFxTime:", v62, &v61, 1, a5->var0.var1);
    v60 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v60, 2, a5->var0.var1);
    v59 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v59, 3, a5->var0.var1);
    v58 = 30.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v58, 4, a5->var0.var1);
    v13 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    v14 = __sincos_stret(v58);
    if (v13 && objc_msgSend(a3, "imageType") == 3)
    {
      v15 = (HFunHouse *)HGObject::operator new(0x1B0uLL);
      HFunHouse::HFunHouse(v15);
      -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
      -[PAESharedDefaultBase getImageBoundary:](self, "getImageBoundary:", a4);
      v52 = 0.0;
      v53 = 0.0;
      __asm { FMOV            V0.2D, #-1.0 }
      v54 = _Q0;
      v51[0] = (__n128)vcvtq_f64_f32(v55);
      v51[1] = (__n128)vcvtq_f64_f32(v56);
      PCMatrix44Tmpl<double>::transformRect<double>(v57, v51[0].n128_f64, (uint64_t)&v52);
      HIDWORD(v21) = HIDWORD(v53);
      v22 = v52;
      *(float *)&v21 = v53;
      v23 = *(double *)&v54;
      v51[0].n128_u32[0] = HGRectfMake4f(v22, v21, v22 + v23);
      *(unint64_t *)((char *)v51[0].n128_u64 + 4) = __PAIR64__(v25, v24);
      v51[0].n128_u32[3] = v26;
      v27 = objc_msgSend(a4, "width", HFunHouse::SetRect((__n128 *)v15, v51).n128_f64[0]);
      v28 = (double)(unint64_t)objc_msgSend(a4, "height");
      v61 = (v61 + -0.5) * v28;
      v62[0] = (v62[0] + -0.5) * (double)v27;
      v29 = v62[0];
      v30 = v61;
      (*(void (**)(HFunHouse *, _QWORD, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 0, v29, v30, 0.0, 0.0);
      cosval = v14.__cosval;
      sinval = v14.__sinval;
      v33 = cosval;
      v34 = cosval / v60;
      v35 = (float)-sinval;
      v36 = v35 / v60;
      v37 = sinval;
      v38 = sinval / v60;
      (*(void (**)(HFunHouse *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 1, v34, v36, v38, v34);
      v39 = v60 * v33;
      v40 = v60 * v37;
      v41 = v60 * v35;
      (*(void (**)(HFunHouse *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 2, v39, v40, v41, v39);
      v42 = 1.0 / v59;
      (*(void (**)(HFunHouse *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 3, v42, 0.0, 0.0, 0.0);
      v43 = v12;
      v44 = v11;
      v45 = 1.0 / v12;
      v46 = 1.0 / v11;
      (*(void (**)(HFunHouse *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 4, v43, v44, v45, v46);
      v47 = (float)v27;
      v48 = v28;
      (*(void (**)(HFunHouse *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 5, v47, v48, 0.0, 0.0);
      if (a4)
      {
        objc_msgSend(a4, "heliumRef");
        v49 = v51[0].n128_u64[0];
      }
      else
      {
        v49 = 0;
        v51[0].n128_u64[0] = 0;
      }
      (*(void (**)(HFunHouse *, _QWORD, unint64_t))(*(_QWORD *)v15 + 120))(v15, 0, v49);
      if (v51[0].n128_u64[0])
        (*(void (**)(unint64_t))(*(_QWORD *)v51[0].n128_u64[0] + 24))(v51[0].n128_u64[0]);
      v51[0].n128_u64[0] = (unint64_t)v15;
      (*(void (**)(HFunHouse *))(*(_QWORD *)v15 + 16))(v15);
      objc_msgSend(a3, "setHeliumRef:", v51);
      if (v51[0].n128_u64[0])
        (*(void (**)(unint64_t))(*(_QWORD *)v51[0].n128_u64[0] + 24))(v51[0].n128_u64[0]);
      (*(void (**)(HFunHouse *))(*(_QWORD *)v15 + 24))(v15);
      LOBYTE(v9) = 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
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
