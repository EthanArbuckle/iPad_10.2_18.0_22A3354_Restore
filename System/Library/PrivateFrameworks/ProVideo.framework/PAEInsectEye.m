@implementation PAEInsectEye

- (PAEInsectEye)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEInsectEye;
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
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("InputSizeLimit"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  int v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PAEInsectEye;
  -[PAESharedDefaultBase addParameters](&v15, sel_addParameters);
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
    v9 = objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("InsectEye::Size"), 0, 0);
    v10 = 64.0;
    if (v7)
    {
      v10 = 128.0;
      v11 = 2048.0;
    }
    else
    {
      v11 = 512.0;
    }
    if (v7)
      v12 = 512.0;
    else
      v12 = 128.0;
    if (v7)
      v13 = 32.0;
    else
      v13 = 8.0;
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", v9, 1, 0, v10, 4.0, v11, 8.0, v12, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("InsectEye::Refraction"), 0, 0), 2, 0, 2.0, 0.0, 10.0, 0.0, 4.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("InsectEye::Border"), 0, 0), 3, 0, 1.0, 0.0, v11, 0.0, v13, 1.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("InsectEye::Border Color"), 0, 0), 4, 0, 0.0, 0.0, 0.0);
  }
  return v6;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  float64_t v18;
  float64_t v19;
  float64_t v20;
  float64_t v21;
  double v22;
  HgcSmearToRect *v23;
  HgcSmearToRect *v24;
  double v25;
  float64x2_t v26;
  float64x2_t v27;
  HGCrop *v28;
  float64_t v29;
  int v30;
  float64_t v31;
  double v32;
  int v33;
  unsigned int v34;
  double v35;
  float v36;
  double v37;
  HgcSmearToRect *v38;
  int32x2_t v39;
  int32x2_t v40;
  int64x2_t v41;
  HInsectEye_Base *v48;
  double v49;
  double v50;
  double v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  HgcInsectEyeBorder *v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  double v78;
  HgcSmearToRect *v79;
  HgcSmearToRect *v80;
  double v81;
  __int128 v82;
  __int128 v83;
  double v84;
  __int128 v85;
  __int128 v86;
  double v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  float64x2_t v91;
  float64x2_t v92;
  HgcSmearToRect *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100[16];

  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = (void *)v9;
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a3);
    v11 = v100[5];
    v12 = fabs(v100[0]);
    v13 = objc_msgSend(a4, "width");
    v14 = objc_msgSend(a4, "height");
    v99 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v99, 1, a5->var0.var1);
    v15 = v99;
    v99 = v12 * v99;
    v98 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v98, 2, a5->var0.var1);
    v97 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v97, 3, a5->var0.var1);
    v95 = 0.0;
    v96 = 0.0;
    v94 = 0.0;
    objc_msgSend(v10, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v96, &v95, &v94, 4, a5->var0.var1);
    v16 = v99;
    v17 = v97;
    LODWORD(v9) = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    if ((_DWORD)v9)
    {
      if (objc_msgSend(a4, "imageType") == 3)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v93 = 0;
        objc_msgSend(a4, "bounds");
        v91.f64[0] = v18;
        v91.f64[1] = v19;
        v92.f64[0] = v20;
        v92.f64[1] = v21;
        PCMatrix44Tmpl<double>::transformRect<double>(v100, v91.f64, (uint64_t)&v91);
        v22 = v98;
        if (v98 >= 1.0)
        {
          Fx_smearToRect(&v93, (uint64_t)&v91, (HgcSmearToRect **)&v81);
          v24 = *(HgcSmearToRect **)&v81;
          v78 = v11;
          if (v93 == *(HgcSmearToRect **)&v81)
          {
            if (v93)
              (*(void (**)(void))(*(_QWORD *)v93 + 24))();
          }
          else
          {
            if (v93)
            {
              (*(void (**)(void))(*(_QWORD *)v93 + 24))();
              v24 = *(HgcSmearToRect **)&v81;
            }
            v93 = v24;
          }
          v25 = v98;
          v26 = v91;
          v27 = v92;
          v28 = (HGCrop *)HGObject::operator new(0x1A0uLL);
          HGCrop::HGCrop(v28);
          v29 = v26.f64[0] - v25 * 3.0;
          v30 = vcvtmd_s64_f64(v29 + 0.0000001);
          v31 = v26.f64[1] - v25 * 3.0;
          v32 = v25 * 3.0 + v25 * 3.0;
          v33 = vcvtmd_s64_f64(v31 + 0.0000001);
          v34 = vcvtpd_s64_f64(v31 + v32 + v27.f64[1]);
          v35 = (double)(int)(vcvtpd_s64_f64(v29 + v32 + v27.f64[0]) - v30);
          *(float *)&v29 = (double)v33 + (double)(int)(v34 - v33);
          v36 = (double)v30 + v35;
          (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v28 + 96))(v28, 0, (float)v30, *(float *)&v29, v36, (float)v33);
          (*(void (**)(HGCrop *, _QWORD, HgcSmearToRect *))(*(_QWORD *)v28 + 120))(v28, 0, v93);
          if (v93 != v28)
          {
            if (v93)
              (*(void (**)(void))(*(_QWORD *)v93 + 24))();
            v93 = v28;
            (*(void (**)(HGCrop *))(*(_QWORD *)v28 + 16))(v28);
          }
          v37 = 1.0 / v22;
          v81 = 1.0 / v22;
          v82 = 0u;
          v83 = 0u;
          v84 = 1.0 / v22;
          v85 = 0u;
          v86 = 0u;
          v87 = 1.0 / v22;
          v88 = 0u;
          v89 = 0u;
          v90 = 0x3FF0000000000000;
          FxSupport::makeHeliumXForm(&v81, (uint64_t *)&v93, 1, 0, &v80);
          v11 = v78;
          v38 = v80;
          if (v93 == v80)
          {
            if (v93)
              (*(void (**)(void))(*(_QWORD *)v93 + 24))();
          }
          else
          {
            if (v93)
            {
              (*(void (**)(void))(*(_QWORD *)v93 + 24))();
              v38 = v80;
            }
            v93 = v38;
          }
          PCMatrix44Tmpl<double>::transformRect<double>(&v81, v91.f64, (uint64_t)&v91);
          v39 = vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vaddq_f64(v91, (float64x2_t)vdupq_n_s64(0x3E7AD7F29ABCAF48uLL)))));
          v40 = vsub_s32(vmovn_s64(vcvtq_s64_f64(vrndpq_f64(vaddq_f64(v91, v92)))), v39);
          v91.f64[0] = (double)v39.i32[0];
          v91.f64[1] = (double)v39.i32[1];
          v41.i64[0] = v40.i32[0];
          v41.i64[1] = v40.i32[1];
          v92 = vcvtq_f64_s64(v41);
          (*(void (**)(HGCrop *))(*(_QWORD *)v28 + 24))(v28);
        }
        else
        {
          v79 = v93;
          if (v93)
            (*(void (**)(HgcSmearToRect *))(*(_QWORD *)v93 + 16))(v93);
          -[PAESharedDefaultBase smear:fromImage:toImage:](self, "smear:fromImage:toImage:", &v79, a4, a4);
          v23 = *(HgcSmearToRect **)&v81;
          if (v93 == *(HgcSmearToRect **)&v81)
          {
            if (v93)
              (*(void (**)(void))(*(_QWORD *)v93 + 24))();
          }
          else
          {
            if (v93)
            {
              (*(void (**)(void))(*(_QWORD *)v93 + 24))();
              v23 = *(HgcSmearToRect **)&v81;
            }
            v93 = v23;
            v81 = 0.0;
          }
          if (v79)
            (*(void (**)(HgcSmearToRect *))(*(_QWORD *)v79 + 24))(v79);
          v37 = 1.0;
        }
        __asm
        {
          FMOV            V0.2D, #0.5
          FMOV            V1.2D, #-1.0
        }
        v91 = vaddq_f64(v91, _Q0);
        v92 = vaddq_f64(v92, _Q1);
        v48 = (HInsectEye_Base *)HGObject::operator new(0x1A0uLL);
        HInsectEye_Base::HInsectEye_Base(v48);
        v49 = fabs(v11);
        v50 = v49 * v15;
        v51 = (double)v14 / v49 / (v49 * v15 / v49);
        v52 = (double)v13 / v12 / (v16 / v12);
        v53 = v51;
        v54 = (double)v13 / (float)(v52 + v52);
        v55 = (double)v14 / (float)(v53 + v53);
        (*(void (**)(HInsectEye_Base *, _QWORD, float, float, float, float))(*(_QWORD *)v48 + 96))(v48, 0, v54, v55, 0.0, 0.0);
        (*(void (**)(HInsectEye_Base *, uint64_t, float, float, float, float))(*(_QWORD *)v48 + 96))(v48, 1, v52 * v54, v53 * v55, 0.0, 0.0);
        v56 = v98;
        (*(void (**)(HInsectEye_Base *, uint64_t, float, float, float, float))(*(_QWORD *)v48 + 96))(v48, 2, v56, v56, 0.0, 0.0);
        v57 = 2.0 / v99;
        v58 = 2.0 / v50;
        v59 = -v52;
        v60 = -v53;
        (*(void (**)(HInsectEye_Base *, uint64_t, float, float, float, float))(*(_QWORD *)v48 + 96))(v48, 3, v57, v58, v59, v60);
        v61 = 0.5 / v54;
        v62 = 0.5 / v55;
        (*(void (**)(HInsectEye_Base *, uint64_t, float, float, float, float))(*(_QWORD *)v48 + 96))(v48, 4, v61, v62, 0.0, 0.0);
        (*(void (**)(HInsectEye_Base *, uint64_t, float, float, float, float))(*(_QWORD *)v48 + 96))(v48, 5, (float)((unint64_t)objc_msgSend(a4, "width") >> 1), (float)((unint64_t)objc_msgSend(a4, "height") >> 1), 0.0, 0.0);
        v63 = v37;
        (*(void (**)(HInsectEye_Base *, uint64_t, float, float, float, float))(*(_QWORD *)v48 + 96))(v48, 6, v63, v63, 0.0, 0.0);
        v64 = v91.f64[0];
        v65 = v91.f64[1];
        v66 = v91.f64[0] + v92.f64[0];
        v67 = v91.f64[1] + v92.f64[1];
        (*(void (**)(HInsectEye_Base *, uint64_t, float, float, float, float))(*(_QWORD *)v48 + 96))(v48, 7, v64, v65, v66, v67);
        (*(void (**)(HInsectEye_Base *, _QWORD, HgcSmearToRect *))(*(_QWORD *)v48 + 120))(v48, 0, v93);
        *(double *)&v68 = COERCE_DOUBLE(HGObject::operator new(0x1A0uLL));
        HgcInsectEyeBorder::HgcInsectEyeBorder(v68);
        v81 = *(double *)&v68;
        v69 = v96;
        v70 = v95;
        v71 = v94;
        (*(void (**)(HgcInsectEyeBorder *, _QWORD, float, float, float, float))(*(_QWORD *)v68 + 96))(v68, 0, v69, v70, v71, 1.0);
        v72 = v17 / v50;
        v73 = v50;
        v74 = -(float)((float)(1.0 - v72) * v73);
        (*(void (**)(HgcInsectEyeBorder *, uint64_t, float, float, float, float))(*(_QWORD *)v68 + 96))(v68, 1, -v73, v74, 0.0, 0.0);
        v75 = v50;
        (*(void (**)(HgcInsectEyeBorder *, uint64_t, float, float, float, float))(*(_QWORD *)v68 + 96))(v68, 2, v75, v74, 0.0, 0.0);
        v76 = 2.0 / v99;
        (*(void (**)(HgcInsectEyeBorder *, uint64_t, float, float, float, float))(*(_QWORD *)v68 + 96))(v68, 3, v76, v58, v59, v60);
        (*(void (**)(HgcInsectEyeBorder *, uint64_t, float, float, float, float))(*(_QWORD *)v68 + 96))(v68, 4, v61, v62, 0.0, 0.0);
        (*(void (**)(HgcInsectEyeBorder *, uint64_t, float, float, float, float))(*(_QWORD *)v68 + 96))(v68, 5, (float)((unint64_t)objc_msgSend(a4, "width") >> 1), (float)((unint64_t)objc_msgSend(a4, "height") >> 1), 0.0, 0.0);
        (*(void (**)(HgcInsectEyeBorder *, _QWORD, HInsectEye_Base *))(*(_QWORD *)v68 + 120))(v68, 0, v48);
        -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v81, a4, a3);
        objc_msgSend(a3, "setHeliumRef:", &v81);
        if (v81 != 0.0)
          (*(void (**)(double))(**(_QWORD **)&v81 + 24))(COERCE_DOUBLE(*(_QWORD *)&v81));
        (*(void (**)(HInsectEye_Base *))(*(_QWORD *)v48 + 24))(v48);
        if (v93)
          (*(void (**)(HgcSmearToRect *))(*(_QWORD *)v93 + 24))(v93);
        LOBYTE(v9) = 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
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
