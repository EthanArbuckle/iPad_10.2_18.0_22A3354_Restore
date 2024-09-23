@implementation PAEWidescreen

- (PAEWidescreen)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEWidescreen;
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
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEWidescreen;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Widescreen::Aspect Ratio"), 0, 0), 1, 0, objc_msgSend((id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Widescreen::AspectEntries"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Widescreen::Offset"), 0, 0), 2, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Widescreen::Border Size"), 0, 0), 3, 0, 0.0, 0.0, 10.0, 0.0, 10.0, 1.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Widescreen::Border Color"), 0, 0), 4, 0, 0.0, 0.0, 0.0, 1.0);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  double v10;
  uint64_t i;
  _OWORD *v12;
  __int128 v13;
  uint64_t j;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  float64x2_t v20;
  double var3;
  double var4;
  double v23;
  double v24;
  unint64_t v25;
  unint64_t v26;
  float64x2_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  float v44;
  double v45;
  HWideScreen *v46;
  double v47;
  float v48;
  double v49;
  double v50;
  float v51;
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
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  HWideScreen *v97;
  uint64_t v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  unsigned int v104;
  double v105[16];
  _BYTE v106[48];
  float64x2_t v107;
  __int128 v108;
  double v109;
  __int128 v110;
  __int128 v111;
  double v112;
  _BYTE v113[48];
  float64x2_t v114;
  __int128 v115;
  double v116;
  __int128 v117;
  __int128 v118;
  double v119;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    v10 = (double)objc_msgSend(v9, "versionAtCreation");
  else
    v10 = 0.0;
  v119 = 1.0;
  v116 = 1.0;
  *(_QWORD *)&v113[40] = 0x3FF0000000000000;
  *(_QWORD *)v113 = 0x3FF0000000000000;
  memset(&v113[8], 0, 32);
  v114 = 0u;
  v115 = 0u;
  v117 = 0u;
  v118 = 0u;
  v112 = 1.0;
  v109 = 1.0;
  *(_QWORD *)&v106[40] = 0x3FF0000000000000;
  *(_QWORD *)v106 = 0x3FF0000000000000;
  memset(&v106[8], 0, 32);
  v107 = 0u;
  v108 = 0u;
  v110 = 0u;
  v111 = 0u;
  if (v10 <= 0.0)
  {
    v18 = objc_msgSend(a4, "width");
    v19 = objc_msgSend(a4, "height");
    v20.f64[0] = (double)v18 * -0.5;
    PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)v113, v20, (double)v19 * -0.5, 0.0);
    var3 = a5->var3;
    var4 = a5->var4;
    if (var3 != 1.0)
    {
      *(float64x2_t *)v113 = vmulq_n_f64(*(float64x2_t *)v113, var3);
      *(float64x2_t *)&v113[16] = vmulq_n_f64(*(float64x2_t *)&v113[16], var3);
    }
    if (var4 != 1.0)
    {
      *(float64x2_t *)&v113[32] = vmulq_n_f64(*(float64x2_t *)&v113[32], var4);
      v114 = vmulq_n_f64(v114, var4);
    }
    v23 = 1.0 / var3;
    v24 = 1.0 / var4;
    if (v23 != 1.0)
    {
      *(float64x2_t *)v106 = vmulq_n_f64(*(float64x2_t *)v106, v23);
      *(float64x2_t *)&v106[16] = vmulq_n_f64(*(float64x2_t *)&v106[16], v23);
    }
    if (v24 != 1.0)
    {
      *(float64x2_t *)&v106[32] = vmulq_n_f64(*(float64x2_t *)&v106[32], v24);
      v107 = vmulq_n_f64(v107, v24);
    }
    v25 = objc_msgSend(a4, "width");
    v26 = objc_msgSend(a4, "height");
    v27.f64[0] = (double)v25 * 0.5;
    *(_QWORD *)&v16 = *(_OWORD *)&PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)v106, v27, (double)v26 * 0.5, 0.0);
  }
  else
  {
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a3);
    for (i = 0; i != 16; i += 4)
    {
      v12 = &v106[i * 8];
      v13 = *(_OWORD *)&v105[i + 2];
      *v12 = *(_OWORD *)&v105[i];
      v12[1] = v13;
    }
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
    for (j = 0; j != 16; j += 4)
    {
      v15 = &v113[j * 8];
      v16 = *(_OWORD *)&v105[j];
      v17 = *(_OWORD *)&v105[j + 2];
      *v15 = v16;
      v15[1] = v17;
    }
  }
  objc_msgSend(a3, "bounds", *(double *)&v16);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  objc_msgSend(a4, "bounds");
  v37 = v36;
  v39 = v38;
  v40 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v40)
  {
    v41 = v40;
    v104 = 0;
    v105[0] = 0.0;
    v102 = 0.0;
    v103 = 0.0;
    v100 = 0.0;
    v101 = 0.0;
    v99 = 0.0;
    objc_msgSend(v40, "getIntValue:fromParm:atFxTime:", &v104, 1, a5->var0.var1);
    objc_msgSend(v41, "getFloatValue:fromParm:atFxTime:", v105, 2, a5->var0.var1);
    objc_msgSend(v41, "getFloatValue:fromParm:atFxTime:", &v103, 3, a5->var0.var1);
    objc_msgSend(v41, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v102, &v101, &v100, &v99, 4, a5->var0.var1);
    v101 = v99 * v101;
    v102 = v99 * v102;
    v100 = v99 * v100;
    v42 = v103;
    v43 = -1.0;
    if (v103 != 0.0)
    {
      v44 = v103;
      v42 = (float)(v44 / 100.0);
      v43 = v39 * v42;
    }
    if (v104 > 6)
      v45 = 0.333333333;
    else
      v45 = dbl_1B30501B8[v104];
    LODWORD(v40) = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1, v42);
    if ((_DWORD)v40)
    {
      if (objc_msgSend(a4, "imageType") == 3)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v98 = 0;
        v46 = (HWideScreen *)HGObject::operator new(0x1A0uLL);
        HWideScreen::HWideScreen(v46);
        (*(void (**)(HWideScreen *, _QWORD, uint64_t))(*(_QWORD *)v46 + 120))(v46, 0, v98);
        v47 = (v39 - v37 * v45) * 0.5;
        v48 = v35 * -0.5;
        v49 = v48;
        v50 = v47 + v48;
        v51 = v50;
        v52 = v35 + v49 - v47;
        (*(void (**)(HWideScreen *, _QWORD, float, float, float, float))(*(_QWORD *)v46 + 96))(v46, 0, v51, v52, 0.0, 0.0);
        v53 = v43 + v50;
        v54 = v35 - v47 - v43 + v49;
        (*(void (**)(HWideScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v46 + 96))(v46, 1, v53, v54, 0.0, 0.0);
        v55 = v102;
        v56 = v101;
        v57 = v100;
        v58 = v99;
        (*(void (**)(HWideScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v46 + 96))(v46, 2, v55, v56, v57, v58);
        v59 = v47 * v105[0];
        (*(void (**)(HWideScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v46 + 96))(v46, 3, v59, 0.0, 0.0, 0.0);
        v60 = *(double *)v113;
        v61 = *(double *)&v113[8];
        v62 = *(double *)&v113[16];
        v63 = *(double *)&v113[24];
        (*(void (**)(HWideScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v46 + 96))(v46, 4, v60, v61, v62, v63);
        v64 = *(double *)&v113[32];
        v65 = *(double *)&v113[40];
        v66 = v114.f64[0];
        v67 = v114.f64[1];
        (*(void (**)(HWideScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v46 + 96))(v46, 5, v64, v65, v66, v67);
        v68 = *(double *)&v115;
        v69 = *((double *)&v115 + 1);
        v70 = v116;
        v71 = *(double *)&v117;
        (*(void (**)(HWideScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v46 + 96))(v46, 6, v68, v69, v70, v71);
        v72 = *((double *)&v117 + 1);
        v73 = *(double *)&v118;
        v74 = *((double *)&v118 + 1);
        v75 = v119;
        (*(void (**)(HWideScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v46 + 96))(v46, 7, v72, v73, v74, v75);
        v76 = *(double *)v106;
        v77 = *(double *)&v106[8];
        v78 = *(double *)&v106[16];
        v79 = *(double *)&v106[24];
        (*(void (**)(HWideScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v46 + 96))(v46, 8, v76, v77, v78, v79);
        v80 = *(double *)&v106[32];
        v81 = *(double *)&v106[40];
        v82 = v107.f64[0];
        v83 = v107.f64[1];
        (*(void (**)(HWideScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v46 + 96))(v46, 9, v80, v81, v82, v83);
        v84 = *(double *)&v108;
        v85 = *((double *)&v108 + 1);
        v86 = v109;
        v87 = *(double *)&v110;
        (*(void (**)(HWideScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v46 + 96))(v46, 10, v84, v85, v86, v87);
        v88 = *((double *)&v110 + 1);
        v89 = *(double *)&v111;
        v90 = *((double *)&v111 + 1);
        v91 = v112;
        (*(void (**)(HWideScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v46 + 96))(v46, 11, v88, v89, v90, v91);
        v92 = v29;
        v93 = v31;
        v94 = v29 + v33;
        v95 = v31 + v35;
        (*(void (**)(HWideScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v46 + 96))(v46, 12, v92, v93, v94, v95);
        v97 = v46;
        (*(void (**)(HWideScreen *))(*(_QWORD *)v46 + 16))(v46);
        objc_msgSend(a3, "setHeliumRef:", &v97);
        if (v97)
          (*(void (**)(HWideScreen *))(*(_QWORD *)v97 + 24))(v97);
        (*(void (**)(HWideScreen *))(*(_QWORD *)v46 + 24))(v46);
        if (v98)
          (*(void (**)(uint64_t))(*(_QWORD *)v98 + 24))(v98);
        LOBYTE(v40) = 1;
      }
      else
      {
        LOBYTE(v40) = 0;
      }
    }
  }
  return (char)v40;
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
