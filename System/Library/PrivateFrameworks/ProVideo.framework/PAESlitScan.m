@implementation PAESlitScan

- (PAESlitScan)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAESlitScan;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (BOOL)variesOverTime
{
  return 1;
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
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("MayRemapTime"), v4, CFSTR("PositionIndependent"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PAESlitScan;
  -[PAESharedDefaultBase addParameters](&v7, sel_addParameters);
  v3 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v4, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Slitscan::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v4, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Slitscan::Rotation"), 0, 0), 2, 0, 0.0, 0.0, 6.28318531);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Slitscan::Speed"), 0, 0), 3, 0, 100.0, 0.0, 400.0, 0.0, 400.0, 1.0);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Slitscan::Perspective"), 0, 0), 4, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Slitscan::Glow Punch"), 0, 0), 5, 0, 0.05, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v4, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Slitscan::Glow Color"), 0, 0), 6, 0, 1.0, 1.0, 1.0);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Slitscan::Offset"), 0, 0), 7, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 0.01);
  }
  return 1;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  BOOL v11;
  BOOL result;
  unint64_t v13;
  double v14;
  __double2 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  HGTextureWrap *v28;
  char *v29;
  HGCrop *v30;
  uint64_t v31;
  int v32;
  int v33;
  double v34;
  long double v35;
  unint64_t v36;
  long double v37;
  unint64_t v38;
  float v39;
  double v40;
  long double v41;
  double v42;
  long double v43;
  long double v44;
  HGXForm *v45;
  HGCrop *v46;
  HGXForm *v47;
  long double v48;
  unint64_t v49;
  long double v50;
  double v51;
  long double v52;
  unint64_t v53;
  long double v54;
  double v55;
  HGXForm *v56;
  HGCrop *v57;
  HGXForm *v58;
  HGLegacyBlend *v59;
  HGCrop *v60;
  unint64_t v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  HgcSlitScanGlow *v70;
  unint64_t v71;
  unint64_t v72;
  float sinval;
  float v74;
  float cosval;
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
  HGXForm *v86;
  HGTextureWrap *v87;
  HGCrop *v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  HGCrop *v93;
  HGXForm *v94;
  HGXForm *v95;
  HGCrop *v96;
  unint64_t v97;
  HgcSlitScanGlow *v98;
  _BYTE v99[144];
  float64x2_t v100[9];
  float64x2_t v101[9];
  _BYTE v102[144];
  float64x2_t v103[9];
  float64x2_t v104[9];
  uint64_t v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  double v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  __int128 v126;
  __int128 v127;
  uint64_t v128;
  double v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  double v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  __int128 v137;
  __int128 v138;
  uint64_t v139;
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
    return 0;
  v13 = objc_msgSend(a4, "width");
  v97 = objc_msgSend(a4, "height");
  v117 = 0.0;
  v116 = 0.0;
  objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v117, &v116, 1, a5->var0.var1);
  v117 = v117 * (double)v13;
  v116 = v116 * (double)v97;
  v115 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v115, 2, a5->var0.var1);
  v114 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v114, 3, a5->var0.var1);
  v113 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v113, 4, a5->var0.var1);
  v112 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v112, 5, a5->var0.var1);
  v111 = 0.0;
  v110 = 0.0;
  v109 = 0.0;
  objc_msgSend(v9, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v111, &v110, &v109, 6, a5->var0.var1);
  v108 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v108, 7, a5->var0.var1);
  v108 = v108 * (double)v13;
  -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
  if (v106 <= v107)
    v14 = v107;
  else
    v14 = v106;
  v113 = v113 / v14;
  v15 = __sincos_stret(v115);
  -[PAESharedDefaultBase secondsFromFxTime:](self, "secondsFromFxTime:", a5->var0.var1);
  v17 = v16;
  v18 = v114;
  v19 = v117;
  v20 = v116;
  v21 = v108;
  v22 = v112;
  v23 = objc_msgSend(a4, "imageType");
  v24 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  result = 0;
  if (!v24 || v23 != 3)
    return result;
  v25 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (!v25)
    return 0;
  if (a4)
    objc_msgSend(a4, "heliumRef");
  else
    v105 = 0;
  v89 = (void *)v25;
  v26 = objc_msgSend(a4, "width");
  v117 = v117 - (double)(v26 >> 1);
  v27 = objc_msgSend(a4, "height");
  v116 = v116 - (double)(v27 >> 1);
  v28 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
  HGTextureWrap::HGTextureWrap(v28);
  v87 = v28;
  (*(void (**)(HGTextureWrap *, _QWORD, uint64_t))(*(_QWORD *)v28 + 120))(v28, 0, v105);
  HGTextureWrap::SetTextureWrapMode((uint64_t)v28, (const char *)2, v29);
  v30 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v30);
  v88 = v30;
  v31 = HGRectMake4i((int)((double)(unint64_t)objc_msgSend(a4, "width") * -1.5), (int)((double)(unint64_t)objc_msgSend(a4, "height") * -1.5), (int)((double)(unint64_t)objc_msgSend(a4, "width") * 1.5), (int)((double)(unint64_t)objc_msgSend(a4, "height") * 1.5));
  (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v30 + 96))(v30, 0, (float)(int)v31, (float)SHIDWORD(v31), (float)v32, (float)v33);
  (*(void (**)(HGCrop *, _QWORD, HGTextureWrap *))(*(_QWORD *)v30 + 120))(v30, 0, v28);
  HGTransform::HGTransform((HGTransform *)v104);
  v129 = 1.0;
  v130 = 0u;
  v131 = 0u;
  v132 = xmmword_1B304EED0;
  v133 = v113 * -0.05;
  v135 = 0;
  v134 = 0;
  v137 = 0u;
  v138 = 0u;
  v136 = 0x3FF0000000000000;
  v139 = 0x3FF0000000000000;
  HGTransform::LoadMatrixd((HGTransform *)v104, &v129);
  v90 = v22;
  v91 = v21;
  v92 = v20;
  HGTransform::HGTransform((HGTransform *)v103);
  v34 = v108;
  v35 = v115;
  v36 = objc_msgSend(a4, "width");
  v37 = v115;
  v38 = objc_msgSend(a4, "height");
  v39 = v14 * -(v17 * v18);
  v40 = v39;
  v41 = sin(v35);
  v42 = fmod(-((v34 + v39) * v41), (double)v36 * 1.5);
  v43 = cos(v37);
  v44 = fmod((v34 + v39) * v43, (double)v38 * 1.5);
  HGTransform::Translate((HGTransform *)v103, -v42, -v44, 0.0);
  HGTransform::Translate((HGTransform *)v103, -v117, -v116, 0.0);
  HGTransform::Rotate((HGTransform *)v103, v115 * 180.0 / 3.14159265, 0.0, 0.0, 1.0);
  HGTransform::Multiply(v103, v104);
  v45 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v45);
  v86 = v45;
  (*(void (**)(HGXForm *, float64x2_t *))(*(_QWORD *)v45 + 576))(v45, v103);
  (*(void (**)(HGXForm *, _QWORD, HGCrop *))(*(_QWORD *)v45 + 120))(v45, 0, v30);
  v46 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v46);
  v96 = v46;
  (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v46 + 96))(v46, 0, (float)(int)0x80000000, 0.0, (float)0x7FFFFFFF, (float)0x7FFFFFFF);
  (*(void (**)(HGCrop *, _QWORD, HGXForm *))(*(_QWORD *)v46 + 120))(v46, 0, v45);
  HGTransform::HGTransform((HGTransform *)v102);
  HGTransform::Rotate((HGTransform *)v102, v115 * -180.0 / 3.14159265, 0.0, 0.0, 1.0);
  HGTransform::Translate((HGTransform *)v102, v117, v116, 0.0);
  v47 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v47);
  v95 = v47;
  (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v47 + 576))(v47, v102);
  (*(void (**)(HGXForm *, _QWORD, HGCrop *))(*(_QWORD *)v47 + 120))(v47, 0, v96);
  HGTransform::HGTransform((HGTransform *)v101);
  v118 = 1.0;
  v119 = 0u;
  v120 = 0u;
  v121 = xmmword_1B304EED0;
  v122 = v113 * 0.05;
  v124 = 0;
  v123 = 0;
  v126 = 0u;
  v127 = 0u;
  v125 = 0x3FF0000000000000;
  v128 = 0x3FF0000000000000;
  HGTransform::LoadMatrixd((HGTransform *)v101, &v118);
  HGTransform::HGTransform((HGTransform *)v100);
  v48 = v115;
  v49 = objc_msgSend(a4, "width");
  v50 = sin(v48);
  v51 = fmod(v50 * (float)-v39, (double)v49 * 1.5);
  v52 = v115;
  v53 = objc_msgSend(a4, "height");
  HGTransform::Scale((HGTransform *)v100, 1.0, -1.0, 1.0);
  v54 = cos(v52);
  v55 = fmod(v54 * v39, (double)v53 * 1.5);
  HGTransform::Translate((HGTransform *)v100, -v51, v55, 0.0);
  HGTransform::Translate((HGTransform *)v100, 0.0, v116 + v116, 0.0);
  HGTransform::Translate((HGTransform *)v100, -v117, -v116, 0.0);
  HGTransform::Rotate((HGTransform *)v100, v115 * -180.0 / 3.14159265, 0.0, 0.0, 1.0);
  HGTransform::Multiply(v100, v101);
  v56 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v56);
  v94 = v56;
  (*(void (**)(HGXForm *, float64x2_t *))(*(_QWORD *)v56 + 576))(v56, v100);
  (*(void (**)(HGXForm *, _QWORD, HGCrop *))(*(_QWORD *)v56 + 120))(v56, 0, v30);
  v57 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v57);
  v93 = v57;
  (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v57 + 96))(v57, 0, (float)(int)0x80000000, (float)(int)0x80000000, (float)0x7FFFFFFF, 0.0);
  (*(void (**)(HGCrop *, _QWORD, HGXForm *))(*(_QWORD *)v57 + 120))(v57, 0, v94);
  HGTransform::HGTransform((HGTransform *)v99);
  HGTransform::Rotate((HGTransform *)v99, v115 * -180.0 / 3.14159265, 0.0, 0.0, 1.0);
  HGTransform::Translate((HGTransform *)v99, v117, v116, 0.0);
  v58 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v58);
  (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v58 + 576))(v58, v99);
  (*(void (**)(HGXForm *, _QWORD, HGCrop *))(*(_QWORD *)v58 + 120))(v58, 0, v57);
  v59 = (HGLegacyBlend *)HGObject::operator new(0x1C0uLL);
  HGLegacyBlend::HGLegacyBlend(v59);
  (*(void (**)(HGLegacyBlend *, _QWORD, float, float, float, float))(*(_QWORD *)v59 + 96))(v59, 0, 0.0, 0.0, 0.0, 0.0);
  (*(void (**)(HGLegacyBlend *, _QWORD, HGXForm *))(*(_QWORD *)v59 + 120))(v59, 0, v95);
  (*(void (**)(HGLegacyBlend *, uint64_t, HGXForm *))(*(_QWORD *)v59 + 120))(v59, 1, v58);
  v60 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  v61 = v13;
  HGCrop::HGCrop(v60);
  v62 = objc_msgSend(a4, "width");
  if (v62 >= 0)
    v63 = v62;
  else
    v63 = v62 + 1;
  v64 = objc_msgSend(a4, "width");
  if (v64 >= 0)
    v65 = v64;
  else
    v65 = v64 + 1;
  v66 = objc_msgSend(a4, "height");
  if (v66 >= 0)
    v67 = v66;
  else
    v67 = v66 + 1;
  v68 = objc_msgSend(a4, "height");
  (*(void (**)(HGCrop *, _QWORD, HGLegacyBlend *))(*(_QWORD *)v60 + 120))(v60, 0, v59);
  if (v68 >= 0)
    v69 = v68;
  else
    v69 = v68 + 1;
  (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v60 + 96))(v60, 0, (float)-(v63 >> 1), (float)-(v67 >> 1), (float)(v65 >> 1), (float)(v69 >> 1));
  objc_msgSend(v89, "versionAtCreation");
  v70 = (HgcSlitScanGlow *)HGObject::operator new(0x1A0uLL);
  HgcSlitScanGlow::HgcSlitScanGlow(v70);
  (*(void (**)(HgcSlitScanGlow *, _QWORD, HGCrop *))(*(_QWORD *)v70 + 120))(v70, 0, v60);
  v71 = objc_msgSend(a4, "width");
  v117 = v117 + (double)(v71 >> 1);
  v72 = objc_msgSend(a4, "height");
  sinval = v15.__sinval;
  v74 = -sinval;
  cosval = v15.__cosval;
  v76 = v19 + (float)((float)-sinval * v39);
  v77 = v92 + (float)(cosval * v39);
  v116 = v116 + (double)(v72 >> 1);
  (*(void (**)(HgcSlitScanGlow *, _QWORD, float, float, float, float))(*(_QWORD *)v70 + 96))(v70, 0, v76, v77, 0.0, 0.0);
  (*(void (**)(HgcSlitScanGlow *, uint64_t, float, float, float, float))(*(_QWORD *)v70 + 96))(v70, 1, (float)v61, (float)v97, 0.0, 0.0);
  v78 = v90 * (double)(v61 >> 2);
  (*(void (**)(HgcSlitScanGlow *, uint64_t, float, float, float, float))(*(_QWORD *)v70 + 96))(v70, 2, v78, 0.0, 0.0, 0.0);
  v79 = v111;
  v80 = v110;
  v81 = v109;
  (*(void (**)(HgcSlitScanGlow *, uint64_t, float, float, float, float))(*(_QWORD *)v70 + 96))(v70, 3, v79, v80, v81, 0.0);
  v82 = v19 + (v91 + v40) * v74;
  v83 = v92 + (v91 + v40) * cosval;
  (*(void (**)(HgcSlitScanGlow *, uint64_t, float, float, float, float))(*(_QWORD *)v70 + 96))(v70, 4, v82, v83, 0.0, 0.0);
  v84 = v117;
  v85 = v116;
  (*(void (**)(HgcSlitScanGlow *, uint64_t, float, float, float, float))(*(_QWORD *)v70 + 96))(v70, 5, v84, v85, 0.0, 0.0);
  (*(void (**)(HgcSlitScanGlow *, uint64_t, float, float, float, float))(*(_QWORD *)v70 + 96))(v70, 6, v74, cosval, 0.0, 0.0);
  v98 = v70;
  (*(void (**)(HgcSlitScanGlow *))(*(_QWORD *)v70 + 16))(v70);
  objc_msgSend(a3, "setHeliumRef:", &v98);
  if (v98)
    (*(void (**)(HgcSlitScanGlow *))(*(_QWORD *)v98 + 24))(v98);
  (*(void (**)(HgcSlitScanGlow *))(*(_QWORD *)v70 + 24))(v70);
  (*(void (**)(HGCrop *))(*(_QWORD *)v60 + 24))(v60);
  (*(void (**)(HGLegacyBlend *))(*(_QWORD *)v59 + 24))(v59);
  (*(void (**)(HGXForm *))(*(_QWORD *)v58 + 24))(v58);
  HGTransform::~HGTransform((HGTransform *)v99);
  (*(void (**)(HGCrop *))(*(_QWORD *)v93 + 24))(v93);
  (*(void (**)(HGXForm *))(*(_QWORD *)v94 + 24))(v94);
  HGTransform::~HGTransform((HGTransform *)v100);
  HGTransform::~HGTransform((HGTransform *)v101);
  (*(void (**)(HGXForm *))(*(_QWORD *)v95 + 24))(v95);
  HGTransform::~HGTransform((HGTransform *)v102);
  (*(void (**)(HGCrop *))(*(_QWORD *)v96 + 24))(v96);
  (*(void (**)(HGXForm *))(*(_QWORD *)v86 + 24))(v86);
  HGTransform::~HGTransform((HGTransform *)v103);
  HGTransform::~HGTransform((HGTransform *)v104);
  (*(void (**)(HGCrop *))(*(_QWORD *)v88 + 24))(v88);
  (*(void (**)(HGTextureWrap *))(*(_QWORD *)v87 + 24))(v87);
  if (v105)
    (*(void (**)(uint64_t))(*(_QWORD *)v105 + 24))(v105);
  return 1;
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
