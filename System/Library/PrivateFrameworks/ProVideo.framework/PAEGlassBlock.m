@implementation PAEGlassBlock

- (PAEGlassBlock)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEGlassBlock;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAEGlassBlock;
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

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEGlassBlock;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GlassBlock::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GlassBlock::Scale"), 0, 0), 2, 0, 2.8, 0.0, 10.0, 0.1, 10.0, 0.1);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GlassBlock::Angle"), 0, 0), 3, 0, 0.0, 0.0, 360.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GlassBlock::TileSize"), 0, 0), 4, 0, 65.0, 0.0, 1000.0, 0.0, 1000.0, 1.0);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  double v16;
  __double2 v17;
  double v18;
  id v19;
  HgcGlassBlock *v20;
  double v22;
  float v23;
  float v24;
  unsigned int v25;
  unsigned int v26;
  unsigned __int32 v27;
  __n128 v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float sinval;
  float cosval;
  float v37;
  float v38;
  float v39;
  __n128 v41[2];
  double v42;
  double v43;
  __int128 v44;
  float32x2_t v45;
  float32x2_t v46;
  double v47[16];
  uint64_t v48;
  double v49;
  double v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  double v56;
  double v57;
  __int128 v58;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = v9;
    __asm { FMOV            V0.2D, #0.5 }
    v58 = _Q0;
    objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v58, (char *)&v58 + 8, 1, a5->var0.var1);
    -[PAESharedDefaultBase convertRelativeToPixelCoordinates:withImage:](self, "convertRelativeToPixelCoordinates:withImage:", &v58, a4);
    v58 = *(_OWORD *)v47;
    v57 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v57, 2, a5->var0.var1);
    v57 = 1.0 / v57;
    v56 = 30.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v56, 3, a5->var0.var1);
    v55 = 0;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    if (a3)
    {
      objc_msgSend(a3, "imageInfo");
      v16 = v56;
      if (*((_QWORD *)&v53 + 1))
      {
        v16 = -v56;
        v56 = -v56;
      }
    }
    else
    {
      v16 = v56;
    }
    v17 = __sincos_stret(v16);
    v50 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v50, 4, a5->var0.var1);
    -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
    v18 = v49 * v50;
    v50 = v49 * v50;
    v19 = (id)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("FxHostCapabilities"))), "initWithAPIManager:", self->super.super._apiManager);
    if (a5->var2 && !objc_msgSend(v19, "upscalesFields"))
      v18 = v18 * 0.5;
    LODWORD(v9) = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    if ((_DWORD)v9)
    {
      if (objc_msgSend(a4, "imageType") == 3)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v48 = 0;
        v20 = (HgcGlassBlock *)HGObject::operator new(0x1B0uLL);
        HgcGlassBlock::HgcGlassBlock(v20);
        *(_QWORD *)v20 = &unk_1E64DE718;
        -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
        -[PAESharedDefaultBase getImageBoundary:](self, "getImageBoundary:", a4);
        v42 = 0.0;
        v43 = 0.0;
        __asm { FMOV            V0.2D, #-1.0 }
        v44 = _Q0;
        v41[0] = (__n128)vcvtq_f64_f32(v45);
        v41[1] = (__n128)vcvtq_f64_f32(v46);
        PCMatrix44Tmpl<double>::transformRect<double>(v47, v41[0].n128_f64, (uint64_t)&v42);
        HIDWORD(v22) = HIDWORD(v43);
        v23 = v42;
        *(float *)&v22 = v43;
        v24 = *(double *)&v44;
        v41[0].n128_u32[0] = HGRectfMake4f(v23, v22, v23 + v24);
        *(unint64_t *)((char *)v41[0].n128_u64 + 4) = __PAIR64__(v26, v25);
        v41[0].n128_u32[3] = v27;
        v28 = HFunHouse::SetRect((__n128 *)v20, v41);
        (*(void (**)(HgcGlassBlock *, _QWORD, uint64_t, __n128))(*(_QWORD *)v20 + 120))(v20, 0, v48, v28);
        v29 = *(double *)&v58;
        v30 = *((double *)&v58 + 1);
        (*(void (**)(HgcGlassBlock *, _QWORD, float, float, float, float))(*(_QWORD *)v20 + 96))(v20, 0, v29, v30, 0.0, 0.0);
        v31 = 1.0 / v50;
        v32 = 1.0 / v18;
        v33 = v50;
        v34 = v18;
        (*(void (**)(HgcGlassBlock *, uint64_t, float, float, float, float))(*(_QWORD *)v20 + 96))(v20, 1, v31, v32, v33, v34);
        sinval = v17.__sinval;
        cosval = v17.__cosval;
        v37 = v57 * cosval;
        v38 = v57 * (float)-sinval;
        v39 = v57 * sinval;
        (*(void (**)(HgcGlassBlock *, uint64_t, float, float, float, float))(*(_QWORD *)v20 + 96))(v20, 2, v37, v38, v39, v37);
        v41[0].n128_u64[0] = (unint64_t)v20;
        (*(void (**)(HgcGlassBlock *))(*(_QWORD *)v20 + 16))(v20);
        objc_msgSend(a3, "setHeliumRef:", v41);
        if (v41[0].n128_u64[0])
          (*(void (**)(unint64_t))(*(_QWORD *)v41[0].n128_u64[0] + 24))(v41[0].n128_u64[0]);
        (*(void (**)(HgcGlassBlock *))(*(_QWORD *)v20 + 24))(v20);
        if (v48)
          (*(void (**)(uint64_t))(*(_QWORD *)v48 + 24))(v48);
        LOBYTE(v9) = 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
  }
  return (char)v9;
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
