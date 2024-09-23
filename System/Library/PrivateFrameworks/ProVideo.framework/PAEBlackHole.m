@implementation PAEBlackHole

- (PAEBlackHole)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEBlackHole;
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
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("MayRemapTime"), v6, CFSTR("SupportsLargeRenderScale"), v7, CFSTR("PixelTransformSupport"), v8, CFSTR("AutoColorProcessingSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0), CFSTR("InputSizeLimit"), 0);
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
  v10.super_class = (Class)PAEBlackHole;
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
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BlackHole::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BlackHole::Amount"), 0, 0), 2, 0, 150.0, 0.0, dbl_1B3050610[v7 == 0], 0.0, dbl_1B3050620[v7 == 0], 1.0);
  }
  return v6;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  int v16;
  int v17;
  int v18;
  int v19;
  PCArray_base *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  PCArray_base *HeliumXForm;
  _QWORD *v26;
  uint64_t v27;
  float64_t v28;
  HGNode *v29;
  unint64_t v30;
  char v31;
  int v32;
  HBlackHole *v33;
  PCArray_base *v34;
  float v35;
  float v36;
  double v37;
  __n128 v38;
  __n128 v39;
  float v40;
  float v41;
  float v42;
  double v43;
  uint64_t v44;
  HGCrop *v45;
  int v46;
  float64x2_t v48;
  int32x2_t v49[2];
  HGCrop *v50;
  float64x2_t v51;
  float64x2_t v52;
  HGCrop *v53;
  float64x2_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  _BYTE v66[128];
  double v67[16];
  double v68;
  float64x2_t v69;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = v9;
    __asm { FMOV            V0.2D, #0.5 }
    v69 = _Q0;
    objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v69, &v69.f64[1], 1, a5->var0.var1);
    v68 = 150.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v68, 2, a5->var0.var1);
    v16 = llround(log2(v68 * 0.125));
    if (v16 <= 1)
      v17 = 1;
    else
      v17 = v16;
    v18 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4);
    -[PAESharedDefaultBase convertRelativeToImageCoordinates:withImage:](self, "convertRelativeToImageCoordinates:withImage:", &v69, a4);
    v69 = v54;
    if (v18 && objc_msgSend(a4, "imageType") == 3)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        v65 = 0;
      v63 = 0;
      v64 = 0;
      v62 = &unk_1E64DF840;
      PCArray<HGRef<HGNode>,PCArray_Traits<HGRef<HGNode>>>::resize((uint64_t)&v62, 1, 3);
      if ((int)v63 >= v17)
        v19 = v63;
      else
        v19 = (2 * v17) | 1;
      PCArray<HGRef<HGNode>,PCArray_Traits<HGRef<HGNode>>>::resize((uint64_t)&v62, v17, v19);
      if (SHIDWORD(v63) <= 0)
        PCArray_base::badIndex(v20);
      v22 = v64;
      v21 = v65;
      v23 = *v64;
      if (*v64 != v65)
      {
        if (v23)
        {
          (*(void (**)(_QWORD))(*(_QWORD *)v23 + 24))(*v64);
          v21 = v65;
        }
        *v22 = v21;
        if (v21)
          (*(void (**)(uint64_t))(*(_QWORD *)v21 + 16))(v21);
      }
      v54.f64[0] = 0.5;
      memset(&v54.f64[1], 0, 32);
      v55 = 0x3FE0000000000000;
      v56 = 0u;
      v57 = 0u;
      v59 = 0u;
      v60 = 0u;
      v58 = 0x3FE0000000000000;
      v61 = 0x3FF0000000000000;
      if (SHIDWORD(v63) >= 2)
      {
        v24 = 1;
        do
        {
          HeliumXForm = (PCArray_base *)FxSupport::makeHeliumXForm(v54.f64, &v64[v24 - 1], 1, 0, &v51);
          if (v24 >= SHIDWORD(v63))
            PCArray_base::badIndex(HeliumXForm);
          v26 = v64;
          v27 = v64[v24];
          v28 = v51.f64[0];
          if (v27 == *(_QWORD *)&v51.f64[0])
          {
            if (v27)
              (*(void (**)(uint64_t))(*(_QWORD *)v27 + 24))(v27);
          }
          else
          {
            if (v27)
            {
              (*(void (**)(uint64_t))(*(_QWORD *)v27 + 24))(v27);
              v28 = v51.f64[0];
            }
            *(float64_t *)&v26[v24] = v28;
          }
          ++v24;
        }
        while (v24 < SHIDWORD(v63));
      }
      v29 = (HGNode *)HGObject::operator new(0x1A0uLL);
      HGNode::HGNode(v29);
      v53 = (HGCrop *)v29;
      v30 = HIDWORD(v63);
      v31 = 1;
      v32 = 1 - HIDWORD(v63);
      v48 = (float64x2_t)vdupq_n_s64(0x3E7AD7F29ABCAF48uLL);
      while ((int)v30 >= 1)
      {
        v33 = (HBlackHole *)HGObject::operator new(0x2A0uLL);
        HBlackHole::HBlackHole(v33);
        if (SHIDWORD(v63) < (int)v30)
          PCArray_base::badIndex(v34);
        (*(void (**)(HBlackHole *, _QWORD, _QWORD))(*(_QWORD *)v33 + 120))(v33, 0, v64[(v30 - 1)]);
        (*(void (**)(HBlackHole *, uint64_t, HGCrop *))(*(_QWORD *)v33 + 120))(v33, 1, v53);
        (*(void (**)(HBlackHole *, double *))(*(_QWORD *)v33 + 576))(v33, v67);
        (*(void (**)(HBlackHole *, _BYTE *))(*(_QWORD *)v33 + 584))(v33, v66);
        v35 = v69.f64[0];
        v36 = v69.f64[1];
        (*(void (**)(HBlackHole *, _QWORD, float, float, float, float))(*(_QWORD *)v33 + 96))(v33, 0, v35, v36, 0.0, 0.0);
        v37 = ldexp(1.0, v32);
        v39.n128_u32[1] = HIDWORD(v68);
        if ((v31 & 1) != 0)
          v38.n128_f32[0] = 0.0;
        else
          v38.n128_f32[0] = 1.0;
        if ((v31 & 1) != 0)
        {
          v39.n128_f32[0] = 0.0;
        }
        else
        {
          v40 = v68 / (2.0 / v37 + -1.0);
          v39.n128_f32[0] = v40;
        }
        v42 = v37;
        v41 = v68;
        (*(void (**)(HBlackHole *, uint64_t, float, __n128, float, __n128))(*(_QWORD *)v33 + 96))(v33, 1, v41, v39, v42, v38);
        if (v53 != v33)
        {
          if (v53)
            (*(void (**)(void))(*(_QWORD *)v53 + 24))();
          v53 = v33;
          (*(void (**)(HBlackHole *))(*(_QWORD *)v33 + 16))(v33);
        }
        if (v30 >= 3)
        {
          v43 = v68;
          *(double *)&v44 = v43 / (ldexp(1.0, (int)v30 - 2) + -1.0);
          v52.f64[0] = *(double *)&v44 + *(double *)&v44;
          v52.f64[1] = *(double *)&v44 + *(double *)&v44;
          v51 = vsubq_f64(v69, (float64x2_t)vdupq_lane_s64(v44, 0));
          PCMatrix44Tmpl<double>::transformRect<double>(v67, v51.f64, (uint64_t)&v51);
          v49[0] = vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vaddq_f64(v51, v48))));
          v49[1] = vsub_s32(vmovn_s64(vcvtq_s64_f64(vrndpq_f64(vaddq_f64(v51, v52)))), v49[0]);
          FxSupport::makeHeliumCrop((unsigned int *)v49, &v53, &v50);
          v45 = v50;
          if (v53 == v50)
          {
            if (v53)
              (*(void (**)(void))(*(_QWORD *)v53 + 24))();
          }
          else
          {
            if (v53)
            {
              (*(void (**)(void))(*(_QWORD *)v53 + 24))();
              v45 = v50;
            }
            v53 = v45;
          }
        }
        --v30;
        ++v32;
        (*(void (**)(HBlackHole *))(*(_QWORD *)v33 + 24))(v33);
        v31 = 0;
      }
      objc_msgSend(a3, "setHeliumRef:", &v53);
      if (v53)
        (*(void (**)(HGCrop *))(*(_QWORD *)v53 + 24))(v53);
      v62 = &unk_1E64DF840;
      if ((int)v63 < 0)
        v46 = 1;
      else
        v46 = v63;
      PCArray<HGRef<HGNode>,PCArray_Traits<HGRef<HGNode>>>::resize((uint64_t)&v62, 0, v46);
      if (v64)
        MEMORY[0x1B5E2914C](v64, 0x1000C8077774924);
      if (v65)
        (*(void (**)(uint64_t))(*(_QWORD *)v65 + 24))(v65);
      LOBYTE(v9) = 1;
    }
    else
    {
      LOBYTE(v9) = 0;
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
